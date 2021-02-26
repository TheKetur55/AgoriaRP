ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--EVENTS--

RegisterServerEvent('ktr_ubershopnpc:pourboire') --Paie a la livraison d'une pizza + pourboire eventuel
AddEventHandler('ktr_ubershopnpc:pourboire', function(pourboire)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addMoney(pourboire)
end)

RegisterServerEvent("ktr_ubershopnpc:paiefinale") --Paie "bonus" lors de la fin de service
AddEventHandler("ktr_ubershopnpc:paiefinale", function()
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


RegisterServerEvent("ktr_ubershopnpc:itemadd") --Ajout temporaire de l'item "pizza"
AddEventHandler("ktr_ubershopnpc:itemadd", function(nbPizza)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addInventoryItem('colis', tonumber(nbPizza))
end)

RegisterServerEvent("ktr_ubershopnpc:itemrm") --Rm de l'item "pizza"
AddEventHandler("ktr_ubershopnpc:itemrm", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('colis', 1)
	xPlayer.addInventoryItem('fichepaye1', 3)
end)

RegisterServerEvent("ktr_ubershopnpc:deleteAllPizz") --Rm de l'item "pizza"
AddEventHandler("ktr_ubershopnpc:deleteAllPizz", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		
	local pizzanbr = xPlayer.getInventoryItem('colis').count
	
	xPlayer.removeInventoryItem('colis', pizzanbr)
end)