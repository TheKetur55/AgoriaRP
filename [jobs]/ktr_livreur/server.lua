ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--EVENTS--

RegisterServerEvent('livreur:pourboire') --Paie a la livraison d'une pizza + pourboire eventuel
AddEventHandler('livreur:pourboire', function(pourboire)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addMoney(pourboire)
end)

RegisterServerEvent("livreur:paiefinale") --Paie "bonus" lors de la fin de service
AddEventHandler("livreur:paiefinale", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	local flouzefin = math.random(10, 100)

--	xPlayer.addMoney(flouzefin)
	--xPlayer.addInventoryItem('fichepaye1', tonumber(nbPizza))

	TriggerClientEvent("pNotify:SendNotification", source, {
		text = "Voici votre petit bonus final : " .. flouzefin .. "$",
		type = "success",
		queue = "global",
		timeout = 4000,
		layout = "bottomRight"
	})
end)


RegisterServerEvent("livreur:itemadd") --Ajout temporaire de l'item "pizza"
AddEventHandler("livreur:itemadd", function(nbPizza)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addInventoryItem('colis', tonumber(nbPizza))
end)

RegisterServerEvent("livreur:itemrm") --Rm de l'item "pizza"
AddEventHandler("livreur:itemrm", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('colis', 1)
	xPlayer.addInventoryItem('fichepaye1', 1)
end)

RegisterServerEvent("livreur:deleteAllPizz") --Rm de l'item "pizza"
AddEventHandler("livreur:deleteAllPizz", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		
	local pizzanbr = xPlayer.getInventoryItem('colis').count
	
	xPlayer.removeInventoryItem('colis', pizzanbr)
end)