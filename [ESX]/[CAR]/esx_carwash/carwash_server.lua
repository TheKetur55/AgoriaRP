--Settings--
ESX = nil

enableprice = true -- true = carwash is paid, false = carwash is free

price = 80 -- you may edit this to your liking. if "enableprice = false" ignore this one


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('carwash:checkmoney')
AddEventHandler('carwash:checkmoney', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)		
		if(enableprice == true) then
			if(xPlayer.getMoney() >= price) then
				xPlayer.removeMoney((price))
				TriggerClientEvent('carwash:success', source, price)
				
			else
				moneyleft = price - xPlayer.getMoney()
				TriggerClientEvent('carwash:notenoughmoney', source, moneyleft)
			end
		else
			TriggerClientEvent('carwash:free', source)
		end
end)