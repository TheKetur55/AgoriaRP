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

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

AddEventHandler('ktr_recolte:hasEnteredMarker', function(zone)


	if zone == 'Journaliste' and PlayerData.job ~= nil and PlayerData.job.name == 'journaliste' then
		CurrentAction     = 'journaliste_recolte'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour vous récuperer'
		CurrentActionData = {zone= zone}
	end

	if zone == 'NourritureFederal'  then
		CurrentAction     = 'nourriture_fede'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour vous nourir'
		CurrentActionData = {zone= zone}
	end
	
	if zone == 'RecolteTranchePoulet'  then
		CurrentAction     = 'recolte_tranchepoulet'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récolter des Tranche de poulet'
		CurrentActionData = {zone= zone}
	end
	if zone == 'RecoltePommeDeTerre' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
		CurrentAction     = 'recolte_pommeterre'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récolter des pommes de terre'
		CurrentActionData = {zone= zone}
	end
	if zone == 'TraitementCornetDeFrite' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
		CurrentAction     = 'traitement_cornetdefrite'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire des Cornet de frite'
		CurrentActionData = {zone= zone}
	end
	if zone == 'AppelLspd'  then
		CurrentAction     = 'appel_lspd'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire un appel LSPD'
		CurrentActionData = {zone= zone}
	end
	if zone == 'AppelFermier'  then
		CurrentAction     = 'appel_fermier'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire un appel Al Bonne Bouf'
		CurrentActionData = {zone= zone}
	end
	

	if zone == 'AppelLsmd'  then
		CurrentAction     = 'appel_lsmd'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire un appel LSMD'
		CurrentActionData = {zone= zone}
	end
	if zone == 'Appelubereat'  then
		CurrentAction     = 'appel_ubereat'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire un appel Uber eat'
		CurrentActionData = {zone= zone}
	end
	if zone == 'Appelmecano'  then
		CurrentAction     = 'appel_mecano'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire un appel Benny\'S'
		CurrentActionData = {zone= zone}
	end

	if zone == 'TraitementBolCacahuete' and PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' then
		CurrentAction     = 'traitement_bolcacahuete'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire des bol de Cacahuete'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Traitementpisselicorne' and PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' then
		CurrentAction     = 'traitement_pisselicorne'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire des Pisse de Licorne'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Traitementrugissementdulion' and PlayerData.job ~= nil and PlayerData.job.name == 'nightclub' then
		CurrentAction     = 'traitement_rugissementlion'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire des Rugissement du Lion'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Traitementvenetiesboomboom' and PlayerData.job ~= nil and PlayerData.job.name == 'nightclub' then
		CurrentAction     = 'traitement_venetieboomboom'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire des Vénétie\'s Boom Boom'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Traitementplanchebois' and PlayerData.job ~= nil and PlayerData.job.name == 'event' then
		CurrentAction     = 'traitement_bois'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire des Planches de Bois'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Traitementcoketailvenetie' and PlayerData.job ~= nil and PlayerData.job.name == 'nightclub' then
		CurrentAction     = 'traitement_cocketailvenetie'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire un Cocktail'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Traitementsaladefruit' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
		CurrentAction     = 'traitement_pommeterre'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour faire des salade de fruit'
		CurrentActionData = {zone= zone}
	end


	if zone == 'Recoltefarine' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
		CurrentAction     = 'farine_recolte'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récolter le ~g~Blé'
		CurrentActionData = {zone= zone}
	end
	if zone == 'Recoltesalade' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
		CurrentAction     = 'salade_recolte'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récolter la ~g~Salade'
		CurrentActionData = {zone= zone}
	end
	if zone == 'Recoltetomate' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
		CurrentAction     = 'tomate_recolte'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récolter les ~g~Tomates'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Recoltefeuille' and PlayerData.job ~= nil and PlayerData.job.name == 'tabac' then
		CurrentAction     = 'feuille_recolte'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récolter les ~g~Feuille a roulée'
		CurrentActionData = {zone= zone}
	end
	if zone == 'Recoltetabac' and PlayerData.job ~= nil and PlayerData.job.name == 'tabac' then
		CurrentAction     = 'tabac_recolte'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récolter le ~g~Tabac'
		CurrentActionData = {zone= zone}
	end
	if zone == 'Recoltecarton' and PlayerData.job ~= nil and PlayerData.job.name == 'tabac' then
		CurrentAction     = 'carton_recolte'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récolter les ~g~Cartons'
		CurrentActionData = {zone= zone}
	end


	if zone == 'RecolteLavande' and PlayerData.job ~= nil and PlayerData.job.name == 'unemployed' then
		CurrentAction     = 'lavande_recolte'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récolter la ~g~Lavande'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Personnage'  then
		CurrentAction     = 'create_user'
		CurrentActionMsg  = '~r~Utiliser la commande /agoriareload pour faire votre Personnage'
		CurrentActionData = {zone= zone}
	end

	if zone == 'Recoltepieceauto' and PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then
		CurrentAction     = 'pieceauto_recolte'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récolter les ~g~Pièces auto'
		CurrentActionData = {zone= zone}
	end

	if zone == 'RecoltePapier' and PlayerData.job ~= nil and PlayerData.job.name == 'event'  then
		CurrentAction     = 'papier_recolte'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récuperer des ~g~Papiers'
		CurrentActionData = {zone= zone}
	end

	if zone == 'RecolteCacahuete' and PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' then
		CurrentAction     = 'cacahuete_recolte'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour récuperer des ~g~Cacahuete'
		CurrentActionData = {zone= zone}
	end




	if zone == 'TraitementCigarrete' and PlayerData.job ~= nil and PlayerData.job.name == 'tabac' then
		CurrentAction     = 'cigarrete_traitement'
		CurrentActionMsg  = _U('press_traitement')
		CurrentActionData = {zone= zone}
	end	
	if zone == 'TraitementCartonCigarrete' and PlayerData.job ~= nil and PlayerData.job.name == 'tabac' then
		CurrentAction     = 'cigarrete2_traitement'
		CurrentActionMsg  = _U('press_traitement')
		CurrentActionData = {zone= zone}
	end	




		if zone == 'TraitementFarine' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
		CurrentAction     = 'farine_traitement'
		CurrentActionMsg  = _U('press_traitement')
		CurrentActionData = {zone= zone}
	end	

	if zone == 'TraitementSandwich' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
		CurrentAction     = 'sandwich_traitement'
		CurrentActionMsg  = _U('press_traitement')
		CurrentActionData = {zone= zone}
	end	

	if zone == 'TraitementSandwich2' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
		CurrentAction     = 'sandwich_traitement2'
		CurrentActionMsg  = _U('press_traitement')
		CurrentActionData = {zone= zone}
	end	

	if zone == 'Traitementsalade' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
		CurrentAction     = 'salade_traitement'
		CurrentActionMsg  = _U('press_traitement')
		CurrentActionData = {zone= zone}
	end		

		
	if zone == 'TraitementVin' and PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' then
		CurrentAction     = 'vine_traitement'
		CurrentActionMsg  = _U('press_traitement')
		CurrentActionData = {zone= zone}
	end		
		
	if zone == 'TraitementJus' and PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' then
		CurrentAction     = 'jus_traitement'
		CurrentActionMsg  = _U('press_traitement')
		CurrentActionData = {zone = zone}
	end
		
	if zone == 'SellFarm'  then
		CurrentAction     = 'farm_resell'
		CurrentActionMsg  = _U('press_sell')
		CurrentActionData = {zone = zone}
	end
	
	if zone == 'SellFarm2'  then
		CurrentAction     = 'farm_resell'
		CurrentActionMsg  = _U('press_sell')
		CurrentActionData = {zone = zone}
	end
	
	if zone == 'SellFarm3'   then
		CurrentAction     = 'farm_resell'
		CurrentActionMsg  = _U('press_sell')
		CurrentActionData = {zone = zone}
	end

	
	
end)




AddEventHandler('ktr_recolte:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	
	if (zone == 'Traitementplanchebois') then
		TriggerServerEvent('ktr_recolte:stopTransformbois')
	end 
	if (zone == 'TraitementBolCacahuete') then
		TriggerServerEvent('ktr_recolte:stopTransformbolcacahuete')
	end 
	if (zone == 'Traitementpisselicorne') then
		TriggerServerEvent('ktr_recolte:stopTransformpisselicorne')
	end 
	if (zone == 'Journaliste') then
		TriggerServerEvent('ktr_recolte:stopTransformJournaliste')
	end 
	if (zone == 'RecoltePommeDeTerre') then
		TriggerServerEvent('ktr_recolte:stopTransformpommedeterre')
	end 
	if (zone == 'TraitementCornetDeFrite') then
		TriggerServerEvent('ktr_recolte:stopTransformcorentdefrite')
	end 
	
	if (zone == 'RecolteTranchePoulet') then
		TriggerServerEvent('ktr_recolte:stopTransformtranchepoulet')
	end 

	if (zone == 'Traitementrugissementdulion') then
		TriggerServerEvent('ktr_recolte:stopTransformrugissementlion')
	end 

	if (zone == 'Traitementvenetiesboomboom') then
		TriggerServerEvent('ktr_recolte:stopTransformvenetieboomboom')
	end 

	
	if (zone == 'Traitementcoketailvenetie') then
		TriggerServerEvent('ktr_recolte:stopTransformcocketailvenetie')
	end 
	if (zone == 'Traitementsaladefruit') then
		TriggerServerEvent('ktr_recolte:stopTransformsaladefruit')
	end 
	
	if (zone == 'Recoltefarine') then
		TriggerServerEvent('ktr_recolte:stopHarvest5')
	end  
	if (zone == 'Recoltesalade') then
		TriggerServerEvent('ktr_recolte:stopHarvest6')
	end  
	if (zone == 'Recoltetomate') then
		TriggerServerEvent('ktr_recolte:stopHarvest7')
	end  

	if (zone == 'Recoltefeuille') then
		TriggerServerEvent('ktr_recolte:stopHarvest8')
	end  
	if (zone == 'Recoltetabac') then
		TriggerServerEvent('ktr_recolte:stopHarvest9')
	end  
	if (zone == 'Recoltecarton') then
		TriggerServerEvent('ktr_recolte:stopHarvest10')
	end  


	
	if (zone == 'RecolteLavande') then
		TriggerServerEvent('ktr_recolte:stopHarvest')
	end  
	
	if (zone == 'Recoltepieceauto') and PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then
		TriggerServerEvent('ktr_recolte:stopHarves4')
	end  
	if (zone == 'RecoltePapier') then
		TriggerServerEvent('ktr_recolte:stopHarvest2')
	end  
	if (zone == 'RecolteCacahuete') and PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' then
		TriggerServerEvent('ktr_recolte:stopHarvest3')
	end
	if (zone == 'TraitementFarine')  then
		TriggerServerEvent('ktr_recolte:stopTransformfarine')
	end

	if (zone == 'TraitementCigarrete') and PlayerData.job ~= nil and PlayerData.job.name == 'tabac' then
		TriggerServerEvent('ktr_recolte:stopTransformcigarette')
	end
	if (zone == 'TraitementCartonCigarrete')  then
		TriggerServerEvent('ktr_recolte:stopTransformcigarette2')
	end


	if (zone == 'TraitementSandwich')  then
		TriggerServerEvent('ktr_recolte:stopTransformsandiwch')
	end
	if (zone == 'TraitementSandwich2')  then
		TriggerServerEvent('ktr_recolte:stopTransformsandiwch2')
	end
	if (zone == 'Traitementsalade')  then
		TriggerServerEvent('ktr_recolte:stopTransformsalade')
	end
	
	if (zone == 'TraitementVin')  then
		TriggerServerEvent('ktr_recolte:stopTransform')
	end
	if (zone == 'TraitementJus')  then
		TriggerServerEvent('ktr_recolte:stopTransform1')
	end
	if (zone == 'SellFarm')  then
		TriggerServerEvent('ktr_recolte:stopSell')
	end
	if (zone == 'SellFarm2')  then
		TriggerServerEvent('ktr_recolte:stopSell')
	end
	if (zone == 'SellFarm3')  then
		TriggerServerEvent('ktr_recolte:stopSell')
	end
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
				TriggerEvent('ktr_recolte:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('ktr_recolte:hasExitedMarker', LastZone)
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
				
				if CurrentAction == 'appel_fermier'  then
					local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
	local text = GetPlayerName(PlayerId()).." Demande une personne au Al Bonne Bouf"
	ESX.ShowNotification('Vous avez fait l\'appel Al Bonne Bouf')

	TriggerServerEvent("call:makeCall", "fermier", {x = -1191.88, y = -895.05, z = 12.99},text, GetPlayerServerId(player))

					
				end
				if CurrentAction == 'appel_lspd'  then
					local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
	local text = GetPlayerName(PlayerId()).." Demande une personne au Commissariat"
	ESX.ShowNotification('Vous avez fait l\'appel LSPD')

	TriggerServerEvent("call:makeCall", "police", {x=-1093.18,y=-809.50,z=19.20},text, GetPlayerServerId(player))

					
				end
				if CurrentAction == 'appel_lsmd'  then
					local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
	local text = GetPlayerName(PlayerId()).." Demande une personne a l'hopital"
	ESX.ShowNotification('Vous avez fait l\'appel LSMD')

	TriggerServerEvent("call:makeCall", "ambulance", {x = 289.09, y = -589.67, z = 52.20},text, GetPlayerServerId(player))

					
				end
				if CurrentAction == 'appel_ubereat'  then
					local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
	local text = "Vous etes demander a la place Agoria"
	ESX.ShowNotification('Vous avez fait l\'appel Uber eat')

	TriggerServerEvent("call:makeCall", "shop", {x = -1138.04, y = -1714.36, z = 3.46},text, GetPlayerServerId(player))

					
				end
				if CurrentAction == 'appel_mecano'  then
					local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
	local text = "Vous etes demander au Benny'S"
	ESX.ShowNotification('Vous avez fait l\'appel Benny\'S')

	TriggerServerEvent("call:makeCall", "mecano", {x = -232.62, y = -1311.29, z = 30.29},text, GetPlayerServerId(player))

					
				end
				if CurrentAction == 'nourriture_fede'  then
					TriggerServerEvent('ktr_recolte:nouriturefede', CurrentActionData.zone)
				end
				if CurrentAction == 'recolte_pommeterre'  then
					TriggerServerEvent('ktr_recolte:recoltepommeterre', CurrentActionData.zone)
				end
				if CurrentAction == 'traitement_cornetdefrite'  then
					TriggerServerEvent('ktr_recolte:startTransforcornetdefrite', CurrentActionData.zone)
				end
				
				if CurrentAction == 'recolte_tranchepoulet'  then
					TriggerServerEvent('ktr_recolte:recoltepoulet', CurrentActionData.zone)
				end
				
				if CurrentAction == 'journaliste_recolte'  then
					TriggerServerEvent('ktr_recolte:journalisterecolte', CurrentActionData.zone)
				end

				if CurrentAction == 'traitement_cocketailvenetie' and PlayerData.job ~= nil and PlayerData.job.name == 'nightclub' then
					TriggerServerEvent('ktr_recolte:startTransformcoketailvenetie', CurrentActionData.zone)
				end
				if CurrentAction == 'traitement_pommeterre' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
					TriggerServerEvent('ktr_recolte:startTransformsaladefruit', CurrentActionData.zone)
				end

				
				if CurrentAction == 'traitement_bois' and PlayerData.job ~= nil and PlayerData.job.name == 'event' then
					TriggerServerEvent('ktr_recolte:startTransformbois', CurrentActionData.zone)
				end
				
				if CurrentAction == 'traitement_rugissementlion' and PlayerData.job ~= nil and PlayerData.job.name == 'nightclub' then
					TriggerServerEvent('ktr_recolte:startTransformrugisemmentlion', CurrentActionData.zone)
				end
				if CurrentAction == 'traitement_venetieboomboom' and PlayerData.job ~= nil and PlayerData.job.name == 'nightclub' then
					TriggerServerEvent('ktr_recolte:startTransformbolvenetieboomboom', CurrentActionData.zone)
				end


if CurrentAction == 'traitement_pisselicorne' and PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' then
					TriggerServerEvent('ktr_recolte:startTransformpisselicorne', CurrentActionData.zone)
				end
				if CurrentAction == 'traitement_bolcacahuete' and PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' then
					TriggerServerEvent('ktr_recolte:startTransformbolcacahuete', CurrentActionData.zone)
				end
				if CurrentAction == 'farine_recolte' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
					TriggerServerEvent('ktr_recolte:startHarvest5', CurrentActionData.zone)
				end
				if CurrentAction == 'salade_recolte'and PlayerData.job ~= nil and PlayerData.job.name == 'fermier'  then
					TriggerServerEvent('ktr_recolte:startHarvest6', CurrentActionData.zone)
				end
				if CurrentAction == 'tomate_recolte' and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
					TriggerServerEvent('ktr_recolte:startHarvest7', CurrentActionData.zone)
				end

				if CurrentAction == 'feuille_recolte' and PlayerData.job ~= nil and PlayerData.job.name == 'tabac' then
					TriggerServerEvent('ktr_recolte:startHarvest8', CurrentActionData.zone)
				end
				if CurrentAction == 'tabac_recolte' and PlayerData.job ~= nil and PlayerData.job.name == 'tabac' then
					TriggerServerEvent('ktr_recolte:startHarvest9', CurrentActionData.zone)
				end
				if CurrentAction == 'carton_recolte' and PlayerData.job ~= nil and PlayerData.job.name == 'tabac' then
					TriggerServerEvent('ktr_recolte:startHarvest10', CurrentActionData.zone)
				end




				
				if CurrentAction == 'lavande_recolte'  then
					TriggerServerEvent('ktr_recolte:startHarvest', CurrentActionData.zone)
				end
			
				if CurrentAction == 'pieceauto_recolte' and PlayerData.job ~= nil and PlayerData.job.name == 'mecano' then
					TriggerServerEvent('ktr_recolte:startHarvest4', CurrentActionData.zone)
				end
				if CurrentAction == 'create_user'  then
				--	TriggerServerEvent('esx_identity:ktrcheck', CurrentActionData.zone)
				end
				if CurrentAction == 'papier_recolte' then
					TriggerServerEvent('ktr_recolte:startHarvest2', CurrentActionData.zone)
				end
				if CurrentAction == 'cacahuete_recolte' and PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' then
					TriggerServerEvent('ktr_recolte:startHarvest3', CurrentActionData.zone)
				end

				if CurrentAction == 'cigarrete_traitement' and PlayerData.job ~= nil and PlayerData.job.name == 'tabac' then
					TriggerServerEvent('ktr_recolte:startTransformcigarrete', CurrentActionData.zone)
				end
				if CurrentAction == 'cigarrete2_traitement' and PlayerData.job ~= nil and PlayerData.job.name == 'tabac' then
					TriggerServerEvent('ktr_recolte:startTransformcigarrete2', CurrentActionData.zone)
				end

				
				if CurrentAction == 'jus_traitement' and PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' then
					TriggerServerEvent('ktr_recolte:startTransform1', CurrentActionData.zone)
				end
				if CurrentAction == 'vine_traitement'  and PlayerData.job ~= nil and PlayerData.job.name == 'unicorn' then
					TriggerServerEvent('ktr_recolte:startTransform', CurrentActionData.zone)
				end
				if CurrentAction == 'farine_traitement'  and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
					TriggerServerEvent('ktr_recolte:startTransformfarine', CurrentActionData.zone)
				end
				if CurrentAction == 'sandwich_traitement'  and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
					TriggerServerEvent('ktr_recolte:startTransformsandwich', CurrentActionData.zone)
				end
				if CurrentAction == 'sandwich_traitement2'  and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
					TriggerServerEvent('ktr_recolte:startTransformsandwich2', CurrentActionData.zone)
				end
				if CurrentAction == 'salade_traitement'  and PlayerData.job ~= nil and PlayerData.job.name == 'fermier' then
					TriggerServerEvent('ktr_recolte:startTransformsalade', CurrentActionData.zone)
				end
				
				
				if CurrentAction == 'farm_resell' then
					TriggerServerEvent('ktr_recolte:startSell', CurrentActionData.zone)
				end
				
				
				--[[ Supprimer le truc en bas
				if CurrentAction == 'delete_vehicle' then

					if Config.EnableSocietyOwnedVehicles then
						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
						TriggerServerEvent('esx_society:putVehicleInGarage', 'vigne', vehicleProps)
					end

					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				end]]

				CurrentAction = nil
				GUI.Time      = GetGameTimer()

			end
		end

		
	end
end)