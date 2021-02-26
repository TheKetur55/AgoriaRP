ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




RegisterServerEvent("bus")
AddEventHandler("bus", function(chargeAmount)
	local _source = source
     local xPlayer        = ESX.GetPlayerFromId(source)
     xPlayer.removeMoney(chargeAmount)
end)


