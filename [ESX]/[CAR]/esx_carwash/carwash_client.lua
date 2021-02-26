local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX              = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Key = 201 -- ENTER

vehicleWashStation = {
	{26.5906,  -1392.0261,  27.3634},
	{167.1034,  -1719.4704,  27.2916},
	{-699.6325,  -932.7043,  17.0139}
}

--[[
Citizen.CreateThread(function ()
	Citizen.Wait(0)
	for i = 1, #vehicleWashStation do
		garageCoords = vehicleWashStation[i]
		stationBlip = AddBlipForCoord(garageCoords[1], garageCoords[2], garageCoords[3])
		SetBlipSprite(stationBlip, 100) -- 100 = carwash
		SetBlipAsShortRange(stationBlip, true)
	end
    return
end)]]

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
			for i = 1, #vehicleWashStation do
				garageCoords2 = vehicleWashStation[i]
				DrawMarker(1, garageCoords2[1], garageCoords2[2], garageCoords2[3], 0, 0, 0, 0, 0, 0, 5.0, 5.0, 2.0, 0, 157, 0, 155, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) < 5 then
					--DrawSpecialText("Tryk enter for at vaske bilen") -- danish
					DrawSpecialText("Appuyez sur ENTRER pour lancer le lavage")
					if(IsControlJustPressed(1, Key)) then
						TriggerServerEvent('carwash:checkmoney')
					end
				end
			end
		end
	end
end)

RegisterNetEvent('carwash:success')
AddEventHandler('carwash:success', function(price)
	SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),  false),  0.0000000001)
	SetVehicleUndriveable(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
	--TriggerEvent('chatMessage', 'carwash', {255, 0, 0}, "Véhicule laver pour " .. price .. "$")
	--TriggerEvent('chatMessage', 'Bilvasken', {255, 0, 0}, "Din bil er blevet vasket for " .. price .. "kr") -- danish
	ESX.ShowNotification('Le Véhicule a était laver pour 80$')
	--[[TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#1E90FF'>Le Véhicule a était laver pour " .. price .. "$</b>",
            type = "success",
            timeout = (15000),
            layout = "centerRight",
            queue = "global"
        })
	DrawSpecialText(msg, 5000)]]
	Wait(5000)
end)

RegisterNetEvent('carwash:notenoughmoney')
AddEventHandler('carwash:notenoughmoney', function(moneyleft)
--	TriggerEvent('chatMessage', 'Bilvasken', {255, 0, 0}, "Du har ikke penge nok, du mangler " .. moneyleft .. "kr") -- danish
	--TriggerEvent('chatMessage', 'carwash', {255, 0, 0}, "Pas asser d'argent, il vous manque " .. moneyleft .. "$") 
	ESX.ShowNotification('~r~Il vous manque' .. moneyleft .. '$')
	--[[TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#1E90FF'>Il vous manque " .. moneyleft .. "$</b>",
            type = "success",
            timeout = (15000),
            layout = "centerRight",
            queue = "global"
        })
	DrawSpecialText(msg, 5000)]]
	Wait(5000)
end)

RegisterNetEvent('carwash:free')
AddEventHandler('carwash:free', function()
	SetVehicleDirtLevel(GetVehiclePedIsUsing(GetPlayerPed(-1)))
	SetVehicleUndriveable(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
	-- TriggerEvent('chatMessage', 'carwash', {255, 0, 0}, "bilvasken er gratis" .. price .. "kr")  -- danish
	--TriggerEvent('chatMessage', 'carwash', {255, 0, 0}, "Lavage gratuit" .. price .. "$") 
	ESX.ShowNotification('~g~Lavage offert')
	--[[TriggerEvent("pNotify:SendNotification",{
            text = "<b style='color:#1E90FF'>Lavage offert " .. price .. "$</b>",
            type = "success",
            timeout = (15000),
            layout = "centerRight",
            queue = "global"
        })
	DrawSpecialText(msg, 5000)]]
	Wait(5000)
end)