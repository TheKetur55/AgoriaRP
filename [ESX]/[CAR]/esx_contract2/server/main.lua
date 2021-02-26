ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_clothes:sellVehicle')
AddEventHandler('esx_clothes:sellVehicle', function(target, plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local _target = target
	local tPlayer = ESX.GetPlayerFromId(_target)
	local result = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles3 WHERE owner = @identifier AND plate = @plate', {
			['@identifier'] = xPlayer.identifier,
			['@plate'] = plate
		})
	if result[1] ~= nil then
		MySQL.Async.execute('UPDATE owned_vehicles3 SET owner = @target WHERE owner = @owner AND plate = @plate', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = plate,
			['@target'] = tPlayer.identifier
		}, function (rowsChanged)

				TriggerClientEvent('esx_contract2:showAnim', _source)
				TriggerEvent('esx_vehiclelock:dvktr', plate, xPlayer.identifier)
				TriggerEvent('esx_vehiclelock:givekeycardealer', plate, tPlayer.identifier)





				Wait(22000)
				TriggerClientEvent('esx_contract2:showAnim', _target)

				Wait(22000)
				
				TriggerClientEvent('esx:showNotification', _source, _U('soldvehicle', plate))



				TriggerClientEvent('esx:showNotification', _target, _U('boughtvehicle', plate))
				xPlayer.removeInventoryItem('contract2', 1)
		--	end
		end)
	else
		TriggerClientEvent('esx:showNotification', _source, ('Ce n\'est pas votre véhicule'))
	end
end)

ESX.RegisterUsableItem('contract2', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_contract2:getVehicle', _source)
end)