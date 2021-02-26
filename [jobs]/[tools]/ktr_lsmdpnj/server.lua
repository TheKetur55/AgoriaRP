ESX = nil

RegisterServerEvent('lsmd:success')
AddEventHandler('lsmd:success', function()
	 --local xPlayer        = ESX.GetPlayerFromId(source)
	 local societyAccount = nil
	 TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
    societyAccount = account
  end)

  print("Player ID " ..source)
	-- Get the players money amount
	

TriggerEvent('es:getPlayerFromId', source, function(user)
	if societyAccount ~= nil then
  total = math.random(250, 400);
  local societyMoney = math.random(300, 350)
  user.addMoney(total)
  societyAccount.addMoney(societyMoney)

 TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez remporter : ' .. total)
    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Votre entreprise a remporter : ' .. societyMoney)
end
 end)
end)
