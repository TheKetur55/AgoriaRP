local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("esx-fichepaye:sellBottles")
AddEventHandler("esx-fichepaye:sellBottles", function()
    local player = ESX.GetPlayerFromId(source)

    local currentBottles = player.getInventoryItem("fichepaye1")["count"]
    
    if currentBottles > 0 then
        math.randomseed(os.time())
        local randomMoney = 12 -- Prix

        player.removeInventoryItem("fichepaye1", currentBottles)
        player.addMoney(randomMoney * currentBottles)

        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Fiche de paye et vous avez reçu %s$"):format(currentBottles, currentBottles * randomMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas de Fiche de paye à vendre au magasin.")
    end
end)




RegisterServerEvent('fichepaye:GetUserInventory')
AddEventHandler('fichepaye:GetUserInventory', function(currentZone)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('fichepaye:ReturnInventory', 
        _source, 
        xPlayer.getInventoryItem('fichepaye1').count,
        xPlayer.job.name, 
        currentZone
    )
end)