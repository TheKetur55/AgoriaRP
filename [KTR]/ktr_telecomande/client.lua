ESX = nil
local HaveBagOnHead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



RegisterNetEvent('ktr_telecomande:menuouvre') 
AddEventHandler('ktr_telecomande:menuouvre', function()
    OpenMenu()
end)

function OpenMenu() 

    local elements = {
          {label = 'Désactiver Néon', value = 'off'},
          {label = 'Activer Néon', value = 'on'},
          {label = 'Couleur Blanc', value = 'on2'},
          {label = 'Activer Bleu I', value = 'on1'},
          {label = 'Couleur Bleu II', value = 'on3'},
          {label = 'Couleur Vert', value = 'on4'},
          {label = 'Couleur Jaune I', value = 'on5'},
          {label = 'Couleur Jaune II', value = 'on6'},
          {label = 'Couleur Orange', value = 'on7'},
          {label = 'Couleur Rouge', value = 'on8'},
          {label = 'Couleur Rose I', value = 'on9'},
          {label = 'Couleur Rose II', value = 'on10'},
          {label = 'Couleur Violet I', value = 'on11'},
          {label = 'Couleur Violet II', value = 'on12'},


          
        }
  
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'NeonCommande',
      {
        title    = 'AGOCUSTOM NEON',
        align    = 'top-left',
        elements = elements
        },
  
            function(data2, menu2)
            local veh = GetVehiclePedIsUsing(PlayerPedId())

                if data2.current.value == 'off' then
                    ToggleVehicleMod(veh, 22, false)
                    SetVehicleHeadlightsColour(veh, 2)
                end
  
                if data2.current.value == 'on' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 2)
                end
                if data2.current.value == 'on1' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 1)
                end
                if data2.current.value == 'on2' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 0)
                end
                if data2.current.value == 'on3' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, -1)
                end
                if data2.current.value == 'on4' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 4)
                end
                if data2.current.value == 'on5' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 5)
                end
                if data2.current.value == 'on6' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 6)
                end
                if data2.current.value == 'on7' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 7)
                end
                if data2.current.value == 'on8' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 8)
                end
                if data2.current.value == 'on9' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 9)
                end
                if data2.current.value == 'on10' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 10)
                end
                if data2.current.value == 'on11' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 11)
                end
                if data2.current.value == 'on12' then
                  ToggleVehicleMod(veh, 22, true) -- toggle xenon
                  SetVehicleHeadlightsColour(veh, 12)
                end

               
            end,
      function(data2, menu2)
        menu2.close()
      end
    )
  
  end


RegisterNetEvent('ktr_telecomande:nitro') 
AddEventHandler('ktr_telecomande:nitro', function()
  local force = 55.0
          local ped = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(ped, false)
    
    ESX.ShowNotification('~g~Nitro en cours ...')
          Citizen.Wait(2500)
          SetVehicleBoostActive(playerVeh, 1, 0)
      SetVehicleForwardSpeed(playerVeh, force)
      StartScreenEffect("RaceTurbo", 0, 0)
      SetVehicleBoostActive(playerVeh, 0, 0)
end)

