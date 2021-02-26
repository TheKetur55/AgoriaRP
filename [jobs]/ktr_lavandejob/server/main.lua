local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)
--[[
RegisterServerEvent("ktr_lavandejob:sellBottles")
AddEventHandler("ktr_lavandejob:sellBottles", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles = player.getInventoryItem("lavande")["count"]
    
    if currentBottles > 0 then
        math.randomseed(os.time())
      --   local randomMoney = math.random(10, 17) -- Prix

        player.removeInventoryItem("lavande", currentBottles)
        player.addMoney(randomMoney * currentBottles)
         TriggerEvent('esx_joblogs:AddInLog', 'lavande', 'lavandevente', player.name, currentBottles)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Lavande et vous avez reçu %s$"):format(currentBottles, currentBottles * randomMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas de lavande à vendre au magasin.")
    end
end)]]

RegisterServerEvent("ktr_lavandejob:retrieveBottle")
AddEventHandler("ktr_lavandejob:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local luck = math.random(0, 20)
    local randomBottle = 1
    local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)
     local pommeQuantity = xPlayer.getInventoryItem('lavande').count

     if pommeQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de lavandes sur vous'))
             --w   TriggerClientEvent("ktr_lavandejob:clearped")
            else
    if luck >= 0 and luck <= 1 then
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas trouver de lavande fleurit.")
    else
        player.addInventoryItem("lavande", randomBottle)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez récolter %s Lavandes"):format(randomBottle))
    end
    end
end)


RegisterServerEvent("ktr_lavandejob:retrieveBottle2")
AddEventHandler("ktr_lavandejob:retrieveBottle2", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local luck = math.random(0, 20)
    local randomBottle = 1
    local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)
     local pommeQuantity = xPlayer.getInventoryItem('bois').count

     if pommeQuantity >= 50 then
                TriggerClientEvent('esx:showNotification', source, ('~r~Vous portez trop de lavandes sur vous'))
             --w   TriggerClientEvent("ktr_lavandejob:clearped")
            else

        player.addInventoryItem("bois", randomBottle)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez récolter %s Bois"):format(randomBottle))
    end
end)





RegisterServerEvent('ktr_lavandejob:GetUserInventory')
AddEventHandler('ktr_lavandejob:GetUserInventory', function(currentZone)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('ktr_lavandejob:ReturnInventory', 
        _source, 
        xPlayer.getInventoryItem('lavande').count,
        xPlayer.job.name, 
        currentZone
    )
end)