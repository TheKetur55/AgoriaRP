rentalTimer = .1 -- bir sonraki günün ücreti kaç dakika sonra alınsın realtimerdan saniye ayarlayın
isBeingCharged = true -- ücretlendirme
--autoChargeAmount = 100 -- Her seferinde bir oyuncu ne kadar ücretlendirilmeli
ESX = nil
devMode = false
damageInsurance = true -- Hasar Sigortası
--damageCharge = true -- Hasar Ücreti
canBeCharged = false -- Sarj edilebilir
handCuffed = false  -- Kelepçe
arrestCheckAlreadyRan = false -- Tutuklama kontrol
isInPrison = false -- Cezaevinde
isBlipCreated = false -- Blip 


Citizen.CreateThread(function()
	local items = { "Item 1", "Item 2", "Item 3", "Item 4", "Item 5" }
	local currentItemIndex = 1
	local selectedItemIndex = 1
	local checkBox = true
	
	pickupStation = { --Set the car rental locaitons here
		{x = -1139.03, y = -1733.37, z = 4.47},		
		--{x = 1677.2429199219, y = 2658.6179199219, z = 45.560031890869}

	}
	
	dropoffStation = { --Set the car dropoff locations here
	--	{x = -1151.94, y = -1742.04, z = 3.07}, --Airport car rental place
	--	{x = 241.49575805664, y = -756.84222412109, z = 29.82596206665}, -- PV At Legion SQ
	--	{x = -914.16, y = -160.85, z = 40.88}, -- PV at Boulevard Del Perro
	--	{x = -1179.45, y = -731.2, z = 19.5}, -- PV at North Rockford Dr
	--	{x = -791.74, y = 332.14, z = 84.7}, -- PV at South Mo Milton Dr
	--	{x = 604.92, y = 105.35, z = 91.89}, -- PV at Vinewood Blvd
	--	{x = 394.15, y = -1660.44, z = 26.31}, -- PV at Innocence Blvd
	--	{x = 1459.65, y = 3735.7, z = 32.51}, -- PV at Marina Dr
	--	{x = 19.39, y = 6334.73, z = 30.24}, -- PV at Great Ocean Hwy
		
	}	
	
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
	
	WarMenu.CreateMenu('carRental', 'Location de véhicule')
	WarMenu.CreateSubMenu('closeMenu', 'carRental', 'Eminmisiniz?')
	WarMenu.CreateSubMenu('carPicker', 'carRental', 'Choix de vehicule ')
	WarMenu.CreateSubMenu('carInsurance', 'carRental', 'SİGORTA YAPTIRMAK İSTERMİSİNİZ?')
	WarMenu.CreateMenu('carReturn', 'Location de véhicule')
	WarMenu.SetSubTitle('carReturn', 'Voullez vous rendre le vehicule?') 
	WarMenu.CreateMenu('arrestCheck', 'Car Rental')
	WarMenu.SetSubTitle('arrestCheck', 'Şuanda tutuklanıyor musunuz?')
	
	while true do
		-- Ana menü
		if WarMenu.IsMenuOpened('carRental') then
			if WarMenu.MenuButton('Location', 'carPicker') then
			--elseif WarMenu.MenuButton('Araç Sigortası', 'carInsurance') then
			--elseif WarMenu.Button('DEV: Return car') then
			--	returnVehicle()
			--elseif WarMenu.Button('DEV: Delete car') then
			--	local currentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			--	SetEntityAsMissionEntity(currentVehicle, true, true)
			--	DeleteVehicle(currentVehicle)
			--elseif WarMenu.Button('DEV: Add 200k') then		
			--	TriggerServerEvent("devAddPlayer", 200000)
            --elseif WarMenu.CheckBox('DEV: Dev Mode', checkbox, function(checked)
            --        checkbox = checked
			--		devMode = checked
            --end) then
			--elseif WarMenu.Button('DEV: Spawn intruder') then
			--	SpawnVehicle("intruder")
			--	Citizen.Wait(100)
			--	canBeCharged = false
            --elseif WarMenu.CheckBox('DEV: Handcuffed', checkbox2, function(checked2)
            --        checkbox2 = checked2
			--		handCuffed = not checked2
            --end) then
			--elseif WarMenu.Button('DEV: TP Prison') then
			--	SetEntityCoords(GetPlayerPed(-1), 1677.233, 2658.618, 45.216)
			--elseif WarMenu.Button('DEV: TP Rental') then
			--	SetEntityCoords(GetPlayerPed(-1), -902.26593017578, -2327.3703613281, 5.7090311050415)
			--elseif WarMenu.MenuButton('Exit', 'closeMenu') then
			end
			WarMenu.SetSubTitle('carRental', 'Choix de categorie') ---KTR ---
			
			WarMenu.Display()
			
		-- Çıkış Menüsü
		elseif WarMenu.IsMenuOpened('closeMenu') then
			if WarMenu.Button('Confirmer') then
				WarMenu.CloseMenu()
			elseif WarMenu.MenuButton('Refuser', 'carRental') then
			end
			
			WarMenu.Display()
		
		
		elseif WarMenu.IsMenuOpened('carPicker') then
			if WarMenu.Button('Panto |  250$') then
				SpawnVehicle("panto")
				TriggerServerEvent("chargePlayer",250)
				ESX.ShowNotification("~g~Vous avez loué une Panto pour 250 $")
			--	autoChargeAmount = 100
				isBeingCharged = true
				WarMenu.CloseMenu()
			elseif WarMenu.Button('Rhapsody |  350$') then
				SpawnVehicle("Rhapsody")
				TriggerServerEvent("chargePlayer", 350)
				ESX.ShowNotification("~g~Vous avez loué une Rhapsody pour 350 $")
			--	autoChargeAmount = 200
				isBeingCharged = true
				WarMenu.CloseMenu()
			elseif WarMenu.Button('Bmx (vélo) |  50$') then
				SpawnVehicle("bmx")
				TriggerServerEvent("chargePlayer", 50)
				ESX.ShowNotification("~g~Vous avez loué un Bmx pour 50 $")
			--	autoChargeAmount = 100
				isBeingCharged = true
				WarMenu.CloseMenu()
			elseif WarMenu.Button('Faggio (scooter) |  180$') then
				SpawnVehicle("faggio")
				TriggerServerEvent("chargePlayer", 180)
				ESX.ShowNotification("~g~Vous avez loué un Faggio pour 180 $")
			--	autoChargeAmount = 250
				isBeingCharged = true
				WarMenu.CloseMenu()
			
			elseif WarMenu.MenuButton('Retour', 'carRental') then
			end
			
			WarMenu.Display()
		
		--Araç iade menüsü
		elseif WarMenu.IsMenuOpened('carReturn') then
			if WarMenu.Button('Confirmer') then
				returnVehicle()
				WarMenu.CloseMenu()
			elseif WarMenu.Button('Refuser') then
				WarMenu.CloseMenu()
			end	
			
			WarMenu.Display()

		-- Araba sigorta menüsü
		elseif WarMenu.IsMenuOpened('carInsurance') then
			if WarMenu.Button('Confirmer | $200') then
				TriggerServerEvent("chargePlayer", 200)
				damageInsurance = true
				ESX.ShowNotification("Hasar sigortasını satın aldığınız için teşekkürler")
				WarMenu.CloseMenu()
			elseif WarMenu.MenuButton('Refuser', 'carRental') then
			end
			
			WarMenu.Display()
		
		--[[Tutuklama kontrol menüsü ICI
		elseif WarMenu.IsMenuOpened('arrestCheck') then
			if WarMenu.Button('Confirmer') then
				isBeingCharged = false
				damageInsurance = false
				--damageCharge = false
				arrestCheckAlreadyRan = true
				ESX.ShowNotification('Kiralamanız iptal edildi')
				WarMenu.CloseMenu()
			elseif WarMenu.Button('Refuser') then
				WarMenu.CloseMenu()
				arrestCheckAlreadyRan = true
			end
			
			WarMenu.Display()]]--ICI
			
		--elseif IsControlJustReleased(0, 48) then
		--	WarMenu.OpenMenu('carRental')
		--end
		end
		


		
		Citizen.Wait(0)
	end
	
	
end)
--[[Blips
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if not isBlipCreated then 
			for _, v in pairs(pickupStation) do
				pickupBlip = AddBlipForCoord(v.x, v.y, v.z)
      			SetBlipSprite(pickupBlip, 523)
      			SetBlipDisplay(pickupBlip, 4)
      			SetBlipScale(pickupBlip, 1.2)
      			SetBlipColour(pickupBlip, 49)
      			SetBlipAsShortRange(pickupBlip, true)
	  			BeginTextCommandSetBlipName("STRING")
      			AddTextComponentString("Location de véhicules")
      			EndTextCommandSetBlipName(pickupBlip)
			end
		--	for _, v in pairs(dropoffStation) do
			--	pickupBlip = AddBlipForCoord(v.x, v.y, v.z)
      		--	SetBlipSprite(pickupBlip, 85)
      		--	SetBlipDisplay(pickupBlip, 4)
      		--	SetBlipScale(pickupBlip, 0.60)
      		--	SetBlipColour(pickupBlip, 1)
      		--	SetBlipAsShortRange(pickupBlip, true)
	  		--	BeginTextCommandSetBlipName("STRING")
      		--	AddTextComponentString("K.Araç Teslimat")
      		--	EndTextCommandSetBlipName(pickupBlip)
		--	end
			isBlipCreated = true
		else
		end
	end
end)]]

-- Kordinatlar
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for _, v in pairs(pickupStation) do
			DrawMarker(36, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.75, 1.75, 1.75, 0, 204, 0, 100, false, true, 2, false, false, false, false)
			--{title="Car Rental", colour=2, id=85, x=v.x, y=v.y, z=v.z, scale=0.75}
		end
		for _, v in pairs(dropoffStation) do
			DrawMarker(1, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.75, 3.75, 1.50, 255, 0, 0, 10, false, true, 2, false, false, false, false)
		end
	end
end)

-- Oynatıcının işaretleyicide olup olmadıgını kontrol edin
Citizen.CreateThread(function()
	while true do
		local HasAlreadyEnteredMarker = false
		Citizen.Wait(0)
		
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker = false
		local isInReturnMarker = false
		
		for _, v in pairs(pickupStation) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.75) then
				isInMarker = true
			end
		end
		
		for _, v in pairs(dropoffStation) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 2.75) then
				isInReturnMarker = true
			end
		end
		
		if (isInReturnMarker and not WarMenu.IsMenuOpened('carReturn')) then
			local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
			local platenum = math.random(100, 900)
			if plate == " LOC "..platenum then
				WarMenu.OpenMenu('carReturn')
			end
		end
		
		if (not isInReturnMarker and not devMode and not isInMarker) then
			Citizen.Wait(100)
			WarMenu.CloseMenu()
		end
		
		if (isInMarker and not WarMenu.IsMenuOpened('carRental') and not WarMenu.IsMenuOpened('carPicker') and not WarMenu.IsMenuOpened('closeMenu') and not WarMenu.IsMenuOpened('carInsurance') and not WarMenu.IsMenuOpened('arrestCheck')) then
			WarMenu.OpenMenu('carRental')
		end
		
		if (not isInMarker and not devMode and not isInReturnMarker) then
			Citizen.Wait(100)
			WarMenu.CloseMenu()
		end
	end
end)

--[[ Araç hasar aldıgında ödenecek tutar ve bildiri
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local currentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local plate = GetVehicleNumberPlateText(currentVehicle)
		if plate == " RENTAL " then
			if (IsVehicleDamaged(currentVehicle) and damageInsurance == false and damageCharge == false and canBeCharged == true) then
				damageCharge = true
				TriggerServerEvent("chargePlayer", 500)
				ESX.ShowNotification("Araca hasar verdiğin için 500$ borçlandın sigortan varsa şirket karşılar")
			elseif (damageInsurance == true and IsVehicleDamaged(currentVehicle) and damageCharge == false) then
				ESX.ShowNotification("Araca zarar verdiniz ancak sigorta nedeniyle sizden ücret alınmayacak")
				damageCharge = true
			end
		end
	end
end)]]
			

-- Araç gecikme ücret Bildiri dakika/saniye 
--Citizen.CreateThread(function()
	--while true do
	--	Citizen.Wait(rentalTimer*60*330000)
	--	if isBeingCharged == true then
	--		TriggerServerEvent("chargePlayer", autoChargeAmount)
	--		ESX.ShowNotification("Araç süresi gecikti ve $" .. autoChargeAmount .. " ücreti alındı kesintiyi durdurmak için teslim edin")
	--	end
	--end
--end)

-- Araç çıkarma betiği
function SpawnVehicle(request)
			local hash = GetHashKey(request)

			RequestModel(hash)

			while not HasModelLoaded(hash) do
				RequestModel(hash)
				Citizen.Wait(0)
			end

			local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
			local vehicle = CreateVehicle(hash, x - 15 , y - 12, z + 1, 33.38, true, false)
			SetVehicleDoorsLocked(vehicle, 1)
			local platenum = math.random(100, 900)
			SetVehicleNumberPlateText(vehicle, "LOC ".. platenum)
			 TriggerServerEvent('esx_vehiclelock:givekey', GetPlayerServerId())
			canBeCharged = true
			arrestCheckAlreadyRan = false
			isInPrison = false
			TaskWarpPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
	--		 TriggerServerEvent('esx_vehiclelock:givekey', GetPlayerServerId(), vehicle) -- TEST
end

-- Araç betiği
function returnVehicle()
			isBeingCharged = false
			damageInsurance = false
		--	damageCharge = false
			ESX.ShowNotification("A une prochaine fois.")
			local currentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			SetEntityAsMissionEntity(currentVehicle, true, true)
			local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
			SetEntityCoords(GetPlayerPed(-1), x - 2, y, z)
			DeleteVehicle(currentVehicle)
end


-- Cezaevi kontrol komut dosyası
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		if(GetDistanceBetweenCoords(coords, 1677.2429199219, 2658.6179199219, 44.560031890869, true) < 2.75 and isInPrison == false) then
			isInPrison = true
			ESX.ShowNotification("Kayıtlarımız şuanda cezaevinde olduğunu gösteriyor")
			ESX.ShowNotification("Kirayı iptal etme özgürlüğünü aldık")
			isBeingCharged = false
			damageInsurance = false
		--	damageCharge = false
		end
	end
end)

						