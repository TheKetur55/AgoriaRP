ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'realestateagent', _U('realtors'), 'society_realestateagent', 'society_realestateagent', 'society_realestateagent', {type = 'private'})






RegisterServerEvent('esx_realestateagentjob:revoke')
AddEventHandler('esx_realestateagentjob:revoke', function(property, owner)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'realestateagent' then
		TriggerEvent('esx_property:removeOwnedPropertyIdentifier', property, owner)
		TriggerServerEvent('esx_joblogs:AddInLog',"immo" ,"revoquer" ,xPlayer.name, owner, property)
	else
		print(('esx_realestateagentjob: %s attempted to revoke a property!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx_realestateagentjob:sell')
AddEventHandler('esx_realestateagentjob:sell', function(target, property, price)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(target)

	if xPlayer.job.name ~= 'realestateagent' then
		print(('esx_realestateagentjob: %s attempted to sell a property!'):format(xPlayer.identifier))
		return
	end

	if xTarget.getMoney() >= price then
		xTarget.removeMoney(price)

	--	if xPlayer.getMoney() >= price then
	--	xPlayer.removeMoney(price)

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_realestateagent', function(account)
			account.addMoney(price)
		end)
	--	TriggerEvent('esx_property:setPropertyOwned', property, price, false, xPlayer.identifier)
		TriggerEvent('esx_property:setPropertyOwned', property, price, false, xTarget.identifier)
		TriggerServerEvent('esx_joblogs:AddInLog',"immo" ,"vendre" ,xPlayer.name, xTarget.name, property, price)
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Le client n\'a pas assez d\'argent')
	end
end)

RegisterServerEvent('esx_realestateagentjob:rent')
AddEventHandler('esx_realestateagentjob:rent', function(target, property, price)
	local xPlayer = ESX.GetPlayerFromId(target)

	TriggerEvent('esx_property:setPropertyOwned', property, price, true, xPlayer.identifier)
	TriggerServerEvent('esx_joblogs:AddInLog',"immo" ,"louer" ,xPlayer.name, xPlayer.name, property, price)
end)

ESX.RegisterServerCallback('esx_realestateagentjob:getCustomers', function(source, cb)
	TriggerEvent('esx_ownedproperty:getOwnedProperties', function(properties)
		local xPlayers  = ESX.GetPlayers()
		local customers = {}

		for i=1, #properties, 1 do
			for j=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[j])

				if xPlayer.identifier == properties[i].owner then
					table.insert(customers, {
						name           = xPlayer.name,
						propertyOwner  = properties[i].owner,
						propertyRented = properties[i].rented,
						propertyId     = properties[i].id,
						propertyPrice  = properties[i].price,
						propertyName   = properties[i].name,
						propertyLabel  = properties[i].label
					})
				end
			end
		end

		cb(customers)
	end)
end)


RegisterServerEvent('esx_realestateagentjob:annonce')
AddEventHandler('esx_realestateagentjob:annonce', function(result)
  local _source  = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  local xPlayers = ESX.GetPlayers()
  local text     = result
  print(text)
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('esx_realestateagentjob:annonce', xPlayers[i],text)
  end

  Citizen.Wait(8000)

  local xPlayers = ESX.GetPlayers()
  for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('esx_realestateagentjob:annoncestop', xPlayers[i])
  end

end)