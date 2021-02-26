local logs = "https://discordapp.com/api/webhooks/585369048028676126/fjN_Fr4W3utKg6Em_3zhXpbE0uAufJ4N4lp30FTeZpmxOobts8rrSj9P7TFWNm0dQcYc"
local logs2 = "https://discordapp.com/api/webhooks/585369170565398548/wYOORbxmlGmzIybRJEzv54FqAPUZt5Wsihiw2Jfied59l9gUu6fuDxr5XXoKkPTPduLR"
local communityname = "AgoriaLifeRP"
local communtiylogo = "https://cdn.discordapp.com/attachments/585366906903461901/585369341038428190/log.png" --Must end with .png or .jpg

AddEventHandler('playerConnecting', function()
	--local playerPed = PlayerPedId()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local license = GetPlayerNeededIdentifiers(source)
local _source = source


--local xPlayer = GetPlayerFromId(source)
--local bank = getAccount('bank')
local identity = getIdentity(_source)
local nameName = "" .. identity.firstname .. " " .. identity.lastname .. ""
local connect = {
        {
            ["color"] = "8663711",
            ["title"] = "Le Joueur ce connecte #1",
            ["description"] = "["..os.date("%Y/%m/%d %H:%M:%S").."] ' ".."\nNom steam: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**\n License: **"..license.."**\n Nom prénom RP: **"..nameName.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "AgoriaLife | Connection", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local license = GetPlayerNeededIdentifiers(source)
local _source = source
local identity = getIdentity(_source)
local nameName = "" .. identity.firstname .. " " .. identity.lastname .. ""

local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Le Joueur ce déconnecte #1",
            ["description"] = "["..os.date("%Y/%m/%d %H:%M:%S").."] ' ".."\nNom steam: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**\n License: **"..license.."**\n Nom prénom RP: **"..nameName.."**",
	        ["footer"] = {
            ["text"] = communityname,
            ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs2, function(err, text, headers) end, 'POST', json.encode({username = "AgoriaLife | Déconnection", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)
