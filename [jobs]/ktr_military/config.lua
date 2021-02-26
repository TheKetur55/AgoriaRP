Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.PoliceStations = {

	LSPD = {

		

		Cloakrooms = {
			vector3(-2207.464, 3311.276, 33.172)
		},

		Armories = {
			vector3(-2253.085, 3301.930, 32.976)
		},

		Vehicles = {
			{
				Spawner = vector3(-2222.186, 3276.17, 32.810),
				InsideShop = vector3(-2238.649, 3208.565, 32.810),
				SpawnPoints = {
					{ coords = vector3(-2234.291, 3271.372, 32.810), heading = 237.75, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1912.247, 3047.828, 32.810),
				InsideShop = vector3(-1990.230, 3063.685, 32.810),
				SpawnPoints = {
					{ coords = vector3(-1921.225, 3031.498, 32.810), heading = 144.843, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(466.06, -1013.34, 27.07)
		}

	}

}

Config.AuthorizedWeapons = {

	sdt = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		--{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		--{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		--{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		--{ weapon = 'WEAPON_RPG', price = 100000 },
		--{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		--{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	pcl = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		--{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		--{ weapon = 'WEAPON_RPG', price = 100000 },
		--{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		--{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	cpl = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		--{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		--{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	cch = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		--{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	ccv = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	sgt = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	sch = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	adj = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	adc = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	mjr = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	slt = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	ltn = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	cne = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	cba = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},

	lcl = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	},
	col = {
		{ weapon = 'WEAPON_FLARE', price = 500 },
		{ weapon = 'WEAPON_SMOKEGRENADE', price = 700 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_KNIFE', price = 1000 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_GRENADE', price = 2500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 30000 },
		{ weapon = 'WEAPON_COMBATMG', price = 50000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 40000 },
		{ weapon = 'WEAPON_RPG', price = 100000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', price = 60000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', price = 70000 },
		{ weapon = 'GADGET_PARACHUTE', price = 1000 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		
	},

	sdt = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		--{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		--{ model = 'apc', label = 'Apc', price = 250000 },
		--{ model = 'rhino', label = 'Char', price = 1000000 }
	},

	pcl = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		--{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		--{ model = 'apc', label = 'Apc', price = 250000 },
		--{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	cpl = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		--{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		--{ model = 'apc', label = 'Apc', price = 250000 },
		--{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	cch = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		--{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		--{ model = 'apc', label = 'Apc', price = 250000 },
		--{ model = 'rhino', label = 'Char', price = 1000000 }
	},

	ccv = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		--{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		--{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	sgt = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		--{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	sch = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		--{ model = 'rhino', label = 'Char', price = 1000000 }
	},

	adj = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	adc = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	mjr = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	slt = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	ltn = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	cne = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	cba = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	lcl = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		{ model = 'rhino', label = 'Char', price = 1000000 }

	},

	col = {
		{ model = 'crusader', label = 'Crusader', price = 20000 },
		{ model = 'Nightshark', label = 'nightshark', price = 80000 },
		{ model = 'barracks', label = 'Barracks', price = 80000 },		
		{ model = 'apc', label = 'Apc', price = 250000 },
		{ model = 'rhino', label = 'Char', price = 1000000 }

	}
}

Config.AuthorizedHelicopters = {

	sdt = {
		--[[{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}]]--
		
	},

	pcl = {
		--[[{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}]]--
		
	},

	cpl = {
		--[[{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}]]--
		
	},

	cch = {
		--[[{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}]]--
	
	},

	ccv = {
		--[[{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}]]--
	},

	sgt = {
		--[[{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}]]--
		
	},

	sch = {
		--[[{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}]]--
		
	},

	adj = {
		--[[{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}]]--
	
	},

	adc = {
		--[[{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}]]--
		
	},

	mjr = {
		--[[{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},]]
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		}--,
		--[[{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}]]
		
	},

	slt = {
		--[[{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},]]
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		}--,
		--[[{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}]]
		
	},

	ltn = {
			{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}
	
	},

	cne = {
		{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}
		
	},

	cba = {
		{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}
		
	},

	lcl = {
		{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}
		
	},

	col = {
		{
			model = 'hunter',
			label = 'Hélicoptère de combat',
			livery = 0,
			price = 800000
		},
		{
			model = 'cargobob',
			label = 'cargobob avec crochet',
			livery = 0,
			price = 300000
		},
		{
			model = 'titan',
			label = 'Avion de transport',
			livery = 0,
			price = 600000
		},
		{
			model = 'strikeforce',
			label = 'Avion de support terrestre',
			livery = 0,
			price = 900000
		},
		{
			model = 'lazer',
			label = 'Avion de chasse',
			livery = 0,
			price = 1000000
		}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	
	sdt_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	pcl_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	cpl_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	cch_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	ccv_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	sgt_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	sch_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	adj_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	adc_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	mjr_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	slt_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	ltn_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	cne_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	cba_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	lcl_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	col_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 221,   ['torso_2'] = 14,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 87,   ['pants_2'] = 14,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 106,  ['helmet_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 9,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	swat2_wear = {   --2
		male = {
				['tshirt_1'] = 131,  ['tshirt_2'] = 12,
				['torso_1'] = 221,   ['torso_2'] = 14,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 17,
				['pants_1'] = 87,   ['pants_2'] = 14,
				['shoes_1'] = 35,   ['shoes_2'] = 0,
				['helmet_1'] = 39,  ['helmet_2'] = 3,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = 5,     ['ears_2'] = 9,
				['glasses_1'] = -1,     ['glasses_2'] = 0,
				['mask_1'] = 0,     ['mask_2'] = 0,
				['bags_1'] = 0,    ['bags_2'] = 0
             },   
        female = {
                ['tshirt_1']     = 131,['tshirt_2']     = 0,
                ['torso_1']      = 221,['torso_2']      = 20,
                ['decals_1'] 	 = 0,  ['decals_2'] 	= 0,
                ['arms']         = 17,
                ['pants_1']      = 78,['pants_2']     	= 2,
                ['shoes_1']      = 60,['shoes_2']      	= 0,
                ['mask_1']       = 125,['mask_2']       = 12,
                ['chain_1']      = 0,['chain_2']      	= 0,
                ['helmet_1']     = 117,['helmet_2']     = 0,
                ['glasses_1']    = 0,['glasses_2']    	= 0, 
               }
        },

    flypilot_wear = {
        male = {
                ['tshirt_1']     = 15,['tshirt_2']     = 0,
                ['torso_1']      = 48,['torso_2']      = 0,
                ['arms']         = 17,
                ['pants_1']      = 30,['pants_2']      = 0,
                ['shoes_1']      = 69,['shoes_2']      = 0,
                ['mask_1']       = 0,['mask_2']       = 0,
                ['chain_1']      = 40,['chain_2']      = 0,
                ['helmet_1']     = 38,['helmet_2']     = 0,
                ['glasses_1']    = 0,['glasses_2']    = 0,
                ['bags_1'] = 39,    ['bags_2'] = 4,
               }, 
        female = {
                ['tshirt_1']     = 56,['tshirt_2']     = 1,
                ['torso_1']      = 224,['torso_2']     = 0,
                ['arms']         = 20,
                ['pants_1']      = 92,['pants_2']      = 4,
                ['shoes_1']      = 60,['shoes_2']      = 0,
                ['mask_1']       = 0,['mask_2']			= 0,
                ['chain_1']      = 0,['chain_2']      	= 0,
                ['helmet_1']     = 19,['helmet_2']    	= 0,
                ['glasses_1']    = 0,['glasses_2']   	= 0,
                }
         },
    helicopterpilot_wear = {
        male = {
                ['tshirt_1']     = 130,['tshirt_2']     = 0,
                ['torso_1']      = 48,['torso_2']      = 0,
                ['arms']         = 96,
                ['pants_1']      = 30,['pants_2']      = 0,
                ['shoes_1']      = 60,['shoes_2']      = 0,
                ['mask_1']       = 0,['mask_2']       = 0,
                ['chain_1']      = 0,['chain_2']      = 0,
                ['helmet_1']     = 19,['helmet_2']     = 0,
                ['glasses_1']    = 0,['glasses_2']    = 0,
                ['bags_1'] = 39,    ['bags_2'] = 4,
               }, 
        female = {
                ['tshirt_1']     = 56,['tshirt_2']     = 1,
                ['torso_1']      = 224,['torso_2']     = 0,
                ['arms']         = 20,
                ['pants_1']      = 92,['pants_2']      = 4,
                ['shoes_1']      = 60,['shoes_2']      = 0,
                ['mask_1']       = 0,['mask_2']			= 0,
                ['chain_1']      = 0,['chain_2']      	= 0,
                ['helmet_1']     = 19,['helmet_2']    	= 0,
                ['glasses_1']    = 0,['glasses_2']   	= 0,
                }
         },



	swat_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 12,
				['torso_1'] = 221,   ['torso_2'] = 14,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 17,
				['pants_1'] = 87,   ['pants_2'] = 14,
				['shoes_1'] = 35,   ['shoes_2'] = 0,
				['helmet_1'] = 117,  ['helmet_2'] = 12,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = 5,     ['ears_2'] = 9,
				['glasses_1'] = -1,     ['glasses_2'] = 0,
				['mask_1'] = 104,     ['mask_2'] = 5,
				['bags_1'] = 0,    ['bags_2'] = 0


		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	bullet_wear = {
		male = {
			['bproof_1'] = 11,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}