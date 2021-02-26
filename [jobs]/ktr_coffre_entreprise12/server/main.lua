ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)





RegisterServerEvent('ktr_coffre_entreprise12:getStockItem')
AddEventHandler('ktr_coffre_entreprise12:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_shop2', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
			--	if Config.EnableJobLogs == true then
					TriggerEvent('esx_joblogs:AddInLog', 'coffre', 'getSharedInventory', xPlayer.name, count, inventoryItem.label)
			--	end
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end
	end)
end)


ESX.RegisterServerCallback('ktr_coffre_entreprise12:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_shop2', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('ktr_coffre_entreprise12:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)
RegisterServerEvent('ktr_coffre_entreprise12:putStockItems')
AddEventHandler('ktr_coffre_entreprise12:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_shop2', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, inventoryItem.label))
		--	if Config.EnableJobLogs == true then
				TriggerEvent('esx_joblogs:AddInLog', 'coffre', 'putStockItems', xPlayer.name, count, inventoryItem.label)
		--	end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

