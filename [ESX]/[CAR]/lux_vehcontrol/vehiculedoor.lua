--
-- @Project: FiveM Tools
-- @Author: Samuelds
-- @License: GNU General Public License v3.0
--
--------------------------------
ESX                = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(10)
  end
end)

-----------------------------

local lastVeh = -1
local numberOfVehicleDoors = 0
local lastDoor = 0
 
local names = {
    "avant droite",
    "arrière gauche",
    "arrière droite",
}
 
local names2 = {
    "avant droit",
    "arrière gauche",
    "arrière droite",
}


Citizen.CreateThread(function()
	Citizen.Wait(1000)
        while true do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local veh = ESX.Game.GetVehicleInDirection()
			
            if veh then
                local vehicleDoorLockStatus = GetVehicleDoorLockStatus(veh)
                if vehicleDoorLockStatus == 2 then
                    return
                end

                if veh ~= lastVeh then
                    numberOfVehicleDoors = GetNumberOfVehicleDoors(veh)
                    lastVeh = veh
                end
 
                for i = 0, numberOfVehicleDoors do
 
                    local coord = GetEntryPositionOfDoor(veh, i)
                    local distance = Vdist(playerCoords.x,  playerCoords.y,  playerCoords.z,  coord.x,  coord.y,  coord.z)
                    local pedInVehicleSeat = GetPedInVehicleSeat(veh, i - 1)
                    local model = GetEntityModel(veh)
                    local isThisModelABike = IsThisModelABike(model)
                    local isThisModelABoat = IsThisModelABoat(model)
                    if distance < 0.5 and pedInVehicleSeat == 0 then
                        lastDoor = i - 1
                    end
                end -- end for
            else
                lastVeh = 0
                numberOfVehicleDoors = 0
                lastDoor = -1
            end
            Citizen.Wait(100)
 
        end
end)
  
Citizen.CreateThread(function()
 
    while true do
        Citizen.Wait(10)
        if names[lastDoor] ~= nil and not isThisModelABike and not isThisModelABoat then
		-- SetTextComponentFormat('STRING')
		-- AddTextComponentString("Appuyez sur ~INPUT_CONTEXT~ pour rentrer par la porte " .. names[lastDoor])
		-- DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        elseif names2[lastDoor] ~= nil and isThisModelABike and isThisModelABoat then
		-- SetTextComponentFormat('STRING')
		-- AddTextComponentString("Appuyez sur ~INPUT_CONTEXT~ pour rentrer par la porte " .. names2[lastDoor])
		-- DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        elseif lastVeh ~= 0 then
		-- SetTextComponentFormat('STRING')
		-- AddTextComponentString("Appuyez sur ~INPUT_CONTEXT~ pour rentrer par cette porte")
		-- DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        end
		
        if IsControlPressed(1, 38) then
           local playerPed = GetPlayerPed(-1)
		   TaskEnterVehicle(playerPed, lastVeh, 10000, lastDoor, 1.0, 1, 0)
           end
        end
end)