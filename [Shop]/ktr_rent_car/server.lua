ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




RegisterServerEvent("chargePlayer")
AddEventHandler("chargePlayer", function(chargeAmount)
	local _source = source
     local xPlayer        = ESX.GetPlayerFromId(source)
     xPlayer.removeBank(chargeAmount)
     CancelEvent()
end)


RegisterServerEvent('loue')
AddEventHandler('loue', function(chargeAmount)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	if xPlayer.get('money') >= chargeAmount then

		xPlayer.removeMoney(chargeAmount)
	--	xPlayer.addInventoryItem(itemName, 1)
		SpawnVehicle("panto")
		TriggerClientEvent('esx:showNotification', _source, ('bought'))

	else
		TriggerClientEvent('esx:showNotification', _source, ('not_enough'))
		TriggerClientEvent('esx:deleteVehicle', source)
	end

end)










RegisterServerEvent("devAddPlayer")
AddEventHandler("devAddPlayer", function(devAddAmount)
	TriggerEvent("es:getPlayerFromId", source, function(user)
		user.addMoney(devAddAmount)
		CancelEvent()
	end)
end)




