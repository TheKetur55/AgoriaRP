ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--[[
ESX.RegisterUsableItem('thermalvision', function(source)
    TriggerClientEvent('esx_thermalvision:useThermalVision', source)
end)


ESX.RegisterUsableItem('nightvision', function(source)
    TriggerClientEvent('esx_thermalvision:useNightVision', source)
end)]]



ESX.RegisterUsableItem('nightvision', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	  TriggerClientEvent('Nightvision', source)
end)
--[[
ESX.RegisterUsableItem('thermalvision', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	  TriggerClientEvent('Thermalvision', source)
end)]]



RegisterNetEvent('night-thermal')
AddEventHandler('night-thermal', function()
	Citizen.CreateThread(function()

    RequestAnimDict('anim@mp_helmets@on_bike@sports')

    while not HasAnimDictLoaded('anim@mp_helmets@on_bike@sports') do
      Citizen.Wait(0)
    end

		TaskPlayAnim(GetPlayerPed(-1), 'anim@mp_helmets@on_bike@sports')
	end)	
end)

AddEventHandler('onMySQLReady', function()
MySQL.Async.fetchAll(
		'SELECT * FROM addon_inventory_items WHERE count = @count',
		{
		['@count']   = 0
		},
		function(result)


		for i=1, #result, 1 do
			MySQL.Async.execute(
						'DELETE FROM addon_inventory_items WHERE id = @id',
						{
							['@id'] = result[i].id
						}
					)
		end
	end)
end)