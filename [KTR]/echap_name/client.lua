--[[function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value, value, value)
end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', "~g~Agoria Paradise ~s~| ~r~https://discord.gg/UUUGTZV | ~y~ ID :~s~" .. GetPlayerServerId(PlayerId()) .. " ~y~| Nom :~s~ " .. (GetPlayerName(i)))
end)]]

function SetData()
	players = {}
	for i = 0, 256 do
		if NetworkIsPlayerActive( i ) then
			table.insert( players, i )
		end
	end
	
	local name = GetPlayerName(PlayerId())
	local id = GetPlayerServerId(PlayerId())
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~y~AGORIA PARADISE  ~t~| ~g~Discord: 8ZRWRsF~t~ | ~b~ID: ' .. id .. ' ~t~| ~b~Nom: ~b~' .. name .. " ~r~Joueurs: " .. #players .. "/64")
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		SetData()
	end
end)
