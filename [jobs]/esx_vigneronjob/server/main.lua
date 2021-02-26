-----------------------------------------
-- Created and modify by L'ile Légale RP
-- SenSi and Kaminosekai
-----------------------------------------

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

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'vigne', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'vigne', _U('vigneron_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'vigne', 'Vigneron', 'society_vigne', 'society_vigne', 'society_vigne', {type = 'private'})
local function Harvest(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "RaisinFarm" or zone == "RaisinFarm2" or zone == "RaisinFarm3" then
			local itemQuantity = xPlayer.getInventoryItem('raisin').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place'))
				return
			else
				SetTimeout(1000, function()
					xPlayer.addInventoryItem('raisin', 5)
					Harvest(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('esx_vigneronjob:startHarvest')
AddEventHandler('esx_vigneronjob:startHarvest', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
  	local raisinQuantity = xPlayer.getInventoryItem('raisin').count
	--if PlayersHarvesting[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersHarvesting[_source]=false
	--else
	
	if raisinQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de raisin sur vous'))
            else
		PlayersHarvesting[_source]=true
		 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "recolte", xPlayer.name)
		TriggerClientEvent('esx:showNotification', _source, _U('raisin_taken'))  
		Harvest(_source,zone)
	end
--	end
end)


RegisterServerEvent('esx_vigneronjob:stopHarvest')
AddEventHandler('esx_vigneronjob:stopHarvest', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local raisinQuantity = xPlayer.getInventoryItem('raisin').count

	
            
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
--		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		--TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~récolter')
		PlayersHarvesting[_source]=true
	
	end
end)


local function Transform(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementVin" then
			local itemQuantity = xPlayer.getInventoryItem('raisin').count
			
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin'))
				return
			else
				local rand = math.random(0,100)
				if (rand >= 97) then
					SetTimeout(2000, function()
						xPlayer.removeInventoryItem('raisin', 1)
						xPlayer.addInventoryItem('grand_cru', 1)
						TriggerClientEvent('esx:showNotification', source, _U('grand_cru'))
						Transform(source, zone)
					end)
				elseif (rand >= 75) then
					SetTimeout(2000, function()
						xPlayer.removeInventoryItem('raisin', 1)
						xPlayer.addInventoryItem('vineblanc', 1)
						TriggerClientEvent('esx:showNotification', source, _U('vineblanc'))
						Transform(source, zone)
					end)
				else
					SetTimeout(2000, function()
						xPlayer.removeInventoryItem('raisin', 1)
						xPlayer.addInventoryItem('vine', 1)
				
						Transform(source, zone)
					end)
				end
			end
		elseif zone == "TraitementJus" then
			local itemQuantity = xPlayer.getInventoryItem('raisin').count
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin'))
				return
			else
			    local rand = math.random(0,100)
				if (rand >= 97) then
					SetTimeout(2000, function()
						xPlayer.removeInventoryItem('raisin', 1)
						xPlayer.addInventoryItem('cognac', 1)
						TriggerClientEvent('esx:showNotification', source, _U('cognac'))
						Transform(source, zone)
					end)
				elseif (rand >= 75) then
					SetTimeout(2000, function()
						xPlayer.removeInventoryItem('raisin', 1)
						xPlayer.addInventoryItem('champagne', 1)
						TriggerClientEvent('esx:showNotification', source, _U('champagne'))
						Transform(source, zone)
					end)
				else
					SetTimeout(2000, function()
						xPlayer.removeInventoryItem('raisin', 1)
						xPlayer.addInventoryItem('jus_raisin', 1)
				
						Transform(source, zone)
				end)
			end
		end
	end	
  end
end

RegisterServerEvent('esx_vigneronjob:startTransform')
AddEventHandler('esx_vigneronjob:startTransform', function(zone)
	local _source = source
  	local xPlayer = ESX.GetPlayerFromId(_source)
	--if PlayersTransforming[_source] == false then
	--	TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
	--	PlayersTransforming[_source]=false
	--else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress')) 
		 TriggerEvent('esx_joblogs:AddInLog', "vigneron", "traite", xPlayer.name)
		Transform(_source,zone)
--	end
end)

RegisterServerEvent('esx_vigneronjob:stopTransform')
AddEventHandler('esx_vigneronjob:stopTransform', function()

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
					SetTimeout(100, function()
						local total = 5
						xPlayer.removeInventoryItem('jus_raisin', 1)
						local societyAccount = nil
						
					--	if xPlayer.job.grade >= 1 then
		          --          total = total * 2
                   --     end

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
					SetTimeout(100, function()
						local total = 6
						xPlayer.removeInventoryItem('vine', 1)
						local societyAccount = nil

				--		if xPlayer.job.grade >= 3 then
		          --          total = total * 2
                 --       end

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
					SetTimeout(100, function()
						local total = 10
						xPlayer.removeInventoryItem('champagne', 1)
						local societyAccount = nil
						
				--		if xPlayer.job.grade >= 3 then
		        --            total = total * 2
                --        end

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
					SetTimeout(100, function()
						local total = 12
						xPlayer.removeInventoryItem('vineblanc', 1)
						local societyAccount = nil
						
					--	if xPlayer.job.grade >= 3 then
		          --          total = total * 2
                  --      end

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
					SetTimeout(100, function()
						local total = 90
						xPlayer.removeInventoryItem('cognac', 1)
						local societyAccount = nil
						
				--		if xPlayer.job.grade >= 3 then
		         --           total = total * 2
                  --      end

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
					SetTimeout(100, function()
						local total = 106
						xPlayer.removeInventoryItem('grand_cru', 1)
						local societyAccount = nil
						
				--		if xPlayer.job.grade >= 3 then
		          --          total = total * 2
                 --       end

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

RegisterServerEvent('esx_vigneronjob:startSell')
AddEventHandler('esx_vigneronjob:startSell', function(zone)

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

RegisterServerEvent('esx_vigneronjob:stopSell')
AddEventHandler('esx_vigneronjob:stopSell', function()

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

RegisterServerEvent('esx_vigneronjob:getStockItem')
AddEventHandler('esx_vigneronjob:getStockItem', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('esx_vigneronjob:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)
		cb(inventory.items)
	end)

end)

RegisterServerEvent('esx_vigneronjob:putStockItems')
AddEventHandler('esx_vigneronjob:putStockItems', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

	end)
end)



ESX.RegisterServerCallback('esx_vigneronjob:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)


ESX.RegisterUsableItem('jus_raisin', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jus_raisin', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 280000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_jus'))

end)

ESX.RegisterUsableItem('champagne', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('champagne', 1)

    TriggerClientEvent('esx_status:add', source, 'drug', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_champagne'))

end)

ESX.RegisterUsableItem('cognac', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cognac', 1)

    TriggerClientEvent('esx_status:add', source, 'drug', 450000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_cognac'))

end)

ESX.RegisterUsableItem('vine', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vine', 1)

    TriggerClientEvent('esx_status:add', source, 'drug', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_vine'))

end)

ESX.RegisterUsableItem('vineblanc', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vineblanc', 1)

    TriggerClientEvent('esx_status:add', source, 'drug', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_vineblanc'))

end)

ESX.RegisterUsableItem('grand_cru', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('grand_cru', 1)

	TriggerClientEvent('esx_status:add', source, 'drug', 400000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_grand_cru'))

end)



ESX.RegisterUsableItem('raisin', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('raisin', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_raisin'))

end)




