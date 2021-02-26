--- MULTIPLICATORS ---
m_x = 0.05 -- x location to list multiplicators | default: 0.05
m_y = 0.24 -- y location to list multiplicators | default: 0.24

m_y_add = 0.032 -- y to add per multiplicator | default: 0.01

m_r = 255 -- r color to list multiplicators | default: 255
m_g = 100 -- g color to list multiplicators | default: 100
m_b = 100 -- b color to list multiplicators | default: 100

m_opacity = 255 -- opacity to list multiplicators | default: 255
m_font = 4 -- font to list multiplicators | default: 4
m_size = 0.6 -- size to list multiplicators | default: 0.6

m_symbol = "•" -- symbol to list multiplicators | default: "•"

--- REFILL ---
r_empty = true -- refill when empty | default: true
r_burnout = true -- refill when doing burnout | multiplicator | default: true
r_drift = true -- refill when drifting | multiplicator | default: true
r_purge = true -- refill when purging | multiplicator | default: true
r_notdriving = false -- refill when standing still | default: true
r_fastdriving = true -- refill when driving fast | multiplicator | default: true
r_fastdriving_speed = 29.0 -- speed to count as fast driving | default: 29.0
r_notusing = false -- refill when not using nitro | default: true
r_flying = true -- refill when in air | multiplicator | default: true
r_flying_height = 2.0 -- height to count as flying | default: 2.0

--- HOTKEYS ---
k_nitro = 21 -- key to activate nitro | default: 21 (L-SHIFT)
k_purge = 36 -- key to activate purge | default: 36 (L-CTRL)
k_buy = 38 -- key to buy / refill nitro with nitro-coins | default: 38 (E)
k_buy_name = "~INPUT_CONTEXT~" -- key to buy / refill nitro with nitro-coins | default: "~INPUT_CONTEXT~" (E)

--- PARTICLES ---
p_flame_location = {
	"exhaust",
	"exhaust_2",
} -- vehicle bones for flames
p_flame_particle = "veh_backfire" -- particle name | default: "veh_backfire"
p_flame_particle_asset = "core" -- particle category | default: "core"
p_flame_size = 2.0 -- size of the flames | default: 2.0

p_purge_location = {
	"overheat",
} -- vehicle bones for purge
p_purge_particle = "ent_sht_steam" -- particle name | default: "ent_sht_steam"
p_purge_particle_asset = "core" -- particle category | default: "core"
p_purge_size = 0.4 -- size of the purge | default: 0.4

--- EFFECTS ---
e_indicators = true -- enable indicators (left and right) on nitro | default: true
e_flames = true -- enable flames on nitro | default: true
e_purge = false -- enable purge on nitro | default: false
e_sound = true -- enable sound on nitro | default: true

--- NITRO ---
n_boost = 15.0 -- boost on nitro | default: 15.0

n_x = 0.05 -- x location to show nitro | default: 0.05
n_y = 0.2 -- y location to show nitro | default: 0.2

n_r = 82 -- r color to show nitro | default: 82
n_g = 219 -- g color to show nitro | default: 219
n_b = 255 -- b color to show nitro | default: 255

n_opacity = 255 -- opacity to show nitro | default: 255
n_font = 4 -- font to show nitro | default: 4
n_size = 0.8 -- size to show nitro | default: 0.8

--- NITRO COINS ---
c_use = true -- use nitro coins | default: true
c_symbol = "N¶" -- symbol for nitro coins | default: "N¶"
c_prize_buy = 300 -- price to add nitro to your car | default: 300
c_prize_refill = 100 -- price to refill nitro in your car | default: 100
c_earn_burnout = false -- earn nitro coins by doing burnouts | default: false
c_earn_drift = true -- earn nitro coins by drifting | default: true
c_earn_fastdriving = false -- earn nitro coins by driving fast | default: false
c_earn_purge = false -- earn nitro coins by purging | default: false
c_earn_fly = true -- earn nitro coins when flying | default: true

c_x = 0.05 -- x location to show nitro coins | default: 0.05
c_y = 0.16 -- y location to show nitro coins | default: 0.2

c_r = 218 -- r color to show nitro coins | default: 218
c_g = 165 -- g color to show nitro coins | default: 165
c_b = 32 -- b color to show nitro coins | default: 32

c_opacity = 255 -- opacity to show nitro coins | default: 255
c_font = 4 -- font to show nitro coins | default: 4
c_size = 0.8 -- size to show nitro coins | default: 0.8

--- VEHICLES ---
v_blacklisted = {
	"raiden",
	"rhino",
	"surge"
} -- vehicles that are not allowed to have nitro
v_whiteorblack = "black" -- use c_blacklisted as black or whitelist? | default: "white"
						 -- "black" = vehicles in v_blacklisted cannot have nitro
						 -- "white" = only vehicles in v_blacklisted can have nitro

--- MAP ---
m_blipcolor = 78 -- color of the gas station blips | default: 78
m_blips = true -- enable / disable blips | default: true

--- COMMANDS ---
c_suggestion = true -- enable / disable suggestions | default: true
c_suggestion_pay = true -- enable / disable suggestion for /nitro pay (if you disabled the command in the server.lua) | default: true

--- END OF CONFIGURATION ---

--- FUNCTIONS ---

function round(num, numDecimalPlaces)
  if numDecimalPlaces and numDecimalPlaces>0 then
    local mult = 10^numDecimalPlaces
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function angle(veh)
    if not veh then return false end
    local vx,vy,vz = table.unpack(GetEntityVelocity(veh))
    local modV = math.sqrt(vx*vx + vy*vy)
    
    
    local rx,ry,rz = table.unpack(GetEntityRotation(veh,0))
    local sn,cs = -math.sin(math.rad(rz)), math.cos(math.rad(rz))
    
    if GetEntitySpeed(veh)* 3.6 < 5 or GetVehicleCurrentGear(veh) == 0 then return 0,modV end --speed over 30 km/h
    
    local cosX = (sn*vx + cs*vy)/modV
    if cosX > 0.966 or cosX < 0 then return 0,modV end
    return math.deg(math.acos(cosX))*0.5, modV
end

function ShowNotification(text)
	if c_use == true then
		SetNotificationTextEntry("STRING")
		AddTextComponentString(string.gsub(text, "nmo", c_symbol))
		PlaySound(-1, "RACE_PLACED", "HUD_AWARDS", 0, 0, 1)
		DrawNotification(0,1)
	end
end

local stuffs = {1339433404,1694452750,1933174915,-2007231801,-469694731,-164877493,-462817101} -- GAS PUMP HASHES

local function find_objects(obj_list)
	player_pos = GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 1)
  	for i,obj in pairs(obj_list) do
  		local closest = GetClosestObjectOfType(player_pos.x, player_pos.y, player_pos.z, 10.0, obj, 1, 0, 0)
    	if tonumber(closest) > 0 then
      		return 1
    	end
  	end
end

--- ACTUAL CODE ---

local nitro_state = 100
local vehicles = {"spacer"}
local multiplicators = {"spacer"}
local coins = 0
local jtbs = 0
local isBlack = "none"
local hasNitro = false

TriggerServerEvent("imNew")

Citizen.CreateThread(function()
	while c_use == true do
		Wait(300000)
		if coins == jtbs then
			TriggerServerEvent("save_coins", coins)
		else
			TriggerServerEvent("sec_kick")
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(300)
		if IsPedInAnyVehicle(GetPlayerPed(-1), 0) then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
				vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
				vehicle_displayname = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
				for ind,vehs in pairs(v_blacklisted) do
					if string.lower(vehs) == string.lower(vehicle_displayname) then
						if v_whiteorblack == "white" then
							isBlack = "false"
							print(isBlack)
						else
							isBlack = "true"
							print(isBlack)
							for ind1,vehs1 in pairs(vehicles) do
								if string.lower(vehs1) == string.lower(vehicle_displayname) then
									table.remove(vehicles, ind1)
									ShowNotification("Nitro was removed from this vehicle, because it got added to the blacklist.")
									TriggerServerEvent("rem_vec", string.lower(vehicle_displayname))
									coins = coins + c_prize_buy
									jtbs = jtbs + c_prize_buy
									ShowNotification(c_prize_buy .. c_symbol .. " were gifted to you, because nitro got removed from your vehicle.")
									break
								end
							end
						end
						break
					end
					if ind == #v_blacklisted then
						if v_whiteorblack == "white" then
							isBlack = "true"
						else
							isBlack = "false"
						end
					end
				end
				for ind3,vehs3 in pairs(vehicles) do
					if string.lower(vehs3) == string.lower(vehicle_displayname) then
						hasNitro = true
						break
					else
						if c_use == true then
							hasNitro = false
						else
							hasNitro = true
						end
					end
				end
			else
				isBlack = "none"
			end
		else
			isBlack = "none"
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(5)
		vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
		vehicle_displayname = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
		car = GetVehiclePedIsUsing(GetPlayerPed(-1))
		ang,speed = angle(car)
		if c_use == true then
			SetTextColour(c_r, c_g, c_b, c_opacity)
			SetTextFont(c_font)
			SetTextScale(c_size, c_size)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")		
			AddTextComponentString(coins .. " " .. c_symbol)
			DrawText(c_x, c_y)
		end
		if hasNitro == true and isBlack == "false" then
			SetTextColour(n_r, n_g, n_b, n_opacity)
			SetTextFont(n_font)
			SetTextScale(n_size, n_size)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")		
			AddTextComponentString("Nitro: " .. round(nitro_state, 1) .. "%")
			DrawText(n_x, n_y)

			if speed >= 3.0 and ang ~= 0 and r_drift == true and not IsControlPressed(0, k_nitro) and GetEntityHeightAboveGround(vehicle) < 1.0 then
				local addition = 0
				for curr,element in pairs(multiplicators) do				
					if element == "drift" then
						addition = curr * m_y_add
						break
					else
						if curr == #multiplicators then
							table.insert(multiplicators, "drift")
							addition = curr * m_y_add
							break
						end
					end
				end
				SetTextColour(m_r, m_g, m_b, m_opacity)
				SetTextFont(m_font)
				SetTextScale(m_size, m_size)
				SetTextWrap(0.0, 1.0)
				SetTextCentre(false)
				SetTextDropshadow(2, 2, 0, 0, 0)
				SetTextEdge(1, 0, 0, 0, 205)
				SetTextEntry("STRING")		
				AddTextComponentString(m_symbol .. " Drifting")
				DrawText(m_x, m_y + addition - m_y_add - m_y_add)
			else
				for curr,element in pairs(multiplicators) do				
					if element == "drift" then
						table.remove(multiplicators, curr)
					end
				end
			end

			if IsControlPressed(0, k_purge) and r_purge == true and not IsControlPressed(0, k_nitro) then
				local addition = 0
				for curr,element in pairs(multiplicators) do				
					if element == "purge" then
						addition = curr * m_y_add
						break
					else
						if curr == #multiplicators then
							table.insert(multiplicators, "purge")
							addition = curr * m_y_add
							break
						end
					end
				end
				SetTextColour(m_r, m_g, m_b, m_opacity)
				SetTextFont(m_font)
				SetTextScale(m_size, m_size)
				SetTextWrap(0.0, 1.0)
				SetTextCentre(false)
				SetTextDropshadow(2, 2, 0, 0, 0)
				SetTextEdge(1, 0, 0, 0, 205)
				SetTextEntry("STRING")		
				AddTextComponentString(m_symbol .. " Purging")
				DrawText(m_x, m_y + addition - m_y_add - m_y_add)
			else
				for curr,element in pairs(multiplicators) do				
					if element == "purge" then
						table.remove(multiplicators, curr)
					end
				end
			end

			if speed < 1.0 and IsVehicleInBurnout(car) and r_burnout == true and not IsControlPressed(0, k_nitro) and GetEntityHeightAboveGround(vehicle) < 1.0 then
				local addition = 0
				for curr,element in pairs(multiplicators) do				
					if element == "burnout" then
						addition = curr * m_y_add
						break
					else
						if curr == #multiplicators then
							table.insert(multiplicators, "burnout")
							addition = curr * m_y_add
							break
						end
					end
				end
				SetTextColour(m_r, m_g, m_b, m_opacity)
				SetTextFont(m_font)
				SetTextScale(m_size, m_size)
				SetTextWrap(0.0, 1.0)
				SetTextCentre(false)
				SetTextDropshadow(2, 2, 0, 0, 0)
				SetTextEdge(1, 0, 0, 0, 205)
				SetTextEntry("STRING")		
				AddTextComponentString(m_symbol .. " Burnout")
				DrawText(m_x, m_y + addition - m_y_add - m_y_add)
			else
				for curr,element in pairs(multiplicators) do				
					if element == "burnout" then
						table.remove(multiplicators, curr)
					end
				end
        	end

        	if r_flying == true and not IsControlPressed(0, k_nitro) and GetEntityHeightAboveGround(vehicle) > r_flying_height then
        		local addition = 0
				for curr,element in pairs(multiplicators) do				
					if element == "flying" then
						addition = curr * m_y_add
						break
					else
						if curr == #multiplicators then
							table.insert(multiplicators, "flying")
							addition = curr * m_y_add
							break
						end
					end
				end
				SetTextColour(m_r, m_g, m_b, m_opacity)
				SetTextFont(m_font)
				SetTextScale(m_size, m_size)
				SetTextWrap(0.0, 1.0)
				SetTextCentre(false)
				SetTextDropshadow(2, 2, 0, 0, 0)
				SetTextEdge(1, 0, 0, 0, 205)
				SetTextEntry("STRING")		
				AddTextComponentString(m_symbol .. " Flying")
				DrawText(m_x, m_y + addition - m_y_add - m_y_add)
        	else
        		for curr,element in pairs(multiplicators) do				
					if element == "flying" then
						table.remove(multiplicators, curr)
					end
				end
        	end

        	if speed >= r_fastdriving_speed and r_fastdriving == true and not IsControlPressed(0, k_nitro) and GetEntityHeightAboveGround(vehicle) < 1.0 then
        		local addition = 0
				for curr,element in pairs(multiplicators) do				
					if element == "fastdriving" then
						addition = curr * m_y_add
						break
					else
						if curr == #multiplicators then
							table.insert(multiplicators, "fastdriving")
							addition = curr * m_y_add
							break
						end
					end
				end
				SetTextColour(m_r, m_g, m_b, m_opacity)
				SetTextFont(m_font)
				SetTextScale(m_size, m_size)
				SetTextWrap(0.0, 1.0)
				SetTextCentre(false)
				SetTextDropshadow(2, 2, 0, 0, 0)
				SetTextEdge(1, 0, 0, 0, 205)
				SetTextEntry("STRING")		
				AddTextComponentString(m_symbol .. " High Speed")
				DrawText(m_x, m_y + addition - m_y_add - m_y_add)
        	else
        		for curr,element in pairs(multiplicators) do				
					if element == "fastdriving" then
						table.remove(multiplicators, curr)
					end
				end
        	end	
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(50)
		if hasNitro == true and IsPedInAnyVehicle(GetPlayerPed(-1), 0) then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
				if IsControlPressed(0, k_nitro) then
	        		if nitro_state - 0.2 > 0 then
	       				SetVehicleEnginePowerMultiplier(vehicle, n_boost)
	       				SetVehicleEngineTorqueMultiplier(vehicle, n_boost)
	       				SetEntityMaxSpeed(vehicle, 999.0)
	       				nitro_state = nitro_state - 0.2
	       				if e_flames == true then     			
	        				TriggerServerEvent("eff_flames", VehToNet(vehicle))
	        			end
	        			if e_purge == true then
	        				TriggerServerEvent("eff_purge", VehToNet(vehicle))
	        			end
	        			if e_sound == true then
	        				TriggerServerEvent("eff_sound_start", VehToNet(vehicle))
	        			end
	       				if e_indicators == true then
	       					TriggerServerEvent("eff_indicator_start", VehToNet(vehicle))
	       				end
	       			else
	       				nitro_state = 0
	       				if e_indicators == true and isBLack == "false" then
	       					TriggerServerEvent("eff_indicator_stop", VehToNet(vehicle))	
	       				end
	       			end
	       		else
			        SetVehicleEnginePowerMultiplier(vehicle, 1.0)
			        SetVehicleEngineTorqueMultiplier(vehicle, 1.0)
			        if e_sound == true then
			        	TriggerServerEvent("eff_sound_stop", VehToNet(vehicle))
			        end
			        if e_indicators == true then
			       		TriggerServerEvent("eff_indicator_stop", VehToNet(vehicle))	
			       	end
	        	end
	        	if IsControlPressed(0, k_purge) and not IsControlPressed(0, k_nitro) then
	        		TriggerServerEvent("eff_purge", VehToNet(vehicle))
	        	end
	        end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(100)
		if hasNitro == true then
			if r_notusing == true and not IsControlPressed(0, k_nitro) then
				if nitro_state + 0.1 < 100 then
					Wait(50)
					nitro_state = nitro_state + 0.1
				else
					Wait(50)
					nitro_state = 100
				end
			end

			if IsControlPressed(0, k_purge) and not IsControlPressed(0, k_nitro) then
				if nitro_state + 0.1 < 100 then
					Wait(50)
					nitro_state = nitro_state + 0.1
				else
					Wait(50)
					nitro_state = 100
				end
			end
			if c_use == true and c_earn_purge == true and not IsControlPressed(0, k_nitro) and IsControlPressed(0, k_purge) then
				Wait(50)
				coins = coins + 1
				jtbs = jtbs + 1
			end

			if r_empty == true and nitro_state == 0 then
               	while true do
               		Wait(1)
					if nitro_state + 0.1 < 100 and not IsControlPressed(0, k_nitro) then
						Wait(50)
						nitro_state = nitro_state + 0.1
					else
						break
					end
				end
			end

			if speed >= 3.0 and ang ~= 0 and r_drift == true and not IsControlPressed(0, k_nitro) and GetEntityHeightAboveGround(vehicle) < 1.0 then
        		if nitro_state + 0.2 < 100 then
					Wait(50)
					nitro_state = nitro_state + 0.2
				else
					Wait(50)
					nitro_state = 100
				end
        	end
        	if c_use == true and c_earn_drift == true and not IsControlPressed(0, k_nitro) and speed >= 3.0 and ang ~= 0 and GetEntityHeightAboveGround(vehicle) < 1.0 then
        		Wait(40)
				coins = coins + 1
				jtbs = jtbs + 1
        	end

        	if speed < 1.0 and IsVehicleInBurnout(car) and r_burnout == true and not IsControlPressed(0, k_nitro) and GetEntityHeightAboveGround(vehicle) < 1.0 then
        		if nitro_state + 0.2 < 100 then
					Wait(50)
					nitro_state = nitro_state + 0.2
				else
					Wait(50)
					nitro_state = 100
				end
        	end
        	if c_use == true and c_earn_burnout == true and speed < 1.0 and IsVehicleInBurnout(car) and GetEntityHeightAboveGround(vehicle) < 1.0 and not IsControlPressed(0, k_nitro) then
        		Wait(40)
				coins = coins + 1
				jtbs = jtbs + 1
			end

			if speed < 0.1 and r_notdriving == true and not IsControlPressed(0, k_nitro) and GetEntityHeightAboveGround(vehicle) < 1.0 then
        		if nitro_state + 0.1 < 100 then
					Wait(50)
					nitro_state = nitro_state + 0.1
				else
					Wait(50)
					nitro_state = 100
				end
        	end

        	if speed >= r_fastdriving_speed and r_fastdriving == true and not IsControlPressed(0, k_nitro) and GetEntityHeightAboveGround(vehicle) < 1.0 then
        		if nitro_state + 0.1 < 100 then
					Wait(50)
					nitro_state = nitro_state + 0.1
				else
					Wait(50)
					nitro_state = 100
				end
        	end
        	if c_use == true and c_earn_fastdriving == true and speed >= r_fastdriving_speed and GetEntityHeightAboveGround(vehicle) < 1.0 and not IsControlPressed(0, k_nitro) then
        		Wait(50)
				coins = coins + 1
				jtbs = jtbs + 1
			end

			if r_flying == true and not IsControlPressed(0, k_nitro) and GetEntityHeightAboveGround(vehicle) > r_flying_height then
        		if nitro_state + 0.2 < 100 then
					Wait(50)
					nitro_state = nitro_state + 0.2
				else
					Wait(50)
					nitro_state = 100
				end
        	end
        	if c_use == true and c_earn_fly == true and GetEntityHeightAboveGround(vehicle) > r_flying_height and not IsControlPressed(0, k_nitro) then
        		Wait(50)
				coins = coins + 1
				jtbs = jtbs + 1
			end
		end
	end
end)

Citizen.CreateThread(function()
	while c_use == true do
		Wait(10)
		if isBlack == "false" then
			local nearest_object = find_objects(stuffs)
			if nearest_object == 1 then
				if hasNitro == false then
					SetTextComponentFormat('STRING')
					AddTextComponentString('Press ' .. k_buy_name .. ' to add nitro to [' .. string.lower(vehicle_displayname) ..'].\nCosts: ' .. c_prize_buy .. ' ' .. c_symbol)
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if coins > c_prize_refill and IsControlJustPressed(0, k_buy) then
						coins = coins - c_prize_buy
						jtbs = jtbs - c_prize_buy
						nitro_state = 100
						if coins == jtbs then
							TriggerServerEvent("save_coins", coins)
						else
							TriggerServerEvent("sec_kick")
						end
						ShowNotification("Nitro has been added for " .. c_prize_buy .. " " .. c_symbol)
						TriggerServerEvent("nitro_bought", string.lower(vehicle_displayname))				
					else
						if coins < c_prize_buy and IsControlJustPressed(0, k_buy) then
							missing = c_prize_buy - coins
							ShowNotification("You do not have enough money.\nYou need " .. missing .. " " .. c_symbol .. " more.")
						end
					end
				else
					if nitro_state < 100.0 then
						SetTextComponentFormat('STRING')
						AddTextComponentString('Press ' .. k_buy_name .. ' to fill up your nitro.\nCosts: ' .. c_prize_refill .. ' ' .. c_symbol)
						DisplayHelpTextFromStringLabel(0, 0, 1, -1)
						if coins > c_prize_refill and IsControlJustPressed(0, k_buy) then
							coins = coins - c_prize_refill
							jtbs = jtbs - c_prize_refill
							nitro_state = 100
							if coins == jtbs then
								TriggerServerEvent("save_coins", coins)
							else
								TriggerServerEvent("sec_kick")
							end
							ShowNotification("Your nitro has been refilled for " .. c_prize_refill .. " " .. c_symbol)
						else
							if coins < c_prize_refill and IsControlJustPressed(0, k_buy) then
								missing = c_prize_refill - coins
								ShowNotification("You do not have enough money.\nYou need " .. missing .. " " .. c_symbol .. " more.")
							end
						end
					end
				end
			end
		end
	end
end)

if c_suggestion == true then
	TriggerEvent('chat:addSuggestion', '/nitro set', 'Ultimate Nitro Command', {
    { name="playerID", help="ID of the player you want to set the " .. c_symbol .. "." },
    { name="amount", help="Amount of " .. c_symbol .. " you want the player to have." }})
    TriggerEvent('chat:addSuggestion', '/nitro add', 'Ultimate Nitro Command', {
    { name="playerID", help="ID of the player you want to add " .. c_symbol .. "." },
    { name="amount", help="Amount of " .. c_symbol .. " you want to add to the player." }})
    TriggerEvent('chat:addSuggestion', '/nitro remove', 'Ultimate Nitro Command', {
    { name="playerID", help="ID of the player you want to remove " .. c_symbol .. " from." },
    { name="amount", help="Amount of " .. c_symbol .. " you want to remove from the player." }})
end
if c_suggestion_pay == true then
	TriggerEvent('chat:addSuggestion', '/nitro pay', 'Ultimate Nitro Command', {
    { name="playerID", help="ID of the player you want to give " .. c_symbol .. "." },
    { name="amount", help="Amount of " .. c_symbol .. " you want to give the player." }
})
end

if m_blips == true then
	blip0 = AddBlipForRadius(48.0, 2776.0, 57.0, 15.0)
	SetBlipColour(blip0, m_blipcolor)
	blip1 = AddBlipForRadius(-726.0, -935.0, 18.0, 20.0)
	SetBlipColour(blip1, m_blipcolor)
	blip2 = AddBlipForRadius(-319.0, -1471.0, 30.0, 20.0)
	SetBlipColour(blip2, m_blipcolor)
	blip3 = AddBlipForRadius(175.0, -1561.0, 29.0, 15.0)
	SetBlipColour(blip3, m_blipcolor)
	blip4 = AddBlipForRadius(-69.0, -1760.0, 29.0, 20.0)
	SetBlipColour(blip4, m_blipcolor)
	blip5 = AddBlipForRadius(1208.0, -1403.0, 35.0, 15.0)
	SetBlipColour(blip5, m_blipcolor)
	blip6 = AddBlipForRadius(817.0, -1030.0, 26.0, 20.0)
	SetBlipColour(blip6, m_blipcolor)
	blip7 = AddBlipForRadius(2581.0, 362.0, 108.0, 20.0)
	SetBlipColour(blip7, m_blipcolor)
	blip8 = AddBlipForRadius(1180.0, -329.0, 69.0, 20.0)
	SetBlipColour(blip8, m_blipcolor)
	blip9 = AddBlipForRadius(621.0, 269.0, 102.0, 20.0)
	SetBlipColour(blip9, m_blipcolor)
	blip10 = AddBlipForRadius(-1436.0, -277.0, 46.0, 15.0)
	SetBlipColour(blip10, m_blipcolor)
	blip11 = AddBlipForRadius(-2095.0, -320.0, 12.0, 20.0)
	SetBlipColour(blip11, m_blipcolor)
	blip12 = AddBlipForRadius(-1803.0, 803.0, 137.0, 20.0)
	SetBlipColour(blip12, m_blipcolor)
	blip13 = AddBlipForRadius(-2555.0, 2333.0, 33.0, 20.0)
	SetBlipColour(blip13, m_blipcolor)
	blip14 = AddBlipForRadius(264.0, 2607.0, 44.0, 15.0)
	SetBlipColour(blip14, m_blipcolor)
	blip15 = AddBlipForRadius(1039.0, 2671.0, 39.0, 15.0)
	SetBlipColour(blip15, m_blipcolor)
	blip16 = AddBlipForRadius(1208.0, 2662.0, 37.0, 15.0)
	SetBlipColour(blip16, m_blipcolor)
	blip17 = AddBlipForRadius(2682.0, 3263.0, 55.0, 15.0)
	SetBlipColour(blip17, m_blipcolor)
	blip18 = AddBlipForRadius(2005.0, 3773.0, 32.0, 15.0)
	SetBlipColour(blip18, m_blipcolor)
	blip19 = AddBlipForRadius(1687.0, 4930.0, 41.0, 15.0)
	SetBlipColour(blip19, m_blipcolor)
	blip20 = AddBlipForRadius(1700.0, 6415.0, 32.0, 15.0)
	SetBlipColour(blip20, m_blipcolor)
	blip21 = AddBlipForRadius(180.0, 6600.0, 31.0, 20.0)
	SetBlipColour(blip21, m_blipcolor)
	blip22 = AddBlipForRadius(-95.0, 6420.0, 31.0, 15.0)
	SetBlipColour(blip22, m_blipcolor)
	blip23 = AddBlipForRadius(1784.0, 3332.0, 40.0, 15.0)
	SetBlipColour(blip23, m_blipcolor)
	blip24 = AddBlipForRadius(2537.0, 2594.0, 37.0, 15.0)
	SetBlipColour(blip24, m_blipcolor)
	blip25 = AddBlipForRadius(263.0, -1261.0, 28.0, 20.0)
	SetBlipColour(blip25, m_blipcolor)
	blip26 = AddBlipForRadius(-524.0, -1211.0, 18.0, 20.0)
	SetBlipColour(blip26, m_blipcolor)
end

RegisterNetEvent("c_eff_flames")
AddEventHandler("c_eff_flames", function(c_veh)
	for _,bones in pairs(p_flame_location) do
		UseParticleFxAssetNextCall(p_flame_particle_asset)
		createdPart = StartParticleFxLoopedOnEntityBone(p_flame_particle, NetToVeh(c_veh), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(NetToVeh(c_veh), bones), p_flame_size, 0.0, 0.0, 0.0)
		StopParticleFxLooped(createdPart, 1)
	end
end)

RegisterNetEvent("c_eff_purge")
AddEventHandler("c_eff_purge", function(c_veh)
	for _,bones in pairs(p_purge_location) do
		UseParticleFxAssetNextCall(p_purge_particle_asset)
		createdPart = StartParticleFxLoopedOnEntityBone(p_purge_particle, NetToVeh(c_veh), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(NetToVeh(c_veh), bones), p_purge_size, 0.0, 0.0, 0.0)
		StopParticleFxLooped(createdPart, 1)
	end
end)

RegisterNetEvent("c_eff_indicator_start")
AddEventHandler("c_eff_indicator_start", function(c_veh)
	SetVehicleIndicatorLights(NetToVeh(c_veh), 0, 1)
	SetVehicleIndicatorLights(NetToVeh(c_veh), 1, 1)
end)
RegisterNetEvent("c_eff_indicator_stop")
AddEventHandler("c_eff_indicator_stop", function(c_veh)
	SetVehicleIndicatorLights(NetToVeh(c_veh), 0, 0)
	SetVehicleIndicatorLights(NetToVeh(c_veh), 1, 0)
end)

RegisterNetEvent("c_eff_sound_start")
AddEventHandler("c_eff_sound_start", function(c_veh)
	SetVehicleBoostActive(NetToVeh(c_veh), 1)
end)
RegisterNetEvent("c_eff_sound_stop")
AddEventHandler("c_eff_sound_stop", function(c_veh)
	SetVehicleBoostActive(NetToVeh(c_veh), 0)
end)

RegisterNetEvent("c_add_vehicle")
AddEventHandler("c_add_vehicle", function(c_veh)
	table.insert(vehicles, c_veh)
end)

RegisterNetEvent("c_set_coins")
AddEventHandler("c_set_coins", function(amount)
	coins = tonumber(amount)
	jtbs = tonumber(amount)
end)

RegisterNetEvent("message")
AddEventHandler("message", function(message)
	ShowNotification(message)
end)

RegisterNetEvent("c_add_coins")
AddEventHandler("c_add_coins", function(amount)
	coins = coins + tonumber(amount)
	jtbs = jtbs + tonumber(amount)
	if coins == jtbs then
		TriggerServerEvent("save_coins", coins)
	else
		TriggerServerEvent("sec_kick")
	end
end)

RegisterNetEvent("c_remove_coins")
AddEventHandler("c_remove_coins", function(amount)
	coins = coins - tonumber(amount)
	jtbs = jtbs - tonumber(amount)
	if coins == jtbs then
		TriggerServerEvent("save_coins", coins)
	else
		TriggerServerEvent("sec_kick")
	end
end)

RegisterNetEvent("co_set_coins")
AddEventHandler("co_set_coins", function(amount)
	coins = tonumber(amount)
	jtbs = tonumber(amount)
end)