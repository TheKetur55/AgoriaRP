Config = {}
Config.DrawDistance = 20.0
Config.HideRadar = true -- Hide HUD?
Config.AnimTime = 60 -- Animation for the hacking in seconds. 60 = 1 minute / 60 seconds!

Config.Locale = 'en'
Config.pNotify = false -- Only enable this if you have pNotify (https://github.com/Nick78111/pNotify)
Config.Hacking = false -- Only enable if you have mhacking (https://github.com/GHMatti/FiveM-Scripts/tree/master/mhacking)

-- Connect to the cameras
-- Place: In the polices armory room
Config.Zones = {
	Cameras = {
		Pos   = {x = -1528.05, y = 128.95, z = 72.10},
		Size  = {x = 1.7, y = 1.7, z = 0.5},
		Color = {r = 26, g = 55, b = 186},
		Type = 27,
	}
}

-- Keep these the same
-- Place: Behind the polices desk in the policestation
-- Screenshot: https://i.imgur.com/f5WNrRj.jpg
Config.HackingPolice = {
	HackingPolice = {
		Pos   = {x = 440.17, y = -975.74, z = 29.69},
		Size  = {x = 1.7, y = 1.7, z = 0.5},
		Color = {r = 26, g = 55, b = 186},
		Type = 27,
	}
}

Config.UnHackPolice = {
	UnHackPolice = {
		Pos   = {x = 440.17, y = -975.74, z = 29.69},
		Size  = {x = 1.7, y = 1.7, z = 0.5},
		Color = {r = 26, g = 55, b = 186},
		Type = 27,
	}
}

-- Keep these the same
-- Place: Down at the bank vault
-- Screenshot: https://i.imgur.com/nvcFUhu.jpg
Config.HackingBank = {
	HackingBank = {
		Pos   = {x = 264.87, y = 219.93, z = 100.68},
		Size  = {x = 1.7, y = 1.7, z = 0.5},
		Color = {r = 26, g = 55, b = 186},
		Type = 27,
	}
}

Config.UnHackBank = {
	UnHackBank = {
		Pos   = {x = 264.87, y = 219.93, z = 100.68},
		Size  = {x = 1.7, y = 1.7, z = 0.5},
		Color = {r = 26, g = 55, b = 186},
		Type = 27,
	}
}

-- Cameras. You could add more cameras for other banks, apartments, houses, buildings etc. (Remember the "," after each row, but not on the last row)
Config.Locations = {
	{
	




		circuitCamLabel = {label = ('Circuit')},
		circuitCameras = {
			{label = ('Caméra 1'), x = -1197.60 , y = -2421.34 , z = 27.00, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 2'), x = -1280.53 , y = -2454.24 , z = 75.00, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
		    {label = ('Caméra 3'), x = -1033.84 , y = -3016.44 , z = 49.00, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 4'), x = -1621.70 , y = -3130.73 , z = 35.65, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 5'), x = -1539.66 , y = 123.00 , z = 63.00, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 6'), x = -1648.21 , y = 105.41 , z = 67.00, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
		    {label = ('Caméra 7'), x = -1565.10 , y = 79.68 , z = 58.00, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 8'), x = -1522.91 , y = 106.40 , z = 60.50, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 9'), x = -1495.01 , y = 129.86 , z = 60.00, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true}
		}





	}
}
