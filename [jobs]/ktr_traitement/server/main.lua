
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

RegisterServerEvent('ktr_traitement:traitementalbonnebouf')
AddEventHandler('ktr_traitement:traitementalbonnebouf', function(itemValue)

    local _source = source
    local _itemValue = itemValue
	TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours...'))



    if _itemValue == 'sandwich' then
		TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours veuillez patientez 25 secondes'))
        SetTimeout(25000, function() 
          TriggerEvent('ktr_traitement:BloqueTouche') 


            local xPlayer           = ESX.GetPlayerFromId(_source)

            local Quantity1    = xPlayer.getInventoryItem('bread').count
            local Quantity2     = xPlayer.getInventoryItem('tomate').count
            local Quantity3     = xPlayer.getInventoryItem('salade').count

            if Quantity1 < 25 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
            elseif Quantity2 < 50 then
                 TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
             elseif Quantity3 < 50 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
            else

                
                  
                    TriggerClientEvent('esx:showNotification', _source, 'Vous avez fabriquer 25 Sandwich' )
                    xPlayer.removeInventoryItem('bread', 25)
                    xPlayer.removeInventoryItem('tomate', 50)
                    xPlayer.removeInventoryItem('salade', 50)
                    xPlayer.addInventoryItem('sandwich', 25)
                
            end

        end)
    end
     if _itemValue == 'sandwichviande' then
		TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours veuillez patientez 50 secondes'))
        SetTimeout(50000, function() 
          TriggerEvent('ktr_traitement:BloqueTouche') 


            local xPlayer           = ESX.GetPlayerFromId(_source)

            local Quantity1    = xPlayer.getInventoryItem('bread').count
            local Quantity2     = xPlayer.getInventoryItem('viande').count
            

            if Quantity1 < 50 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
            elseif Quantity2 < 25 then
                 TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
             
            else

                
                  
                    TriggerClientEvent('esx:showNotification', _source, 'Vous avez fabriquer 50 Sandwich au viande' )
                    xPlayer.removeInventoryItem('bread', 50)
                    xPlayer.removeInventoryItem('viande', 25)
                    xPlayer.addInventoryItem('sandwichviande', 50)
                
            end

        end)
    end
    if _itemValue == 'salademixte' then
		TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours veuillez patientez 50 secondes'))
        SetTimeout(50000, function() 
          TriggerEvent('ktr_traitement:BloqueTouche') 


            local xPlayer           = ESX.GetPlayerFromId(_source)

            local Quantity1    = xPlayer.getInventoryItem('tomate').count
            local Quantity2     = xPlayer.getInventoryItem('salade').count
            

            if Quantity1 < 50 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
            elseif Quantity2 < 50 then
                 TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
             
            else

                
                  
                    TriggerClientEvent('esx:showNotification', _source, 'Vous avez fabriquer 50 Salade Mixte' )
                    xPlayer.removeInventoryItem('tomate', 50)
                    xPlayer.removeInventoryItem('salade', 50)
                    xPlayer.addInventoryItem('salademixte', 50)
                
            end

        end)
    end
    if _itemValue == 'saladefruit' then
		TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours veuillez patientez 25 secondes'))
		SetTimeout(25000, function() 

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local Quantity1    = xPlayer.getInventoryItem('orange').count
            local Quantity2     = xPlayer.getInventoryItem('pomme').count
            

            if Quantity1 < 50 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
            elseif Quantity2 < 50 then
                 TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
             
            else
              
                  
                    TriggerClientEvent('esx:showNotification', _source, 'Vous avez fabriquer 25 Salade au Fruit' )
                    xPlayer.removeInventoryItem('orange', 50)
                    xPlayer.removeInventoryItem('pomme', 50)
                    xPlayer.addInventoryItem('saladefruit', 25)
                
            end

        end)
    end
    if _itemValue == 'cornetfrite' then
		TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours veuillez patientez 25 secondes'))
        SetTimeout(25000, function() 
          TriggerEvent('ktr_traitement:BloqueTouche') 


            local xPlayer           = ESX.GetPlayerFromId(_source)

            local Quantity1    = xPlayer.getInventoryItem('pommeterre').count
            

            if Quantity1 < 50 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
          
             
            else

                
                  
                    TriggerClientEvent('esx:showNotification', _source, 'Vous avez fabriquer 25 Cornet de Frite' )
                    xPlayer.removeInventoryItem('pommeterre', 50)
                    xPlayer.addInventoryItem('cornetfrite', 25)
                
            end

        end)
    end
    if _itemValue == 'chickenburger' then
		TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours veuillez patientez 50 secondes'))
        SetTimeout(50000, function() 
          TriggerEvent('ktr_traitement:BloqueTouche') 


            local xPlayer           = ESX.GetPlayerFromId(_source)

            local Quantity1    = xPlayer.getInventoryItem('bread').count
            local Quantity2     = xPlayer.getInventoryItem('tranchepoulet').count
            

            if Quantity1 < 50 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
            elseif Quantity2 < 50 then
                 TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
             
            else

                
                  
                    TriggerClientEvent('esx:showNotification', _source, 'Vous avez fabriquer 50 Chicken Burger' )
                    xPlayer.removeInventoryItem('bread', 50)
                    xPlayer.removeInventoryItem('tranchepoulet', 50)
                    xPlayer.addInventoryItem('chickenburger', 50)
                
            end

        end)
    end
    if _itemValue == 'fishburger' then
		TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours veuillez patientez 50 secondes'))
        SetTimeout(50000, function() 
          TriggerEvent('ktr_traitement:BloqueTouche') 


            local xPlayer           = ESX.GetPlayerFromId(_source)

            local Quantity1    = xPlayer.getInventoryItem('bread').count
            local Quantity2     = xPlayer.getInventoryItem('fish').count
            

            if Quantity1 < 50 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
            elseif Quantity2 < 50 then
                 TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
             
            else             
                  
                    TriggerClientEvent('esx:showNotification', _source, 'Vous avez fabriquer 50 Fish Burger' )
                    xPlayer.removeInventoryItem('bread', 50)
                    xPlayer.removeInventoryItem('fish', 50)
                    xPlayer.addInventoryItem('fishburger', 50)
                
            end

        end)
    end
    if _itemValue == 'soupetomate' then
		TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours veuillez patientez 50 secondes'))
        SetTimeout(50000, function() 
          TriggerEvent('ktr_traitement:BloqueTouche') 


            local xPlayer           = ESX.GetPlayerFromId(_source)

            local Quantity1    = xPlayer.getInventoryItem('tomate').count
            

            if Quantity1 < 50 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
          
             
            else

                
                  
                    TriggerClientEvent('esx:showNotification', _source, 'Vous avez fabriquer 50 Soupe à la Tomate' )
                    xPlayer.removeInventoryItem('tomate', 50)
                    xPlayer.addInventoryItem('soupetomate', 50)
                
            end

        end)
    end
    if _itemValue == 'saladecesar' then
		TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours veuillez patientez 50 secondes'))
        SetTimeout(50000, function() 
          TriggerEvent('ktr_traitement:BloqueTouche') 


            local xPlayer           = ESX.GetPlayerFromId(_source)

            local Quantity1    = xPlayer.getInventoryItem('tranchepoulet').count
            local Quantity2     = xPlayer.getInventoryItem('salademixte').count
            

            if Quantity1 < 50 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
            elseif Quantity2 < 50 then
                 TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
             
            else             
                  
                    TriggerClientEvent('esx:showNotification', _source, 'Vous avez fabriquer 50 Salade César' )
                    xPlayer.removeInventoryItem('tranchepoulet', 50)
                    xPlayer.removeInventoryItem('salademixte', 50)
                    xPlayer.addInventoryItem('saladecésar', 50)
                
            end

        end)
    end
    if _itemValue == 'delicious' then
		TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours veuillez patientez 25 secondes'))
        SetTimeout(25000, function() 
          TriggerEvent('ktr_traitement:BloqueTouche') 


            local xPlayer           = ESX.GetPlayerFromId(_source)

            local Quantity1    = xPlayer.getInventoryItem('bread').count
            local Quantity2     = xPlayer.getInventoryItem('tomate').count
            local Quantity3     = xPlayer.getInventoryItem('salade').count
            local Quantity4     = xPlayer.getInventoryItem('viande').count

            if Quantity1 < 25 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
            elseif Quantity2 < 50 then
                 TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
             elseif Quantity3 < 50 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
             elseif Quantity4 < 25 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
            else

                
                  
                    TriggerClientEvent('esx:showNotification', _source, 'Vous avez fabriquer 25 Delicious Sandwich' )
                    xPlayer.removeInventoryItem('bread', 25)
                    xPlayer.removeInventoryItem('tomate', 50)
                    xPlayer.removeInventoryItem('salade', 50)
                    xPlayer.removeInventoryItem('viande', 25)
                    xPlayer.addInventoryItem('delicious', 25)
                
            end

        end)
    end
    if _itemValue == 'venetoast' then
		TriggerClientEvent('esx:showNotification', _source, ('Traitement en cours veuillez patientez 3 minutes 20 secondes'))
        SetTimeout(200000, function() 
          TriggerEvent('ktr_traitement:BloqueTouche') 


            local xPlayer           = ESX.GetPlayerFromId(_source)
            local Quantity1    = xPlayer.getInventoryItem('bread').count
            local Quantity2     = xPlayer.getInventoryItem('viande').count
            

            if Quantity1 < 200 then
                TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
            elseif Quantity2 < 50 then
                 TriggerClientEvent('esx:showNotification', _source, ("Vous n'avez pas les ingrédients"))
             
            else             
                  
                    TriggerClientEvent('esx:showNotification', _source, 'Vous avez fabriquer 50 Vene1toast' )
                    xPlayer.removeInventoryItem('bread', 200)
                    xPlayer.removeInventoryItem('viande', 50)
                    xPlayer.addInventoryItem('venetoast', 200)
                
            end

        end)
    end



    end)