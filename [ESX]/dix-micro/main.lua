local isUiOpen = false 
local isTalking = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isTalking == false then
			if NetworkIsPlayerTalking(PlayerId()) then
				isTalking = true
				SendNUIMessage({
            	   displayWindow = 'true'
            	   })
                isUiOpen = true 	
			end
		else
			if NetworkIsPlayerTalking(PlayerId()) == false then
				isTalking = false
				SendNUIMessage({
				   displayWindow = 'false'
				   })
				isUiOpen = true
			end
		end
	end
end)


--[[
Citizen.CreateThread(function()
	local fixingVoice = true	
	NetworkSetTalkerProximity(0.1)
	while true do
		NetworkSetTalkerProximity(8.0)
		if not fixingVoice then
			print("Vocal Connecter")
			break
		end
		Wait(1)
	end

    -- we break the loop after 15 seconds
    SetTimeout(15000, function()
        fixingVoice = false
    end)
end
]]