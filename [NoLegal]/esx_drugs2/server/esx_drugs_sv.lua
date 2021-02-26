ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingCoke    = {}
local PlayersTransformingCoke  = {}
local PlayersSellingCoke       = {}
--Nouvelle
local PlayersHarvestingCoco    = {}
local PlayersHarvesting2Coco    = {}
local PlayersTransformingCoco  = {}
local PlayersSellingCoco       = {}
--
--
local PlayersHarvestingVirus    = {}
local PlayersHarvesting2Virus    = {}
local PlayersTransformingVirus  = {}
local PlayersSellingVirus       = {}


--Fin
local PlayersHarvestingMeth    = {}
local PlayersTransformingMeth  = {}
local PlayersSellingMeth       = {}
local PlayersHarvestingWeed    = {}
local PlayersTransformingWeed  = {}
local PlayersSellingWeed       = {}
local PlayersHarvestingOpium   = {}
local PlayersTransformingOpium = {}
local PlayersSellingOpium      = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

--coke
local function HarvestCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coke = xPlayer.getInventoryItem('fleur_mauve')

			if coke.limit ~= -1 and coke.count >= coke.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_datura'))
			else
				xPlayer.addInventoryItem('fleur_mauve', 1)
				HarvestCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startHarvestCoke')
AddEventHandler('esx_drugs2:startHarvestCoke', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersHarvestingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'virusr', xPlayer.name)
	HarvestCoke(_source)

end)

RegisterServerEvent('esx_drugs2:stopHarvestCoke')
AddEventHandler('esx_drugs2:stopHarvestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = false

end)



local function TransformCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingCoke[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local cokeQuantity = xPlayer.getInventoryItem('fleur_mauve').count
			local coke2Quantity = xPlayer.getInventoryItem('datura').count
			local poochQuantity = xPlayer.getInventoryItem('pomme').count

			if poochQuantity > 30 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif cokeQuantity < 1 and coke2Quantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('fleur_mauve', 5)
				xPlayer.removeInventoryItem('pomme', 5)
				xPlayer.addInventoryItem('datura', 1)
			
				TransformCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startTransformCoke')
AddEventHandler('esx_drugs2:startTransformCoke', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersTransformingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'virust', xPlayer.name)
	TransformCoke(_source)

end)

RegisterServerEvent('esx_drugs2:stopTransformCoke')
AddEventHandler('esx_drugs2:stopTransformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = false

end)

local function SellCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingCoke[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('datura').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('datura', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 550)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 600)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 700)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 800)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				end
				
				SellCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startSellCoke')
AddEventHandler('esx_drugs2:startSellCoke', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersSellingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'virusv', xPlayer.name)
	SellCoke(_source)

end)

RegisterServerEvent('esx_drugs2:stopSellCoke')
AddEventHandler('esx_drugs2:stopSellCoke', function()

	local _source = source

	PlayersSellingCoke[_source] = false

end)

--meth
local function HarvestMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end
	
	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local meth = xPlayer.getInventoryItem('meth')

			if meth.limit ~= -1 and meth.count >= meth.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth'))
			else
				xPlayer.addInventoryItem('meth', 1)
				HarvestMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startHarvestMeth')
AddEventHandler('esx_drugs2:startHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestMeth(_source)

end)

RegisterServerEvent('esx_drugs2:stopHarvestMeth')
AddEventHandler('esx_drugs2:stopHarvestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = false

end)

local function TransformMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local methQuantity = xPlayer.getInventoryItem('meth').count
			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity > 30 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif methQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 5)
				xPlayer.addInventoryItem('meth_pooch', 1)
				
				TransformMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startTransformMeth')
AddEventHandler('esx_drugs2:startTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMeth(_source)

end)

RegisterServerEvent('esx_drugs2:stopTransformMeth')
AddEventHandler('esx_drugs2:stopTransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = false

end)

local function SellMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', _source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('meth_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 562)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 1125)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 1687)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 2250)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 2812)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 5 then
					xPlayer.addAccountMoney('black_money', 3375)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				end
				
				SellMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startSellMeth')
AddEventHandler('esx_drugs2:startSellMeth', function()

	local _source = source

	PlayersSellingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellMeth(_source)

end)

RegisterServerEvent('esx_drugs2:stopSellMeth')
AddEventHandler('esx_drugs2:stopSellMeth', function()

	local _source = source

	PlayersSellingMeth[_source] = false

end)

--weed
local function HarvestWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingWeed[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local weed = xPlayer.getInventoryItem('weed')

			if weed.limit ~= -1 and weed.count >= weed.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed'))
			else
				xPlayer.addInventoryItem('weed', 1)
				HarvestWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startHarvestWeed')
AddEventHandler('esx_drugs2:startHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestWeed(_source)

end)

RegisterServerEvent('esx_drugs2:stopHarvestWeed')
AddEventHandler('esx_drugs2:stopHarvestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = false

end)

local function TransformWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity > 30 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif weedQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 5)
				xPlayer.addInventoryItem('weed_pooch', 1)
				
				TransformWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startTransformWeed')
AddEventHandler('esx_drugs2:startTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeed(_source)

end)

RegisterServerEvent('esx_drugs2:stopTransformWeed')
AddEventHandler('esx_drugs2:stopTransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = false

end)

local function SellWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('weed_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 187)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 375)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 562)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 750)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected >= 4 then
					xPlayer.addAccountMoney('black_money', 937)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 1125)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				end
				
				SellWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startSellWeed')
AddEventHandler('esx_drugs2:startSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellWeed(_source)

end)

RegisterServerEvent('esx_drugs2:stopSellWeed')
AddEventHandler('esx_drugs2:stopSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = false

end)


--opium

local function HarvestOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingOpium[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local opium = xPlayer.getInventoryItem('opium')

			if opium.limit ~= -1 and opium.count >= opium.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium'))
			else
				xPlayer.addInventoryItem('opium', 1)
				HarvestOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startHarvestOpium')
AddEventHandler('esx_drugs2:startHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestOpium(_source)

end)

RegisterServerEvent('esx_drugs2:stopHarvestOpium')
AddEventHandler('esx_drugs2:stopHarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = false

end)

local function TransformOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity > 30 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif opiumQuantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 5)
				xPlayer.addInventoryItem('opium_pooch', 1)
			
				TransformOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startTransformOpium')
AddEventHandler('esx_drugs2:startTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpium(_source)

end)

RegisterServerEvent('esx_drugs2:stopTransformOpium')
AddEventHandler('esx_drugs2:stopTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = false

end)

local function SellOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('opium_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 750)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 1500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 2250)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 3000)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 3750)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 4500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				end
				
				SellOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startSellOpium')
AddEventHandler('esx_drugs2:startSellOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellOpium(_source)

end)

RegisterServerEvent('esx_drugs2:stopSellOpium')
AddEventHandler('esx_drugs2:stopSellOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = false

end)

RegisterServerEvent('esx_drugs2:GetUserInventory')
AddEventHandler('esx_drugs2:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_drugs2:ReturnInventory', 
		_source, 
		xPlayer.getInventoryItem('pomme').count, 
		xPlayer.getInventoryItem('fleur_mauve').count,
		
		--Nouvelle
		xPlayer.getInventoryItem('poudre_sol').count, 
		xPlayer.getInventoryItem('corium').count, 
		xPlayer.getInventoryItem('virus_tchernobyl').count, 

		--
		xPlayer.getInventoryItem('fleur_mauve').count, 
		xPlayer.getInventoryItem('pomme').count, 
		xPlayer.getInventoryItem('datura').count, 



		xPlayer.getInventoryItem('weed_pooch').count, 
		xPlayer.getInventoryItem('opium').count, 
		xPlayer.getInventoryItem('opium_pooch').count,
		xPlayer.job.name, 
		currentZone
	)
end)


--[[
ESX.RegisterUsableItem('weed', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('weed', 1)

	TriggerClientEvent('esx_drugs2:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))
end)]]


--Nouvelle

--Coco

local function HarvestCoco(source)

	if CopsConnected < Config.RequiredCopsCoco then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoco))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingCoco[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coco = xPlayer.getInventoryItem('poudre_sol')

			if coco.limit ~= -1 and coco.count >= coco.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_virus'))
			else
				xPlayer.addInventoryItem('poudre_sol', 1)
				HarvestCoco(source)
			end

		end
	end)
end

local function Harvest2Coco(source)

	if CopsConnected < Config.RequiredCopsCoco then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoco))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvesting2Coco[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coco = xPlayer.getInventoryItem('corium')

			if coco.limit ~= -1 and coco.count >= coco.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full2_virus'))
			else
				xPlayer.addInventoryItem('corium', 1)
				Harvest2Coco(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startHarvestCoco')
AddEventHandler('esx_drugs2:startHarvestCoco', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersHarvestingCoco[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'dedede', xPlayer.name)
	HarvestCoco(_source)

end)

RegisterServerEvent('esx_drugs2:stopHarvestCoco')
AddEventHandler('esx_drugs2:stopHarvestCoco', function()

	local _source = source

	PlayersHarvestingCoco[_source] = false

end)


--
--
--
RegisterServerEvent('esx_drugs2:startHarvest2Coco')
AddEventHandler('esx_drugs2:startHarvest2Coco', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersHarvesting2Coco[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'dede', xPlayer.name)
	Harvest2Coco(_source)

end)

RegisterServerEvent('esx_drugs2:stopHarvest2Coco')
AddEventHandler('esx_drugs2:stopHarvest2Coco', function()

	local _source = source

	PlayersHarvesting2Coco[_source] = false

end)

local function TransformCoco(source)

	if CopsConnected < Config.RequiredCopsCoco then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoco))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingCoco[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local cocoQuantity = xPlayer.getInventoryItem('poudre_sol').count
			local coco2Quantity = xPlayer.getInventoryItem('corium').count
			local poochQuantity = xPlayer.getInventoryItem('virus_tchernobyl').count

			if poochQuantity > 30 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches_coco'))
			elseif cocoQuantity and coco2Quantity < 1 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coco'))
			else
				xPlayer.removeInventoryItem('poudre_sol', 5)
				xPlayer.removeInventoryItem('corium', 5)
				xPlayer.addInventoryItem('virus_tchernobyl', 1)
			
				TransformCoco(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startTransformCoco')
AddEventHandler('esx_drugs2:startTransformCoco', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersTransformingCoco[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'dededede', xPlayer.name)
	TransformCoco(_source)

end)

RegisterServerEvent('esx_drugs2:stopTransformCoco')
AddEventHandler('esx_drugs2:stopTransformCoco', function()

	local _source = source

	PlayersTransformingCoco[_source] = false

end)

local function SellCoco(source)

	if CopsConnected < Config.RequiredCopsCoco then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoco))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingCoco[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('virus_tchernobyl').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale_virus'))
			else
				xPlayer.removeInventoryItem('virus_tchernobyl', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_virus'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 400)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_virus'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_virus'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 625)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_virus'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 750)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_virus'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 900)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_virus'))
				end
				
				SellCoco(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs2:startSellCoco')
AddEventHandler('esx_drugs2:startSellCoco', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersSellingCoco[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'dedededede', xPlayer.name)
	SellCoco(_source)

end)

RegisterServerEvent('esx_drugs2:stopSellCoco')
AddEventHandler('esx_drugs2:stopSellCoco', function()

	local _source = source

	PlayersSellingCoco[_source] = false

end)

--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
