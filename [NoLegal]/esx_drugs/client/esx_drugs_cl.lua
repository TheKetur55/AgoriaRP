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

local cokeQTE       			= 0
ESX 			    			= nil
local coke_poochQTE 			= 0
local weedQTE					= 0
local weed_poochQTE 			= 0
local methQTE					= 0
local meth_poochQTE 			= 0
local opiumQTE					= 0
local opium_poochQTE 			= 0
--Nouvelle
local coco_huileQTE				= 0
local coco_noixQTE 				= 0
local huile_de_cocoQTE 			= 0
--
local poudre_solQTE				= 0
local coriumQTE 				= 0
local virus_tchernobylQTE 		= 0
--
local fleur_mauveQTE			=0
local daturaQTE					=0
local pommeQTE					=0
--
local myJob 					= nil
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local isInZone                  = false
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx_drugs:hasEnteredMarker', function(zone)
	if myJob == '' or myJob == '' then
		return
	end

	
	
	if zone == 'exitMarker' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('exit_marker')
		CurrentActionData = {}
	end



	--Nouvelle
	if zone == 'CocoField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_coco')
		CurrentActionData = {}
	end

	if zone == 'CocoField2' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect2_coco')
		CurrentActionData = {}
	end

	if zone == 'CocoProcessing' then
		--if coco_huileQTE >= 5 and coco_noixQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_coco')
			CurrentActionData = {}
		--end
	end

	if zone == 'CocoDealer' then
		--if huile_de_cocoQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_coco')
			CurrentActionData = {}
		--end
	end
--
--
	if zone == 'VirusField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_virus')
		CurrentActionData = {}
	end

	if zone == 'VirusField2' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect2_virus')
		CurrentActionData = {}
	end

	if zone == 'VirusProcessing' then
		--if coriumQTE >= 1 and poudre_solQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_virus')
			CurrentActionData = {}
		--end
	end

	if zone == 'VirusDealer' then
		--if virus_tchernobylQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_virus')
			CurrentActionData = {}
		--end
	end

	if zone == 'DaturaField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_datura')
		CurrentActionData = {}
	end

	if zone == 'DaturaProcessing' then
		--if  pommeQTE >= 5 and fleur_mauveQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_datura')
			CurrentActionData = {}
		--end
	end

	if zone == 'DaturaDealer' then
		--if daturaQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_datura')
			CurrentActionData = {}
		--end
	end




	-- fin
	if zone == 'CokeField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_coke')
		CurrentActionData = {}
	end

	if zone == 'CokeProcessing' then
		--if cokeQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_coke')
			CurrentActionData = {}
		--end
	end

	if zone == 'CokeDealer' then
		--if coke_poochQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_coke')
			CurrentActionData = {}
		--end
	end

	if zone == 'MethField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_meth')
		CurrentActionData = {}
	end

	if zone == 'MethProcessing' then
		--if methQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_meth')
			CurrentActionData = {}
		--end
	end

	if zone == 'MethDealer' then
		--if meth_poochQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_meth')
			CurrentActionData = {}
		--end
	end

	if zone == 'WeedField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_weed')
		CurrentActionData = {}
	end

	if zone == 'WeedProcessing' then
		--if weedQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_weed')
			CurrentActionData = {}
		--end
	end

	if zone == 'WeedDealer' then
		--if weed_poochQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_weed')
			CurrentActionData = {}
		--end
	end

	if zone == 'OpiumField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_opium')
		CurrentActionData = {}
	end

	if zone == 'OpiumProcessing' then
		--if opiumQTE >= 5 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_process_opium')
			CurrentActionData = {}
		--end
	end

	if zone == 'OpiumDealer' then
		--if opium_poochQTE >= 1 then
			CurrentAction     = zone
			CurrentActionMsg  = _U('press_sell_opium')
			CurrentActionData = {}
		--end
	end
end)

AddEventHandler('esx_drugs:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()


--Nouvelle
TriggerServerEvent('esx_drugs:stopHarvestCoco')
TriggerServerEvent('esx_drugs:stopHarvest2Coco')
TriggerServerEvent('esx_drugs:stopTransformCoco')
TriggerServerEvent('esx_drugs:stopSellCoco')
	--
	--
TriggerServerEvent('esx_drugs:stopHarvestVirus')
TriggerServerEvent('esx_drugs:stopHarvest2Virus')
TriggerServerEvent('esx_drugs:stopTransformVirus')
TriggerServerEvent('esx_drugs:stopSellVirus')

TriggerServerEvent('esx_drugs:stopHarvestDatura')
TriggerServerEvent('esx_drugs:stopTransformDatura')
TriggerServerEvent('esx_drugs:stopSellDatura')

--fin
TriggerServerEvent('esx_drugs:stopHarvestCoke')
TriggerServerEvent('esx_drugs:stopTransformCoke')
TriggerServerEvent('esx_drugs:stopSellCoke')

TriggerServerEvent('esx_drugs:stopHarvestMeth')
TriggerServerEvent('esx_drugs:stopTransformMeth')
TriggerServerEvent('esx_drugs:stopSellMeth')

TriggerServerEvent('esx_drugs:stopHarvestWeed')
TriggerServerEvent('esx_drugs:stopTransformWeed')
TriggerServerEvent('esx_drugs:stopSellWeed')

TriggerServerEvent('esx_drugs:stopHarvestOpium')
TriggerServerEvent('esx_drugs:stopTransformOpium')
TriggerServerEvent('esx_drugs:stopSellOpium')
end)

-- Weed Effect
RegisterNetEvent('esx_drugs:onPot')
AddEventHandler('esx_drugs:onPot', function()
	RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
		Citizen.Wait(0)
	end
	TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
	Citizen.Wait(5000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	SetTimecycleModifier("spectator5")
	SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(GetPlayerPed(-1), true)
	DoScreenFadeIn(1000)
	Citizen.Wait(600000)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(GetPlayerPed(-1), 0)
	SetPedIsDrunk(GetPlayerPed(-1), false)
	SetPedMotionBlur(GetPlayerPed(-1), false)
end)

-- Render markers
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end
		end

	end
end)


-- RETURN NUMBER OF ITEMS FROM SERVER
RegisterNetEvent('esx_drugs:ReturnInventory')
AddEventHandler('esx_drugs:ReturnInventory', function(cokeNbr, cokepNbr, coco2Nbr, cocon2Nbr, cocop2Nbr, cocoNbr, coconNbr, cocopNbr, methNbr, methpNbr, weedNbr, weedpNbr, opiumNbr, opiumpNbr, fleur_mauveNbr, pommeNbr, daturaNbr, jobName, currentZone)
	cokeQTE	   			= cokeNbr
	coke_poochQTE 		= cokepNbr
	--Nouvelle
	coco_huileQTE	   	= cocoNbr
	coco_noixQTE	   	= coconNbr
	huile_de_cocoQTE	= cocopNbr
	--
	--

	poudre_solQTE	   	= coco2Nbr
	coriumQTE	   		= cocon2Nbr
	virus_tchernobylQTE = cocop2Nbr
	fleur_mauveQTE	   	= fleur_mauveNbr
	pommeQTE			= pommeNbr
	daturaQTE 			= daturaNbr


	--
	methQTE 	  		= methNbr
	meth_poochQTE 		= methpNbr
	weedQTE 	  		= weedNbr
	weed_poochQTE 		= weedpNbr
	opiumQTE	   		= opiumNbr
	opium_poochQTE 		= opiumpNbr
	myJob		 		= jobName
	TriggerEvent('esx_drugs:hasEnteredMarker', currentZone)
end)



-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 2) then
				isInMarker  = true
				currentZone = k
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			lastZone				= currentZone
			TriggerServerEvent('esx_drugs:GetUserInventory', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
		end

		if isInMarker and isInZone then
			TriggerEvent('esx_drugs:hasEnteredMarker', 'exitMarker')
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustReleased(0, Keys['E']) then
				isInZone = false -- unless we set this boolean to false, we will always freeze the user
				if CurrentAction == 'exitMarker' then
					isInZone = false -- do not freeze user
					TriggerEvent('esx_drugs:freezePlayer', false)
					TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
					Citizen.Wait(15000)
				elseif CurrentAction == 'CokeField' then
					TriggerServerEvent('esx_drugs:startHarvestCoke')
				elseif CurrentAction == 'CokeProcessing' then
					TriggerServerEvent('esx_drugs:startTransformCoke')
				elseif CurrentAction == 'CokeDealer' then
					TriggerServerEvent('esx_drugs:startSellCoke')



					--Nouvelle
				elseif CurrentAction == 'CocoField' then
					TriggerServerEvent('esx_drugs:startHarvestCoco')
				elseif CurrentAction == 'CocoField2' then
					TriggerServerEvent('esx_drugs:startHarvest2Coco')
				elseif CurrentAction == 'CocoProcessing' then
					TriggerServerEvent('esx_drugs:startTransformCoco')
				elseif CurrentAction == 'CocoDealer' then
					TriggerServerEvent('esx_drugs:startSellCoco')

				elseif CurrentAction == 'DaturaField' then
					TriggerServerEvent('esx_drugs:startHarvestDatura')
				elseif CurrentAction == 'DaturaProcessing' then
					TriggerServerEvent('esx_drugs:startTransformDatura')
				elseif CurrentAction == 'DaturaDealer' then
					TriggerServerEvent('esx_drugs:startSellDatura')
					--
					--
				elseif CurrentAction == 'VirusField' then
					TriggerServerEvent('esx_drugs:startHarvestVirus')
				elseif CurrentAction == 'VirusField2' then
					TriggerServerEvent('esx_drugs:startHarvest2Virus')
				elseif CurrentAction == 'VirusProcessing' then
					TriggerServerEvent('esx_drugs:startTransformVirus')
				elseif CurrentAction == 'VirusDealer' then
					TriggerServerEvent('esx_drugs:startSellVirus')


					--Fin
				elseif CurrentAction == 'MethField' then
					TriggerServerEvent('esx_drugs:startHarvestMeth')
				elseif CurrentAction == 'MethProcessing' then
					TriggerServerEvent('esx_drugs:startTransformMeth')
				elseif CurrentAction == 'MethDealer' then
					TriggerServerEvent('esx_drugs:startSellMeth')
				elseif CurrentAction == 'WeedField' then
					TriggerServerEvent('esx_drugs:startHarvestWeed')
				elseif CurrentAction == 'WeedProcessing' then
					TriggerServerEvent('esx_drugs:startTransformWeed')
				elseif CurrentAction == 'WeedDealer' then
					TriggerServerEvent('esx_drugs:startSellWeed')
				elseif CurrentAction == 'OpiumField' then
					TriggerServerEvent('esx_drugs:startHarvestOpium')
				elseif CurrentAction == 'OpiumProcessing' then
					TriggerServerEvent('esx_drugs:startTransformOpium')
				elseif CurrentAction == 'OpiumDealer' then
					TriggerServerEvent('esx_drugs:startSellOpium')
				else
					isInZone = false -- not a esx_drugs zone
				end
				
				if isInZone then
					TriggerEvent('esx_drugs:freezePlayer', true)
				end
				
				CurrentAction = nil
			end
		end
	end
end)

RegisterNetEvent('esx_drugs:freezePlayer')
AddEventHandler('esx_drugs:freezePlayer', function(freeze)
	FreezeEntityPosition(GetPlayerPed(-1), freeze)
end)
