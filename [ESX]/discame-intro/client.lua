local dc_coords_player_spawn
local dc_intro_started = false
local dc_intro_start = false

local function lerp(a, b, t)
	return a + (b - a) * t
end

local function vecLerp(x1, y1, z1, x2, y2, z2, l, clamp)
    if clamp then
        if l < 0.0 then l = 0.0 end
        if l > 1.0 then l = 1.0 end
    end
    local x = lerp(x1, x2, l)
    local y = lerp(y1, y2, l)
    local z = lerp(z1, z2, l)
    return vector3(x, y, z)
end

local function autoloadMap(point_data)
    local x,y,z = 0,0,0
    local x1,y1,z1 = point_data.startPoint.x,point_data.startPoint.y,point_data.startPoint.z
    local x2,y2,z2 = point_data.endPoint.x,point_data.endPoint.y,point_data.endPoint.z

    x = (x1 + x2) / 2
    y = (y1 + y2) / 2
    z = (z1 + z2) / 2

    return vector3(x, y, z)
end

local function introStart()

    Citizen.CreateThread(function()
        dc_intro_start = true

        local ply = GetPlayerPed(-1)
        local cam1 = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        local lerp_variable = 0
        
        TriggerEvent("dc_intro:splashspawn", true)

        FreezeEntityPosition(ply, true)
        SetEntityInvincible(ply,true) 
        SetEntityVisible(ply,false) 

        SetCamFov(cam1, dc_intro.fov)
        RenderScriptCams(true, false, 0, 1, 0)
        
        for i=1,#dc_intro.points do
            
            local lerp_vector = dc_intro.points[i].startPoint
            local distance = GetDistanceBetweenCoords(lerp_vector.x, lerp_vector.y, lerp_vector.z, dc_intro.points[i].endPoint.x, dc_intro.points[i].endPoint.y, dc_intro.points[i].endPoint.z, true)
            local middle_intro_point = autoloadMap(dc_intro.points[i])

            SetEntityCoords(ply,middle_intro_point.x, middle_intro_point.y, middle_intro_point.z,0,0,0,0)

            SetCamRot(cam1, GetEntityPitch(ply) ,1.0, dc_intro.points[i].ang)
            DisplayRadar(false)

            while distance > 10.0 and not IsEntityDead(ply) do
                Wait(10)
               
                lerp_vector = vecLerp(lerp_vector.x, lerp_vector.y, lerp_vector.z, dc_intro.points[i].endPoint.x, dc_intro.points[i].endPoint.y, dc_intro.points[i].endPoint.z, dc_intro.points[i].speed*Timestep())
                distance = GetDistanceBetweenCoords(lerp_vector.x, lerp_vector.y, lerp_vector.z, dc_intro.points[i].endPoint.x, dc_intro.points[i].endPoint.y, dc_intro.points[i].endPoint.z, true)
               
                if (dc_intro.debug) then
                    print("DEBUG > "..lerp_vector)
                end 

                SetCamCoord(cam1, lerp_vector.x, lerp_vector.y, lerp_vector.z)
            end

        end
        
        RenderScriptCams(false, false, 0, 1, 0)
        DestroyCam(cam1, false)
        DisplayRadar(true)

        TriggerEvent("dc_intro:splashspawn", false)

        TriggerServerEvent("dc_intro:spawn", "false")
        TriggerServerEvent("dc_intro:spawn", "true")

        SetEntityCoords(ply,dc_coords_player_spawn.x, dc_coords_player_spawn.y, dc_coords_player_spawn.z,0,0,0,0)

        FreezeEntityPosition(ply, false)
        SetEntityInvincible(ply,false) 
        SetEntityVisible(ply,true) 
        
        dc_intro_start = false

    end)
end

AddEventHandler("playerSpawned", function()
    Wait(1000)
    dc_coords_player_spawn = GetEntityCoords(GetPlayerPed(-1))
    TriggerServerEvent("dc_intro:spawn", "true")
    Wait(1000 * dc_intro.wait_start)

    if dc_intro.first_spawn_start_server and dc_intro_started then return end 

    introStart()
end)

RegisterCommand("dc_intro_preview", function()
    dc_coords_player_spawn = GetEntityCoords(GetPlayerPed(-1))

    if (dc_intro_start) then 
        print("Intro already in play !")
        return
    end 

    introStart()
end, true)

RegisterCommand("dc_intro_pos", function()
    local playerCoords = GetEntityCoords(PlayerPedId())
    print("----- HELP for the Configuration -----")
    print("COORDS of PLAYER \n"..playerCoords)
    print("ANGLE of PLAYER \n"..GetEntityHeading(PlayerPedId()))
    print("----- HELP for the Configuration -----")
end, true)

RegisterNetEvent('dc_intro:splashspawn')
AddEventHandler('dc_intro:splashspawn', function(dsp)
  SendNUIMessage({
    element = "splashspawn",
    display = dsp,
    text = dc_intro.splashscreen.text
  })
end)

RegisterNetEvent("dc_intro:setSpawn")
AddEventHandler("dc_intro:setSpawn", function(get)
    Citizen.CreateThread(function()
        dc_intro_started = get
	end)
end)