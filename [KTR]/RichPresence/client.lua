local playerPed = PlayerPedId()


Citizen.CreateThread(function()
    while true do

        SetDiscordAppId(551326252615860254)

        players = {}
        for i = 0, 256 do
            if NetworkIsPlayerActive( i ) then
                table.insert( players, i )
            end
        end

        SetDiscordRichPresenceAsset('1024')
        SetDiscordRichPresenceAssetText("Agoria Paradise | Discord : 8ZRWRsF")
        SetRichPresence(GetPlayerName)
	SetRichPresence(GetPlayerName(PlayerId()) .. " - ".. #players .. "/64")

	SetDiscordRichPresenceAssetSmall('logo')
	SetDiscordRichPresenceAssetSmallText("ID :".. GetPlayerServerId(PlayerId()))
        Citizen.Wait(60000)
    end
end)

RegisterCommand('ktr', function()
TriggerClientEvent('chatMessage', -1, '[Agoria Paradise]', {255, 0, 0}, "/agoriareload pour faire son personnage")
TriggerClientEvent('chatMessage', -1, '[Agoria Paradise]', {255, 0, 0}, "Utiliser vos nom RP sur Steam S.V.P")
TriggerClientEvent('chatMessage', -1, '[Agoria Paradise]', {255, 0, 0}, "discord.gg/8ZRWRsF")
end, false)


RegisterCommand('discord', function()
    msg("Discord: discord.gg/8ZRWRsF")

  --  msg("Website: website.com")
  --  msg("teamspeak: website.com")
end, false)

-- We declare this 'msg' function on the bottom due to better practices.
function msg(text)
    -- TriggerEvent will send a chat message to the client in the prefix as red
    TriggerEvent("chatMessage",  "[Agoria Paradise]", {255,0,0}, text)
end


