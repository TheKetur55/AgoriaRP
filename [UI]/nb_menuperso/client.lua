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

-- C O N F I G --
local soundDistance = 0.5 --pour fermeture vehicule
local VehicleList   = {} --pour fermeture vehicule

local PlayerData      = {}
local working

local curlib          = nil
local curAnim         = nil
local curType         = nil
local curLabel        = ""
local register        = {}

local vehiculeON      = true
local noclip          = false
local godmode         = false
local invisible       = false
local showcoords      = false
local showname        = false
local isSpectate      = false
local freeze          = false

ESX                   = nil

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

function Text(text)
  SetTextColour(186, 186, 186, 255)
  SetTextFont(0)
  SetTextScale(0.378, 0.378)
  SetTextWrap(0.0, 1.0)
  SetTextCentre(false)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 205)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(0.314, 0.976)
end

function OpenPersonnelMenu()
  
  ESX.UI.Menu.CloseAll()
  ESX.TriggerServerCallback('nb_menuperso:getUsergroup', function(group)
    playergroup = group
    
    local elements = {
      {label = 'Personnage',                                      value = 'menuperso_moi'},
      {label = 'Animations',                                      value = 'menuperso_animations'}
    }
    
    if IsInVehicle() then
      local vehicle = GetVehiclePedIsIn( PlayerPedId(), false )
      if ( GetPedInVehicleSeat( vehicle, -1 ) == PlayerPedId() ) then
        table.insert(elements, {label = 'Véhicule',               value = 'menuperso_vehicule'})
        table.insert(elements, {label = 'Limiteur de vitesse',    value = 'cruise_control'})
      end
    else
      table.insert(elements, {label = 'Démarche',                 value = 'menuperso_demarches'})
      table.insert(elements, {label = 'Action',                 value = 'openactionktr'})
    end

    if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'viceboss' or PlayerData.job.grade_name == 'chef' then
      table.insert(elements, {label = 'Gestion d\'entreprise',    value = 'menuperso_grade'})
    end
        
    if playergroup == 'mod' or playergroup == 'admin' or playergroup == 'superadmin' or playergroup == 'owner' then
      table.insert(elements, {label = 'Modération',               value = 'menuperso_modo'})
    end
    
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'menu_perso',
      {
        title    = 'Menu Personnel',
        align    = 'top-left',
        elements = elements
      },
      function(data, menu)

        local action = data.current.value
        if action == 'menuperso_moi' then
          menuperso_moi_menu()
        elseif action == 'menuperso_animations' then
        	local playerPed = GetPlayerPed(-1)
        if IsPedInAnyVehicle(playerPed,  false) then
            
        ESX.ShowNotification('~r~Vous ne pouvez pas faire cette action')
    else
          menuperso_animations_menu()
      end
        elseif action == 'menuperso_demarches' then
          menuperso_demarches_menu()
           elseif action == 'openactionktr' then
           openAction()
  -- else
   --		TriggerServerEvent('esx_policejob:message', '~r~Aucun joueur a fouillé')
        elseif action == 'menuperso_vehicule' then
          menuperso_vehicule_menu()
        elseif action == 'cruise_control' then
          cruise_control_menu()
        elseif action == 'menuperso_grade' then
          menuperso_grade_menu()
        elseif action == 'menuperso_modo' then
          menuperso_modo_menu()
        end
 
      end,
      function(data, menu)
        menu.close()
      end
    )
    
  end)

end


function menuperso_moi_menu()

  local elements = {
    {label = 'Inventaire',                        value = 'menuperso_moi_inventaire'},
    {label = 'Accessoires',                       value = 'menuperso_moi_accessory'},
    {label = 'Trousseau de clés',                 value = 'menuperso_moi_keys'},
    {label = 'Mes factures',                      value = 'menuperso_moi_factures'},
    {label = 'tablette top serveur',              value = 'menuperso_moi_topserveur'},
    {label = 'Vetement',                        value = 'menuperso_moi_vetement'},
    {label = 'Faire ses besoin',              value = 'menuperso_moi_need'},
    {label = 'Montrer sa carte identité',         value = 'menuperso_moi_idcard_show'}
   --  {label = 'Montrer ses licenses',         value = 'menuperso_moi_idcard2_show'}
  }

  if IsNextWeatherType('XMAS') then
    table.insert(elements, {label = 'Boule de neige',     value = 'menuperso_moi_snowball'})
  end

  ESX.UI.Menu.Open(
    
    'default', GetCurrentResourceName(), 'menuperso_moi',
    {
      title    = 'Personnage',
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      local action = data.current.value
      if action == 'menuperso_moi_inventaire' then
        menuperso_moi_inventaire_menu()
      elseif action == 'menuperso_moi_accessory' then
        menuperso_moi_accessory_menu()
      elseif action == 'menuperso_moi_keys' then
        menuperso_moi_keys_menu()
      elseif action == 'menuperso_moi_factures' then
        openFacture()
        elseif action == 'menuperso_moi_vetement' then
        openVetement()
      elseif action == 'menuperso_moi_topserveur' then
        TriggerEvent("topserveur:openme")
        elseif action == 'menuperso_moi_need' then
        TriggerEvent("NB:openMenuBesoin")
      elseif action == 'menuperso_moi_idcard_show' then
        TriggerEvent('esx_cards:show', 'identity')
    elseif action == 'menuperso_moi_idcard2_show' then
        TriggerEvent('esx_cards:show', 'driverlicence')
      elseif action == 'menuperso_moi_snowball' then
        menuperso_moi_snowball_menu()
      end
      
    end,
    function(data, menu)
      menu.close()
    end
  )

end



function menuperso_menu_vetement()
if data.current.value == 'menu_vetement' then
	
					local elements = {}
					
				
				table.insert(elements, {label = ' 👕 Gestion Vetement',             					value = 'menu_vetement_gestion'})
			--		table.insert(elements, {label = '🎒 Vetement',             					value = 'menuperso_moi_inventaire'})

					ESX.UI.Menu.Open(
						
						'default', GetCurrentResourceName(), 'menu_vetement',
						{
							css 	 = 'meconcernant',
							title    = '👕 Vetement 👕',
							align    = 'top-left',
							elements = elements
						},
						function(data2, menu2)

							

							if data2.current.value == 'menu_vetement_gestion' then
								OpenActionMenuVetement()
							end

							if data2.current.value == 'menuperso_moi_inventaire' then
								openInventaire()
							end	
						end,
						function(data2, menu2)
							menu2.close()
						end

					)
				end
end




function menuperso_moi_inventaire_menu()
  TriggerEvent('nb_menuperso:closeAllMenu')
  TriggerEvent('nb_menuperso:openMenuInventaire')
end

function menuperso_moi_accessory_menu()

  local elements = {
    {label = 'Mettre / Retirer masque',                 value = 'Mask'},
    {label = 'Mettre / Retirer casque',               value = 'Helmet_1'},
    --{label = 'Mettre / Retirer casque 2',               value = 'Helmet_2'},
    {label = 'Mettre / Retirer lunettes',               value = 'Glasses'},
    {label = 'Mettre / Retirer accessoires d\'oreille', value = 'Ears'},
  }

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menuperso_moi_accessory',
    {
      title = 'Accessoires',
      align = 'top-left',
      elements = elements
    },
    function(data, menu)

      local action = data.current.value
      if action ~= nil then
        SetUnsetAccessory(data.current.value)
      end

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function SetUnsetAccessory(accessory)
	local playerPed = GetPlayerPed(-1)
  local slot = nil
  if accessory == 'Helmet_1' then
  		RequestAnimDict('missfbi4')
    while not HasAnimDictLoaded('missfbi4') do
        Citizen.Wait(0)
      end
    TaskPlayAnim(playerPed, 'missfbi4', 'takeoff_mask',8.0, 1.0, -1, 49, 0, false, false, false )
    Citizen.Wait(700)
    ClearPedTasks(playerPed, 0)	
    accessory = 'Helmet'
    slot = 1
  elseif accessory == 'Helmet_2' then
    accessory = 'Helmet'
    slot = 2
  end

	ESX.TriggerServerCallback('esx_accessories:get', function(hasAccessory, accessorySkin)
		local _accessory = string.lower(accessory)
		local playerPed = GetPlayerPed(-1)

		if hasAccessory then
			TriggerEvent('skinchanger:getSkin', function(skin)
				local mAccessory = -1
				local mColor = 0	  
				if _accessory == "mask" then
					RequestAnimDict('missfbi4')
    while not HasAnimDictLoaded('missfbi4') do
        Citizen.Wait(0)
      end
    TaskPlayAnim(playerPed, 'missfbi4', 'takeoff_mask',8.0, 1.0, -1, 49, 0, false, false, false )
    Citizen.Wait(700)
    ClearPedTasks(playerPed, 0)	
					mAccessory = 0
				end
				if skin[_accessory .. '_1'] == mAccessory then
					mAccessory = accessorySkin[_accessory .. '_1']
					mColor = accessorySkin[_accessory .. '_2']
				end
				local accessorySkin = {}
				--[[	RequestAnimDict('clothingspecs')
    while not HasAnimDictLoaded('clothingspecs') do
        Citizen.Wait(0)
      end
    TaskPlayAnim(playerPed, 'clothingspecs', 'try_glasses_positive_a',8.0, -8.0, -1, 0, 0, false, false, false )
    Citizen.Wait(1000)]]
				accessorySkin[_accessory .. '_1'] = mAccessory
				accessorySkin[_accessory .. '_2'] = mColor
				TriggerEvent('skinchanger:loadClothes', skin, accessorySkin)
			end)
		else
			ESX.ShowNotification('~r~Vous n\'avez pas cet accessoire !~s~')
		end

	end, accessory)
end

function menuperso_moi_keys_menu()

  ESX.TriggerServerCallback('esx_vehiclelock:allkey', function(mykey)
    local elements = {}
    for i=1, #mykey, 1 do
      if mykey[i].got == 'true' then 
        if mykey[i].NB == 1 then                  
          table.insert(elements, {label = 'Clés : '.. ' [' .. mykey[i].plate .. ']', value = mykey[i].plate})
        else
          table.insert(elements, {label = '[DOUBLE] Véhicule : '.. ' [' .. mykey[i].plate .. ']', value = nil})
        end          
      end
    end
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'menuperso_moi_keys',
      {
        title = 'Mes clés',
        align = 'top-left',
        elements = elements
      },
      function(data, menu)
              
        local action = data.current.value
        if action ~= nil then
          menuperso_moi_keys_menu_2(action)
        end

      end,
      function(data, menu)
        menu.close()
      end
    )
  end)

end

function menuperso_moi_keys_menu_2(mykey)

  local elements = {
    {label = 'Donner un double', value = mykey}
  }

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menuperso_moi_keys_2',
    {
      title = 'Faire un double',
      align = 'top-left',
      elements = elements
    },
    function(data, menu)

      local action = data.current.value
      local player, distance = ESX.Game.GetClosestPlayer()
      if action ~= nil then
        if player ~= -1 and distance <= 3.0 then 
          TriggerServerEvent('esx_vehiclelock:givekey', GetPlayerServerId(player), mykey)
           TriggerEvent('esx:showNotification', 'Vous venez de donner une double des clé :'.. mykey .. ' a'.. ' '.. GetPlayerName(player))  -- player.name 4555
          --4555
        end
      end

    end,
    function(data, menu)
      menu.close()
    end
  )

end


function OpenCartelActionsMenu()
	TriggerEvent('NB:closeAllSubMenu')
	TriggerEvent('NB:closeAllMenu')
	TriggerEvent('NB:closeMenuKey')
	
	TriggerEvent('NB:openMenuCartel')
end


function openFacture()
	TriggerEvent('NB:closeAllSubMenu')
	TriggerEvent('NB:closeAllMenu')
	TriggerEvent('NB:closeMenuKey')
	
	TriggerEvent('NB:openMenuFactures')
end


function openAnimal()
  TriggerEvent('NB:closeAllSubMenu')
  TriggerEvent('NB:closeAllMenu')
  TriggerEvent('NB:closeMenuKey')
  
  TriggerEvent('NB:openMenuAnimal')
end

function menuperso_animations_menu()

  local elements = {
    {label = 'Annuler Animations',     value = 'menuperso_animations_cancel'}
  }

  for i=1, #Config.Animations, 1 do
    table.insert(elements, {label = Config.Animations[i].label, value = Config.Animations[i].name})
  end


  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menuperso_animations',
    {
      title    = 'Animations',
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      local action = data.current.value
      if action == 'menuperso_animations_cancel' then
		local playerPed = PlayerPedId()
		ClearPedTasks(playerPed, 0)							
      else
		menuperso_actions_menu_2(action)
	  end

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function menuperso_actions_menu_2(menu)

  local title    = nil
  local elements = {}

  for i=1, #Config.Animations, 1 do  
    if Config.Animations[i].name == menu then
      title = Config.Animations[i].label
      for j=1, # Config.Animations[i].items, 1 do
        table.insert(elements, {label = Config.Animations[i].items[j].label, type = Config.Animations[i].items[j].type, value = Config.Animations[i].items[j].data})
      end
      break
    end
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menuperso_animations_2',
    {
      title    = "MAJ+[1-9] pour ajouter le raccourci",
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      curLabel = data.current.label or ""
      curType = data.current.type
      curlib  = data.current.value.lib
      curAnim = data.current.value.anim

      if curType == 'scenario' then
        startScenario(curAnim)
      else
        startAnim(curType, curlib, curAnim)
      end

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function menuperso_demarches_menu()

  local elements = {
    {label = 'Annuler Démarche',     value = 'menuperso_demarches_cancel'}
  }

  for i=1, #Config.Demarches, 1 do
    table.insert(elements, {label = Config.Demarches[i].label, value = Config.Demarches[i].name})
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menuperso_demarches',
    {
      title    = 'Démarches',
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      local action = data.current.value
      if action == 'menuperso_demarches_cancel' then
        local playerPed = PlayerPedId()
        ResetPedMovementClipset(playerPed, 0)
      else
        menuperso_demarches_menu_2(action)
      end

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function menuperso_demarches_menu_2(menu)

  local title    = nil
  local elements = {}

  for i=1, #Config.Demarches, 1 do
    if Config.Demarches[i].name == menu then
      title = Config.Demarches[i].label
      for j=1, # Config.Demarches[i].items, 1 do
        table.insert(elements, {label = Config.Demarches[i].items[j].label, value = Config.Demarches[i].items[j].value})
      end
      break
    end
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menuperso_demarches_2',
    {
      title    = "MAJ+[1-9] pour ajouter le raccourci",
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      curLabel  = data.current.label or ""
      curType   = 'attitude'
      curAnim   = data.current.value
      startAttitude(curAnim)

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function menuperso_vehicule_menu()
        
  local elements = {}
  
  if vehiculeON then
    table.insert(elements, {label = 'Couper le moteur',                  value = 'menuperso_vehicule_MoteurOff'})
  else
    table.insert(elements, {label = 'Démarrer le moteur',                value = 'menuperso_vehicule_MoteurOn'})
  end
  
  if porteAvantGaucheOuverte then
    table.insert(elements, {label = 'Fermer la porte gauche',            value = 'menuperso_vehicule_fermerportes_fermerportegauche'})
  else
    table.insert(elements, {label = 'Ouvrir la porte gauche',            value = 'menuperso_vehicule_ouvrirportes_ouvrirportegauche'})
  end
  
  if porteAvantDroiteOuverte then
    table.insert(elements, {label = 'Fermer la porte droite',            value = 'menuperso_vehicule_fermerportes_fermerportedroite'})
  else
    table.insert(elements, {label = 'Ouvrir la porte droite',            value = 'menuperso_vehicule_ouvrirportes_ouvrirportedroite'})
  end
  
  if porteArriereGaucheOuverte then
    table.insert(elements, {label = 'Fermer la porte arrière gauche',   value = 'menuperso_vehicule_fermerportes_fermerportearrieregauche'})
  else
    table.insert(elements, {label = 'Ouvrir la porte arrière gauche',   value = 'menuperso_vehicule_ouvrirportes_ouvrirportearrieregauche'})
  end
  
  if porteArriereDroiteOuverte then
    table.insert(elements, {label = 'Fermer la porte arrière droite',    value = 'menuperso_vehicule_fermerportes_fermerportearrieredroite'})
  else
    table.insert(elements, {label = 'Ouvrir la porte arrière droite',    value = 'menuperso_vehicule_ouvrirportes_ouvrirportearrieredroite'})
  end
  
  if porteCapotOuvert then
    table.insert(elements, {label = 'Fermer le capot',                  value = 'menuperso_vehicule_fermerportes_fermercapot'})
  else
    table.insert(elements, {label = 'Ouvrir le capot',                  value = 'menuperso_vehicule_ouvrirportes_ouvrircapot'})
  end
  
  if porteCoffreOuvert then
    table.insert(elements, {label = 'Fermer le coffre',                  value = 'menuperso_vehicule_fermerportes_fermercoffre'})
  else
    table.insert(elements, {label = 'Ouvrir le coffre',                  value = 'menuperso_vehicule_ouvrirportes_ouvrircoffre'})
  end
  
  if porteAutre1Ouvert then
    table.insert(elements, {label = 'Fermer autre 1',                    value = 'menuperso_vehicule_fermerportes_fermerAutre1'})
  else
    table.insert(elements, {label = 'Ouvrir autre 1',                    value = 'menuperso_vehicule_ouvrirportes_ouvrirAutre1'})
  end
  
  if porteAutre2Ouvert then
    table.insert(elements, {label = 'Fermer autre 2',    value = 'menuperso_vehicule_fermerportes_fermerAutre2'})
  else
    table.insert(elements, {label = 'Ouvrir autre 2',        value = 'menuperso_vehicule_ouvrirportes_ouvrirAutre2'})
  end
  
  if porteToutOuvert then
    table.insert(elements, {label = 'Tout fermer',    value = 'menuperso_vehicule_fermerportes_fermerTout'})
  else
    table.insert(elements, {label = 'Tout ouvrir',        value = 'menuperso_vehicule_ouvrirportes_ouvrirTout'})
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menuperso_vehicule',
    {
      title    = 'Véhicule',
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      local action = data.current.value
      ---------- GESTION MOTEUR
      if action == 'menuperso_vehicule_MoteurOn' then
        vehiculeON = true
        SetVehicleEngineOn(GetVehiclePedIsIn( PlayerPedId(), false ), true, false, true)
        SetVehicleUndriveable(GetVehiclePedIsIn( PlayerPedId(), false ), false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_MoteurOff' then
        vehiculeON = false
        SetVehicleEngineOn(GetVehiclePedIsIn( PlayerPedId(), false ), false, false, true)
        SetVehicleUndriveable(GetVehiclePedIsIn( PlayerPedId(), false ), true)
        menuperso_vehicule_menu()
      ---------- OUVRIR LES PORTES
      elseif action == 'menuperso_vehicule_ouvrirportes_ouvrirportegauche' then
        porteAvantGaucheOuverte = true
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 0, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_ouvrirportes_ouvrirportedroite' then
        porteAvantDroiteOuverte = true
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 1, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_ouvrirportes_ouvrirportearrieregauche' then
        porteArriereGaucheOuverte = true
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 2, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_ouvrirportes_ouvrirportearrieredroite' then
        porteArriereDroiteOuverte = true
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 3, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_ouvrirportes_ouvrircapot' then
        porteCapotOuvert = true
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 4, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_ouvrirportes_ouvrircoffre' then
        porteCoffreOuvert = true
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 5, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_ouvrirportes_ouvrirAutre1' then
        porteAutre1Ouvert = true
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 6, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_ouvrirportes_ouvrirAutre2' then
        porteAutre2Ouvert = true
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 7, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_ouvrirportes_ouvrirTout' then
        porteAvantGaucheOuverte = true
        porteAvantDroiteOuverte = true
        porteArriereGaucheOuverte = true
        porteArriereDroiteOuverte = true
        porteCapotOuvert = true
        porteCoffreOuvert = true
        porteAutre1Ouvert = true
        porteAutre2Ouvert = true
        porteToutOuvert = true
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 0, false, false)
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 1, false, false)
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 2, false, false)
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 3, false, false)
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 4, false, false)
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 5, false, false)
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 6, false, false)
        SetVehicleDoorOpen(GetVehiclePedIsIn( PlayerPedId(), false ), 7, false, false)
        menuperso_vehicule_menu()
      ---------- FERMER LES PORTES
      elseif action == 'menuperso_vehicule_fermerportes_fermerportegauche' then
        porteAvantGaucheOuverte = false
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 0, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_fermerportes_fermerportedroite' then
        porteAvantDroiteOuverte = false
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 1, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_fermerportes_fermerportearrieregauche' then
        porteArriereGaucheOuverte = false
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 2, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_fermerportes_fermerportearrieredroite' then
        porteArriereDroiteOuverte = false
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 3, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_fermerportes_fermercapot' then
        porteCapotOuvert = false
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 4, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_fermerportes_fermercoffre' then
        porteCoffreOuvert = false
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 5, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_fermerportes_fermerAutre1' then
        porteAutre1Ouvert = false
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 6, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_fermerportes_fermerAutre2' then
        porteAutre2Ouvert = false
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 7, false, false)
        menuperso_vehicule_menu()
      elseif action == 'menuperso_vehicule_fermerportes_fermerTout' then
        porteAvantGaucheOuverte = false
        porteAvantDroiteOuverte = false
        porteArriereGaucheOuverte = false
        porteArriereDroiteOuverte = false
        porteCapotOuvert = false
        porteCoffreOuvert = false
        porteAutre1Ouvert = false
        porteAutre2Ouvert = false
        porteToutOuvert = false
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 0, false, false)
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 1, false, false)
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 2, false, false)
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 3, false, false)
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 4, false, false)
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 5, false, false)
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 6, false, false)
        SetVehicleDoorShut(GetVehiclePedIsIn( PlayerPedId(), false ), 7, false, false)
        menuperso_vehicule_menu()
      end
      
    end,
    function(data, menu)
      menu.close()
    end
  )

end

function cruise_control_menu()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'cruise_control_menu',
    {
      title		= 'Limiteur de vitesse',
      elements = {
        {label = 'Désactiver', 	value = '700'},
        {label = '15Km/h', 		value = '15'},
        {label = '30Km/h', 		value = '30'},
        {label = '40Km/h', 		value = '40'},
        {label = '80Km/h', 		value = '80'},
        {label = '100Km/h', 	value = '99'},
        {label = '120Km/h', 	value = '119'},
        {label = '150Km/h', 	value = '149'},
        {label = '180Km/h', 	value = '179'}
      }
    },
    function(data, menu)
      local action = data.current.value
      if action == 'none' then
        local playerPed = PlayerPedId()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        local modelVeh	= GetEntityModel(playerVeh)
        local maxSpeed	= GetVehicleMaxSpeed(modelVeh)
        SetEntityMaxSpeed(playerVeh, maxSpeed)
        TriggerEvent('esx:showNotification', 'Limiteur de vitesse ~r~désactivé~s~')
      else
        local playerPed	  = PlayerPedId()
        local speedKm		  = action
        local speed			  = speedKm/3.6
        local playerVeh	  = GetVehiclePedIsIn(playerPed, false)
        local vehSpeed	  = GetEntitySpeed(playerVeh)
        if vehSpeed > speed then
          ESX.ShowNotification('Votre vitesse est ~r~trop élevée~s~ pour la limiter à ~o~'.. speedKm ..'~s~ Km/h')
        else
          SetEntityMaxSpeed(playerVeh, speed)
          ESX.ShowNotification('Vitesse limitée à ~o~'.. speedKm ..'~s~ Km/h')
        end
      end
    end,
    function(data, menu)
      menu.close()
    end
  )

end

function menuperso_grade_menu()

  local elements = {
    {label = 'Recruter',      value = 'menuperso_grade_recruter'},
    {label = 'Virer',         value = 'menuperso_grade_virer'},
    {label = 'Promouvoir',    value = 'menuperso_grade_promouvoir'},
    {label = 'Destituer',     value = 'menuperso_grade_destituer'}
  }

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menuperso_grade',
    {
      title    = 'Gestion d\'entreprise',
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      local action = data.current.value
      if action == 'menuperso_grade_recruter' then
        local job =  PlayerData.job.name
        local grade = 0
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer == -1 or closestDistance > 3.0 then
          ESX.ShowNotification("~r~Aucun joueur à proximité~s~")
        else
          TriggerServerEvent('nb_menuperso:recruteplayer', GetPlayerServerId(closestPlayer), job, grade)
        end
      elseif action == 'menuperso_grade_virer' then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer == -1 or closestDistance > 3.0 then
          ESX.ShowNotification("~r~Aucun joueur à proximité~s~")
        else
          TriggerServerEvent('nb_menuperso:fireplayer', GetPlayerServerId(closestPlayer))
        end
      elseif action == 'menuperso_grade_promouvoir' then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer == -1 or closestDistance > 3.0 then
          ESX.ShowNotification("~r~Aucun joueur à proximité~s~")
        else
          TriggerServerEvent('nb_menuperso:promoteplayer', GetPlayerServerId(closestPlayer))
        end  
      elseif action == 'menuperso_grade_destituer' then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer == -1 or closestDistance > 3.0 then
          ESX.ShowNotification("~r~Aucun joueur à proximité~s~")
        else
          TriggerServerEvent('nb_menuperso:demoteplayer', GetPlayerServerId(closestPlayer))
        end
      end

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function menuperso_modo_menu()

  local elements = {}
        
  if playergroup == 'mod' then
  	 table.insert(elements, {label = 'Menu Admin',                 value = 'menuperso_modo_ktr'})
 --   table.insert(elements, {label = 'Identité du joueur',                 value = 'menuperso_modo_id_player'})
    table.insert(elements, {label = 'Menu des joueurs ',                  value = 'menuperso_modo_player_list'})
 --   table.insert(elements, {label = 'NoClip',                             value = 'menuperso_modo_no_clip'})
 --   table.insert(elements, {label = 'Mode invincible',                    value = 'menuperso_modo_godmode'})
    table.insert(elements, {label = 'Mode fantôme',                       value = 'menuperso_modo_mode_fantome'})
--    table.insert(elements, {label = 'Réparer véhicule',                   value = 'menuperso_modo_vehicle_repair'})
    table.insert(elements, {label = 'Retourner le véhicule',              value = 'menuperso_modo_vehicle_flip'})
    table.insert(elements, {label = 'Afficher/Cacher coordonnées',        value = 'menuperso_modo_showcoord'})
    table.insert(elements, {label = 'Afficher/Cacher noms des joueurs',   value = 'menuperso_modo_showname'})
--    table.insert(elements, {label = 'Apparence moldu',                    value = 'menuperso_modo_moldu_skin'})
    --table.insert(elements, {label = 'Changer l\'apparence',               value = 'menuperso_modo_changer_skin'})
    --table.insert(elements, {label = 'Sauvegarder l\'apparence',           value = 'menuperso_modo_save_skin'})
  elseif playergroup == 'admin' then
     
    table.insert(elements, {label = 'Menu Keytur',                 value = 'menuperso_modo_ktr'})
    table.insert(elements, {label = 'Identité du joueur',                 value = 'menuperso_modo_id_player'})
    table.insert(elements, {label = 'Menu des joueurs ',                  value = 'menuperso_modo_player_list'})
    table.insert(elements, {label = 'NoClip',                             value = 'menuperso_modo_no_clip'})
 --   table.insert(elements, {label = 'Mode invincible',                    value = 'menuperso_modo_godmode'})
    table.insert(elements, {label = 'Mode fantôme',                       value = 'menuperso_modo_mode_fantome'})
    table.insert(elements, {label = 'Réparer véhicule',                   value = 'menuperso_modo_vehicle_repair'})
    table.insert(elements, {label = 'Retourner le véhicule',              value = 'menuperso_modo_vehicle_flip'})
    table.insert(elements, {label = 'Afficher/Cacher coordonnées',        value = 'menuperso_modo_showcoord'})
    table.insert(elements, {label = 'Afficher/Cacher noms des joueurs',   value = 'menuperso_modo_showname'})
    table.insert(elements, {label = 'Apparence moldu',                    value = 'menuperso_modo_moldu_skin'})
     table.insert(elements, {label = 'Annonce Staff',           value = 'announce'})
 --   table.insert(elements, {label = 'Changer l\'apparence',               value = 'menuperso_modo_changer_skin'})
 --   table.insert(elements, {label = 'Sauvegarder l\'apparence',           value = 'menuperso_modo_save_skin'})
  elseif playergroup == 'superadmin' or playergroup == 'owner' then
    table.insert(elements, {label = 'Menu Admin',                 value = 'menuperso_modo_ktr'})
    table.insert(elements, {label = 'Identité du joueur',                 value = 'menuperso_modo_id_player'})
    table.insert(elements, {label = 'Menu des joueurs ',                  value = 'menuperso_modo_player_list'})
    table.insert(elements, {label = 'NoClip',                             value = 'menuperso_modo_no_clip'})
    table.insert(elements, {label = 'Mode invincible',                    value = 'menuperso_modo_godmode'})
    table.insert(elements, {label = 'Mode fantôme',                       value = 'menuperso_modo_mode_fantome'})
    table.insert(elements, {label = 'Réparer véhicule',                   value = 'menuperso_modo_vehicle_repair'})
    table.insert(elements, {label = 'Retourner le véhicule',              value = 'menuperso_modo_vehicle_flip'})
    table.insert(elements, {label = 'Afficher/Cacher coordonnées',        value = 'menuperso_modo_showcoord'})
    table.insert(elements, {label = 'Afficher/Cacher noms des joueurs',   value = 'menuperso_modo_showname'})
    table.insert(elements, {label = 'Apparence moldu',                    value = 'menuperso_modo_moldu_skin'})
    table.insert(elements, {label = 'Changer l\'apparence',               value = 'menuperso_modo_changer_skin'})
    table.insert(elements, {label = 'Sauvegarder l\'apparence',           value = 'menuperso_modo_save_skin'})
    table.insert(elements, {label = 'Annonce Staff',           value = 'announce'})
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menuperso_modo',
    {
      title    = 'Modération',
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      local action = data.current.value
      if action == 'menuperso_modo_id_player' then
        local player, distance = ESX.Game.GetClosestPlayer()
        if distance ~= -1 and distance <= 6.0 then
          menuperso_modo_id_player_menu(player)
       end

       elseif data.current.value == 'announce' then
			                messagenotfinish = true
				            Message()

				            
      elseif action == 'menuperso_modo_player_list' then
        menuperso_modo_player_list_menu(playergroup)
      elseif action == 'menuperso_modo_no_clip' then
        menuperso_modo_no_clip_menu()

elseif action == 'menuperso_modo_ktr' then
        menuperso_modo_ktr()
       

      elseif action == 'menuperso_modo_godmode' then
        menuperso_modo_godmode_menu()
      elseif action == 'menuperso_modo_mode_fantome' then
        menuperso_modo_invisible_menu()
      elseif action == 'menuperso_modo_vehicle_repair' then
        menuperso_modo_repair_menu()
      elseif action == 'menuperso_modo_vehicle_flip' then
        menuperso_modo_flip_menu()
      elseif action == 'menuperso_modo_showcoord' then
        menuperso_modo_showcoords_menu()
      elseif action == 'menuperso_modo_showname' then
        menuperso_modo_shownames()
      elseif action == 'menuperso_modo_moldu_skin' then
        ped_custom_menu()
      elseif action == 'menuperso_modo_changer_skin' then
        TriggerEvent('esx_skin:openSaveableMenu', source)
      elseif action == 'menuperso_modo_save_skin' then
        ESX.ShowAdvancedNotification('SAVESKIN', '~p~Modération~s~', 'Sauvegarde de l\'apparence', 'CHAR_MINOTAUR', 7)
        TriggerEvent('esx_skin:requestSaveSkin', source)
      end              
      
    end,
    function(data, menu)
      menu.close()
    end
  )
end

function menuperso_modo_id_player_menu(player)

  ESX.TriggerServerCallback('ktr_iaa:getOtherPlayerData', function(data)

    local jobLabel    = nil
    local sexLabel    = nil
    local sex         = nil
    local dobLabel    = nil
    local heightLabel = nil
    local idLabel     = nil
    local money       = nil
    local account     = nil

    if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
      jobLabel = 'Job : ' .. data.job.label .. ' - ' .. data.job.grade_label
    else
      jobLabel = 'Job : ' .. data.job.label
    end

    if data.sex ~= nil then
      if (data.sex == 'h') or (data.sex == 'H') then
        sex = 'Male'
      else
        sex = 'Female'
      end
      sexLabel = 'Sexe : ' .. sex
    else
      sexLabel = 'Sexe : Inconnu'
    end

    if data.dob ~= nil then
      dobLabel = 'Né(e) : ' .. data.dob
    else
      dobLabel = 'Né(e) : Inconnu'
    end

    if data.height ~= nil then
      heightLabel = 'Taille : ' .. data.height
    else
      heightLabel = 'Taille : Inconnue'
    end

    if data.name ~= nil then
      idLabel = 'STEAMNAME : ' .. data.name
    else
      idLabel = 'STEAMNAME : Inconnu'
    end

    if data.money ~= nil then
      money = 'Cash : ' .. data.money ..' $'
    else
      money = 'Cash : Inconnu'
    end

    if data.account ~= nil then
      account = 'Banque : ' .. data.account .. ' $'
    else
      account = 'Banque : Inconnu'
    end

    local blackMoney = 0

    for i=1, #data.accounts, 1 do
      if data.accounts[i].name == 'black_money' then
        blackMoney = data.accounts[i].money
      end
    end

    local elements = {
      {label = idLabel,     value = nil},
      {label = "Nom : " .. data.firstname .. " " .. data.lastname, value = nil},
      {label = sexLabel,    value = nil},
      {label = dobLabel,    value = nil},
      {label = heightLabel, value = nil},
      {label = jobLabel,    value = nil},
   --   {label = inventory,   value = nil},
    }

    if data.licenses ~= nil then

      table.insert(elements, {label = '--- Licenses ---', value = nil})

      for i=1, #data.licenses, 1 do
        table.insert(elements, {label = data.licenses[i].label, value = nil})
      end

    end

    table.insert(elements, {label = '--- Argent ---', value = nil})
    table.insert(elements, {label = money, value = nil})
    table.insert(elements, {label = account, value = nil})
    table.insert(elements, {label = "Argent sale : " .. blackMoney .. " $",   value = nil})

table.insert(elements, {label = '---ARME---', value = nil})

for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    =  ESX.GetWeaponLabel(data.weapons[i].name) .. ' | ' .. data.weapons[i].ammo .. ' Munition',
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end


     table.insert(elements, {label = '---INVENTAIRE---', value = nil})

    for i=1, #data.inventory, 1 do
      if data.inventory[i].count > 0 then
        table.insert(elements, {
          label    = 'x' .. data.inventory[i].count ..' | '.. data.inventory[i].label,
          value    = data.inventory[i].name,
          itemType = 'item_standard',
          amount   = data.inventory[i].count
        })
      end
    end





    
  --  table.insert(elements, {label = "[>Inventaire de l'individu<]", value = 'open_inventory_admin', realData = data})

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'menuperso_identity_card_menu',
      {
        title    = "Carte d'identité",
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)
        
        local action = data.current.value
        local realData = data.current.realData
        if action ~= nil and action == 'open_inventory_admin' then
          openAdminTargetInventory(realData)
        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, GetPlayerServerId(player))
  
end

function menuperso_modo_player_list_menu(playergroup)

  ptable = GetPlayers()
  local AmountOfPlayers = 0
  local players = {}
  for _, i in ipairs(ptable) do
    table.insert(players, {PlayerServerId = GetPlayerServerId(i), PlayerName = GetPlayerName(i)})
  end

  local elements = {}
  for k,v in pairs(players) do
  table.insert(elements, {label = v.PlayerName.." ("..tostring(v.PlayerServerId)..")", value = v.PlayerServerId})
  AmountOfPlayers = AmountOfPlayers +1
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menuperso_playerlist_menu',
    {
      title    = 'Liste des joueurs' .." ("..AmountOfPlayers..")",
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      local action  = data.current.value
      local label   = data.current.label
      menuperso_modo_player_list_menu_2(playergroup, label, action)

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function menuperso_modo_player_list_menu_2(playergroup, SteamName, Playerid)

  local elements = {}

  if playergroup == 'mod' then
 --   table.insert(elements, {label = 'Identité du joueur',           value = 'menuperso_modo_id_player'})
    table.insert(elements, {label = "Amener le joueur à soi",       value = 'menuperso_modo_bring'})
    table.insert(elements, {label = "Rejoindre le joueur",          value = 'menuperso_modo_goto'})
    table.insert(elements, {label = 'Mode spectateur',              value = 'menuperso_modo_spectate'})
    --table.insert(elements, {label = "Donner de l'argent (cash)",    value = 'menuperso_modo_givecash'})
    --table.insert(elements, {label = "Donner de l'argent (banque)",  value = 'menuperso_modo_givebank'})
    --table.insert(elements, {label = "Donner de l'argent (sale)",    value = 'menuperso_modo_giveblack'})
    table.insert(elements, {label = "Kick le joueur",               value = 'menuperso_modo_kick'})
    table.insert(elements, {label = "Freeze le joueur",             value = 'menuperso_modo_freeze'})
    --table.insert(elements, {label = "Crash le joueur",              value = 'menuperso_modo_crash'})
  end  
  
  if playergroup == 'admin' then
    table.insert(elements, {label = 'Identité du joueur',           value = 'menuperso_modo_id_player'})
    table.insert(elements, {label = "Amener le joueur à soi",       value = 'menuperso_modo_bring'})
    table.insert(elements, {label = "Rejoindre le joueur",          value = 'menuperso_modo_goto'})
    table.insert(elements, {label = 'Mode spectateur',              value = 'menuperso_modo_spectate'})
    table.insert(elements, {label = "Donner de l'argent (cash)",    value = 'menuperso_modo_givecash'})
    table.insert(elements, {label = "Donner de l'argent (banque)",  value = 'menuperso_modo_givebank'})
    table.insert(elements, {label = "Donner de l'argent (sale)",    value = 'menuperso_modo_giveblack'})
    table.insert(elements, {label = "Kick le joueur",               value = 'menuperso_modo_kick'})
    table.insert(elements, {label = "Freeze le joueur",             value = 'menuperso_modo_freeze'})
    --table.insert(elements, {label = "Crash le joueur",              value = 'menuperso_modo_crash'})
  end  
  
  if playergroup == 'superadmin' or playergroup == 'owner' then
    table.insert(elements, {label = 'Identité du joueur',           value = 'menuperso_modo_id_player'})
    table.insert(elements, {label = "Amener le joueur à soi",       value = 'menuperso_modo_bring'})
    table.insert(elements, {label = "Rejoindre le joueur",          value = 'menuperso_modo_goto'})
    table.insert(elements, {label = 'Mode spectateur',              value = 'menuperso_modo_spectate'})
    table.insert(elements, {label = "Donner de l'argent (cash)",    value = 'menuperso_modo_givecash'})
    table.insert(elements, {label = "Donner de l'argent (banque)",  value = 'menuperso_modo_givebank'})
    table.insert(elements, {label = "Donner de l'argent (sale)",    value = 'menuperso_modo_giveblack'})
    table.insert(elements, {label = "Kick le joueur",               value = 'menuperso_modo_kick'})
    table.insert(elements, {label = "Freeze le joueur",             value = 'menuperso_modo_freeze'})
    table.insert(elements, {label = "Crash le joueur",              value = 'menuperso_modo_crash'})
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'player_menu',
    {
      title    = SteamName,
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      local action = data.current.value
      if action == 'menuperso_modo_id_player' then
        menuperso_modo_id_player_menu2(Playerid)
      elseif action == 'menuperso_modo_bring' then
        menuperso_modo_bring_menu(Playerid)
      elseif action == 'menuperso_modo_goto' then
        menuperso_modo_goto_menu(Playerid)
      elseif action == 'menuperso_modo_spectate' then
        menuperso_modo_spectate_menu(Playerid)
      elseif action == 'menuperso_modo_givecash' then
        menuperso_modo_givemoney_menu(SteamName, Playerid, 'cash')
      elseif action == 'menuperso_modo_givebank' then
        menuperso_modo_givemoney_menu(SteamName, Playerid, 'bank')
      elseif action == 'menuperso_modo_giveblack' then
        menuperso_modo_givemoney_menu(SteamName, Playerid, 'black')
      elseif action == 'menuperso_modo_kick' then
        menuperso_modo_kick_menu(SteamName, Playerid)
      elseif action == 'menuperso_modo_freeze' then
        menuperso_modo_freeze_menu(SteamName, Playerid)
      elseif action == 'menuperso_modo_crash' then
        TriggerServerEvent('nb_menuperso:crashplayerserver', Playerid)
      end

    end,
    function(data2, menu)
      menu.close()
    end
  )
end

function menuperso_modo_bring_menu(Player_id)
  TriggerServerEvent('nb_menuperso:bringplayertomeserver', Player_id)
end

function menuperso_modo_goto_menu(Player_id)
  local playerPed = PlayerPedId()
  local targerPed = GetPlayerPed(GetPlayerFromServerId(Player_id))
  SetEntityCoords(playerPed, GetEntityCoords(targerPed))
end
--lala
function menuperso_modo_spectate_menu(targeted)
  isSpectate = not isSpectate
  local playerPed = PlayerPedId() -- yourself
  local target    = GetPlayerPed(GetPlayerFromServerId(tonumber(targeted)))
  if isSpectate then
    if (not IsScreenFadedOut() and not IsScreenFadingOut()) then
      DoScreenFadeOut(1000)
      while (not IsScreenFadedOut()) do
        Citizen.Wait(0)
      end

      local targetpos = GetEntityCoords(target, false)
      RequestCollisionAtCoord(targetpos.x,targetpos.y,targetpos.z)
      NetworkSetInSpectatorMode(true, target)

      if(IsScreenFadedOut()) then
        DoScreenFadeIn(1000)
      end
    end

    local PlayerSpecName = GetPlayerName(GetPlayerFromServerId(tonumber(targeted)))
    TriggerServerEvent('esx_joblogs:AddInLog',"spec" ,"spec1" ,GetPlayerName(PlayerId()), PlayerSpecName)
    ESX.ShowAdvancedNotification('SPECTATE', '~p~Modération~s~', 'Le joueur ~b~' .. PlayerSpecName .. '~s~ (id:~y~' ..targeted..'~s~) ~g~est en train d\'être spectate~s~', 'CHAR_MINOTAUR', 7)
  else
    if(not IsScreenFadedOut() and not IsScreenFadingOut()) then
      DoScreenFadeOut(1000)
      while (not IsScreenFadedOut()) do
        Citizen.Wait(0)
      end

      local targetpos = GetEntityCoords(playerPed, false)
      RequestCollisionAtCoord(targetpos.x,targetpos.y,targetpos.z)
      NetworkSetInSpectatorMode(false, target)

      if(IsScreenFadedOut()) then
        DoScreenFadeIn(1000)
      end
    end

    local PlayerSpecName = GetPlayerName(GetPlayerFromServerId(tonumber(targeted)))
     TriggerServerEvent('esx_joblogs:AddInLog',"spec" ,"spec2" ,GetPlayerName(PlayerId()), PlayerSpecName)
    ESX.ShowAdvancedNotification('SPECTATE', '~p~Modération~s~', 'Le joueur ~b~' .. PlayerSpecName .. '~s~ (id:~y~' ..targeted..'~s~) ~r~n\'est plus spectate~s~', 'CHAR_MINOTAUR', 7)
  end
end

function menuperso_modo_givemoney_menu(Steam_Name, Player_id, type)

  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'menuperso_modo_givemoney',
    {
      title = 'Argent à donner'
    },
    function(data, menu)

      menu.close()
      local amount = tonumber(data.value)
      if amount == nil or string.len(data.value) < 1 then
        ESX.ShowAdvancedNotification('GIVEMONEY', '~p~Modération~s~', '~r~Montant invalide~s~', 'CHAR_MINOTAUR', 7)
      else
        TriggerServerEvent('nb_menuperso:addmoneybytype', Player_id, type, amount)
        ESX.ShowAdvancedNotification('GIVEMONEY', '~p~Modération~s~', 'Le joueur ~b~' .. Steam_Name .. '~s~ a reçu $~g~' .. amount .. '~s~ de ~y~' .. type, 'CHAR_MINOTAUR', 7)
      end
    end,
  function(data, menu)
    menu.close()
  end
  )

end

function menuperso_modo_kick_menu(Steam_Name, Player_id)

  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'menuperso_modo_kick',
    {
      title = 'Raison du kick'
    },
    function(data, menu)

      menu.close()
      local kickreason = tostring(data.value)
      if data.value == nil or string.len(data.value) < 1 then
        ESX.ShowAdvancedNotification('KICK', '~p~Modération~s~', '~r~Raison invalide~s~', 'CHAR_MINOTAUR', 7)
      else
        TriggerServerEvent('nb_menuperso:kickplayer', Player_id, kickreason)
        ESX.ShowAdvancedNotification('KICK', '~p~Modération~s~', 'Le joueur ~b~' .. Steam_Name .. '~s~ a été kick du serveur', 'CHAR_MINOTAUR', 7)
      end
    end,
  function(data, menu)
    menu.close()
  end
  )

end

function menuperso_modo_freeze_menu(Steam_Name, Player_id)
  freeze = not freeze
  if freeze then
    TriggerServerEvent('nb_menuperso:freezeplayerserver', Player_id)
    ESX.ShowAdvancedNotification('FREEZE', '~p~Modération~s~', 'Le joueur ~b~' .. Steam_Name .. '~s~ a été ~g~freeze~s~', 'CHAR_MINOTAUR', 7)
  else
    TriggerServerEvent('nb_menuperso:freezeplayerserver', Player_id)
    ESX.ShowAdvancedNotification('FREEZE', '~p~Modération~s~', 'Le joueur ~b~' .. Steam_Name .. '~s~ a été ~r~unfreeze~s~', 'CHAR_MINOTAUR', 7)
  end
end

local noclip_speed = 1.0
function menuperso_modo_no_clip_menu()
  noclip = not noclip
  local ped = PlayerPedId()
  if noclip then -- activé
    SetEntityInvincible(ped, true)
    SetEntityVisible(ped, false, false)
    menuperso_modo_no_clip_loop()
     TriggerServerEvent('esx_joblogs:AddInLog',"spec" ,"noclip" ,GetPlayerName(PlayerId()))
    ESX.ShowAdvancedNotification('NOCLIP', '~p~Modération~s~', '~g~Activation~s~', 'CHAR_MINOTAUR', 7)
  else -- désactivé
    if not invisible then
      SetEntityVisible(ped, true, false)
    end
    if not godmode then
      SetEntityInvincible(ped, false)
    end
     TriggerServerEvent('esx_joblogs:AddInLog',"spec" ,"noclip1" ,GetPlayerName(PlayerId()))
    ESX.ShowAdvancedNotification('NOCLIP', '~p~Modération~s~', '~r~Désactivation~s~', 'CHAR_MINOTAUR', 7)
  end
end

function menuperso_modo_no_clip_loop()
  Citizen.CreateThread(function()
    while noclip do
      Citizen.Wait(10)
      local ped = PlayerPedId()
      local x,y,z = getPosition()
      local dx,dy,dz = getCamDirection()
      local speed = noclip_speed

      -- reset du velocity
      SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)

      -- aller vers le haut
      if IsControlPressed(0,32) then -- MOVE UP
        x = x+speed*dx
        y = y+speed*dy
        z = z+speed*dz
      end

      -- aller vers le bas
      if IsControlPressed(0,269) then -- MOVE DOWN
        x = x-speed*dx
        y = y-speed*dy
        z = z-speed*dz
      end

      SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
    end
  end)
end

function menuperso_modo_godmode_menu()
  godmode = not godmode
  local ped = PlayerPedId()
  if godmode then -- activé
    SetEntityInvincible(ped, true)
    ESX.ShowAdvancedNotification('GODMODE', '~p~Modération~s~', '~g~Activation~s~', 'CHAR_MINOTAUR', 7)
  else -- désactivé
    SetEntityInvincible(ped, false)
    ESX.ShowAdvancedNotification('GODMODE', '~p~Modération~s~', '~r~Désactivation~s~', 'CHAR_MINOTAUR', 7)
  end
end

function menuperso_modo_invisible_menu()
  invisible = not invisible
  local ped = PlayerPedId()
  
  if invisible then -- activé
    SetEntityVisible(ped, false, false)
    ESX.ShowAdvancedNotification('INVISIBILITÉ', '~p~Modération~s~', '~g~Activation~s~', 'CHAR_MINOTAUR', 7)
  else -- désactivé
    SetEntityVisible(ped, true, false)
    ESX.ShowAdvancedNotification('INVISIBILITÉ', '~p~Modération~s~', '~r~Désactivation~s~', 'CHAR_MINOTAUR', 7)
  end
end

function menuperso_modo_repair_menu()
  local ped = PlayerPedId()
  local car = GetVehiclePedIsUsing(ped)
  SetVehicleFixed(car)
  SetVehicleDirtLevel(car, 0.0)
  GetDecalWashLevel(car, 1.0)
  ESX.ShowAdvancedNotification('REPAIR VEHICLE', '~p~Modération~s~', '~g~Véhicule réparé~s~', 'CHAR_MINOTAUR', 7)
end

function menuperso_modo_flip_menu()
  local player = PlayerPedId()
  local posdepmenu = GetEntityCoords(player)
  local carTargetDep = GetClosestVehicle(posdepmenu['x'], posdepmenu['y'], posdepmenu['z'], 10.0,0,70)
  if carTargetDep ~= nil then
    platecarTargetDep = GetVehicleNumberPlateText(carTargetDep)
  end
  local playerCoords = GetEntityCoords(PlayerPedId())
  playerCoords = playerCoords + vector3(0, 2, 0)
  SetEntityCoords(carTargetDep, playerCoords)
  ESX.ShowAdvancedNotification('FLIP VEHICLE', '~p~Modération~s~', '~g~Véhicule retourné~s~', 'CHAR_MINOTAUR', 7)
end

function menuperso_modo_showcoords_menu()
  showcoords = not showcoords
  if showcoords then
    menuperso_modo_showcoords_loop()
    ESX.ShowAdvancedNotification('COORDONNÉES', '~p~Modération~s~', '~g~Activation~s~', 'CHAR_MINOTAUR', 7)
  else
    ESX.ShowAdvancedNotification('COORDONNÉES', '~p~Modération~s~', '~r~Désactivation~s~', 'CHAR_MINOTAUR', 7)
  end
end

function menuperso_modo_showcoords_loop()
  Citizen.CreateThread(function()
    while showcoords do
      Citizen.Wait(10)
      local playerPed = PlayerPedId()
      local playerPos = GetEntityCoords(playerPed)
      local playerHeading = GetEntityHeading(playerPed)
      Text("~r~X~s~: " ..playerPos.x.." ~b~Y~s~: " ..playerPos.y.." ~g~Z~s~: " ..playerPos.z.." ~y~Angle~s~: " ..playerHeading.."")
    end
  end)
end

function menuperso_modo_shownames()
  showname = not showname
  if showname then
    ESX.ShowAdvancedNotification('NOMS JOUEURS', '~p~Modération~s~', '~g~Activation~s~', 'CHAR_MINOTAUR', 7)
    menuperso_modo_shownames_loop()
    --menuperso_modo_shownames_loop_2()
  else
    ESX.ShowAdvancedNotification('NOMS JOUEURS', '~p~Modération~s~', '~r~Désactivation~s~', 'CHAR_MINOTAUR', 7)
    for i=0,1000 do
      N_0x31698aa80e0223f8(i)
    end
  end
end

function menuperso_modo_shownames_loop()
  Citizen.CreateThread(function()
    while showname do
      Citizen.Wait(10)
      for _, i in ipairs(GetPlayers()) do
        if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= PlayerPedId() then
          local ped = GetPlayerPed(i)
          --local blip = GetBlipFromEntity( ped )
          headId = Citizen.InvokeNative( 0xBFEFE3321A3F5015, ped, (GetPlayerServerId(i)..' - '..GetPlayerName(i)), false, false, "", false )
        end
      end
    end
  end)
end





function menuperso_modo_ktr()
local elements = {
{label = "Super Héro",             value = 'ktr_admin'},  --invincible / skin 
{label = "Mode Charlie Juge",             value = 'ktr_charlie'},
{label = "Mode Charlie",             value = 'ktr_charlie2'},
--{label = "Flo",             value = 'ktr_admin_flo'},
--{label = "Emka",             value = 'ktr_admin_emka'},
--{label = "KeyTur",             value = 'ktr_admin_keytur'},
{label = "Exit Mode Admin",             value = 'ktr_adminstop'}
--{label = "Changer Heure",             value = 'ktr_heure'}
}
ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'ktr_menu',
    {
      title    = "KTR Menu",
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)
      local playerPed = PlayerPedId()
      local ped = PlayerPedId()
      local action = data.current.value
      local model = nil
      
      if action == 'ktr_admin' then
        SetEntityInvincible(ped, true)
        SetEntityInvincible(playerPed,true)
        -- singe       local model = GetHashKey("a_c_chimp")
local model = GetHashKey("u_m_y_imporage")
	local player = PlayerId()
          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
        	SetRunSprintMultiplierForPlayer(player, 1.49)
        ESX.ShowAdvancedNotification('KTR ADMIN', '~p~Modération~s~', '~g~Activation~s~', 'CHAR_MINOTAUR', 7)


        elseif action == 'ktr_admin_keytur' then
        SetEntityInvincible(ped, true)
        SetEntityInvincible(playerPed,true)
        -- singe       local model = GetHashKey("a_c_chimp")
local model = GetHashKey("u_m_y_juggernaut_01")
	local player = PlayerId()
          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
        	SetRunSprintMultiplierForPlayer(player, 1.49)
        ESX.ShowAdvancedNotification('KTR ADMIN', '~p~Modération~s~', '~g~Activation~s~', 'CHAR_MINOTAUR', 7)


    elseif action == 'ktr_admin_emka' then
        SetEntityInvincible(ped, true)
        SetEntityInvincible(playerPed,true)
        -- singe       local model = GetHashKey("a_c_chimp")
local model = GetHashKey("u_m_y_pogo_01")
	local player = PlayerId()
          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
        	SetRunSprintMultiplierForPlayer(player, 1.49)
        ESX.ShowAdvancedNotification('KTR ADMIN', '~p~Modération~s~', '~g~Activation~s~', 'CHAR_MINOTAUR', 7)




         elseif action == 'ktr_charlie' then
          TriggerServerEvent("ktr_charlie:charlieI")
        ESX.ShowAdvancedNotification('KTR ADMIN', '~p~Modération~s~', '~g~Mode Juge Activer~s~', 'CHAR_MINOTAUR', 7)

        elseif action == 'ktr_charlie2' then
          TriggerServerEvent("ktr_charlie:charlieII")
        ESX.ShowAdvancedNotification('KTR ADMIN', '~p~Modération~s~', '~g~Mode Charlie Activer~s~', 'CHAR_MINOTAUR', 7)

         elseif action == 'ktr_admin_flo' then
        SetEntityInvincible(ped, true)
        SetEntityInvincible(playerPed,true)
        -- singe       local model = GetHashKey("a_c_chimp")
local model = GetHashKey("a_f_y_juggalo_01")
	local player = PlayerId()
          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
        	SetRunSprintMultiplierForPlayer(player, 1.49)
        ESX.ShowAdvancedNotification('KTR ADMIN', '~p~Modération~s~', '~g~Activation~s~', 'CHAR_MINOTAUR', 7)


      elseif action == 'ktr_adminstop' then
      	local player = PlayerId()
        SetEntityInvincible(ped, false)
        SetEntityInvincible(playerPed,false)
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local isMale = skin.sex == 0
          SetRunSprintMultiplierForPlayer(player, 1.0)
          TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
              TriggerEvent('skinchanger:loadSkin', skin)
        ESX.ShowAdvancedNotification('KTR ADMIN', '~p~Modération Stop~s~', '~g~Activation~s~', 'CHAR_MINOTAUR', 7)
        end)
            end)
          end)

elseif action ==  'ktr_heure' then
  	menuperso_modo_ktr_heure()
      end




    end,
    function(data, menu)
      menu.close()
    end
  )
end







function menuperso_modo_ktr_heure()
	local elements = {
{label = "08 Heures",             value = 'ktr_08'},  
{label = "20 Heures",             value = 'ktr_20'},  
{label = "23 Heures",             value = 'ktr_23'}
}
ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'ktr_menu2',
    {
      title    = "KTR Menu",
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)
      local playerPed = PlayerPedId()
      local ped = PlayerPedId()
      local action = data.current.value

      if action == 'ktr_08' then
        
       -- A TERMINER

  
      end

    end,
    function(data, menu)
      menu.close()
    end
  )
end






--
--


RegisterNetEvent('admin:c_godmode')
AddEventHandler('admin:c_godmode', function()
	local playerPed = GetPlayerPed(-1)
	if (SetEntityInvincible() == true) then
	    SetEntityInvincible(playerPed,false)
	    Notify("GodMode ~r~Off")
	elseif (SetEntityInvincible() == false) then
	    SetEntityInvincible(playerPed,true)
	    Notify("GodMode ~g~On")
	end
end)






function menuperso_modo_shownames_loop_2()
  Citizen.CreateThread(function()
    while showname do
      Citizen.Wait(10)
      for i=0,99 do
        N_0x31698aa80e0223f8(i)
      end
      for id = 0, 31 do
        if  ((NetworkIsPlayerActive( id )) and GetPlayerPed( id ) ~= PlayerPedId()) then
          ped = GetPlayerPed( id )
          blip = GetBlipFromEntity( ped )
        
          x1, y1, z1 = table.unpack( GetEntityCoords( PlayerPedId(), true ) )
          x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
          distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
          if (distance < 20) then
            if NetworkIsPlayerTalking( id ) then
              DrawText3D(x2, y2, z2+1, GetPlayerServerId(id) .. "  |  " .. string.sub(GetPlayerName(id), 1, 44) .. "~n~~g~Talking...", 247,124,24)
            else
              DrawText3D(x2, y2, z2+1, GetPlayerServerId(id) .. "  |  " .. string.sub(GetPlayerName(id), 1, 44).."", 255,255,255)
            end
          end  
        end
      end
    end
  end)
end

local skin_armor = false
function ped_custom_menu()

  local elements = {
    {label = "INPUT",             value = 'ped_input'},
    {label = "Personnalisation",  value = 'ped_settings'},
    {label = "Armure",            value = 'ped_armor'},
    {label = "Arme",              value = 'ped_weapon'},
    {label = "Remplir Faim/Soif", value = 'ped_hunger'},
    {label = "Remplir Santé",     value = 'ped_health'},
    {label = "Infinite Stamina",  value = 'ped_infinite_stam'},
    {label = "RESET",             value = 'ped_reset'}
  }

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'ped_customs',
    {
      title    = "Menu ped customs",
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)

      local playerPed = PlayerPedId()
      local action = data.current.value
      if action == 'ped_input' then
        ped_input()
      elseif action == 'ped_settings' then
        TriggerEvent('clothes:open_menu')
        menu.close()
      elseif action == 'ped_armor' then
        skin_armor = not skin_armor
        if skin_armor then
          SetPedArmour(playerPed, 100)
        else
          SetPedArmour(playerPed, 0)
        end
      elseif action == 'ped_weapon' then
        ped_weapon_input()
      elseif action == 'ped_hunger' then
        TriggerEvent('esx_status:add', 'hunger', 1000000)
        TriggerEvent('esx_status:add', 'thirst', 1000000)
      elseif action == 'ped_health' then
        local maxHealth = GetEntityMaxHealth(playerPed)
        SetEntityHealth(playerPed, maxHealth)
      elseif action == 'ped_infinite_stam' then
        menuperso_modo_infinitestam_menu()
      elseif action == 'ped_reset' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local isMale = skin.sex == 0

          TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
              TriggerEvent('skinchanger:loadSkin', skin)
            end)
          end)

        end)
      end
    end,
    function(data, menu)
      menu.close()
    end
  )

end

function ped_input()

  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'ped_input',
    {
      title = 'Menu ped input'
    },
    function(data, menu)

      menu.close()
      local action = data.value
      if action ~= nil then
        
        local modelHash = ''

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          modelHash = GetHashKey(action)

          RequestModel(modelHash)
          while not HasModelLoaded(modelHash) do
            RequestModel(modelHash)
            Citizen.Wait(1)
          end
        
          SetPlayerModel(PlayerId(), modelHash)
          SetModelAsNoLongerNeeded(modelHash)
        end)

      end

    end,
    function(data, menu)
      menu.close()
    end
  )
end

function ped_weapon_input()

  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'ped_input',
    {
      title = 'Menu weapon input'
    },
    function(data, menu)

      menu.close()
      if data.value ~= nil then
        
        local weapon = tostring(data.value)
        local playerPed  = PlayerPedId()
        local weaponHash = GetHashKey(weapon)
      
        GiveWeaponToPed(playerPed, weaponHash, 1000, false, false)

      end

    end,
    function(data, menu)
      menu.close()
    end
  )
end

local infiniteStam = false
function menuperso_modo_infinitestam_menu()
  infiniteStam = not infiniteStam
  if infiniteStam then
    menuperso_modo_infinitestam_loop()
    ESX.ShowAdvancedNotification('INFINITE STAMINA', '~p~Modération~s~', '~g~Activation~s~', 'CHAR_MINOTAUR', 7)
  else
    ESX.ShowAdvancedNotification('INFINITE STAMINA', '~p~Modération~s~', '~r~Désactivation~s~', 'CHAR_MINOTAUR', 7)
  end
end

function menuperso_modo_infinitestam_loop()
  Citizen.CreateThread(function()
    while infiniteStam do
      Citizen.Wait(100)
      RestorePlayerStamina(PlayerId(), 1.0)
    end
  end)
end

function startAttitude(anim)
  Citizen.CreateThread(function()
    local playerPed = PlayerPedId() 
    RequestAnimSet(anim)
    while not HasAnimSetLoaded(anim) do
      Citizen.Wait(1)
    end
    SetPedMovementClipset(playerPed, anim, true)
  end)
end

function startAnim(type, lib, anim)
  Citizen.CreateThread(function()

    RequestAnimDict(lib)
    while not HasAnimDictLoaded(lib) do
      Citizen.Wait(1)
    end

    local PlayerPed = PlayerPedId()

    if type == 'anim' then
      TaskPlayAnim(PlayerPed, lib ,anim ,8.0, -8.0, -1, 0, 0, false, false, false )
    elseif type == 'movanim' then
      TaskPlayAnim(PlayerPed, lib, anim , 8.0, -8.0, -1, 50, 0, false, false, false)
    elseif type == 'loopanim' then
      TaskPlayAnim(PlayerPed, lib ,anim ,8.0, -8.0, -1, 1, 0, false, false, false )
    elseif type == 'movloopanim' then
      TaskPlayAnim(PlayerPed, lib, anim , 8.0, -8.0, -1, 51, 0, false, false, false)
    end

  end)
end

function startScenario(anim)
  local playerPed = PlayerPedId()
  TaskStartScenarioInPlace(playerPed, anim, 0, true)
end

function playShortcut(key)
  if register[key] ~= nil then
    local anim = stringsplit(register[key], '|')
    if anim[1] == "scenario" then
      startScenario(anim[2])
    elseif anim[1] == 'attitude' then
      startAttitude(anim[2])
    else
      startAnim(anim[1], anim[2], anim[3])
    end
  end
end

function addAnim(key, val, shortcut)
  TriggerServerEvent("esx_user_preference:addOrUpdate", key, val)
  registerAnimShortcut(key, val)
  if curLabel ~= "" then
    ESX.ShowNotification("~g~Raccourci ajouté pour l'animation :~s~ ~p~" .. curLabel .. "~s~ " .. shortcut)
  else 
    ESX.ShowNotification("~r~Jouez l'animation une fois avant de la rajouter en raccourci~s~")
  end
end

function registerAnimShortcut(key, val)
  register[key] = val
end

function stringsplit(inputstr, sep) if sep == nil then sep = "%s" end local t={} ; i=1 for str in string.gmatch(inputstr, "([^"..sep.."]+)") do t[i] = str i = i + 1 end return t end

function menuperso_moi_snowball_menu()

  local playerPed   = PlayerPedId()
  local snowball    = GetHashKey("WEAPON_SNOWBALL")

  RequestAnimDict('anim@mp_snowball') -- pre-load the animation

  if not IsPedInAnyVehicle(playerPed) and not IsPlayerClimbing(playerPed) and not IsPlayerFreeAiming(PlayerId()) then
    TaskPlayAnim(playerPed, 'anim@mp_snowball', 'pickup_snowball', 8.0, -1, -1, 0, 1, 0, 0, 0) -- pickup the snowball
    Citizen.Wait(1950) -- wait 2 seconds to prevent spam clicking and getting a lot of snowballs without waiting for animatin to finish.
    GiveWeaponToPed(playerPed, snowball, 5, false, true) -- get 1 snowball each time.
    --TaskPlayAnim(playerPed, "anim@mp_snowball", "pickup_snowball", 1.0,-1.0, 5000, 0, 1, true, true, true)
  end

end

function teleportToWaypoint()
  local targetPed = PlayerPedId()
  local targetVeh = GetVehiclePedIsUsing(targetPed)
  if(IsPedInAnyVehicle(targetPed))then
    targetPed = targetVeh
  end

  if(not IsWaypointActive())then
    ESX.ShowAdvancedNotification('TELEPORTEUR', '~p~Modération~s~', '~r~Pas de marqueur sur la carte !~s~', 'CHAR_MINOTAUR', 7)
    return
  end

  local waypointBlip = GetFirstBlipInfoId(8) -- 8 = Waypoint ID
  local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, waypointBlip, Citizen.ResultAsVector())) 

  -- Ensure Entity teleports above the ground
  local ground
  local groundFound = false
  local groundCheckHeights = {50.0, 100.0, 150.0, 50.0, 0.0, 200.0, 250.0, 300.0, 350.0, 400.0,450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0}


  for i,height in ipairs(groundCheckHeights) do
    SetEntityCoordsNoOffset(targetPed, x,y,height, 0, 0, 1)
    Citizen.Wait(10)

    ground,z = GetGroundZFor_3dCoord(x,y,height)
    if(ground) then
      z = z + 3
      groundFound = true
      break;
    end
  end

  if(not groundFound)then
    z = 500
    -- GiveDelayedWeaponToPed(PlayerPedId(), 0xFBAB5776, 1, 0) -- Parachute
    SetEntityCoordsNoOffset(targetPed, x,y,z, 0, 0, 1)
  end

  SetEntityCoordsNoOffset(targetPed, x,y,z, 0, 0, 1)
  ESX.ShowAdvancedNotification('TELEPORTEUR', '~p~Modération~s~', '~g~Téléporté sur le marqueur !~s~', 'CHAR_MINOTAUR', 7)
end

function getPosition()
  local playerPed = PlayerPedId()
  local x,y,z = table.unpack(GetEntityCoords(playerPed,true))
  return x,y,z
end

function getCamDirection()
  local playerPed = PlayerPedId()
  local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(playerPed)
  local pitch = GetGameplayCamRelativePitch()

  local x = -math.sin(heading*math.pi/180.0)
  local y = math.cos(heading*math.pi/180.0)
  local z = math.sin(pitch*math.pi/180.0)

  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end

  return x,y,z
end

function DrawText3D(x,y,z, text, r,g,b)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

  local scale = (1/dist)*2
  local fov = (1/GetGameplayCamFov())*100
  local scale = scale*fov
 
  if onScreen then
    SetTextScale(0.0*scale, 0.55*scale)
    SetTextFont(0)
    SetTextProportional(1)
    -- SetTextScale(0.0, 0.55)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
  end
end

function GetPlayers()
  local players = {}

  for i = 0, 256 do
    if NetworkIsPlayerActive(i) then
      table.insert(players, i)
    end
  end
  return players
end

function IsInVehicle()
  local ply = PlayerPedId()
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

RegisterNetEvent('esx_animations:loadShortcut')
AddEventHandler('esx_animations:loadShortcut', function(key, val)
  if key == "anim_1" or
  key == "anim_2" or
  key == "anim_3" or
  key == "anim_4" or
  key == "anim_5" or
  key == "anim_6" or
  key == "anim_7" or
  key == "anim_8" or
  key == "anim_9" then
    registerAnimShortcut(key, val)
  end
end)

RegisterNetEvent('nb_menuperso:bringplayertomeclient')
AddEventHandler('nb_menuperso:bringplayertomeclient', function(admin)
  local playerPed = PlayerPedId()
  local targerPed = GetPlayerPed(GetPlayerFromServerId(admin))
  SetEntityCoords(playerPed, GetEntityCoords(targerPed))
end)

RegisterNetEvent('nb_menuperso:crashplayerclient')
AddEventHandler('nb_menuperso:crashplayerclient', function()
  while true do end
end)

RegisterNetEvent('nb_menuperso:freezePlayerclient')
AddEventHandler('nb_menuperso:freezePlayerclient', function(state)
  local player = PlayerId()
  local ped = PlayerPedId()
  if not state then
    if not IsEntityVisible(ped) then
      SetEntityVisible(ped, true)
    end

    if not IsPedInAnyVehicle(ped) then
      SetEntityCollision(ped, true)
    end

    FreezeEntityPosition(ped, false)
    --SetCharNeverTargetted(ped, false)
    SetPlayerInvincible(player, false)
  else
    SetEntityCollision(ped, false)
    FreezeEntityPosition(ped, true)
    --SetCharNeverTargetted(ped, true)
    SetPlayerInvincible(player, true)
    --RemovePtfxFromPed(ped)

    if not IsPedFatallyInjured(ped) then
      ClearPedTasksImmediately(ped)
    end
  end
end)

RegisterNetEvent('nb_menuperso:givePosition')
AddEventHandler('nb_menuperso:givePosition', function()
  local playerPed = PlayerPedId()
  local pos = GetEntityCoords(playerPed)
  local string = "{ x = " .. pos.x .. ", y = " .. pos.y .. ", z = " .. pos.z-1 .. " },\n"
  TriggerServerEvent('nb_menuperso:givePos', string)
  TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, 'Position saved to file.')
end)

---------------------------------------------------------------------------------------------------------
--NB : gestion des menu
---------------------------------------------------------------------------------------------------------

RegisterNetEvent('nb_menuperso:goTpMarker')
AddEventHandler('nb_menuperso:goTpMarker', function()
  teleportToWaypoint()
end)

RegisterNetEvent('nb_menuperso:openMenuPersonnel')
AddEventHandler('nb_menuperso:openMenuPersonnel', function()
  OpenPersonnelMenu()
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)
    
    if IsControlJustReleased(0, Keys['F10']) and GetLastInputMethod(2) then
      local playerPed = PlayerPedId()
      ClearPedTasks(playerPed)
    end
    
    if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'menuperso_animations_2') or ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'menuperso_demarches_2') then

      local str = nil
      
      if curType ~= nil then
        str = curType
      end
  
      if curlib ~= nil then
        str = str .. '|' .. curlib
      end
      
      if curAnim ~= nil then
        str = str .. '|' .. curAnim
      end
  
      if IsControlPressed(0, 21) and str ~= nil then
        if IsDisabledControlJustReleased(0, 157) then
          addAnim("anim_1", str, "(MAJ+1)")
        elseif IsDisabledControlJustReleased(0, 158) then
          addAnim("anim_2", str, "(MAJ+2)")
        elseif IsDisabledControlJustReleased(0, 159) then
          addAnim("anim_6", str, "(MAJ+6)")
        elseif IsDisabledControlJustReleased(0, 160) then
          addAnim("anim_3", str, "(MAJ+3)")
        elseif IsDisabledControlJustReleased(0, 161) then
          addAnim("anim_7", str, "(MAJ+7)")
        elseif IsDisabledControlJustReleased(0, 162) then
          addAnim("anim_8", str, "(MAJ+8)")
        elseif IsDisabledControlJustReleased(0, 163) then
          addAnim("anim_9", str, "(MAJ+9)")
        elseif IsDisabledControlJustReleased(0, 164) then
          addAnim("anim_4", str, "(MAJ+4)")
        elseif IsDisabledControlJustReleased(0, 165) then
          addAnim("anim_5", str, "(MAJ+5)")
        end
      end
    else
  
      if IsControlPressed(0, 21) then
        DisableControlAction(0, 157, true)
        DisableControlAction(0, 158, true)
        DisableControlAction(0, 159, true)
        DisableControlAction(0, 160, true)
        DisableControlAction(0, 161, true)
        DisableControlAction(0, 162, true)
        DisableControlAction(0, 163, true)
        DisableControlAction(0, 164, true)
        DisableControlAction(0, 165, true)
        curlib = nil
        curAnim = nil
        curType = nil
        curLabel = ""
        if IsDisabledControlJustReleased(0, 157) then
          playShortcut("anim_1")
        elseif IsDisabledControlJustReleased(0, 158) then
          playShortcut("anim_2")
        elseif IsDisabledControlJustReleased(0, 159) then
          playShortcut("anim_6")
        elseif IsDisabledControlJustReleased(0, 160) then
          playShortcut("anim_3")
        elseif IsDisabledControlJustReleased(0, 161) then
          playShortcut("anim_7")
        elseif IsDisabledControlJustReleased(0, 162) then
          playShortcut("anim_8")
        elseif IsDisabledControlJustReleased(0, 163) then
          playShortcut("anim_9")
        elseif IsDisabledControlJustReleased(0, 164) then
          playShortcut("anim_4")
        elseif IsDisabledControlJustReleased(0, 165) then
          playShortcut("anim_5")
        end
      end
    end
  
  end
end)



function openFacture()
	TriggerEvent('NB:closeAllSubMenu')
	TriggerEvent('NB:closeAllMenu')
	TriggerEvent('NB:closeMenuKey')
	
	TriggerEvent('NB:openMenuFactures')
end

function openMenuAccessoire2()
  TriggerEvent('NB:closeAllSubMenu')
  TriggerEvent('NB:closeAllMenu')
  TriggerEvent('NB:closeMenuKey')
  
  TriggerEvent('NB:openMenuAccessoire2')
end


function openVetement(target)

	local elements = {}
	table.insert(elements, {label = ('Remmetre vos vetement'), value = 'mettre'})
	table.insert(elements, {label = ('Retirer votre haut'), value = 'tshirt'})
	table.insert(elements, {label = ('Retirer votre bas'), value = 'pants'})
	table.insert(elements, {label = ('Retirer vos Chaussure'), value = 'shoes'})
	table.insert(elements, {label = ('Retirer votre Sac'), value = 'sac'})
	table.insert(elements, {label = ('Retirer votre Gilet Par Balle'), value = 'gilet'})
	table.insert(elements, {label = ('Retirer votre Chaine'), value = 'chaine'})
  		ESX.UI.Menu.CloseAll()	


	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'action_menu_vetement',
		{
			title    = ('Gestion Vetement'),
			align    = 'top-left',
			elements = elements
		},
    function(data, menu)
    	if data.current.value == 'tshirt' then			
		TriggerEvent('vetement:tshirt')
	--	openPorterPersonne()
		--ESX.UI.Menu.CloseAll()	
		elseif data.current.value == 'pants' then
		TriggerEvent('vetement:pants')

		elseif data.current.value == 'sac' then
		TriggerEvent('vetement:sac')

	elseif data.current.value == 'gilet' then
		TriggerEvent('vetement:gilet')
		elseif data.current.value == 'chaine' then
		TriggerEvent('vetement:chaine')
		

	elseif data.current.value == 'mettre' then
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed,  false) then
			
		ESX.ShowNotification('~r~Vous ne pouvez pas faire cette action')
	else
    RequestAnimDict('mp_clothing@female@shoes')
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
        Citizen.Wait(0)
      end
    TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    Citizen.Wait(2000)
		   ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local isMale = skin.sex == 0

          TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
              TriggerEvent('skinchanger:loadSkin', skin) 
		ESX.ShowNotification(('Vous venez de vous rhabiller')) 
end)
        end)
end)
		end
		--ESX.UI.Menu.CloseAll()	
		elseif data.current.value == 'shoes' then
		TriggerEvent('vetement:shoes')
		
		--ESX.UI.Menu.CloseAll()	
	  end
end,
      function(data, menu)
        menu.close()
   --   end
	end)
end

--HELP



RegisterNetEvent('vetement:tshirt')
AddEventHandler('vetement:tshirt', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed,  false) then
		ESX.ShowNotification('~r~Vous ne pouvez pas faire cette action')
	else
    RequestAnimDict('mp_clothing@female@shoes')
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
        Citizen.Wait(0)
      end
    TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    Citizen.Wait(2000)
	TriggerEvent('skinchanger:getSkin', function(skin)

		local clothesSkin = {
		['tshirt_1']	= 15, ['tshirt_2']	= 0,
		['torso_1']	= 15, ['torso_2']	= 0,
		['arms']	= 15,  ['decals_1']	= 0,
		}
		ESX.ShowNotification(('Vous venez de retirer votre haut'))
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end
	end)



RegisterNetEvent('vetement:pants')
AddEventHandler('vetement:pants', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed,  false) then
		ESX.ShowNotification('~r~Vous ne pouvez pas faire cette action')
	else
    RequestAnimDict('mp_clothing@female@shoes')
    while not HasAnimDictLoaded('mp_clothing@female@shoes') do
        Citizen.Wait(0)
      end
    TaskPlayAnim(playerPed, 'mp_clothing@female@shoes', 'try_shoes_negative_a',8.0, -8.0, -1, 0, 0, false, false, false )
    Citizen.Wait(2000)
	TriggerEvent('skinchanger:getSkin', function(skin)
		local clothesSkin = {
		['pants_1']	= 21, ['pants_2']	= 0,
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		ESX.ShowNotification(('Vous venez de retirer votre pantalon'))
	end)
end
end)





RegisterNetEvent('vetement:chaine')
AddEventHandler('vetement:chaine', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed,  false) then
		ESX.ShowNotification('~r~Vous ne pouvez pas faire cette action')
	else
	TriggerEvent('skinchanger:getSkin', function(skin)
		local clothesSkin = {
		['chain_1']	= 0,
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		ESX.ShowNotification(('Vous venez de retirer votre Chaine'))
	end)
end
end)


RegisterNetEvent('vetement:sac')
AddEventHandler('vetement:sac', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed,  false) then
		ESX.ShowNotification('~r~Vous ne pouvez pas faire cette action')
	else
	TriggerEvent('skinchanger:getSkin', function(skin)
		local clothesSkin = {
		['bags_1']	= 0,
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		ESX.ShowNotification(('Vous venez de retirer votre Sac'))
	end)
end
end)


RegisterNetEvent('vetement:gilet')
AddEventHandler('vetement:gilet', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed,  false) then
		ESX.ShowNotification('~r~Vous ne pouvez pas faire cette action')
	else
	TriggerEvent('skinchanger:getSkin', function(skin)
		local clothesSkin = {
		['bproof_1']	= 0,
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		ESX.ShowNotification(('Vous venez de retirer votre Gilet Par Balle'))
	end)
end
end)


RegisterNetEvent('vetement:shoes')
AddEventHandler('vetement:shoes', function()
	local playerPed = GetPlayerPed(-1)

	if IsPedInAnyVehicle(playerPed,  false) then
		ESX.ShowNotification('~r~Vous ne pouvez pas faire cette action')
	else
	TriggerEvent('skinchanger:getSkin', function(skin)
		local clothesSkin = {
		['shoes_1']	= 34, ['shoes_2']	= 0,
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		ESX.ShowNotification(('Vous venez de retirer vos chaussures'))
	end)
end
end)







function menuperso_modo_id_player_menu2(Player_id)

  ESX.TriggerServerCallback('ktr_iaa:getOtherPlayerData2', function(data)

    local jobLabel    = nil
    local sexLabel    = nil
    local sex         = nil
    local dobLabel    = nil
    local heightLabel = nil
    local idLabel     = nil
    local money       = nil
    local account     = nil

    if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
      jobLabel = 'Job : ' .. data.job.label .. ' - ' .. data.job.grade_label
    else
      jobLabel = 'Job : ' .. data.job.label
    end

    if data.sex ~= nil then
      if (data.sex == 'h') or (data.sex == 'H') then
        sex = 'Male'
      else
        sex = 'Female'
      end
      sexLabel = 'Sexe : ' .. sex
    else
      sexLabel = 'Sexe : Inconnu'
    end

    if data.dob ~= nil then
      dobLabel = 'Né(e) : ' .. data.dob
    else
      dobLabel = 'Né(e) : Inconnu'
    end

    if data.height ~= nil then
      heightLabel = 'Taille : ' .. data.height
    else
      heightLabel = 'Taille : Inconnue'
    end

    if data.name ~= nil then
      idLabel = 'STEAMNAME : ' .. data.name
    else
      idLabel = 'STEAMNAME : Inconnu'
    end

    if data.money ~= nil then
      money = 'Cash : ' .. data.money
    else
      money = 'Cash : Inconnu'
    end

    if data.account ~= nil then
      account = 'Banque : ' .. data.account
    else
      account = 'Banque : Inconnu'
    end

    local blackMoney = 0

    for i=1, #data.accounts, 1 do
      if data.accounts[i].name == 'black_money' then
        blackMoney = data.accounts[i].money
      end
    end

    local elements = {
      {label = idLabel,     value = nil},
      {label = "Nom : " .. data.firstname .. " " .. data.lastname, value = nil},
      {label = sexLabel,    value = nil},
      {label = dobLabel,    value = nil},
      {label = heightLabel, value = nil},
      {label = jobLabel,    value = nil},
   --   {label = inventory,   value = nil},
    }

    if data.licenses ~= nil then

      table.insert(elements, {label = '--- Licenses ---', value = nil})

      for i=1, #data.licenses, 1 do
        table.insert(elements, {label = data.licenses[i].label, value = nil})
      end

    end

    table.insert(elements, {label = '--- Argent ---', value = nil})
    table.insert(elements, {label = money, value = nil})
    table.insert(elements, {label = account, value = nil})
    table.insert(elements, {label = "Argent sale : " .. blackMoney .. " $",   value = nil})
    table.insert(elements, {label = '---ARME---', value = nil})

for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    =  ESX.GetWeaponLabel(data.weapons[i].name) .. ' | ' .. data.weapons[i].ammo .. ' Munition',
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end
     table.insert(elements, {label = '---INVENTAIRE---', value = nil})

    for i=1, #data.inventory, 1 do
      if data.inventory[i].count > 0 then
        table.insert(elements, {
          label    = 'x' .. data.inventory[i].count ..' | '.. data.inventory[i].label,
          value    = data.inventory[i].name,
          itemType = 'item_standard',
          amount   = data.inventory[i].count
        })
      end
    end
  --  table.insert(elements, {label = "[>Inventaire de l'individu<]", value = 'open_inventory_admin', realData = data})

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'menuperso_identity_card_menu',
      {
        title    = "Carte d'identité",
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)
        local targerPed = GetPlayerPed(GetPlayerFromServerId(Player_id))
        local action = data.current.value
        local realData = data.current.realData
        if action ~= nil and action == 'open_inventory_admin' then
          openAdminTargetInventory(Player_id)
        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, GetPlayerServerId(targerPed))   -- 4555
  
end


--
--
--






function openAction(target)

	local elements = {}
	table.insert(elements, {label = ('Fouiller'), value = 'openactionktr'})
	table.insert(elements, {label = ('Gérer l\'animal'), value = 'animal'})
	--table.insert(elements, {label = ('Retirer votre bas'), value = 'pants'})
	--table.insert(elements, {label = ('Retirer vos Chaussure'), value = 'shoes'})
  		ESX.UI.Menu.CloseAll()	


	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'action_menu',
		{
			title    = ('Gestion Action'),
			align    = 'top-left',
			elements = elements
		},
    function(data, menu)
    	if data.current.value == 'openactionktr' then			
		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 1.0 then
        	ESX.ShowNotification('~g~Vous fouillez la personne.')
          TriggerServerEvent('esx_joblogs:AddInLog',"fouiller" ,"fouiller_log" ,GetPlayerName(PlayerId()) , GetPlayerName(closestPlayer))--9999

        TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), '~r~Vous êtes fouillé.')
        Wait(3000)
          menuperso_modo_id_player_menu3(closestPlayer)--(player)
       end

elseif data.current.value == 'animal' then
openAnimal()
      


		
		--ESX.UI.Menu.CloseAll()	
	  end
end,
      function(data, menu)
        menu.close()
   --   end
	end)
end



function menuperso_modo_id_player_menu3(player)

  ESX.TriggerServerCallback('ktr_iaa:getOtherPlayerData', function(data)

    local jobLabel    = nil
    local sexLabel    = nil
    local sex         = nil
    local dobLabel    = nil
    local heightLabel = nil
    local idLabel     = nil
    local money       = nil
    local account     = nil

    if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
      jobLabel = 'Job : ' .. data.job.label .. ' - ' .. data.job.grade_label
    else
      jobLabel = 'Job : ' .. data.job.label
    end

    if data.sex ~= nil then
      if (data.sex == 'h') or (data.sex == 'H') then
        sex = 'Male'
      else
        sex = 'Female'
      end
      sexLabel = 'Sexe : ' .. sex
    else
      sexLabel = 'Sexe : Inconnu'
    end

    if data.dob ~= nil then
      dobLabel = 'Né(e) : ' .. data.dob
    else
      dobLabel = 'Né(e) : Inconnu'
    end

    if data.height ~= nil then
      heightLabel = 'Taille : ' .. data.height
    else
      heightLabel = 'Taille : Inconnue'
    end

    if data.name ~= nil then
      idLabel = 'STEAMNAME : ' .. data.name
    else
      idLabel = 'STEAMNAME : Inconnu'
    end

    if data.money ~= nil then
      money = 'Cash : ' .. data.money
    
    end

    if data.bank ~= nil then
      bank = 'Banque : ' .. data.bank
    
    end

    local blackMoney = 0

    for i=1, #data.accounts, 1 do
      if data.accounts[i].name == 'black_money' then
        blackMoney = data.accounts[i].money
      end
    end

    local elements = {
   --   {label = idLabel,     value = nil},
   --   {label = "Nom : " .. data.firstname .. " " .. data.lastname, value = nil},
   --   {label = sexLabel,    value = nil},
  --    {label = dobLabel,    value = nil},
  --    {label = heightLabel, value = nil},
  --    {label = jobLabel,    value = nil},
   --   {label = inventory,   value = nil},
    }

    if data.licenses ~= nil then

      table.insert(elements, {label = '--- LICENSE(S) ---', value = nil})

      for i=1, #data.licenses, 1 do
        table.insert(elements, {label = data.licenses[i].label, value = nil})
      end

    end

    table.insert(elements, {label = '--- ARGENT ---', value = nil})
 --   table.insert(elements, {label = money .. '$', value = nil})
 --   table.insert(elements, {label = account, value = nil})
    table.insert(elements, {label = "Argent sale : " .. blackMoney .. " $",   value = nil})
    table.insert(elements, {label = '---ARME(S)---', value = nil})

for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    =  ESX.GetWeaponLabel(data.weapons[i].name) .. ' | ' .. data.weapons[i].ammo .. ' Munition',
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end
     table.insert(elements, {label = '---INVENTAIRE---', value = nil})

    for i=1, #data.inventory, 1 do
      if data.inventory[i].count > 0 then
        table.insert(elements, {
          label    = 'x' .. data.inventory[i].count ..' | '.. data.inventory[i].label,
          value    = data.inventory[i].name,
          itemType = 'item_standard',
          amount   = data.inventory[i].count
        })
      end
    end
  --  table.insert(elements, {label = "[>Inventaire de l'individu<]", value = 'open_inventory_admin', realData = data})

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'menuperso_identity_card_menu',
      {
        title    = "Fouiller",
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)
        
        local action = data.current.value
        local realData = data.current.realData
        if action ~= nil and action == 'open_inventory_admin' then
          openAdminTargetInventory(realData)
        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, GetPlayerServerId(player))
  
end

-- message
function Message()
	Citizen.CreateThread(function()
    while messagenotfinish do
    		Citizen.Wait(1)

			DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 100)
		    while (UpdateOnscreenKeyboard() == 0) do
		        DisableAllControlActions(0);
		       Citizen.Wait(1)
		    end
		    if (GetOnscreenKeyboardResult()) then
		        local result = GetOnscreenKeyboardResult()
		        messagenotfinish = false
		       TriggerServerEvent('nb_menuperso:annonce',result)
		        
		    end


		end
	end)
	
end

function DrawAdvancedTextCNN (x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end


 Citizen.CreateThread(function()
		    while true do
		        Citizen.Wait(1)    
		                       
		            if (affichenews == true) then
		           
				            DrawRect(0.494, 0.04, 5.185, 0.118, 0, 0, 0, 150)
				            DrawAdvancedTextCNN(0.588, 0.02, 0.005, 0.0028, 0.8, "~r~ AGORIA STAFF ~d~", 255, 255, 255, 255, 1, 0)
				            DrawAdvancedTextCNN(0.588, 0.065, 0.005, 0.0028, 0.6, texteafiche, 255, 255, 255, 255, 7, 0)
				            DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "", 255, 255, 255, 255, 0, 0)

				    end                
		   end
		end)


RegisterNetEvent('nb_menuperso:annonce')
AddEventHandler('nb_menuperso:annonce', function(text)
 		texteafiche = text
 		affichenews = true
		
  end) 


RegisterNetEvent('nb_menuperso:annoncestop')
AddEventHandler('nb_menuperso:annoncestop', function()
 		affichenews = false
 		
  end)