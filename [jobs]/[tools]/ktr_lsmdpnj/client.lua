onJob = 0
local player = PlayerId()

-- Configure the coordinates where the lsmd cabs should be placed.
--local cabs = {
  -- { hash=0xC703DB5F, x=918.592, y=-166.732, z=74.250, a=100.938 },
   --{ hash=0xC703DB5F, x=917.207, y=-171.100, z=74.489, a=85.422 },
  --}

	-- Configure the coordinates where the lsmd cabs should be placed.
--local peds = {
  --{type=4, hash=0xe52e126c, x=894.422, y=-182.196, z=74.700, a=269.449},
  --{type=4, hash=0xe52e126c, x=895.422, y=-180.234, z=74.700, a=260.402},
  --{type=4, hash=0xe52e126c, x=900.742, y=-174.138, z=73.936, a=265.213},
 -- }

AddEventHandler('onClientMapStart', function()
RequestModel(0xC703DB5F)
while not HasModelLoaded(0xC703DB5F) do
	Wait(10)
end

RequestModel(0xe52e126c)
while not HasModelLoaded(0xe52e126c) do
	Wait(10)
end

-- Set a blip on the map for Downtown Cab
--downtownc = AddBlipForCoord(900.461, -181.466, 73.89)
--SetBlipSprite(downtownc, 50)
--SetBlipDisplay(downtownc, 3)
--SetBlipNameFromTextFile(downtownc, "TXM_BLIP")

-- Spawn the lsmd cab to DownTown Cab
--for _, item in pairs(cabs) do
	--cab =  CreateVehicle(item.hash, item.x, item.y, item.z, item.a, false, false)
	--SetVehicleOnGroundProperly(cab)
--end

--[[Spawn the gang members to the coordinates (testing)
for _, item in pairs(peds) do
	ped = CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
	GiveWeaponToPed(ped, 0x1B06D571, 2800, false, true)
	SetPedCombatAttributes(ped, 46, true)
	SetPedFleeAttributes(ped, 0, 0)
	SetPedArmour(ped, 100)
	SetPedMaxHealth(ped, 100)
	SetPedRelationshipGroupHash(ped, GetHashKey("GANG_1"))
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GUARD_STAND_PATROL", 0, true)
	SetPedCanRagdoll(ped, false)
	SetPedDiesWhenInjured(ped, false)
	end]]

end)

jobs = {peds = {}, flag = {}, blip = {}, cars = {}, coords = {cx={}, cy={}, cz={}}}

function StartJob(jobid)
	if jobid == 1 then -- lsmd
		showLoadingPromt("Chargement des missions LSMD", 2000, 3)
		jobs.coords.cx[1],jobs.coords.cy[1],jobs.coords.cz[1] = 295.86, -582.59, 42.15
		jobs.coords.cx[2],jobs.coords.cy[2],jobs.coords.cz[2] = 295.86, -582.59, 42.15
		jobs.coords.cx[3],jobs.coords.cy[3],jobs.coords.cz[3] = 295.86, -582.59, 42.15
		
		
		jobs.coords.cx[6],jobs.coords.cy[6],jobs.coords.cz[6] = 295.86, -582.59, 42.15
		jobs.coords.cx[7],jobs.coords.cy[7],jobs.coords.cz[7] = 295.86, -582.59, 42.15
		jobs.coords.cx[8],jobs.coords.cy[8],jobs.coords.cz[8] = 295.86, -582.59, 42.15
		jobs.coords.cx[9],jobs.coords.cy[9],jobs.coords.cz[9] = 295.86, -582.59, 42.15
		jobs.coords.cx[10],jobs.coords.cy[10],jobs.coords.cz[10] = 295.86, -582.59, 42.15
		jobs.coords.cx[11],jobs.coords.cy[11],jobs.coords.cz[11] = 295.86, -582.59, 42.15
		jobs.coords.cx[12],jobs.coords.cy[12],jobs.coords.cz[12] = 295.86, -582.59, 42.15
		jobs.coords.cx[13],jobs.coords.cy[13],jobs.coords.cz[13] = 295.86, -582.59, 42.15
		jobs.coords.cx[14],jobs.coords.cy[14],jobs.coords.cz[14] = 295.86, -582.59, 42.15
		jobs.coords.cx[15],jobs.coords.cy[15],jobs.coords.cz[15] = 295.86, -582.59, 42.15
		jobs.coords.cx[16],jobs.coords.cy[16],jobs.coords.cz[16] = 295.86, -582.59, 42.15
		jobs.coords.cx[17],jobs.coords.cy[17],jobs.coords.cz[17] = 295.86, -582.59, 42.15
		jobs.coords.cx[18],jobs.coords.cy[18],jobs.coords.cz[18] = 295.86, -582.59, 42.15
		jobs.coords.cx[19],jobs.coords.cy[19],jobs.coords.cz[19] = 295.86, -582.59, 42.15
		jobs.coords.cx[20],jobs.coords.cy[20],jobs.coords.cz[20] = 295.86, -582.59, 42.15
		jobs.coords.cx[21],jobs.coords.cy[21],jobs.coords.cz[21] = 295.86, -582.59, 42.15
		jobs.coords.cx[22],jobs.coords.cy[22],jobs.coords.cz[22] = 295.86, -582.59, 42.15
		jobs.coords.cx[23],jobs.coords.cy[23],jobs.coords.cz[23] = 295.86, -582.59, 42.15
		jobs.coords.cx[24],jobs.coords.cy[24],jobs.coords.cz[24] = 295.86, -582.59, 42.15
		jobs.coords.cx[25],jobs.coords.cy[25],jobs.coords.cz[25] = 295.86, -582.59, 42.15
		jobs.coords.cx[26],jobs.coords.cy[26],jobs.coords.cz[26] = 295.86, -582.59, 42.15
		jobs.coords.cx[27],jobs.coords.cy[27],jobs.coords.cz[27] = 295.86, -582.59, 42.15
		jobs.coords.cx[28],jobs.coords.cy[28],jobs.coords.cz[28] = 295.86, -582.59, 42.15
		jobs.coords.cx[29],jobs.coords.cy[29],jobs.coords.cz[29] = 295.86, -582.59, 42.15
		jobs.coords.cx[30],jobs.coords.cy[30],jobs.coords.cz[30] = 295.86, -582.59, 42.15
		jobs.coords.cx[31],jobs.coords.cy[31],jobs.coords.cz[31] = 295.86, -582.59, 42.15
		jobs.coords.cx[32],jobs.coords.cy[32],jobs.coords.cz[32] = 295.86, -582.59, 42.15
		jobs.coords.cx[33],jobs.coords.cy[33],jobs.coords.cz[33] = 295.86, -582.59, 42.15
		jobs.coords.cx[34],jobs.coords.cy[34],jobs.coords.cz[34] = 295.86, -582.59, 42.15
		jobs.coords.cx[35],jobs.coords.cy[35],jobs.coords.cz[35] = 295.86, -582.59, 42.15
		jobs.coords.cx[36],jobs.coords.cy[36],jobs.coords.cz[36] = 295.86, -582.59, 42.15
		jobs.coords.cx[37],jobs.coords.cy[37],jobs.coords.cz[37] = 295.86, -582.59, 42.15
		jobs.coords.cx[38],jobs.coords.cy[38],jobs.coords.cz[38] = 295.86, -582.59, 42.15
		jobs.coords.cx[39],jobs.coords.cy[39],jobs.coords.cz[39] = 295.86, -582.59, 42.15
		jobs.coords.cx[40],jobs.coords.cy[40],jobs.coords.cz[40] = 295.86, -582.59, 42.15
		jobs.coords.cx[41],jobs.coords.cy[41],jobs.coords.cz[41] = 295.86, -582.59, 42.15
		jobs.coords.cx[42],jobs.coords.cy[42],jobs.coords.cz[42] = 295.86, -582.59, 42.15
		jobs.coords.cx[43],jobs.coords.cy[43],jobs.coords.cz[43] = 295.86, -582.59, 42.15
		jobs.coords.cx[44],jobs.coords.cy[44],jobs.coords.cz[44] = 295.86, -582.59, 42.15
		jobs.coords.cx[45],jobs.coords.cy[45],jobs.coords.cz[45] = 295.86, -582.59, 42.15
		jobs.coords.cx[46],jobs.coords.cy[46],jobs.coords.cz[46] = 295.86, -582.59, 42.15
		jobs.coords.cx[47],jobs.coords.cy[47],jobs.coords.cz[47] = 295.86, -582.59, 42.15
		jobs.coords.cx[48],jobs.coords.cy[48],jobs.coords.cz[48] = 295.86, -582.59, 42.15
		jobs.coords.cx[49],jobs.coords.cy[49],jobs.coords.cz[49] = 295.86, -582.59, 42.15
		jobs.coords.cx[50],jobs.coords.cy[50],jobs.coords.cz[50] = 295.86, -582.59, 42.15
		jobs.coords.cx[51],jobs.coords.cy[51],jobs.coords.cz[51] = 295.86, -582.59, 42.15
		jobs.coords.cx[52],jobs.coords.cy[52],jobs.coords.cz[52] = 295.86, -582.59, 42.15
		jobs.coords.cx[53],jobs.coords.cy[53],jobs.coords.cz[53] = 295.86, -582.59, 42.15
		jobs.coords.cx[54],jobs.coords.cy[54],jobs.coords.cz[54] = 295.86, -582.59, 42.15
		jobs.coords.cx[55],jobs.coords.cy[55],jobs.coords.cz[55] = 295.86, -582.59, 42.15
		jobs.coords.cx[56],jobs.coords.cy[56],jobs.coords.cz[56] = 295.86, -582.59, 42.15
		jobs.coords.cx[57],jobs.coords.cy[57],jobs.coords.cz[57] = 295.86, -582.59, 42.15
		jobs.coords.cx[58],jobs.coords.cy[58],jobs.coords.cz[58] = 295.86, -582.59, 42.15
		jobs.coords.cx[59],jobs.coords.cy[59],jobs.coords.cz[59] = 295.86, -582.59, 42.15
		jobs.coords.cx[60],jobs.coords.cy[60],jobs.coords.cz[60] = 295.86, -582.59, 42.15
		jobs.coords.cx[61],jobs.coords.cy[61],jobs.coords.cz[61] = 295.86, -582.59, 42.15
		jobs.coords.cx[62],jobs.coords.cy[62],jobs.coords.cz[62] = 295.86, -582.59, 42.15
		jobs.coords.cx[63],jobs.coords.cy[63],jobs.coords.cz[63] = 295.86, -582.59, 42.15
		jobs.coords.cx[64],jobs.coords.cy[64],jobs.coords.cz[64] = 295.86, -582.59, 42.15
		jobs.coords.cx[65],jobs.coords.cy[65],jobs.coords.cz[65] = 295.86, -582.59, 42.15
		jobs.coords.cx[66],jobs.coords.cy[66],jobs.coords.cz[66] = 295.86, -582.59, 42.15
		jobs.coords.cx[67],jobs.coords.cy[67],jobs.coords.cz[67] = 295.86, -582.59, 42.15
		jobs.coords.cx[68],jobs.coords.cy[68],jobs.coords.cz[68] = 295.86, -582.59, 42.15
		jobs.coords.cx[69],jobs.coords.cy[69],jobs.coords.cz[69] = 295.86, -582.59, 42.15
		jobs.coords.cx[70],jobs.coords.cy[70],jobs.coords.cz[70] = 295.86, -582.59, 42.15
		jobs.coords.cx[71],jobs.coords.cy[71],jobs.coords.cz[71] = 295.86, -582.59, 42.15
		jobs.coords.cx[72],jobs.coords.cy[72],jobs.coords.cz[72] = 295.86, -582.59, 42.15
		jobs.coords.cx[73],jobs.coords.cy[73],jobs.coords.cz[73] = 295.86, -582.59, 42.15
		jobs.coords.cx[74],jobs.coords.cy[74],jobs.coords.cz[74] = 295.86, -582.59, 42.15
		jobs.coords.cx[75],jobs.coords.cy[75],jobs.coords.cz[75] = 295.86, -582.59, 42.15
		jobs.coords.cx[76],jobs.coords.cy[76],jobs.coords.cz[76] = 295.86, -582.59, 42.15
		jobs.coords.cx[77],jobs.coords.cy[77],jobs.coords.cz[77] = 295.86, -582.59, 42.15
		jobs.coords.cx[78],jobs.coords.cy[78],jobs.coords.cz[78] = 295.86, -582.59, 42.15
		jobs.coords.cx[79],jobs.coords.cy[79],jobs.coords.cz[79] = 295.86, -582.59, 42.15
		jobs.coords.cx[80],jobs.coords.cy[80],jobs.coords.cz[80] = 295.86, -582.59, 42.15
		jobs.coords.cx[81],jobs.coords.cy[81],jobs.coords.cz[81] = 295.86, -582.59, 42.15
		jobs.coords.cx[82],jobs.coords.cy[82],jobs.coords.cz[82] = 295.86, -582.59, 42.15
		jobs.coords.cx[83],jobs.coords.cy[83],jobs.coords.cz[83] = 295.86, -582.59, 42.15
		jobs.coords.cx[84],jobs.coords.cy[84],jobs.coords.cz[84] = 295.86, -582.59, 42.15
		jobs.coords.cx[85],jobs.coords.cy[85],jobs.coords.cz[85] = 295.86, -582.59, 42.15
		jobs.coords.cx[86],jobs.coords.cy[86],jobs.coords.cz[86] = 295.86, -582.59, 42.15
		jobs.coords.cx[87],jobs.coords.cy[87],jobs.coords.cz[87] = 295.86, -582.59, 42.15
		jobs.coords.cx[88],jobs.coords.cy[88],jobs.coords.cz[88] = 295.86, -582.59, 42.15
		jobs.coords.cx[89],jobs.coords.cy[89],jobs.coords.cz[89] = 295.86, -582.59, 42.15
		jobs.coords.cx[90],jobs.coords.cy[90],jobs.coords.cz[90] = 295.86, -582.59, 42.15
		jobs.coords.cx[91],jobs.coords.cy[91],jobs.coords.cz[91] = 295.86, -582.59, 42.15
		jobs.coords.cx[92],jobs.coords.cy[92],jobs.coords.cz[92] = 295.86, -582.59, 42.15

		jobs.cars[1] = GetVehiclePedIsUsing(GetPlayerPed(-1))
		jobs.flag[1] = 0
		jobs.flag[2] = GetRandomIntInRange(1, 60)
		Wait(2000)
		DrawMissionText("Faites un tour pour trouver un ~h~~y~Blessé~w~.", 10000)
		onJob = jobid
	end
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function DrawMissionText(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function showLoadingPromt(showText, showTime, showType)
	Citizen.CreateThread(function()
		Citizen.Wait(0)
		N_0xaba17d7ce615adbf("STRING") -- set type
		AddTextComponentString(showText) -- sets the text
		N_0xbd12f8228410d9b4(showType) -- show promt (types = 3)
		Citizen.Wait(showTime) -- show time
		N_0x10d373323e5b9c0d() -- remove promt
	end)
end

function StopJob(jobid)
	if jobid == 1 then
		if DoesEntityExist(jobs.peds[1]) then
			local pedb = GetBlipFromEntity(jobs.peds[1])
			if pedb ~= nil and DoesBlipExist(pedb) then
				SetBlipSprite(pedb, 2)
				SetBlipDisplay(pedb, 3)
			end
			ClearPedTasks(ped)
			if DoesEntityExist(jobs.cars[1]) and IsVehicleDriveable(jobs.cars[1], 0) then
				if IsPedSittingInVehicle(jobs.peds[1], jobs.cars[1]) then
					TaskLeaveVehicle(jobs.peds[1], jobs.cars[1], 0)
				end
			end
			Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(jobs.peds[1]))
		end
		if jobs.blip[1] ~= nil and DoesBlipExist(jobs.blip[1]) then
			Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(jobs.blip[1]))
			jobs.blip[1] = nil
		end
		onJob = 0
		jobs.cars[1] = nil
		jobs.peds[1] = nil
		jobs.flag[1] = nil
		jobs.flag[2] = nil
	end
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if onJob == 0 then
			if IsControlJustPressed(1, 214) or IsDisabledControlJustPressed(1, 214) then -- DEL
				if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
					if IsVehicleModel(GetVehiclePedIsUsing(GetPlayerPed(-1)), GetHashKey("ambulance", _r)) then
						StartJob(1)
					end
				end
			end
		elseif onJob == 1 then
			if DoesEntityExist(jobs.cars[1]) and IsVehicleDriveable(jobs.cars[1], 0) then
				if IsPedSittingInVehicle(GetPlayerPed(-1), jobs.cars[1]) then
					if DoesEntityExist(jobs.peds[1]) then
						if IsPedFatallyInjured(jobs.peds[1]) then
							Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(jobs.peds[1]))
							local pedb = GetBlipFromEntity(jobs.peds[1])
							if pedb ~= nil and DoesBlipExist(pedb) then
								SetBlipSprite(pedb, 2)
								SetBlipDisplay(pedb, 3)
							end
							jobs.peds[1] = nil
							jobs.flag[1] = 0
							jobs.flag[2] = 8+GetRandomIntInRange(1, 60)
							if jobs.blip[1] ~= nil and DoesBlipExist(jobs.blip[1]) then
								Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(jobs.blip[1]))
								jobs.blip[1] = nil
							end
							DrawMissionText("Le Blessé est ~r~mort~w~. Trouvez en un autre.", 5000)
						else
							if jobs.flag[1] == 1 and jobs.flag[2] > 0 then
								Wait(1000)
								jobs.flag[2] = jobs.flag[2]-1
								if jobs.flag[2] == 0 then
									local pedb = GetBlipFromEntity(jobs.peds[1])
									if pedb ~= nil and DoesBlipExist(pedb) then
										SetBlipSprite(pedb, 2)
										SetBlipDisplay(pedb, 3)
									end
									ClearPedTasks(ped)
									Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(jobs.peds[1]))
									jobs.peds[1] = nil
									DrawMissionText("Le Blessé est ~r~mort~w~. Trouvez en un autre.", 5000)
									jobs.flag[1] = 0
									jobs.flag[2] = 8+GetRandomIntInRange(1, 60)
								else
									if IsPedSittingInVehicle(GetPlayerPed(-1), jobs.cars[1]) then
										if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(jobs.peds[1]), true) < 8.0001 then
											local offs = GetOffsetFromEntityInWorldCoords(GetVehiclePedIsUsing(GetPlayerPed(-1)), 1.5, 0.0, 0.0)
											local offs2 = GetOffsetFromEntityInWorldCoords(GetVehiclePedIsUsing(GetPlayerPed(-1)), -1.5, 0.0, 0.0)
											if GetDistanceBetweenCoords(offs['x'], offs['y'], offs['z'], GetEntityCoords(jobs.peds[1]), true) < GetDistanceBetweenCoords(offs2['x'], offs2['y'], offs2['z'], GetEntityCoords(jobs.peds[1]), true) then
												TaskEnterVehicle(jobs.peds[1], jobs.cars[1], -1, 2, 2.0001, 1)
											else
												TaskEnterVehicle(jobs.peds[1], jobs.cars[1], -1, 1, 2.0001, 1)
											end
											jobs.flag[1] = 2
											jobs.flag[2] = 30
										end
									end
								end
							end
							if jobs.flag[1] == 2 and jobs.flag[2] > 0 then
								Wait(1000)
								jobs.flag[2] = jobs.flag[2]-1
								if jobs.flag[2] == 0 then
									local pedb = GetBlipFromEntity(jobs.peds[1])
									if pedb ~= nil and DoesBlipExist(pedb) then
										SetBlipSprite(pedb, 2)
										SetBlipDisplay(pedb, 3)
									end
									ClearPedTasks(ped)
									Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(jobs.peds[1]))
									jobs.peds[1] = nil
									DrawMissionText("Le Blessé est ~r~mort~w~. Trouvez en un autre.", 5000)
									jobs.flag[1] = 0
									jobs.flag[2] = 8+GetRandomIntInRange(1, 60)
								else
									if IsPedSittingInVehicle(jobs.peds[1], jobs.cars[1]) then
										local pedb = GetBlipFromEntity(jobs.peds[1])
										if pedb ~= nil and DoesBlipExist(pedb) then
											SetBlipSprite(pedb, 2)
											SetBlipDisplay(pedb, 3)
										end
										jobs.flag[1] = 3
										jobs.flag[2] = 8+GetRandomIntInRange(1, 60)
										local street = table.pack(GetStreetNameAtCoord(jobs.coords.cx[jobs.flag[2]],jobs.coords.cy[jobs.flag[2]],jobs.coords.cz[jobs.flag[2]]))
										if street[2] ~= 0 and street[2] ~= nil then
											local streetname = string.format("~w~Emmenez le blessé à ~y~ %s~w~, proche de ~y~ %s", GetStreetNameFromHashKey(street[1]),GetStreetNameFromHashKey(street[2]))
											DrawMissionText(streetname, 5000)
										else
											local streetname = string.format("~w~Emmenez le blessé à ~y~ %s", GetStreetNameFromHashKey(street[1]))
											DrawMissionText(streetname, 5000)
										end
										jobs.blip[1] = AddBlipForCoord(jobs.coords.cx[jobs.flag[2]],jobs.coords.cy[jobs.flag[2]],jobs.coords.cz[jobs.flag[2]])
										AddTextComponentString(GetStreetNameFromHashKey(street[1]))
										N_0x80ead8e2e1d5d52e(jobs.blip[1])
										SetBlipRoute(jobs.blip[1], 1)
									end
								end
							end
							if jobs.flag[1] == 3 then
								if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), jobs.coords.cx[jobs.flag[2]],jobs.coords.cy[jobs.flag[2]],jobs.coords.cz[jobs.flag[2]], true) > 4.0001 then
									DrawMarker(1, jobs.coords.cx[jobs.flag[2]],jobs.coords.cy[jobs.flag[2]],jobs.coords.cz[jobs.flag[2]]-1.0001, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
								else
									if jobs.blip[1] ~= nil and DoesBlipExist(jobs.blip[1]) then
										Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(jobs.blip[1]))
										jobs.blip[1] = nil
									end
									ClearPedTasks(ped)
									TaskLeaveVehicle(jobs.peds[1], jobs.cars[1], 0)
									Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(jobs.peds[1]))
									jobs.peds[1] = nil
									Wait(6000)

                  TriggerServerEvent('lsmd:success')
                  DrawMissionText("~g~Le blessé est bien arrivé !", 5000)
									-- pay money on something
									Wait(8000)
									DrawMissionText("Faites un tour pour trouver un nouveau ~h~~y~malade~w~.", 10000)
									jobs.flag[1] = 0
									jobs.flag[2] = 8+GetRandomIntInRange(1, 60)
								end
							end
						end
					else

						if jobs.flag[1] > 0 then
							jobs.flag[1] = 0
							jobs.flag[2] = 8+GetRandomIntInRange(1, 60)
							DrawMissionText("Faites un tour pour trouver un ~h~~y~malade~w~.", 10000)
							if jobs.blip[1] ~= nil and DoesBlipExist(jobs.blip[1]) then
								Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(jobs.blip[1]))
								jobs.blip[1] = nil
							end
						end
						if jobs.flag[1] == 0 and jobs.flag[2] > 0 then
							Wait(1000)
							jobs.flag[2] = jobs.flag[2]-1
							if jobs.flag[2] == 0 then
								local pos = GetEntityCoords(GetPlayerPed(-1))
								local rped = GetRandomPedAtCoord(pos['x'], pos['y'], pos['z'], 35.001, 35.001, 35.001, 6, _r)
								if DoesEntityExist(rped) then
									jobs.peds[1] = rped
									jobs.flag[1] = 1
									jobs.flag[2] = 8+GetRandomIntInRange(1, 60)
									ClearPedTasks(ped)
									SetBlockingOfNonTemporaryEvents(jobs.peds[1], 1)
									TaskStandStill(jobs.peds[1], 1000*jobs.flag[2])
									DrawMissionText("Le ~g~malade~w~ vous attend. Allez-y", 5000)
									local lblip = AddBlipForEntity(jobs.peds[1])
									SetBlipAsFriendly(lblip, 1)
									SetBlipColour(lblip, 2)
									SetBlipCategory(lblip, 3)
								else
									jobs.flag[1] = 0
									jobs.flag[2] = 8+GetRandomIntInRange(1, 60)
									DrawMissionText("Faites un tour pour trouver un ~h~~y~blessé~w~.", 10000)
								end
							end
						end
					end
				else
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(jobs.cars[1]), true) > 30.0001 then
						StopJob(1)
					else
						DrawMissionText("Retournez dans votre véhicule pour ~y~continuer~w~. ou laissez-le la pour ~r~arreter~ les missions.", 1)
					end
				end
			else
				StopJob(1)
				DrawMissionText("Le véhicule a ete ~h~~r~detruit~w~.", 5000)
			end
		end
	end
end)
