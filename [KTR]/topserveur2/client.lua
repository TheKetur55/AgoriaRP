local IsInMarker              = false
local HasAlreadyEnteredMarker = false
local MenuIsShowed            = false

Citizen.CreateThread(function()
  SetNuiFocus(false)
end)



RegisterNetEvent('topserveur:openme')
AddEventHandler('topserveur:openme', function()
  MenuIsShowed = true

  SetNuiFocus(true, true)

  SendNUIMessage({
    action = 'show'
  })
end)

-- -- Render markers
-- Citizen.CreateThread(function()
--   while true do
--
--     Wait(0)
--
--     local coords = GetEntityCoords(GetPlayerPed(-1))
--
--     for i=1, #Config.MarkerPositions, 1 do
--       if(GetDistanceBetweenCoords(coords, Config.MarkerPositions[i].x, Config.MarkerPositions[i].y, Config.MarkerPositions[i].z, true) < Config.DrawDistance) then
--         DrawMarker(Config.MarkerType, Config.MarkerPositions[i].x, Config.MarkerPositions[i].y, Config.MarkerPositions[i].z - Config.ZDiff, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
--       end
--     end
--
--   end
-- end)
--
-- -- Activate menu when player is inside marker
-- Citizen.CreateThread(function()
--   while true do
--
--     Wait(0)
--
--     local coords = GetEntityCoords(GetPlayerPed(-1))
--
--     IsInMarker = false
--
--     for i=1, #Config.MarkerPositions, 1 do
--       if(GetDistanceBetweenCoords(coords, Config.MarkerPositions[i].x, Config.MarkerPositions[i].y, Config.MarkerPositions[i].z, true) < Config.ZoneSize.x / 2) then
--
--         IsInMarker = true
--
--         SetTextComponentFormat('STRING')
--         AddTextComponentString('Appuyez sur ~INPUT_CONTEXT~ pour ouvrir l\'ordinateur')
--         DisplayHelpTextFromStringLabel(0, 0, 1, -1)
--
--       end
--     end
--
--     if IsInMarker and not HasAlreadyEnteredMarker then
--       HasAlreadyEnteredMarker = true
--     end
--
--     if not IsInMarker and HasAlreadyEnteredMarker then
--
--       HasAlreadyEnteredMarker = false
--
--       SetNuiFocus(false)
--
--       MenuIsShowed = false
--
--       SendNUIMessage({
--         hide = true
--       })
--
--     end
--   end
-- end)

-- -- Menu interactions
-- Citizen.CreateThread(function()
--   while true do
--
--     Wait(0)
--
--     if MenuIsShowed then
--
--       DisableControlAction(0, 1,   true) -- LookLeftRight
--       DisableControlAction(0, 2,   true) -- LookUpDown
--       DisableControlAction(0, 142, true) -- MeleeAttackAlternate
--       DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
--
--     else
--
--       if IsControlJustReleased(0, 38) and IsInMarker then
--
--         TriggerEvent("twitter:openme")
--
--       end
--
--     end
--   end
-- end)

RegisterNUICallback('escape_pressed', function(data, cb)

  MenuIsShowed = false

  SetNuiFocus(false)

  SendNUIMessage({
    action = 'hide'
  })

  cb('');

end)
