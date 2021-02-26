local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("ktr_lavandejob:sellBottles")
AddEventHandler("ktr_lavandejob:sellBottles", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles = player.getInventoryItem("lavande")["count"]
    
    if currentBottles > 0 then
        math.randomseed(os.time())
         local randomMoney = 2-- Prix
  	--	  local randomMoney = math.random(10, 17)

        player.removeInventoryItem("lavande", currentBottles)
        player.addMoney(randomMoney * currentBottles)
         TriggerEvent('esx_joblogs:AddInLog', 'lavande', 'lavandevente', player.name, currentBottles)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Lavande et vous avez reçu %s$"):format(currentBottles, currentBottles * randomMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas de lavande à vendre au magasin.")
    end
end)








RegisterServerEvent("ktr_lavandejob:sellBottles3")
AddEventHandler("ktr_lavandejob:sellBottles3", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles2 = player.getInventoryItem("unicorncocktail")["count"]
    
     local societyAccount = nil
	 TriggerEvent('esx_addonaccount:getSharedAccount', 'society_unicorn', function(account)
    societyAccount = account
  end)

    if currentBottles2 > 0 then
        math.randomseed(os.time())
         local randomMoney = 72 -- Prix
         local societyMoney = 23

        player.removeInventoryItem("unicorncocktail", currentBottles2)
        player.addMoney(randomMoney * currentBottles2)
        societyAccount.addMoney(societyMoney * currentBottles2)
     --    TriggerEvent('esx_joblogs:AddInLog', 'lavande', 'lavandevente', player.name, currentBottles2)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Cocktail et vous avez reçu %s$"):format(currentBottles2, currentBottles2 * randomMoney))
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Cocktail et votre entreprise a reçu %s$"):format(currentBottles2, currentBottles2 * societyMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas de Cocktail à vendre au magasin.")
    end
end)





RegisterServerEvent("ktr_lavandejob:sellBottles4")
AddEventHandler("ktr_lavandejob:sellBottles4", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles2 = player.getInventoryItem("pieceauto")["count"]
    
    if currentBottles2 > 0 then
        math.randomseed(os.time())
         local randomMoney = 6 -- Prix

        player.removeInventoryItem("pieceauto", currentBottles2)
        player.addMoney(randomMoney * currentBottles2)
     --    TriggerEvent('esx_joblogs:AddInLog', 'lavande', 'lavandevente', player.name, currentBottles2)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Pièces auto et vous avez reçu %s$"):format(currentBottles2, currentBottles2 * randomMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas de Pièces auto à vendre au magasin.")
    end
end)


RegisterServerEvent("ktr_lavandejob:sellBottles5")
AddEventHandler("ktr_lavandejob:sellBottles5", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles2 = player.getInventoryItem("sandwich")["count"]
    
     local societyAccount = nil
	 TriggerEvent('esx_addonaccount:getSharedAccount', 'society_fermier', function(account)
    societyAccount = account
  end)

    if currentBottles2 > 0 then
        math.randomseed(os.time())
         local randomMoney = 15 -- Prix
         local societyMoney = 10

        player.removeInventoryItem("sandwich", currentBottles2)
        player.addMoney(randomMoney * currentBottles2)
        societyAccount.addMoney(societyMoney * currentBottles2)
         TriggerEvent('esx_joblogs:AddInLog', 'fermier', 'fermier1', player.name, currentBottles2)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Sandwich et vous avez reçu %s$"):format(currentBottles2, currentBottles2 * randomMoney))
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Sandwich et votre entreprise a reçu %s$"):format(currentBottles2, currentBottles2 * societyMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas de Sandwich à vendre au magasin.")
    end
end)


RegisterServerEvent("ktr_lavandejob:sellBottles6")
AddEventHandler("ktr_lavandejob:sellBottles6", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles2 = player.getInventoryItem("salademixte")["count"]
    
     local societyAccount = nil
	 TriggerEvent('esx_addonaccount:getSharedAccount', 'society_fermier', function(account)
    societyAccount = account
  end)

    if currentBottles2 > 0 then
        math.randomseed(os.time())
         local randomMoney = 10 -- Prix
         local societyMoney = 5

        player.removeInventoryItem("salademixte", currentBottles2)
        player.addMoney(randomMoney * currentBottles2)
        societyAccount.addMoney(societyMoney * currentBottles2)
         TriggerEvent('esx_joblogs:AddInLog', 'fermier', 'fermier2', player.name, currentBottles2)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Salade Mixte et vous avez reçu %s$"):format(currentBottles2, currentBottles2 * randomMoney))
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Salade Mixte et votre entreprise a reçu %s$"):format(currentBottles2, currentBottles2 * societyMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez plus de Salade Mixte à vendre au magasin.")
    end
end)


RegisterServerEvent("ktr_lavandejob:sellBottles7")
AddEventHandler("ktr_lavandejob:sellBottles7", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles2 = player.getInventoryItem("paquetcigarett")["count"]
    
     local societyAccount = nil
   TriggerEvent('esx_addonaccount:getSharedAccount', 'society_tabac', function(account)
    societyAccount = account
  end)

    if currentBottles2 > 0 then
        math.randomseed(os.time())
         local randomMoney = 270 -- Prix
         local societyMoney = 50

        player.removeInventoryItem("paquetcigarett", currentBottles2)
        player.addMoney(randomMoney * currentBottles2)
        societyAccount.addMoney(societyMoney * currentBottles2)
         TriggerEvent('esx_joblogs:AddInLog', 'lavande', 'cigarette', player.name, currentBottles2)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Paquet de Cigarette et vous avez reçu %s$"):format(currentBottles2, currentBottles2 * randomMoney))
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Paquet de Cigarette et votre entreprise a reçu %s$"):format(currentBottles2, currentBottles2 * societyMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez plus de Paquet de Cigarette à vendre au magasin.")
    end
end)


RegisterServerEvent("ktr_lavandejob:sellBottles8")
AddEventHandler("ktr_lavandejob:sellBottles8", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles2 = player.getInventoryItem("venetiecocktail")["count"]
    
     local societyAccount = nil
   TriggerEvent('esx_addonaccount:getSharedAccount', 'society_nightclub', function(account)
    societyAccount = account
  end)

    if currentBottles2 > 0 then
        math.randomseed(os.time())
        local randomMoney = 55 -- Prix
         local societyMoney = 30

        player.removeInventoryItem("venetiecocktail", currentBottles2)
        player.addMoney(randomMoney * currentBottles2)
        societyAccount.addMoney(societyMoney * currentBottles2)
     --    TriggerEvent('esx_joblogs:AddInLog', 'lavande', 'lavandevente', player.name, currentBottles2)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Cocktail et vous avez reçu %s$"):format(currentBottles2, currentBottles2 * randomMoney))
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Cocktail et votre entreprise a reçu %s$"):format(currentBottles2, currentBottles2 * societyMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez plus de Cocktail à vendre au magasin.")
    end
end)




RegisterServerEvent("ktr_lavandejob:sellBottles9")
AddEventHandler("ktr_lavandejob:sellBottles9", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles2 = player.getInventoryItem("planchebois")["count"]

    if currentBottles2 > 0 then
        math.randomseed(os.time())
        local randomMoney = 34 -- Prix


        player.removeInventoryItem("planchebois", currentBottles2)
        player.addMoney(randomMoney * currentBottles2)
        societyAccount.addMoney(societyMoney * currentBottles2)
     --    TriggerEvent('esx_joblogs:AddInLog', 'lavande', 'lavandevente', player.name, currentBottles2)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Planche et vous avez reçu %s$"):format(currentBottles2, currentBottles2 * randomMoney))
    --    TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Planche et votre entreprise a reçu %s$"):format(currentBottles2, currentBottles2 * societyMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez plus de Planche à vendre au magasin.")
    end
end)


RegisterServerEvent("ktr_lavandejob:sellBottles10")
AddEventHandler("ktr_lavandejob:sellBottles10", function()
    local player = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    local currentBottles2 = player.getInventoryItem("journal")["count"]

    if currentBottles2 > 0 then
        math.randomseed(os.time())
        local randomMoney = 27 -- Prix


        player.removeInventoryItem("journal", currentBottles2)
        player.addMoney(randomMoney * currentBottles2)
        societyAccount.addMoney(societyMoney * currentBottles2)
     --    TriggerEvent('esx_joblogs:AddInLog', 'lavande', 'lavandevente', player.name, currentBottles2)
        TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Journaux et vous avez reçu %s$"):format(currentBottles2, currentBottles2 * randomMoney))
    --    TriggerClientEvent("esx:showNotification", source, ("Vous avez vendu %s Planche et votre entreprise a reçu %s$"):format(currentBottles2, currentBottles2 * societyMoney))
    else
        TriggerClientEvent("esx:showNotification", source, "Vous n'avez plus de Journaux à vendre au magasin.")
    end
end)