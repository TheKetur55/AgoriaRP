dc_intro_players = dc_intro_players or {}

local function has_already_intro(uniqueId)
  for k,v in pairs(dc_intro_players) do
    if (v == uniqueId) then 
      return true
    end
  end
  return false
end

RegisterServerEvent("dc_intro:spawn")
AddEventHandler("dc_intro:spawn", function(get)
  local src = source
  local name = GetPlayerName(src)
  local uniqueId = table.unpack(GetPlayerIdentifiers(src))

  if (dc_intro.debug) then
    print("DEBUG > "..name.." ("..uniqueId..")")
  end 

  if (get == "true") then
    local has_already_spawn = false

    if (has_already_intro(uniqueId)) then
      has_already_spawn = true
    end

    if (dc_intro.debug) then
      print("DEBUG > "..name.." ("..uniqueId..") has "..has_already_spawn.." intro !")
    end 

    TriggerClientEvent("dc_intro:setSpawn", src,has_already_spawn)
  else 
    table.insert(dc_intro_players, uniqueId)
    if (dc_intro.debug) then
      print("DEBUG > Add "..name.." ("..uniqueId..") !")
    end 
  end
end)