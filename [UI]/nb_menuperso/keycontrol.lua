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

local PlayerData        = {}

local viewMode          = false
local NBMenuIsOpen      = false
local vehicleEngineOn   = true

ESX                     = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end

  while ESX.GetPlayerData().job == nil do
    Citizen.Wait(10)
  end

  PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

function menuperso_hide_hud()
  viewMode = not viewMode
  if viewMode then
    TriggerEvent('es:setMoneyDisplay', 0.0)
	  ESX.UI.HUD.SetDisplay(0.0)
    TriggerEvent('esx_status:setDisplay', 0.0)
    TriggerEvent('streetdisplay:setDisplay1', 0.0)
  else
    TriggerEvent('es:setMoneyDisplay', 1.0)
    ESX.UI.HUD.SetDisplay(1.0)
    TriggerEvent('esx_status:setDisplay', 1.0)
    TriggerEvent('streetdisplay:setDisplay1', 1.0)
  end
  TriggerEvent('esx_voice:setDisplayVoice', viewMode)
  TriggerEvent('streetLabel:setDisplayGPS', viewMode)
  TriggerEvent('esx_AdvancedFuel:setDisplayFuel', viewMode)
  TriggerEvent('carhud:setDisplayCar', viewMode)
  TriggerEvent('esx_methdrug:setDisplayLoading', viewMode)
  Citizen.CreateThread(function()
    while viewMode do
      Citizen.Wait(10)
      HideHelpTextThisFrame()
      HideHudAndRadarThisFrame()
      HideHudComponentThisFrame(1) -- Wanted Stars
      HideHudComponentThisFrame(2) -- Weapon icon
      HideHudComponentThisFrame(3) -- Cash
      HideHudComponentThisFrame(4) -- MP CASH
      HideHudComponentThisFrame(11) -- Floating Help Text
      HideHudComponentThisFrame(12) -- more floating help text
      HideHudComponentThisFrame(13) -- Cash Change
      HideHudComponentThisFrame(15) -- Subtitle Text
      HideHudComponentThisFrame(18) -- Game Stream
      HideHudComponentThisFrame(19) -- weapon wheel
    end
  end)
end

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

RegisterNetEvent('nb_menuperso:closeAllMenu')
AddEventHandler('nb_menuperso:closeAllMenu', function()
	ESX.UI.Menu.CloseAll()
end)

jobsMenus = {
  ambulance       = 'openMenuAmbulance',
  bahamas         = 'openMenuBahamas',
  bakery          = 'openMenuBakery',
  --bank            = 'openMenuBank',
  brewer          = 'openMenuBrewer',
  --cardealer       = 'openMenuCardealer',
  coffeeshop      = 'openMenuCoffeeShop',
  etat            = 'openMenuEtat',
  fisherman       = 'openMenuFisherman',
  gunshop         = 'openMenuGunshop',
  mecano          = 'openMenuMecano',
  police          = 'openMenuPolice',
  realestateagent = 'openMenuRealestateagent',
  reporter        = 'openMenuReporter',
  security        = 'openMenuSecurity',
  sheriff         = 'openMenuSheriff',
  taxi            = 'openMenuTaxi',
  unicorn         = 'openMenuUnicorn',
  woodcut         = 'openMenuWoodcut'
}

function menuperso_open_job_menu(playerJob)

  for k,v in pairs(jobsMenus) do
    if k == playerJob then
      TriggerEvent('nb_menuperso:'..v)
      break
    end
  end

end

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)

    if IsPauseMenuActive() then
      ESX.UI.Menu.CloseAll()
    end

  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)

    -- TP marqueur
    if (IsControlPressed(0, Keys['LEFTCTRL']) and IsControlJustReleased(0, Keys['E'])) and GetLastInputMethod(2) then
      ESX.TriggerServerCallback('nb_menuperso:getUsergroup', function(group)
        playergroup = group
				if playergroup == 'mod' or playergroup == 'admin' or playergroup == 'superadmin' or playergroup == 'owner' then
          TriggerEvent('nb_menuperso:goTpMarker')
        end
      end)
    end

    if IsControlJustReleased(0, Keys['TAB']) and GetLastInputMethod(2) then
	  	ClearPedTasks(GetPlayerPed(-1))
	  end

  
    -- Hide HUD
    if IsControlJustPressed(0, Keys['F9']) and GetLastInputMethod(2) then
      menuperso_hide_hud()
    end
    
    -- Menu personnel
    if IsControlJustPressed(0, Keys['F5']) and GetLastInputMethod(2) then
      if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'menu_perso') then
        ESX.UI.Menu.CloseAll()
      else
        TriggerEvent('nb_menuperso:openMenuPersonnel')
      end
    end

    -- Menu métier
    if IsControlJustPressed(0, Keys['F6']) and GetLastInputMethod(2) then
      if PlayerData.job ~= nil then
        ESX.UI.Menu.CloseAll()
        menuperso_open_job_menu(PlayerData.job.name)
      end
    end

    --[[ Éteindre/allumer le moteur
    if IsControlPressed(1, 47) and IsControlPressed(1, 21) and GetLastInputMethod(2) then

			local playerPed = PlayerPedId()
      local vehiclePed = GetVehiclePedIsIn(playerPed, false)
      if GetPedInVehicleSeat(vehiclePed, -1) == playerPed then
        vehicleEngineOn = not vehicleEngineOn
			  if vehicleEngineOn then
			  	SetVehicleEngineOn(vehiclePed, false, false, true)
			  	SetVehicleUndriveable(vehiclePed, true)
			  else
			  	SetVehicleEngineOn(vehiclePed, true, false, true)
			  	SetVehicleUndriveable(vehiclePed, false)
        end
      end

		end
]]
  end
end)

Citizen.CreateThread(function()
  while true do

    Citizen.Wait(10)

    if #ESX.UI.Menu.Opened > 0 then
      NBMenuIsOpen = true
    else
      NBMenuIsOpen = false	
    end
    
    if NBMenuIsOpen then
      local ply = PlayerPedId()
      local active = true 
      ------------------------------------------------------------------------ TOUCHES CLAVIER
      --DisableControlAction(0, Keys["ESC"], active) -- ESC - 322
      --DisableControlAction(0, Keys["²"], active) -- ² - 243
      --DisableControlAction(0, Keys["TAB"], active) -- TAB - 37
      --DisableControlAction(0, Keys["LEFTCTRL"], active) -- LEFTCTRL - 36
      --DisableControlAction(0, Keys["RIGHTCTRL"], active) -- RIGHTCTRL - 70
      --DisableControlAction(0, Keys["SPACE"], active) -- SPACE - 22
      --DisableControlAction(0, Keys["="], active) -- = - 83
      --DisableControlAction(0, Keys["LEFTSHIFT"], active) -- LEFTSHIFT - 21
      --DisableControlAction(0, Keys["RIGHTSHIFT"], active) -- RIGHTSHIFT - NON IDENTIFIER
      --DisableControlAction(0, Keys["LEFTALT"], active) -- LEFTALT - 19
      --DisableControlAction(0, Keys["RIGHTALT"], active) -- RIGHTALT - NON IDENTIFIER
      --DisableControlAction(0, Keys["CAPS"], active) -- CAPS - 137
      --DisableControlAction(0, Keys[")"], active) -- ) - 84
      --DisableControlAction(0, Keys["BACKSPACE"], active) -- BACKSPACE - 177
      --DisableControlAction(0, Keys["^"], active) -- ^ - 39
      --DisableControlAction(0, Keys["$"], active) -- $ - 40
      --DisableControlAction(0, Keys["ENTER"], active) -- ENTER - 18
      --DisableControlAction(0, Keys["ù"], active) -- ù - NON IDENTIFIER
      --DisableControlAction(0, Keys["*"], active) -- * - NON IDENTIFIER
      --DisableControlAction(0, Keys[","], active) -- , - 82
      --DisableControlAction(0, Keys[";"], active) -- ; - 81
      --DisableControlAction(0, Keys[":"], active) -- : - NON IDENTIFIER
      --DisableControlAction(0, Keys["!"], active) -- ! - NON IDENTIFIER
      
      --DisableControlAction(0, Keys["NENTER"], active) -- NENTER - 201
      --DisableControlAction(0, Keys["N1"], active) -- N1 - NON IDENTIFIER
      --DisableControlAction(0, Keys["N2"], active) -- N2 - NON IDENTIFIER
      --DisableControlAction(0, Keys["N3"], active) -- N3 - NON IDENTIFIER
      --DisableControlAction(0, Keys["N4"], active) -- N4 - 108
      --DisableControlAction(0, Keys["N5"], active) -- N5 - 60
      --DisableControlAction(0, Keys["N6"], active) -- N6 - 107
      --DisableControlAction(0, Keys["N7"], active) -- N7 - 117
      --DisableControlAction(0, Keys["N8"], active) -- N8 - 61
      --DisableControlAction(0, Keys["N9"], active) -- N9 - 118
      --DisableControlAction(0, Keys["N0"], active) -- N0 - NON IDENTIFIER
      --DisableControlAction(0, Keys["N+"], active) -- N+ - 96
      --DisableControlAction(0, Keys["N-"], active) -- N- - 97
      
      --DisableControlAction(0, Keys["HOME"], active) -- HOME - 213
      --DisableControlAction(0, Keys["PAGEUP"], active) -- PAGEUP - 10
      --DisableControlAction(0, Keys["PAGEDOWN"], active) -- PAGEDOWN - 11
      --DisableControlAction(0, Keys["DELETE"], active) -- DELETE - 178
      
      --DisableControlAction(0, Keys["LEFT"], active) -- LEFT - 174
      --DisableControlAction(0, Keys["RIGHT"], active) -- RIGHT - 175
      --DisableControlAction(0, Keys["TOP"], active) -- TOP - 27
      --DisableControlAction(0, Keys["DOWN"], active) -- DOWN - 173
      
      --DisableControlAction(0, Keys["F1"], active) -- F1 - 288
      --DisableControlAction(0, Keys["F2"], active) -- F2 - 289
      --DisableControlAction(0, Keys["F3"], active) -- F3 - 170
      --DisableControlAction(0, Keys["F4"], active) -- F4 - NON IDENTIFIER
      --DisableControlAction(0, Keys["F5"], active) -- F5 - 166
      --DisableControlAction(0, Keys["F6"], active) -- F6 - 167
      --DisableControlAction(0, Keys["F7"], active) -- F7 - 168
      --DisableControlAction(0, Keys["F8"], active) -- F8 - 169
      --DisableControlAction(0, Keys["F9"], active) -- F9 - 56
      --DisableControlAction(0, Keys["F10"], active) -- F10 - 57
      --DisableControlAction(0, Keys["F11"], active) -- F11 - NON IDENTIFIER
      --DisableControlAction(0, Keys["F12"], active) -- F12 - NON IDENTIFIER
      
      --DisableControlAction(0, Keys["1"], active) -- 1 - 157
      --DisableControlAction(0, Keys["2"], active) -- 2 - 158
      --DisableControlAction(0, Keys["3"], active) -- 3 - 160
      --DisableControlAction(0, Keys["4"], active) -- 4 - 164
      --DisableControlAction(0, Keys["5"], active) -- 5 - 165
      --DisableControlAction(0, Keys["6"], active) -- 6 - 159
      --DisableControlAction(0, Keys["7"], active) -- 7 - 161
      --DisableControlAction(0, Keys["8"], active) -- 8 - 162
      --DisableControlAction(0, Keys["9"], active) -- 9 - 163
      --DisableControlAction(0, Keys["0"], active) -- 0 - NON IDENTIFIER
      
      --DisableControlAction(0, Keys["A"], active) -- A - 34
      --DisableControlAction(0, Keys["B"], active) -- B - 29
      --DisableControlAction(0, Keys["C"], active) -- C - 26
      --DisableControlAction(0, Keys["D"], active) -- D - 9
      --DisableControlAction(0, Keys["E"] active) -- E - 38
      --DisableControlAction(0, Keys["F"], active) -- F - 23
      --DisableControlAction(0, Keys["G"], active) -- G - 47
      --DisableControlAction(0, Keys["H"], active) -- H - 74
      --DisableControlAction(0, Keys["I"], active) -- I - NON IDENTIFIER
      --DisableControlAction(0, Keys["J"], active) -- J - NON IDENTIFIER
      --DisableControlAction(0, Keys["K"], active) -- K - 311
      --DisableControlAction(0, Keys["L"], active) -- L - 182
      --DisableControlAction(0, Keys["M"], active) -- M - 244
      --DisableControlAction(0, Keys["N"], active) -- N - 249
      --DisableControlAction(0, Keys["O"], active) -- O - NON IDENTIFIER
      --DisableControlAction(0, Keys["P"], active) -- P - 199
      --DisableControlAction(0, Keys["Q"], active) -- Q - 44
      --DisableControlAction(0, Keys["R"], active) -- R - 45
      --DisableControlAction(0, Keys["S"], active) -- S - 8
      --DisableControlAction(0, Keys["T"], active) -- T - 245
      --DisableControlAction(0, Keys["U"], active) -- U - 303
      --DisableControlAction(0, Keys["V"], active) -- V - 0
      --DisableControlAction(0, Keys["W"], active) -- W - 32
      --DisableControlAction(0, Keys["X"], active) -- X - 73
      --DisableControlAction(0, Keys["Y"], active) -- Y - 246
      --DisableControlAction(0, Keys["Z"], active) -- Z - 20
      
      ------------------------------------------------------------------------ FONCTION ACTION GTA -- codes here: https://pastebin.com/guYd0ht4
      DisablePlayerFiring(ply, active) -- desactive armes a feu -- 24/05/18
      --DisableControlAction(0, 1, active) -- mouvement camera horizontale
      --DisableControlAction(0, 2, active) -- mouvement camera verticale
      --DisableControlAction(0, 30,	active) -- Mouvement personnage horizontale
      --DisableControlAction(0, 31,	active) -- Mouvement personnage verticale
      DisableControlAction(0, 24, active) -- attaque -- 24/05/18
      DisableControlAction(0, 142, active) -- attaque de melee -- 24/05/18
      --DisableControlAction(0, 106, active) -- VehicleMouseControlOverride
      
      DisableControlAction(0, 12, active) -- Selection d'arme roue
      DisableControlAction(0, 14, active) -- Selection d'arme suivante roue
      DisableControlAction(0, 15, active) -- Selection d'arme precedente roue
      DisableControlAction(0, 16, active) -- Selection d'arme suivante
      DisableControlAction(0, 17, active) -- Selection d'arme precedente
      DisableControlAction(0, 140, active) -- coup de poing -- 24/05/18
      DisableControlAction(0, 80, active) -- Camera aleatoire en voiture
      DisableControlAction(0, 73, active) -- Camera aleatoire en voiture
      
      if IsDisabledControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate -- 24/05/18
        SendNUIMessage({type = "click"})
      end

    end
    break
  end
end)