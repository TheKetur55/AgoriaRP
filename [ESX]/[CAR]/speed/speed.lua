Citizen.CreateThread(function()
   while true do
    Citizen.Wait(1)
    if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("fbi")) then
       SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.2) -- Accélération
       SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.3) -- Vitesse
     end
   end
 end)


Citizen.CreateThread(function()
   while true do
    Citizen.Wait(1)
    if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("fbi2")) then
       SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.3) -- Accélération
       SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.8) -- Vitesse
     end
   end
 end)


Citizen.CreateThread(function()
   while true do
    Citizen.Wait(1)
    if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("police2")) then
       SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.5) -- Accélération
       SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.6) -- Vitesse
     end
   end
 end)

Citizen.CreateThread(function()
   while true do
    Citizen.Wait(1)
    if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("policeb")) then
       SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.7) -- Accélération
       SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.7) -- Vitesse
     end
   end
 end)

Citizen.CreateThread(function()
   while true do
    Citizen.Wait(1)
    if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("police3")) then
       SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.2) -- Accélération
       SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.3) -- Vitesse
     end
   end
 end)