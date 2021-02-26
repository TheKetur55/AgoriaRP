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
--
--
local PlayersHarvestingDatura    = {}
local PlayersTransformingDatura  = {}
local PlayersSellingDatura       = {}

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

			local coke = xPlayer.getInventoryItem('coke')

			if coke.limit ~= -1 and coke.count >= coke.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke'))
			else
				xPlayer.addInventoryItem('coke', 1)

				HarvestCoke(source)
			end

		end
	end)
end
local xPlayer = ESX.GetPlayerFromId(_source)
RegisterServerEvent('esx_drugs:startHarvestCoke')
AddEventHandler('esx_drugs:startHarvestCoke', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersHarvestingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'coker', xPlayer.name)

	HarvestCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestCoke')
AddEventHandler('esx_drugs:stopHarvestCoke', function()

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

			local cokeQuantity = xPlayer.getInventoryItem('coke').count
			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity > 30 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif cokeQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('coke', 5)
				xPlayer.addInventoryItem('coke_pooch', 1)
			
				TransformCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCoke')
AddEventHandler('esx_drugs:startTransformCoke', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersTransformingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'coket', xPlayer.name)
	TransformCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformCoke')
AddEventHandler('esx_drugs:stopTransformCoke', function()

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

			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('coke_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 166)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 200)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 233)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 266)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 300)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				end
				
				SellCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellCoke')
AddEventHandler('esx_drugs:startSellCoke', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersSellingCoke[_source] = true
	
	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'cokev', xPlayer.name)
	SellCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopSellCoke')
AddEventHandler('esx_drugs:stopSellCoke', function()

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

RegisterServerEvent('esx_drugs:startHarvestMeth')
AddEventHandler('esx_drugs:startHarvestMeth', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersHarvestingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'methr', xPlayer.name)
	HarvestMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestMeth')
AddEventHandler('esx_drugs:stopHarvestMeth', function()

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
			elseif methQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 5)
				xPlayer.addInventoryItem('meth_pooch', 1)
				
				TransformMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformMeth')
AddEventHandler('esx_drugs:startTransformMeth', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersTransformingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'metht', xPlayer.name)
	TransformMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformMeth')
AddEventHandler('esx_drugs:stopTransformMeth', function()

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
					xPlayer.addAccountMoney('black_money', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 66)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 100)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 133)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 166)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 200)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				end
				
				SellMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellMeth')
AddEventHandler('esx_drugs:startSellMeth', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersSellingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'methv', xPlayer.name)
	SellMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopSellMeth')
AddEventHandler('esx_drugs:stopSellMeth', function()

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

RegisterServerEvent('esx_drugs:startHarvestWeed')
AddEventHandler('esx_drugs:startHarvestWeed', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersHarvestingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'weedr', xPlayer.name)
	HarvestWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestWeed')
AddEventHandler('esx_drugs:stopHarvestWeed', function()

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
			elseif weedQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 5)
				xPlayer.addInventoryItem('weed_pooch', 1)
				
				TransformWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformWeed')
AddEventHandler('esx_drugs:startTransformWeed', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersTransformingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'weedt', xPlayer.name)
	TransformWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformWeed')
AddEventHandler('esx_drugs:stopTransformWeed', function()

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
					xPlayer.addAccountMoney('black_money', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 250)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 374)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 624)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 750)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				end
				
				SellWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellWeed')
AddEventHandler('esx_drugs:startSellWeed', function()

	local _source = source

	PlayersSellingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopSellWeed')
AddEventHandler('esx_drugs:stopSellWeed', function()

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

RegisterServerEvent('esx_drugs:startHarvestOpium')
AddEventHandler('esx_drugs:startHarvestOpium', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersHarvestingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'opiumr', xPlayer.name)
	HarvestOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestOpium')
AddEventHandler('esx_drugs:stopHarvestOpium', function()

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
			elseif opiumQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 5)
				xPlayer.addInventoryItem('opium_pooch', 1)
			
				TransformOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformOpium')
AddEventHandler('esx_drugs:startTransformOpium', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersTransformingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'opiumt', xPlayer.name)
	TransformOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformOpium')
AddEventHandler('esx_drugs:stopTransformOpium', function()

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
					xPlayer.addAccountMoney('black_money', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 166)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 233)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 300)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 333)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 366)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				end
				
				SellOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellOpium')
AddEventHandler('esx_drugs:startSellOpium', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersSellingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'opiumb', xPlayer.name)
	SellOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopSellOpium')
AddEventHandler('esx_drugs:stopSellOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = false

end)

RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_drugs:ReturnInventory', 
		_source, 
		xPlayer.getInventoryItem('coke').count, 
		xPlayer.getInventoryItem('coke_pooch').count,
		--Nouvelle
		xPlayer.getInventoryItem('coco_huile').count, 
		xPlayer.getInventoryItem('coco_noix').count, 
		xPlayer.getInventoryItem('huile_de_coco').count, 

		xPlayer.getInventoryItem('poudre_sol').count, 
		xPlayer.getInventoryItem('corium').count, 
		xPlayer.getInventoryItem('virus_tchernobyl').count,

		xPlayer.getInventoryItem('fleur_mauve').count, 
		xPlayer.getInventoryItem('datura').count, 
		xPlayer.getInventoryItem('pomme').count, 
		--
		xPlayer.getInventoryItem('meth').count, 
		xPlayer.getInventoryItem('meth_pooch').count, 
		xPlayer.getInventoryItem('weed').count, 
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

	TriggerClientEvent('esx_drugs:onPot', _source)
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

			local coco = xPlayer.getInventoryItem('coco_noix')

			if coco.limit ~= -1 and coco.count >= coco.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coco'))
			else
				xPlayer.addInventoryItem('coco_noix', 1)
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

			local coco = xPlayer.getInventoryItem('coco_huile')

			if coco.limit ~= -1 and coco.count >= coco.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full2_coco'))
			else
				xPlayer.addInventoryItem('coco_huile', 1)
				Harvest2Coco(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestCoco')
AddEventHandler('esx_drugs:startHarvestCoco', function()

	local _source = source

	PlayersHarvestingCoco[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestCoco(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestCoco')
AddEventHandler('esx_drugs:stopHarvestCoco', function()

	local _source = source

	PlayersHarvestingCoco[_source] = false

end)


--
--
--
RegisterServerEvent('esx_drugs:startHarvest2Coco')
AddEventHandler('esx_drugs:startHarvest2Coco', function()

	local _source = source

	PlayersHarvesting2Coco[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	Harvest2Coco(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvest2Coco')
AddEventHandler('esx_drugs:stopHarvest2Coco', function()

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

			local cocoQuantity = xPlayer.getInventoryItem('coco_noix').count
			local coco2Quantity = xPlayer.getInventoryItem('coco_huile').count
			local poochQuantity = xPlayer.getInventoryItem('huile_de_coco').count

			if poochQuantity > 30 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches_coco'))
			elseif cocoQuantity < 5 or coco2Quantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coco'))
			else
				xPlayer.removeInventoryItem('coco_noix', 5)
				xPlayer.removeInventoryItem('coco_huile', 5)
				xPlayer.addInventoryItem('huile_de_coco', 1)
			
				TransformCoco(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCoco')
AddEventHandler('esx_drugs:startTransformCoco', function()

	local _source = source

	PlayersTransformingCoco[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCoco(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformCoco')
AddEventHandler('esx_drugs:stopTransformCoco', function()

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

			local poochQuantity = xPlayer.getInventoryItem('huile_de_coco').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale_coco'))
			else
				xPlayer.removeInventoryItem('huile_de_coco', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coco'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 200)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coco'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 266)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coco'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 300)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coco'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 366)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coco'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 400)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coco'))
				end
				
				SellCoco(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellCoco')
AddEventHandler('esx_drugs:startSellCoco', function()

	local _source = source

	PlayersSellingCoco[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellCoco(_source)

end)

RegisterServerEvent('esx_drugs:stopSellCoco')
AddEventHandler('esx_drugs:stopSellCoco', function()

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
local function HarvestVirus(source)

	if CopsConnected < Config.RequiredCopsVirus then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsVirus))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingVirus[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local virus = xPlayer.getInventoryItem('poudre_sol')

			if virus.limit ~= -1 and virus.count >= virus.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_virus'))
			else
				xPlayer.addInventoryItem('poudre_sol', 1)
				HarvestVirus(source)
			end

		end
	end)
end

local function Harvest2Virus(source)

	if CopsConnected < Config.RequiredCopsVirus then
		TriggerClientEvent('esx:showNotification', source, _U('inv_full2_virus', CopsConnected, Config.RequiredCopsVirus))
		return
	end

	SetTimeout(3000, function()

		if PlayersHarvesting2Virus[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local virus = xPlayer.getInventoryItem('corium')

			if virus.limit ~= -1 and virus.count >= virus.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full2_virus'))
			else
				xPlayer.addInventoryItem('corium', 1)
				Harvest2Virus(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestVirus')
AddEventHandler('esx_drugs:startHarvestVirus', function()

	local _source = source

	PlayersHarvestingVirus[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestVirus(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestVirus')
AddEventHandler('esx_drugs:stopHarvestVirus', function()

	local _source = source

	PlayersHarvestingVirus[_source] = false

end)


RegisterServerEvent('esx_drugs:startHarvest2Virus')
AddEventHandler('esx_drugs:startHarvest2Virus', function()

	local _source = source

	PlayersHarvesting2Virus[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	Harvest2Virus(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvest2Virus')
AddEventHandler('esx_drugs:stopHarvest2Virus', function()

	local _source = source

	PlayersHarvesting2Virus[_source] = false

end)



local function TransformVirus(source)

	if CopsConnected < Config.RequiredCopsVirus then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsVirus))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingVirus[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local virusQuantity = xPlayer.getInventoryItem('poudre_sol').count
			local virus2Quantity = xPlayer.getInventoryItem('corium').count
			local pooch22Quantity = xPlayer.getInventoryItem('virus_tchernobyl').count

			if pooch22Quantity > 30 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches_virus'))
			elseif virusQuantity < 5 or virus2Quantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_virus'))
			else
				xPlayer.removeInventoryItem('poudre_sol', 5)
				xPlayer.removeInventoryItem('corium', 5)
				xPlayer.addInventoryItem('virus_tchernobyl', 1)
			
				TransformVirus(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformVirus')
AddEventHandler('esx_drugs:startTransformVirus', function()

	local _source = source

	PlayersTransformingVirus[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformVirus(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformVirus')
AddEventHandler('esx_drugs:stopTransformVirus', function()

	local _source = source

	PlayersTransformingVirus[_source] = false

end)






local function SellVirus(source)

	if CopsConnected < Config.RequiredCopsVirus then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsVirus))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingVirus[source] == true then

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
					xPlayer.addAccountMoney('black_money', 200)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_virus'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 266)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_virus'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 333)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_virus'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 500)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_virus'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 550)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_virus'))
				end
				
				SellVirus(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellVirus')
AddEventHandler('esx_drugs:startSellVirus', function()

	local _source = source

	PlayersSellingVirus[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellVirus(_source)

end)

RegisterServerEvent('esx_drugs:stopSellVirus')
AddEventHandler('esx_drugs:stopSellVirus', function()

	local _source = source

	PlayersSellingVirus[_source] = false

end)

--Datura
local function HarvestDatura(source)

	if CopsConnected < Config.RequiredCopsDatura then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsDatura))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingDatura[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local datura = xPlayer.getInventoryItem('fleur_mauve')

			if datura.limit ~= -1 and datura.count >= datura.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_datura'))
			else
				xPlayer.addInventoryItem('fleur_mauve', 1)
				HarvestDatura(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestDatura')
AddEventHandler('esx_drugs:startHarvestDatura', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersHarvestingDatura[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'virusr', xPlayer.name)
	HarvestDatura(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestDatura')
AddEventHandler('esx_drugs:stopHarvestDatura', function()

	local _source = source

	PlayersHarvestingDatura[_source] = false

end)



local function TransformDatura(source)

	if CopsConnected < Config.RequiredCopsDatura then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsDatura))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingDatura[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local daturaQuantity = xPlayer.getInventoryItem('fleur_mauve').count
			local datura2Quantity = xPlayer.getInventoryItem('pomme').count
			local poochQuantity = xPlayer.getInventoryItem('datura').count

			if poochQuantity > 30 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif daturaQuantity < 5 or datura2Quantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_datura'))
			else
				xPlayer.removeInventoryItem('fleur_mauve', 5)
				xPlayer.removeInventoryItem('pomme', 5)
				xPlayer.addInventoryItem('datura', 1)
			
				TransformDatura(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformDatura')
AddEventHandler('esx_drugs:startTransformDatura', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersTransformingDatura[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'virust', xPlayer.name)
	TransformDatura(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformDatura')
AddEventHandler('esx_drugs:stopTransformDatura', function()

	local _source = source

	PlayersTransformingDatura[_source] = false

end)

local function SellDatura(source)

	if CopsConnected < Config.RequiredCopsDatura then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsDatura))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingDatura[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local datura2Quantity = xPlayer.getInventoryItem('datura').count

			if datura2Quantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('datura', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_datura'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 233)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_datura'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 266)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_datura'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 300)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_datura'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 333)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_datura'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 366)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_datura'))
				end
				
				SellDatura(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellDatura')
AddEventHandler('esx_drugs:startSellDatura', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	PlayersSellingDatura[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
	TriggerEvent('esx_joblogs:AddInLog', 'drogue', 'virusv', xPlayer.name)
	SellDatura(_source)

end)

RegisterServerEvent('esx_drugs:stopSellDatura')
AddEventHandler('esx_drugs:stopSellDatura', function()

	local _source = source

	PlayersSellingDatura[_source] = false

end)