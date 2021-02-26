local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("esx-ecobottles:sellBottles")
AddEventHandler("esx-ecobottles:sellBottles", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles = player.getInventoryItem("pomme")["count"]
    
    if currentBottles > 0 then
        math.randomseed(os.time())
        local randomMoney = 3 -- Prix

        player.removeInventoryItem("pomme", currentBottles)
        player.addMoney(randomMoney * currentBottles)
        TriggerEvent('esx_joblogs:AddInLog', 'pomme', 'pommevente', player.name, currentBottles)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Pommes et vous avez reçu %s$"):format(currentBottles, currentBottles * randomMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas de pomme à vendre au magasin.")
    end
end)

RegisterServerEvent("esx-ecobottles:retrieveBottle")
AddEventHandler("esx-ecobottles:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local luck = math.random(0, 20)
    local randomBottle = 1
    local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)
     local pommeQuantity = xPlayer.getInventoryItem('pomme').count

     if pommeQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de pommes sur vous'))
            else
    if luck >= 0 and luck <= 0 then
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas trouver de pomme mure.")
    else
        player.addInventoryItem("pomme", randomBottle)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez récolter %s Pommes"):format(randomBottle))
    end
    end
end)


