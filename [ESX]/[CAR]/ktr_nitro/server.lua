--- NITRO COINS ---
c_starter = 500 -- amount of coins, player get to start | default: 500

--- COMMANDS ---
c_pay = true -- allow everyone to give their money to others by using the command /nitro pay {playerID} {amount} | default: true
c_add = {
	"license:6917e9c059e05a93c3bc8b4947bbb9b35628aada",
} -- add players here (license), to give them permissions for the command /nitro add {playerID} {amount}
c_remove = {
	"license:6917e9c059e05a93c3bc8b4947bbb9b35628aada",
} -- add players here (license), to give them permissions for the command /nitro remove {playerID} {amount}
c_set = {
	"license:6917e9c059e05a93c3bc8b4947bbb9b35628aada",
} -- add players here (license), to give them permissions for the command /nitro set {playerID} {amount}

--- END OF CONFIGURATION ---

RegisterCommand("nitro", function(source, args)
	if #args == 3 then
		if  GetPlayerPing(args[2]) > 1 then
			if args[1] == "pay" then
				if c_pay == true then
					TriggerClientEvent("c_remove_coins", source, args[3])
					TriggerClientEvent("c_add_coins", args[2], args[3])
					TriggerClientEvent("message", source, "You gave " .. args[3] .. " nmo to " .. GetPlayerName(args[2]))
					TriggerClientEvent("message", args[2], GetPlayerName(source) .. " gave you " .. args[3] .. " nmo.")
				else
					TriggerClientEvent("message", source, "This feature has been disabled.")
				end
			end
			for _,id in ipairs(GetPlayerIdentifiers(source)) do
				if string.find(id, "license:") then
					if args[1] == "add" then
						fails = 0
						size = 0
						for _,lic in pairs(c_add) do
							size = size + 1
							if lic == id then
								TriggerClientEvent("c_add_coins", args[2], args[3])
								TriggerClientEvent("message", args[2], GetPlayerName(source) .. " gave you " .. args[3] .. " nmo.")
								TriggerClientEvent("message", source, "You gave " .. args[3] .. " nmo to " .. GetPlayerName(args[2]))
								break
							else
								fails = fails + 1
							end
						end
						if fails == size then
							TriggerClientEvent("message", source, "You do not have enough permissions for this command.")
						end
					end
					if args[1] == "remove" then
						fails = 0
						size = 0
						for _,lic in pairs(c_remove) do
							size = size + 1
							if lic == id then
								TriggerClientEvent("c_remove_coins", args[2], args[3])
								TriggerClientEvent("message", args[2], GetPlayerName(source) .. " took " .. args[3] .. " nmo from you.")
								TriggerClientEvent("message", source, "You removed " .. args[3] .. " nmo from " .. GetPlayerName(args[2]))
								break
							else
								fails = fails + 1
							end
						end
						if fails == size then
							TriggerClientEvent("message", source, "You do not have enough permissions for this command.")
						end
					end
					if args[1] == "set" then
						fails = 0
						size = 0
						for _,lic in pairs(c_set) do
							size = size + 1
							if lic == id then
								TriggerClientEvent("co_set_coins", args[2], args[3])
								TriggerClientEvent("message", args[2], "Your nmo were set to " .. args[3] .. " by " .. GetPlayerName(source) .. ".")
								TriggerClientEvent("message", source, "You have set the nmo from " .. GetPlayerName(args[2]) .. " to " .. args[3])
								break
							else
								fails = fails + 1
							end
						end
						if fails == size then
							TriggerClientEvent("message", source, "You do not have enough permissions for this command.")
						end
					end					
				end
			end
		else
			TriggerClientEvent("message", source, "This player does not seem to exist.")
		end
	else
		TriggerClientEvent("message", source, "You did not give the arguments that are expected for this command.")
	end
end, false)

RegisterServerEvent("eff_flames")
AddEventHandler("eff_flames", function(entity)
	TriggerClientEvent("c_eff_flames", -1, entity)
end)

RegisterServerEvent("eff_purge")
AddEventHandler("eff_purge", function(entity)
	TriggerClientEvent("c_eff_purge", -1, entity)
end)

RegisterServerEvent("eff_indicator_start")
AddEventHandler("eff_indicator_start", function(entity)
	TriggerClientEvent("c_eff_indicator_start", -1, entity)
end)
RegisterServerEvent("eff_indicator_stop")
AddEventHandler("eff_indicator_stop", function(entity)
	TriggerClientEvent("c_eff_indicator_stop", -1, entity)
end)

RegisterServerEvent("eff_sound_start")
AddEventHandler("eff_sound_start", function(entity)
	TriggerClientEvent("c_eff_sound_start", -1, entity)
end)
RegisterServerEvent("eff_sound_stop")
AddEventHandler("eff_sound_stop", function(entity)
	TriggerClientEvent("c_eff_sound_stop", -1, entity)
end)

RegisterServerEvent("nitro_bought")
AddEventHandler("nitro_bought", function(vehicle)
	TriggerClientEvent("c_add_vehicle", source, vehicle)
	for id in pairs(GetPlayerIdentifiers(source)) do
		if string.find(GetPlayerIdentifiers(source)[id], "license:") then
			license = string.gsub(GetPlayerIdentifiers(source)[id], "license:", "")
			if exists("ultimateNitro_saves/" .. license .. ".txt") then
				open = io.open("ultimateNitro_saves/" .. license .. ".txt", "r")
				allin = open:read("*all")
				io.close(open)
				os.execute("rm ultimateNitro_saves/" .. license .. ".txt")
				closet = io.open("ultimateNitro_saves/" .. license .. ".txt", "w")
				closet:write(allin .. "." ..vehicle)
				io.close(closet)
			end
			break
		end
	end
end)

RegisterServerEvent("rem_vec")
AddEventHandler("rem_vec", function(vehicle)
	for id in pairs(GetPlayerIdentifiers(source)) do
		if string.find(GetPlayerIdentifiers(source)[id], "license:") then
			license = string.gsub(GetPlayerIdentifiers(source)[id], "license:", "")
			if exists("ultimateNitro_saves/" .. license .. ".txt") then
				open = io.open("ultimateNitro_saves/" .. license .. ".txt", "r")
				local delvec = tostring("." .. vehicle)
				local asl = tostring(open:read("*all"))
				local allin = string.gsub(asl, delvec, "")
				io.close(open)
				os.execute("rm ultimateNitro_saves/" .. license .. ".txt")
				closet = io.open("ultimateNitro_saves/" .. license .. ".txt", "w")
				closet:write(allin)
				io.close(closet)
			end
			break
		end
	end
end)

RegisterServerEvent("imNew")
AddEventHandler("imNew", function()
	for id in pairs(GetPlayerIdentifiers(source)) do
		if string.find(GetPlayerIdentifiers(source)[id], "license:") then
			license = string.gsub(GetPlayerIdentifiers(source)[id], "license:", "")
			if exists("ultimateNitro_saves") then
				if exists("ultimateNitro_saves/" .. license .. ".txt") then
					opened = io.open("ultimateNitro_saves/" .. license .. ".txt", "r")
					one = opened:read("*line")
					TriggerClientEvent("c_set_coins", source, one)
					vehics = opened:read("*all")
					spl = split(vehics, "%.")
					for veh1,veh2 in pairs(spl) do
						ves = string.gsub(veh2, "%%", "")
						TriggerClientEvent("c_add_vehicle", source, ves)
					end
					io.close(opened)
				else
					opened = io.open("ultimateNitro_saves/" .. license .. ".txt", "w")
					opened:write(tostring(c_starter))
					io.close(opened)
					TriggerClientEvent("c_set_coins", source, c_starter)
				end
			else
				os.execute("mkdir ultimateNitro_saves")
				opened = io.open("ultimateNitro_saves/" .. license .. ".txt", "w")
				opened:write(tostring(c_starter))
				io.close(opened)
				TriggerClientEvent("c_set_coins", source, c_starter)
			end
			break
		end
	end
end)

RegisterServerEvent("save_coins")
AddEventHandler("save_coins", function(currcoins)
	for id in pairs(GetPlayerIdentifiers(source)) do
		if string.find(GetPlayerIdentifiers(source)[id], "license:") then
			license = string.gsub(GetPlayerIdentifiers(source)[id], "license:", "")
			if exists("ultimateNitro_saves/" .. license .. ".txt") then
				opened = io.open("ultimateNitro_saves/" .. license .. ".txt", "r")
				unuse = opened:read("*line")
				allin = opened:read("*all")
				io.close(opened)
				os.execute("rm ultimateNitro_saves/" .. license .. ".txt")
				closet = io.open("ultimateNitro_saves/" .. license .. ".txt", "w")
				closet:write(currcoins .. "\n" .. allin)
				io.close(closet)
			end
			break
		end
	end
end)

RegisterServerEvent("sec_kick")
AddEventHandler("sec_kick", function()
	print("AgAC™: " .. GetPlayerName(source) .. " has been kicked, because his Nitro Coins were manipulated.")
	DropPlayer(source, "You have been kicked by AgAC™. Something was wrong with your Nitro Coins.")	
end)

--- FUNCTION ---

function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end