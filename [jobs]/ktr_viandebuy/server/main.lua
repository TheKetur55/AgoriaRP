local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("esx-viandebuy:sellBottles")
AddEventHandler("esx-viandebuy:sellBottles", function()
    local player = ESX.GetPlayerFromId(source)

    local currentBottles = player.getInventoryItem("viande")["count"]
    
    if currentBottles > 0 then
        math.randomseed(os.time())
        local randomMoney = 37 -- Prix

        player.removeInventoryItem("viande", currentBottles)
        player.addMoney(randomMoney * currentBottles)

        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Viande et vous avez reçu %s$"):format(currentBottles, currentBottles * randomMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas de Viande à vendre au magasin.")
    end
end)




RegisterServerEvent('viandebuy:GetUserInventory')
AddEventHandler('viandebuy:GetUserInventory', function(currentZone)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('viandebuy:ReturnInventory', 
        _source, 
        xPlayer.getInventoryItem('viande').count,
        xPlayer.job.name, 
        currentZone
    )
end)