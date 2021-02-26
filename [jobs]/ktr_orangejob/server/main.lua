local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("ktr_orangejob:sellBottles")
AddEventHandler("ktr_orangejob:sellBottles", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles = player.getInventoryItem("orange")["count"]
    
    if currentBottles > 0 then
        math.randomseed(os.time())
        local randomMoney = 4 -- Prix

        player.removeInventoryItem("orange", currentBottles)
        player.addMoney(randomMoney * currentBottles)
        TriggerEvent('esx_joblogs:AddInLog', 'pomme', 'orangevente', player.name, currentBottles)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Orange et vous avez reçu %s$"):format(currentBottles, currentBottles * randomMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas de orange à vendre au magasin.")
    end
end)

RegisterServerEvent("ktr_orangejob:retrieveBottle")
AddEventHandler("ktr_orangejob:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local luck = math.random(0, 20)
    local randomBottle = 1
    local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)
     local pommeQuantity = xPlayer.getInventoryItem('orange').count

     if pommeQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop d\'orange sur vous'))
            else
    if luck >= 0 and luck <= 0 then
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas trouver de orange mure.")
    else
        player.addInventoryItem("orange", randomBottle)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez récolter %s Orange"):format(randomBottle))
    end
    end
end)






RegisterServerEvent('ktr_pommejob:GetUserInventory')
AddEventHandler('ktr_pommejob:GetUserInventory', function(currentZone)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('ktr_pommejob:ReturnInventory', 
        _source, 
        xPlayer.getInventoryItem('pomme').count,
        xPlayer.job.name, 
        currentZone
    )
end)