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

local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local CurrentTask = {}
ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

AddEventHandler('ktr_traitement:hasEnteredMarker', function(zone)


	if zone == 'TraitementAlBonneBouf' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
		CurrentAction     = 'traitement_albonnebouf'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire l\'action'
		CurrentActionData = {zone= zone}
	end

	
	
end)




AddEventHandler('ktr_traitement:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	
	CurrentAction = nil
end)





-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
end)


-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do

		Wait(0)


			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('ktr_traitement:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('ktr_traitement:hasExitedMarker', LastZone)
			end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlPressed(0,  Keys['E'])  and (GetGameTimer() - GUI.Time) > 300 then
				
				
				if CurrentAction == 'traitement_albonnebouf'  and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
					OpenAlBonneBouf()
				end
				
				
				
				CurrentAction = nil
				GUI.Time      = GetGameTimer()

			end
		end

		
	end
end)



function OpenAlBonneBouf()

  local elements = {}

    table.insert(elements, {label = ('Al Bonne Bouf'),    value = 'albonnebouf_menu'})

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'unicorn_actions',
    {
      title    = ('Traitement'),
      align    = 'top-left',
      elements = elements
    },
    function(data, menu)



      if data.current.value == 'albonnebouf_menu' then
        
          ESX.UI.Menu.Open(
              'default', GetCurrentResourceName(), 'albonnebouf_menu',
              {
                  title = ('Traitement'),
                  align = 'top-left',
                  elements = {
                      {label = ('Sandwich'),     value = 'sandwich'},
                      {label = ('Sandwich au viande'),     value = 'sandwichviande'},
                      {label = ('Salade Mixte'),     value = 'salademixte'},
                      {label = ('Salade au Fruit'),     value = 'saladefruit'},
                      {label = ('Cornet de Frite'),     value = 'cornetfrite'},
                      {label = ('Chicken Burger'),     value = 'chickenburger'},
                      {label = ('Fish Burger'),     value = 'fishburger'},
                      {label = ('Soupe à la Tomate'),     value = 'soupetomate'},
                      {label = ('Salade César'),     value = 'saladecesar'},
                      {label = ('Delicious Sandwich'),     value = 'delicious'},
                      {label = ('Venetoast'),     value = 'venetoast'},
                      
                  }
              },
              function(data2, menu2)
            
                TriggerServerEvent('ktr_traitement:traitementalbonnebouf', data2.current.value)
               

      
              end,
              function(data2, menu2)
                  menu2.close()
              end
          )
      end
     
    end,
    function(data, menu)

      menu.close()

    end
  )

end


RegisterNetEvent('ktr_traitement:BloqueTouche')
AddEventHandler('ktr_traitement:BloqueTouche', function()

	DisableControlAction(2, Keys['ENTER'], true)
    Citizen.Wait(1000)
    DisableControlAction(2, Keys['ENTER'], false)

end)