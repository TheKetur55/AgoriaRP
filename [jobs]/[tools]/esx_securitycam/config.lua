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
		Pos   = {x = 454.38, y = -979.35, z = 29.69},
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
	bankCamLabel = {label = _U('pacific_standard_bank')},
		bankCameras = {
			{label = _U('bcam'), x = 232.86, y = 221.46, z = 107.83, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = _U('bcam2'), x = 257.45, y = 210.07, z = 109.08, r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = true},
			{label = _U('bcam3'), x = 261.50, y = 218.08, z = 107.95, r = {x = -25.0, y = 0.0, z = -149.49}, canRotate = true},
			{label = _U('bcam4'), x = 241.64, y = 233.83, z = 111.48, r = {x = -35.0, y = 0.0, z = 120.46}, canRotate = true},
			{label = _U('bcam5'), x = 269.66, y = 223.67, z = 113.23, r = {x = -30.0, y = 0.0, z = 111.29}, canRotate = true},
			{label = _U('bcam6'), x = 261.98, y = 217.92, z = 113.25, r = {x = -40.0, y = 0.0, z = -159.49}, canRotate = true},
			{label = _U('bcam7'), x = 258.44, y = 204.97, z = 113.25, r = {x = -30.0, y = 0.0, z = 10.50}, canRotate = true},
			{label = _U('bcam8'), x = 235.53, y = 227.37, z = 113.23, r = {x = -35.0, y = 0.0, z = -160.29}, canRotate = true},
			{label = _U('bcam9'), x = 254.72, y = 206.06, z = 113.28, r = {x = -35.0, y = 0.0, z = 44.70}, canRotate = true},
			{label = _U('bcam10'), x = 269.89, y = 223.76, z = 106.48, r = {x = -35.0, y = 0.0, z = 112.62}, canRotate = true},
			{label = _U('bcam11'), x = 252.27, y = 225.52, z = 103.99, r = {x = -35.0, y = 0.0, z = -74.87}, canRotate = true}
		},


		agoriaCamLabel = {label = _U('agoria_place')},
		agoriaCameras = {
			{label = ('Caméra 1'), x = -1155.47, y = -1751.93, z = 7.30, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 2'), x = -1186.22, y = -1769.28, z = 6.90, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 3'), x = -1161.70, y = -1709.16, z = 7.50, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 1'), x = -1174.46, y = -1780.11, z = 7.30, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 2'), x = -1138.40, y = -1728.24, z = 9.60, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 3'), x = -1169.93, y = -1720.79, z = 9.60, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true}
		},




		circuitCamLabel = {label = ('Circuit')},
		circuitCameras = {
			{label = ('Caméra 1'), x = -1133.52, y = -2410.07, z = 29.95, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 2'), x = -1163.90, y = -2314.99, z = 23.00, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
		    {label = ('Caméra 2'), x = -1281.09, y = -2455.95, z = 271.04, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true}
		},

		frontiereCamLabel = {label = ('Frontiere')},
		frontiereCameras = {
			{label = ('Caméra 1'), x = -2659.21, y = 2670.20, z = 30.15, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 2'), x = 2664.19, y = 4852.06, z = 55.77, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
		    {label = ('Caméra 2'), x = 141.38, y = 3408.74, z = 46.43, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true}
		},

		concessCamLabel = {label = ('Concession')},
		concessCameras = {
			{label = ('Caméra 1'), x = -62.74, y = -1101.13, z = 31.27, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true},
			{label = ('Caméra 2'), x = -22.19, y = -1077.80, z = 35.00, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = true}
		},





	policeCamLabel = {label = _U('police_station')},
		policeCameras = {
			{label = ('Caméra 1'), x = -1090.79, y = -807.82, z = 22.30, r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = true},
		{label = ('Caméra 2'), x = -1113.95, y = -826.20, z = 22.30, r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = true},
		{label = ('Caméra 3'), x = -1114.56, y = -837.64, z = 22.50, r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = true},
		{label = ('Caméra 4'), x = -1120.30, y = -839.17, z = 14.50, r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = true},
		{label = ('Caméra 5'), x = -1072.54, y = -851.52, z = 6.00, r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = true},
			{label = _U('pcam2'), x = 465.151, y = -994.266, z = 27.23, r = {x = -30.0, y = 0.0, z = 100.29}, canRotate = true},
			{label = _U('pcam3'), x = 465.631, y = -997.777, z = 27.48, r = {x = -35.0, y = 0.0, z = 90.46}, canRotate = true},
			{label = _U('pcam4'), x = 465.544, y = -1001.583, z = 27.1, r = {x = -25.0, y = 0.0, z = 90.01}, canRotate = true},
			{label = _U('pcam7'), x = 449.440, y = -987.639, z = 33.25, r = {x = -30.0, y = 0.0, z = 50.50}, canRotate = true}
		},
	}
}
