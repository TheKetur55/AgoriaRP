
ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local vine = 1
local jus = 1
local vineblanc = 1
local grand_cru = 1
local champagne = 1
local cognac = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




local function Harvest(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "RecolteLavande" then
			local itemQuantity = xPlayer.getInventoryItem('lavande').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Lavande sur vous'))
				return
			else
				SetTimeout(4200, function()
					xPlayer.addInventoryItem('lavande', 1)
					Harvest(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:startHarvest')
AddEventHandler('ktr_recolte:startHarvest', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local lavandeQuantity = xPlayer.getInventoryItem('lavande').count
	if lavandeQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Lavande sur vous'))
            else
		PlayersHarvesting[_source]=true
		 TriggerEvent('esx_joblogs:AddInLog', "lavande", "lavanderecolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser la ~g~Lavande'))  
		Harvest(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopHarvest')
AddEventHandler('ktr_recolte:stopHarvest', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local lavandeQuantity = xPlayer.getInventoryItem('lavande').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)



-- Papier

local function Harvest2(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "RecoltePapier" then
			local itemQuantity = xPlayer.getInventoryItem('papier').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Papier sur vous'))
				return
			else
				SetTimeout(3000, function()
					xPlayer.addInventoryItem('papier', 1)
					Harvest2(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:startHarvest2')
AddEventHandler('ktr_recolte:startHarvest2', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local lavandeQuantity = xPlayer.getInventoryItem('papier').count
	if lavandeQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Papier sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser du ~g~Papier'))  
		Harvest2(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopHarvest2')
AddEventHandler('ktr_recolte:stopHarvest2', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local lavandeQuantity = xPlayer.getInventoryItem('papier').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)


-- Cacahuete


local function Harvest3(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "RecolteCacahuete" then
			local itemQuantity = xPlayer.getInventoryItem('cacahuete').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Cacahuete sur vous'))
				return
			else
				SetTimeout(3000, function()
					xPlayer.addInventoryItem('cacahuete', 1)
					Harvest3(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:startHarvest3')
AddEventHandler('ktr_recolte:startHarvest3', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local cacahueteQuantity = xPlayer.getInventoryItem('cacahuete').count
	if cacahueteQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Cacahuete sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser des ~g~Cacahuete'))  
		Harvest3(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopHarvest3')
AddEventHandler('ktr_recolte:stopHarvest3', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cacahueteQuantity = xPlayer.getInventoryItem('cacahuete').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)



local function Harvest4(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Recoltepieceauto" then
			local itemQuantity = xPlayer.getInventoryItem('pieceauto').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Pièces auto sur vous'))
				return
			else
				SetTimeout(3000, function()
					xPlayer.addInventoryItem('pieceauto', 1)
					Harvest4(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:startHarvest4')
AddEventHandler('ktr_recolte:startHarvest4', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local cacahueteQuantity = xPlayer.getInventoryItem('pieceauto').count
	if cacahueteQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Pièces auto sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser des ~g~Pièces auto'))  
		Harvest4(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopHarvest4')
AddEventHandler('ktr_recolte:stopHarvest4', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cacahueteQuantity = xPlayer.getInventoryItem('pieceauto').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)





--
local function Harvest5(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Recoltefarine" then
			local itemQuantity = xPlayer.getInventoryItem('ble').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Blé sur vous'))
				return
			else
				SetTimeout(1000, function()
					xPlayer.addInventoryItem('ble', 1)
					Harvest5(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:startHarvest5')
AddEventHandler('ktr_recolte:startHarvest5', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local cacahueteQuantity = xPlayer.getInventoryItem('ble').count
	if cacahueteQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Blé sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser du ~g~Blé'))  
		Harvest5(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopHarvest5')
AddEventHandler('ktr_recolte:stopHarvest5', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cacahueteQuantity = xPlayer.getInventoryItem('ble').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)




local function Harvest6(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Recoltesalade" then
			local itemQuantity = xPlayer.getInventoryItem('salade').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Salade sur vous'))
				return
			else
				SetTimeout(1000, function()
					xPlayer.addInventoryItem('salade', 1)
					Harvest6(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:startHarvest6')
AddEventHandler('ktr_recolte:startHarvest6', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local cacahueteQuantity = xPlayer.getInventoryItem('salade').count
	if cacahueteQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Salade sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser de la ~g~Salade'))  
		Harvest6(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopHarvest6')
AddEventHandler('ktr_recolte:stopHarvest6', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cacahueteQuantity = xPlayer.getInventoryItem('salade').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)



local function Harvest7(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Recoltetomate" then
			local itemQuantity = xPlayer.getInventoryItem('tomate').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Tomate sur vous'))
				return
			else
				SetTimeout(1000, function()
					xPlayer.addInventoryItem('tomate', 1)
					Harvest7(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:startHarvest7')
AddEventHandler('ktr_recolte:startHarvest7', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local cacahueteQuantity = xPlayer.getInventoryItem('tomate').count
	if cacahueteQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Tomate sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser des ~g~Tomate'))  
		Harvest7(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopHarvest7')
AddEventHandler('ktr_recolte:stopHarvest7', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cacahueteQuantity = xPlayer.getInventoryItem('tomate').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)

local function Harvest8(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Recoltefeuille" then
			local itemQuantity = xPlayer.getInventoryItem('feuille').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Feuille a roulée sur vous'))
				return
			else
				SetTimeout(1000, function()
					xPlayer.addInventoryItem('feuille', 1)
					Harvest8(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:startHarvest8')
AddEventHandler('ktr_recolte:startHarvest8', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local cacahueteQuantity = xPlayer.getInventoryItem('feuille').count
	if cacahueteQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Feuille a roulée sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser des ~g~Feuille a roulée'))  
		Harvest8(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopHarvest8')
AddEventHandler('ktr_recolte:stopHarvest8', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cacahueteQuantity = xPlayer.getInventoryItem('feuille').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)



local function Harvest9(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Recoltetabac" then
			local itemQuantity = xPlayer.getInventoryItem('tabac').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Tabac sur vous'))
				return
			else
				SetTimeout(2000, function()
					xPlayer.addInventoryItem('tabac', 2)
					Harvest9(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:startHarvest9')
AddEventHandler('ktr_recolte:startHarvest9', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local cacahueteQuantity = xPlayer.getInventoryItem('tabac').count
	if cacahueteQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Tabac sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser des ~g~Tabac'))  
		Harvest9(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopHarvest9')
AddEventHandler('ktr_recolte:stopHarvest9', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cacahueteQuantity = xPlayer.getInventoryItem('tabac').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)



local function Harvest10(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Recoltecarton" then
			local itemQuantity = xPlayer.getInventoryItem('carton').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Carton sur vous'))
				return
			else
				SetTimeout(1000, function()
					xPlayer.addInventoryItem('carton', 1)
					Harvest10(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:startHarvest10')
AddEventHandler('ktr_recolte:startHarvest10', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local cacahueteQuantity = xPlayer.getInventoryItem('carton').count
	if cacahueteQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Carton sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser des ~g~Carton'))  
		Harvest10(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopHarvest10')
AddEventHandler('ktr_recolte:stopHarvest10', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cacahueteQuantity = xPlayer.getInventoryItem('carton').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)




local function Harvest11(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Journaliste" then
			local itemQuantity = xPlayer.getInventoryItem('journale').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de journale sur vous'))
				return
			else
				SetTimeout(2500, function()
					xPlayer.addInventoryItem('journale', 1)
					Harvest11(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:journalisterecolte')
AddEventHandler('ktr_recolte:journalisterecolte', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local cacahueteQuantity = xPlayer.getInventoryItem('journale').count
	if cacahueteQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de journale sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser des ~g~journaux'))  
		Harvest11(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopTransformJournaliste')
AddEventHandler('ktr_recolte:stopTransformJournaliste', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cacahueteQuantity = xPlayer.getInventoryItem('journale').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)


local function Harvest12(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "RecoltePommeDeTerre" then
			local itemQuantity = xPlayer.getInventoryItem('pommeterre').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Pomme de terre sur vous'))
				return
			else
				SetTimeout(2500, function()
					xPlayer.addInventoryItem('pommeterre', 1)
					Harvest12(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:recoltepommeterre')
AddEventHandler('ktr_recolte:recoltepommeterre', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local cacahueteQuantity = xPlayer.getInventoryItem('pommeterre').count
	if cacahueteQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Pomme de terre sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser des ~g~Pomme de terre'))  
		Harvest12(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopTransformpommedeterre')
AddEventHandler('ktr_recolte:stopTransformpommedeterre', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cacahueteQuantity = xPlayer.getInventoryItem('pommeterre').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)




local function Harvest13(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "RecolteTranchePoulet" then
			local itemQuantity = xPlayer.getInventoryItem('tranchepoulet').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Tranche de poulet sur vous'))
				return
			else
				SetTimeout(2500, function()
					xPlayer.addInventoryItem('tranchepoulet', 1)
					Harvest13(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:recoltepoulet')
AddEventHandler('ktr_recolte:recoltepoulet', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local cacahueteQuantity = xPlayer.getInventoryItem('tranchepoulet').count
	if cacahueteQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de Tranche de poulet sur vous'))
            else
		PlayersHarvesting[_source]=true
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, ('Vous être en train de ramasser des ~g~Tranche de poulet'))  
		Harvest13(_source,zone)
	end
end)


RegisterServerEvent('ktr_recolte:stopTransformtranchepoulet')
AddEventHandler('ktr_recolte:stopTransformtranchepoulet', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local cacahueteQuantity = xPlayer.getInventoryItem('tranchepoulet').count      
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
	
	end
end)























local function Transform(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementVin" then
			local itemQuantity = xPlayer.getInventoryItem('raisin').count
			local itemQuantity2 = xPlayer.getInventoryItem('pomme').count
			local itemQuantity3 = xPlayer.getInventoryItem('cacahuete').count
			
			if itemQuantity < 1 or itemQuantity2 < 2 or itemQuantity3 < 5 then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('raisin', 1)
						xPlayer.removeInventoryItem('pomme', 2)
						xPlayer.removeInventoryItem('cacahuete', 5)
						xPlayer.addInventoryItem('unicorncocktail', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer un Cocktail'))
						Transform(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransform')
AddEventHandler('ktr_recolte:startTransform', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransform')
AddEventHandler('ktr_recolte:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)



--


local function Transform1(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementJus" then
			local itemQuantity = xPlayer.getInventoryItem('donut').count
		--	local itemQuantity2 = xPlayer.getInventoryItem('pomme').count
			local itemQuantity3 = xPlayer.getInventoryItem('cacahuete').count
			
			if itemQuantity < 1  or itemQuantity3 < 5 then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('donut', 1)
					--	xPlayer.removeInventoryItem('pomme', 2)
						xPlayer.removeInventoryItem('cacahuete', 5)
						xPlayer.addInventoryItem('donuts', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez mélanger le Donuts'))
						Transform1(source, zone)
					end)
end
end
end
end


RegisterServerEvent('ktr_recolte:startTransform1')
AddEventHandler('ktr_recolte:startTransform1', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform1(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransform1')
AddEventHandler('ktr_recolte:stopTransform1', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)




local function Transform2(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementFarine" then
			local itemQuantity = xPlayer.getInventoryItem('ble').count
			local itemQuantity2 = xPlayer.getInventoryItem('water').count
		--	local itemQuantity3 = xPlayer.getInventoryItem('cacahuete').count
			
			if itemQuantity < 5 or itemQuantity2 < 1  then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('water', 1)
						xPlayer.removeInventoryItem('ble', 5)
						xPlayer.addInventoryItem('bread', 10)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer un Pain'))
						Transform2(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformfarine')
AddEventHandler('ktr_recolte:startTransformfarine', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform2(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformfarine')
AddEventHandler('ktr_recolte:stopTransformfarine', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)


local function Transform3(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementSandwich" then
			local itemQuantity = xPlayer.getInventoryItem('bread').count
			local itemQuantity2 = xPlayer.getInventoryItem('tomate').count
			local itemQuantity3 = xPlayer.getInventoryItem('salade').count
			
			if itemQuantity < 1 or itemQuantity2 < 2  or itemQuantity3 < 2  then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(3000, function()
						xPlayer.removeInventoryItem('bread', 1)
						xPlayer.removeInventoryItem('tomate', 2)
						xPlayer.removeInventoryItem('salade', 2)
						xPlayer.addInventoryItem('sandwich', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer un Sandwich'))
						Transform3(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformsandwich')
AddEventHandler('ktr_recolte:startTransformsandwich', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform3(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformsandiwch')
AddEventHandler('ktr_recolte:stopTransformsandiwch', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)


local function Transform4(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Traitementsalade" then
		--	local itemQuantity = xPlayer.getInventoryItem('bread').count
			local itemQuantity2 = xPlayer.getInventoryItem('tomate').count
			local itemQuantity3 = xPlayer.getInventoryItem('salade').count
			
			if  itemQuantity2 < 1  or itemQuantity3 < 1  then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('tomate', 1)
						xPlayer.removeInventoryItem('salade', 1)
						xPlayer.addInventoryItem('salademixte', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer une Salade Mixte'))
						Transform4(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformsalade')
AddEventHandler('ktr_recolte:startTransformsalade', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform4(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformsalade')
AddEventHandler('ktr_recolte:stopTransformsalade', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)


local function Transform5(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementSandwich2" then
		--	local itemQuantity = xPlayer.getInventoryItem('bread').count
			local itemQuantity2 = xPlayer.getInventoryItem('bread').count
			local itemQuantity3 = xPlayer.getInventoryItem('viande').count
			
			if  itemQuantity2 < 1  or itemQuantity3 < 1  then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('bread', 1)
						xPlayer.removeInventoryItem('viande', 1)
						xPlayer.addInventoryItem('sandwichviande', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer un Sandwich a la viande'))
						Transform5(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformsandwich2')
AddEventHandler('ktr_recolte:startTransformsandwich2', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform5(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformsandwich2')
AddEventHandler('ktr_recolte:stopTransformsandwich2', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)




local function Transform6(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementCigarrete" then
		--	local itemQuantity = xPlayer.getInventoryItem('bread').count
			local itemQuantity2 = xPlayer.getInventoryItem('feuille').count
			local itemQuantity3 = xPlayer.getInventoryItem('tabac').count
			
			if  itemQuantity2 < 1  or itemQuantity3 < 1  then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(1500, function()
						xPlayer.removeInventoryItem('feuille', 1)
						xPlayer.removeInventoryItem('tabac', 1)
						xPlayer.addInventoryItem('cigarett', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer un Cigarette'))
						Transform6(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformcigarrete')
AddEventHandler('ktr_recolte:startTransformcigarrete', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform6(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformcigarette')
AddEventHandler('ktr_recolte:stopTransformcigarette', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)


local function Transform7(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementCartonCigarrete" then
		--	local itemQuantity = xPlayer.getInventoryItem('bread').count
			local itemQuantity2 = xPlayer.getInventoryItem('cigarett').count
			local itemQuantity3 = xPlayer.getInventoryItem('carton').count
			
			if  itemQuantity2 < 1  or itemQuantity3 < 1  then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('cigarett', 20)
						xPlayer.removeInventoryItem('carton', 1)
						xPlayer.addInventoryItem('paquetcigarett', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer un Paquet de Cigarette'))
						Transform7(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformcigarrete2')
AddEventHandler('ktr_recolte:startTransformcigarrete2', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform7(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformcigarette2')
AddEventHandler('ktr_recolte:stopTransformcigarette2', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)



local function Transform8(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementBolCacahuete" then
		--	local itemQuantity = xPlayer.getInventoryItem('bread').count
			local itemQuantity2 = xPlayer.getInventoryItem('cacahuete').count
		--	local itemQuantity3 = xPlayer.getInventoryItem('carton').count
			
			if  itemQuantity2 < 5   then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('cacahuete', 5)
						xPlayer.addInventoryItem('bolcacahuete', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer un Bol de Cacahuete'))
						Transform8(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformbolcacahuete')
AddEventHandler('ktr_recolte:startTransformbolcacahuete', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform8(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformbolcacahuete')
AddEventHandler('ktr_recolte:stopTransformbolcacahuete', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)


local function Transform9(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Traitementcoketailvenetie" then
			local itemQuantity = xPlayer.getInventoryItem('vodka').count
			local itemQuantity2 = xPlayer.getInventoryItem('pomme').count
			local itemQuantity3 = xPlayer.getInventoryItem('orange').count
			
			if  itemQuantity2 < 2 or itemQuantity < 1 or itemQuantity3 < 2   then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('pomme', 2)
						xPlayer.removeInventoryItem('orange', 2)
						xPlayer.removeInventoryItem('vodka', 1)
						xPlayer.addInventoryItem('venetiecocktail', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer un Cocktail Veneties'))
						Transform9(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformcoketailvenetie')
AddEventHandler('ktr_recolte:startTransformcoketailvenetie', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform9(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformcocketailvenetie')
AddEventHandler('ktr_recolte:stopTransformcocketailvenetie', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)


local function Transform10(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Traitementplanchebois" then
			local itemQuantity = xPlayer.getInventoryItem('bois').count

			
			if  itemQuantity < 5   then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('bois', 5)
						xPlayer.addInventoryItem('planchebois', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer une planche de bois'))
						Transform10(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformbois')
AddEventHandler('ktr_recolte:startTransformbois', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform10(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformbois')
AddEventHandler('ktr_recolte:stopTransformbois', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)





local function Transform11(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Traitementrugissementdulion" then
			local itemQuantity = xPlayer.getInventoryItem('redbull').count
			local itemQuantity1 = xPlayer.getInventoryItem('pomme').count
			local itemQuantity2 = xPlayer.getInventoryItem('orange').count

			
			if  itemQuantity2 < 1 or itemQuantity < 1 or itemQuantity1 < 1   then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('orange', 1)
						xPlayer.removeInventoryItem('pomme', 1)
						xPlayer.removeInventoryItem('redbull', 1)
						xPlayer.addInventoryItem('rugissementlion', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer un Rugissement du Lion'))
						Transform11(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformrugisemmentlion')
AddEventHandler('ktr_recolte:startTransformrugisemmentlion', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform11(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformrugissementlion')
AddEventHandler('ktr_recolte:stopTransformrugissementlion', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)


local function Transform12(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Traitementvenetiesboomboom" then
			local itemQuantity = xPlayer.getInventoryItem('champagne').count
			local itemQuantity1 = xPlayer.getInventoryItem('raisin').count
			local itemQuantity2 = xPlayer.getInventoryItem('lavande').count

			
			if  itemQuantity2 < 2 or itemQuantity1 < 2 or itemQuantity < 1   then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('raisin', 2)
						xPlayer.removeInventoryItem('lavande', 2)
						xPlayer.removeInventoryItem('champagne', 1)
						xPlayer.addInventoryItem('venetiesboomboom', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer un Vénétie\'s Boom Boom'))
						Transform12(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformbolvenetieboomboom')
AddEventHandler('ktr_recolte:startTransformbolvenetieboomboom', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform12(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformvenetieboomboom')
AddEventHandler('ktr_recolte:stopTransformvenetieboomboom', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)



local function Transform13(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Traitementpisselicorne" then
			local itemQuantity = xPlayer.getInventoryItem('pomme').count
			local itemQuantity1 = xPlayer.getInventoryItem('lavande').count
			local itemQuantity2 = xPlayer.getInventoryItem('vineblanc').count

			
			if  itemQuantity2 < 1 or itemQuantity1 < 2 or itemQuantity < 2   then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(5000, function()
						xPlayer.removeInventoryItem('pomme', 2)
						xPlayer.removeInventoryItem('lavande', 2)
						xPlayer.addInventoryItem('vineblanc', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer une Pisse de Licorne'))
						Transform13(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformpisselicorne')
AddEventHandler('ktr_recolte:startTransformpisselicorne', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform13(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformpisselicorne')
AddEventHandler('ktr_recolte:stopTransformpisselicorne', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)




local function Transform14(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "Traitementsaladefruit" then
			local itemQuantity = xPlayer.getInventoryItem('orange').count
			local itemQuantity1 = xPlayer.getInventoryItem('pomme').count


			
			if   itemQuantity1 < 2 or itemQuantity < 2   then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(1500, function()
						xPlayer.removeInventoryItem('orange', 2)
						xPlayer.removeInventoryItem('pomme', 2)
						xPlayer.addInventoryItem('saladefruit', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer une Salade de fruit'))
						Transform14(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransformsaladefruit')
AddEventHandler('ktr_recolte:startTransformsaladefruit', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform14(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformsaladefruit')
AddEventHandler('ktr_recolte:stopTransformsaladefruit', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)

local function Transform15(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementCornetDeFrite" then
			local itemQuantity = xPlayer.getInventoryItem('pommeterre').count
			


			
			if    itemQuantity < 2   then
				TriggerClientEvent('esx:showNotification', source, ('Vous n\'avez pas tout les élements'))
				return
			else
					SetTimeout(2500, function()
						xPlayer.removeInventoryItem('pommeterre', 2)
						xPlayer.addInventoryItem('cornetfrite', 1)
						TriggerClientEvent('esx:showNotification', source, ('Vous avez fabriquer un Cornet de frite'))
						Transform15(source, zone)
					end)
end
end
end
end



RegisterServerEvent('ktr_recolte:startTransforcornetdefrite')
AddEventHandler('ktr_recolte:startTransforcornetdefrite', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, ('Tratement en cours ...')) 
	--	 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform15(_source,zone)
--	end
end)

RegisterServerEvent('ktr_recolte:stopTransformcorentdefrite')
AddEventHandler('ktr_recolte:stopTransformcorentdefrite', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
--		
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)




















local function Sell(source, zone)
	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		
		if zone == 'SellFarm' then
			if xPlayer.getInventoryItem('vine').count <= 0 then
				vine = 0
			else
				vine = 1
			end
			
			if xPlayer.getInventoryItem('jus_raisin').count <= 0 then
				jus = 0
			else
				jus = 1
			end
		
			if vine == 0 and jus == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('vine').count <= 0 and jus == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_vin_sale'))
				vine = 0
				return
			elseif xPlayer.getInventoryItem('jus_raisin').count <= 0 and vine == 0then
				TriggerClientEvent('esx:showNotification', source, _U('no_jus_sale'))
				jus = 0
				return
			else
				if (jus == 1) then
					SetTimeout(1100, function()
						local total = math.random(6,11)
						xPlayer.removeInventoryItem('jus_raisin', 1)
						local societyAccount = nil
						
						if xPlayer.job.grade >= 3 then
		                    total = total * 2
                        end

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
							societyAccount = account
						end)
						if societyAccount then
						    local playerMoney  = math.floor(total / 100 * 50)
                            local societyMoney = math.floor(total / 100 * 50)
							
							xPlayer.addMoney(playerMoney)
							societyAccount.addMoney(societyMoney)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. playerMoney)
						else
						    xPlayer.addMoney(total)
                            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. total)
						end
						Sell(source,zone)
					end)
				elseif (vine == 1) then
					SetTimeout(1100, function()
						local total = math.random(8,17)
						xPlayer.removeInventoryItem('vine', 1)
						local societyAccount = nil

						if xPlayer.job.grade >= 3 then
		                    total = total * 2
                        end

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
							societyAccount = account
						end)
						if societyAccount then
						    local playerMoney  = math.floor(total / 100 * 50)
                            local societyMoney = math.floor(total / 100 * 50)
							
							xPlayer.addMoney(playerMoney)
							societyAccount.addMoney(societyMoney)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. playerMoney)
						else
						    xPlayer.addMoney(total)
                            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. total)
						end
						Sell(source,zone)
					end)
				end
				
			end
		end
		if zone == 'SellFarm2' then
			if xPlayer.getInventoryItem('vineblanc').count <= 0 then
				vineblanc = 0
			else
				vineblanc = 1
			end
			
			if xPlayer.getInventoryItem('champagne').count <= 0 then
				champagne = 0
			else
				champagne = 1
			end
		
			if vineblanc == 0 and champagne == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('vineblanc').count <= 0 and champagne == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_vineblanc_sale'))
				vineblanc = 0
				return
			elseif xPlayer.getInventoryItem('champagne').count <= 0 and vineblanc == 0then
				TriggerClientEvent('esx:showNotification', source, _U('no_champagne_sale'))
				champagne = 0
				return
			else
				if (champagne == 1) then
					SetTimeout(1100, function()
						local total = math.random(15,25)
						xPlayer.removeInventoryItem('champagne', 1)
						local societyAccount = nil
						
						if xPlayer.job.grade >= 3 then
		                    total = total * 2
                        end

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
							societyAccount = account
						end)
						if societyAccount then
						    local playerMoney  = math.floor(total / 100 * 50)
                            local societyMoney = math.floor(total / 100 * 50)
							
							xPlayer.addMoney(playerMoney)
							societyAccount.addMoney(societyMoney)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. playerMoney)
						else
						    xPlayer.addMoney(total)
                            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. total)
						end
						Sell(source,zone)
					end)
				elseif (vineblanc == 1) then
					SetTimeout(1100, function()
						local total = math.random(10,25)
						xPlayer.removeInventoryItem('vineblanc', 1)
						local societyAccount = nil
						
						if xPlayer.job.grade >= 3 then
		                    total = total * 2
                        end

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
							societyAccount = account
						end)
						if societyAccount then
						    local playerMoney  = math.floor(total / 100 * 50)
                            local societyMoney = math.floor(total / 100 * 50)
							
							xPlayer.addMoney(playerMoney)
							societyAccount.addMoney(societyMoney)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. playerMoney)
						else
						    xPlayer.addMoney(total)
                            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. total)
						end
						Sell(source,zone)
					end)
				end
				
			end
		end
		if zone == 'SellFarm3' then
			if xPlayer.getInventoryItem('grand_cru').count <= 0 then
				grand_cru = 0
			else
				grand_cru = 1
			end
			
			if xPlayer.getInventoryItem('cognac').count <= 0 then
				cognac = 0
			else
				cognac = 1
			end
		
			if grand_cru == 0 and cognac == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('grand_cru').count <= 0 and cognac == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_vin_sale'))
				grand_cru = 0
				return
			elseif xPlayer.getInventoryItem('cognac').count <= 0 and grand_cru == 0then
				TriggerClientEvent('esx:showNotification', source, _U('no_cognac_sale'))
				cognac = 0
				return
			else
				if (cognac == 1) then
					SetTimeout(1100, function()
						local total = math.random(30,38)
						xPlayer.removeInventoryItem('cognac', 1)
						local societyAccount = nil
						
						if xPlayer.job.grade >= 3 then
		                    total = total * 2
                        end

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
							societyAccount = account
						end)
						if societyAccount then
						    local playerMoney  = math.floor(total / 100 * 50)
                            local societyMoney = math.floor(total / 100 * 50)
							
							xPlayer.addMoney(playerMoney)
							societyAccount.addMoney(societyMoney)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. playerMoney)
						else
						    xPlayer.addMoney(total)
                            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. total)
						end
						Sell(source,zone)
					end)
				elseif (grand_cru == 1) then
					SetTimeout(1100, function()
						local total = math.random(55,80)
						xPlayer.removeInventoryItem('grand_cru', 1)
						local societyAccount = nil
						
						if xPlayer.job.grade >= 3 then
		                    total = total * 2
                        end

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
							societyAccount = account
						end)
						if societyAccount then
						    local playerMoney  = math.floor(total / 100 * 50)
                            local societyMoney = math.floor(total / 100 * 50)
							
							xPlayer.addMoney(playerMoney)
							societyAccount.addMoney(societyMoney)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. playerMoney)
						else
						    xPlayer.addMoney(total)
                            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_earned') .. total)
						end
						Sell(source,zone)
					end)
				end
				
			end
		end
	end
end

RegisterServerEvent('ktr_recolte:startSell')
AddEventHandler('ktr_recolte:startSell', function(zone)

	local _source = source
	
	--if PlayersSelling[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
--		PlayersSelling[_source]=false
--	else
		PlayersSelling[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sell(_source, zone)
--	end

end)

RegisterServerEvent('ktr_recolte:stopSell')
AddEventHandler('ktr_recolte:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	--	
	else
	--	TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
		PlayersSelling[_source]=true
	end

end)

RegisterServerEvent("ktr_recolte:nouriturefede")
AddEventHandler("ktr_recolte:nouriturefede", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
end)


ESX.RegisterServerCallback('ktr_recolte:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)

