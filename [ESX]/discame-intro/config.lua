--[[    

    WELCOME IN config file
        
        Name : Discame intro
        Version : 1.0
        Author : 3630
        Github : https://github.com/363O/discame-intro/

]]--

dc_intro = dc_intro or {}

-- Start intro when first spawn since the server start : true
dc_intro.first_spawn_start_server = true

-- Time wait after spawn on the server : 5
dc_intro.wait_start = 5

-- Enable debug mode : false
dc_intro.debug = false

-- Speed of the intro : 0.3
dc_intro.speed = 0.1

-- FOV : 50.0
dc_intro.fov = 50.0

dc_intro.points = {
    {
        startPoint = vector3(-1422.0, -2687.0, 16.0),
        ang = 227.0,
        endPoint = vector3(-1771.031, -2937.088, 16.0),
        speed = 0.25,
    },

    {
        startPoint = vector3(-1392.79, -2318.611, 13.94483),
        ang = 329.0,
        endPoint = vector3(-1172.617, -2032.953, 63.55844),
        speed = 0.5,
    },
    {
        startPoint = vector3(-1251.206, -1545.496, 204.6915),
        ang = 295.0,
        endPoint = vector3(-863.9723, -1083.225, 248.6046),
        speed = 0.5,
    }
}

-- Splash Screen
-- Configuration LOGO : Please replace the file 'ui/assets/logo.png' but rename with the SAME name for autodownload !
-- Configuration MUSIC : Please replace the file 'ui/assets/music.mp3' but rename with the SAME name for autodownload !
dc_intro.splashscreen = {
    text = "Hello World !", -- If True, the player is freeze : true
}
