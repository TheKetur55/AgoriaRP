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
Config.EnableJobLogs              = true

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enasble blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'
Config.PoliceStations = {

	LSPD = {

		--[[Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},]]

		Cloakrooms = {
			vector3(452.6, -992.8, 30.6)
		},

		Armories = {
			vector3(451.7, -980.1, 30.6)
		},

		Armoriess = {
			vector3(451.97, -988.05, 26.65)
		},

		Vehicles = {
			{
				Spawner = vector3(-1120.71, -839.62, 13.30),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(-1125.68, -840.14, 12.55), heading = 12.59, radius = 6.0 },
					{ coords = vector3(-1123.63, -844.80, 12.55), heading = 12.59, radius = 6.0 },
					{ coords = vector3(-1132.97, -841.02, 12.55), heading = 12.59, radius = 6.0 },
					{ coords = vector3(-1124.04, -853.40, 12.55), heading = 12.59, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(-1071.76, -852.62, 4.85),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(-1070.42, -858.10, 4.00), heading = 218.00, radius = 6.0 },
					{ coords = vector3(-1065.92, -855.63, 4.00), heading = 218.00, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1103.42, -830.18, 37.60),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(-1095.44, -834.78, 38.05), heading = 90.00, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(448.4, -973.2, 30.6)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		--{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
	--	{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 1500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 80 }
		{ weapon = 'WEAPON_NIGHTSTICK', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 }
	},

	officer = {
		--{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
		{ weapon = 'WEAPON_FLARE', price = 200 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { nil, 1, 1,1 ,1}, price = 5000 }
	},

	sergeant = {
	--	{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
		{ weapon = 'WEAPON_BZGAS', price = 200 },
		{ weapon = 'WEAPON_FLARE', price = 200 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { nil, 1, 1,1 ,1}, price = 5000 },
		{ weapon = 'WEAPON_SMG',components = { nil, 1, 1,1 ,1,1,1}, price = 15000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',components = { 1, 1, 1}, price = 15000 }


	},

	sergeant2 = {
	--	{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
		{ weapon = 'WEAPON_BZGAS', price = 200 },
		{ weapon = 'WEAPON_FLARE', price = 200 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_SMG',components = { nil, 1, 1,1 ,1,1,1}, price = 15000 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { nil, 1, 1, 1,1}, price = 5000 },
		{ weapon = 'WEAPON_CARBINERIFLE',components = { nil, 1, 1, 1,1,1,1,1}, price = 30000 },
		--{ weapon = 'WEAPON_SMG',components = { nil, 500, 500,500 ,500,500,500}, price = 15000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',components = { 1, 1, 1}, price = 15000 }
	},


	lieutenant = {
		--{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		---{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 } 
		{ weapon = 'WEAPON_BZGAS', price = 200 },
		{ weapon = 'WEAPON_FLARE', price = 200 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { nil, 1, 1,1 ,1}, price = 5000 },
		{ weapon = 'WEAPON_SMG',components = { nil, 1, 1,1 ,1,1,1}, price = 15000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',components = { 1, 1, 1}, price = 15000 },
	--	{ weapon = 'WEAPON_ASSAULTSMG',components = { nil, 500, 500,500 ,500,500}, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',components = { nil, 1, 1,1 ,1,1,1,1}, price = 30000 },
		{ weapon = 'WEAPON_SNIPERRIFLE',components = { 1, 1, 1,1}, price = 40000 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 }
	},

	chef = {
	--	{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
	--	{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
	--	{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
		{ weapon = 'WEAPON_BZGAS', price = 200 },
		{ weapon = 'WEAPON_FLARE', price = 200 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { nil, 1, 1,1 ,1}, price = 5000 },
		{ weapon = 'WEAPON_REVOLVER', price = 7000 },
		{ weapon = 'WEAPON_SMG',components = { nil, 1, 1,1 ,1,1,1}, price = 15000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',components = { 1, 1, 1}, price = 15000 },
			{ weapon = 'WEAPON_BULLPUPSHOTGUN',components = { 1, 1, 1}, price = 20000 },
		{ weapon = 'WEAPON_ASSAULTSMG',components = { nil, 500, 500,500 ,500,500}, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',components = { nil, 1, 1,1 ,1,1,1,1}, price = 30000 },
		{ weapon = 'WEAPON_SNIPERRIFLE',components = { 1, 1, 1,1}, price = 250000 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 }
	},
	GSI = {
	--	{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
	--	{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
	--	{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
		{ weapon = 'WEAPON_BZGAS', price = 200 },
		{ weapon = 'WEAPON_FLARE', price = 200 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { nil, 1, 1,1 ,1}, price = 5000 },
		--{ weapon = 'WEAPON_REVOLVER', price = 7000 },
		{ weapon = 'WEAPON_SMG',components = { nil, 1, 1,1 ,1,1,1}, price = 15000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',components = { 1, 1, 1}, price = 15000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN',components = { 1, 1, 1}, price = 20000 },
		{ weapon = 'WEAPON_ASSAULTSMG',components = { nil, 500, 500,500 ,500,500}, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',components = { nil, 1, 1,1 ,1,1,1,1}, price = 30000 },
		{ weapon = 'WEAPON_SNIPERRIFLE',components = { 1, 1, 1,1}, price = 40000 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 }
	},

	boss = {
	--	{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
	--	{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		--{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		--{ weapon = 'WEAPON_STUNGUN', price = 500 },
	--	{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
		{ weapon = 'WEAPON_BZGAS', price = 200 },
		{ weapon = 'WEAPON_FLARE', price = 200 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 500 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_STUNGUN', price = 2000 },
		{ weapon = 'WEAPON_VINTAGEPISTOL', price = 2000 },
		{ weapon = 'WEAPON_COMBATPISTOL', components = { nil, 1, 1,1 ,1}, price = 5000 },
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 7000 },
		{ weapon = 'WEAPON_SMG',components = { nil, 1, 1,1 ,1,1,1}, price = 15000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN',components = { 1, 1, 1}, price = 15000 },
		{ weapon = 'WEAPON_BULLPUPSHOTGUN',components = { 1, 1, 1}, price = 20000 },
		{ weapon = 'WEAPON_ASSAULTSMG',components = { nil, 500, 500,500 ,500,500}, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE',components = { nil, 1, 1,1 ,1,1,1,1}, price = 30000 },
		{ weapon = 'WEAPON_SNIPERRIFLE',components = { 1, 1, 1,1}, price = 40000 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 }

	}
}

Config.AuthorizedVehicles = {
	Shared = {
		
	},
	
	juge = {
	    { model = 'schafter5', label = 'Schafter Blindé', price = 30000 }
	},

	recruit = {
		{ model = 'police', label = 'Police Stanier', price = 15000 }
	},

	officer = {

		{ model = 'police', label = 'Police Stanier', price = 15000 },
		{ model = 'police4', label = 'Cruiser Banalisée', price = 20000 },
		{ model = 'police3', label = 'Police Cruiser Interceptor', price = 25000 }
	},

	sergeant = {
		{ model = 'police', label = 'Police Stanier', price = 15000 },
		{ model = 'police4', label = 'Cruiser Banalisée', price = 20000 },
		{ model = 'policeb', label = 'Police Bike', price = 10000 },
		{ model = 'policet', label = 'Police Transporter', price = 20000 },
		{ model = 'police3', label = 'Police Cruiser Interceptor', price = 25000 }
	},

	sergeant2 = {
		{ model = 'police', label = 'Police Stanier', price = 15000 },
		{ model = 'police4', label = 'Cruiser Banalisée', price = 20000 },
		{ model = 'policeb', label = 'Police Bike', price = 10000 },
		{ model = 'police3', label = 'Police Cruiser Interceptor', price = 25000 },
		{ model = 'policet', label = 'Police Transporter', price = 20000 },
		{ model = 'police2', label = 'Police Cruiser Buffalo', price = 22000 },
		{ model = 'fbi', label = 'Buffalo banalisé', price = 50000 }
		--{ model = 'policefelon', label = 'Felon Banalisée', price = 30000 }
	},

	lieutenant = {
		{ model = 'police', label = 'Police Stanier', price = 15000 },
		{ model = 'police3', label = 'Police Cruiser Interceptor', price = 25000 },
		{ model = 'policeb', label = 'Police Bike', price = 10000 },
		{ model = 'police4', label = 'Cruiser Banalisée', price = 20000 },
		{ model = 'policet', label = 'Police Transporter', price = 20000 },
		{ model = 'police2', label = 'Police Cruiser Buffalo', price = 22000 },
		{ model = 'fbi', label = 'Buffalo banalisé', price = 50000 }
		--{ model = 'policefelon', label = 'Felon Banalisée', price = 30000 },
		--{ model = 'polaventa', label = 'VRI Aventador', price = 100000 },
	},

	chef = {
		{ model = 'police', label = 'Police Stanier', price = 15000 },
		{ model = 'police3', label = 'Police Cruiser Interceptor', price = 25000 },
		{ model = 'policeb', label = 'Police Bike', price = 10000 },
		{ model = 'police4', label = 'Cruiser Banalisée', price = 20000 },
		{ model = 'policet', label = 'Police Transporter', price = 20000 },
	--	{ model = 'pbus', label = 'Police Bus', price = 23000 },
		{ model = 'riot', label = 'Police Riot', price = 40000 },
		{ model = 'riot2', label = 'Police Riot Advanced', price = 60000 },
		{ model = 'police2', label = 'Police Cruiser Buffalo', price = 22000 },
		{ model = 'fbi', label = 'Buffalo banalisé', price = 50000 },
		--{ model = 'police2', label = 'Police SuperAdvanced', price = 100000},
		{ model = 'fbi2', label = 'IAA SUV', price = 30000 },
		{ model = 'insurgent2', label = 'Insurgent', price = 58000 }--,
		--{ model = 'policefelon', label = 'Felon Banalisée', price = 30000 },
		--{ model = 'polaventa', label = 'VRI Aventador', price = 100000 },
		--{ model = 'polf430', label = 'VRI F430', price = 100000 },
		--{ model = 'pol718', label = 'VRI 718', price = 100000 }


	},

	GSI = {
		{ model = 'police', label = 'Police Stanier', price = 15000 },
		{ model = 'police3', label = 'Police Cruiser Interceptor', price = 25000 },
	--	{ model = 'police2', label = 'Police Cruiser Buffalo', price = 22000 },
	--	{ model = 'policeb', label = 'Police Bike', price = 10000 },
		{ model = 'police4', label = 'Cruiser Banalisée', price = 20000 },
		{ model = 'policet', label = 'Police Transporter', price = 20000 },
	--	{ model = 'pbus', label = 'Police Bus', price = 23000 },
		{ model = 'riot', label = 'Police Riot', price = 40000 },
		{ model = 'riot2', label = 'Police Riot Advanced', price = 60000 },
	--	{ model = 'police2', label = 'Police SuperAdvanced', price = 100000},
		{ model = 'fbi2', label = 'SUV Banalisé', price = 30000 },
		{ model = 'police2', label = 'Police Cruiser Buffalo', price = 22000 },
		{ model = 'fbi', label = 'Buffalo banalisé', price = 50000 },
		{ model = 'oracle', label = 'Oracle', price = 30000 },
		{ model = 'exemplar', label = 'Exemplar', price = 30000 },
		{ model = 'raiden', label = 'Raiden', price = 30000 },
		{ model = 'insurgent2', label = 'Insurgent', price = 58000 }--,
		--{ model = 'policefelon', label = 'Felon Banalisée', price = 30000 }


	},

	boss = {
		{ model = 'police', label = 'Police Stanier', price = 15000 },
		{ model = 'police3', label = 'Police Cruiser Interceptor', price = 25000 },
		
		{ model = 'policeb', label = 'Police Bike', price = 10000 },
		{ model = 'police4', label = 'Cruiser Banalisée', price = 20000 },
		{ model = 'policet', label = 'Police Transporter', price = 20000 },
	--	{ model = 'pbus', label = 'Police Bus', price = 23000 },
		{ model = 'riot', label = 'Police Riot', price = 40000 },
		{ model = 'riot2', label = 'Police Riot Advanced', price = 60000 },
	--	{ model = 'police2', label = 'Police SuperAdvanced', price = 100000 },
		{ model = 'fbi2', label = 'SUV banalisé', price = 30000 },
		--{ model = 'policefelon', label = 'Felon Banalisée', price = 30000 },
		{ model = 'police2', label = 'Police Cruiser Buffalo', price = 22000 },
		{ model = 'fbi', label = 'banalisé cmdt', price = 50000 },
		{ model = 'oracle', label = 'Oracle', price = 30000 },
		{ model = 'exemplar', label = 'Exemplar', price = 30000 },
		{ model = 'raiden', label = 'Raiden', price = 30000 },
		{ model = 'insurgent2', label = 'Insurgent', price = 58000 }--,--,
		--{ model = 'polaventa', label = 'VRI Aventador', price = 100000 },		
		--{ model = 'polf430', label = 'VRI F430', price = 100000 },
		--{ model = 'pol718', label = 'VRI 718', price = 100000 }
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	sergent2 = {},

	lieutenant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 100000 },
		{ model = 'buzzard2', label = 'buzzard', livery = 0, price = 100000 }
	},

	chef = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 100000 },
		{ model = 'buzzard2', label = 'buzzard', livery = 0, price = 100000 }
	},

	GSI = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 100000 },
		{ model = 'buzzard2', label = 'buzzard', livery = 0, price = 100000 }
	},

	boss = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 100000 },
		{ model = 'buzzard2', label = 'buzzard', livery = 0, price = 100000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 6,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 15,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 15,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant2_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 15,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 15,   ['decals_2'] = 6,
			['arms'] = 41,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 15,   ['decals_2'] = 7,
			['arms'] = 41,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	GSI_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 0,
			
			['arms'] = 19,
			['pants_1'] = 52,   ['pants_2'] = 1,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['Bag'] = 69,    ['bag_2'] = 3,
			['ears_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 84,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 61,   ['pants_2'] = 0,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 15,   ['decals_2'] = 8,
			['arms'] = 41,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	boss2_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 73,   ['torso_2'] = 17,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 23,   ['pants_2'] = 8,
			['shoes_1'] = 22,   ['shoes_2'] = 5,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 6,    ['chain_2'] = 1,
		--	['ears_1'] = 5,     ['ears_2'] = 5,
			--['glasses_1'] = 5,     ['glasses_2'] = 5,
			['Bag'] = 74,    ['bag_2'] = 1,


		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	helicopterpilot_wear = {
        male = {
                ['tshirt_1']     = 130,['tshirt_2']     = 0,
                ['torso_1']      = 54,['torso_2']      = 0,
                ['arms']         = 96,
                ['pants_1']      = 92,['pants_2']      = 4,
                ['shoes_1']      = 60,['shoes_2']      = 0,
                ['mask_1']       = 0,['mask_2']       = 0,
                ['chain_1']      = 0,['chain_2']      = 0,
                ['helmet_1']     = 79,['helmet_2']     = 1,
                ['glasses_1']    = 0,['glasses_2']    = 0,
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
		investigator_wear = {
       	male = {
                ['tshirt_1']     = 114,['tshirt_2']     = 2,
                ['torso_1']      = 50,['torso_2']      = 0,
                ['arms']         = 19,
                ['pants_1']      = 49,['pants_2']      = 1,
                ['shoes_1']      = 25,['shoes_2']      = 0,
                ['mask_1']       = 0,['mask_2']       = 0,
                ['chain_1']      = 1,['chain_2']      = 0,
                ['helmet_1']     = 58,['helmet_2']     = 2,
                ['glasses_1']    = 5,['glasses_2']    = 1,
				['Bag']          = 45,['bag_2']      = 0,
               }, 
        female = {
                ['tshirt_1']     = 80,['tshirt_2']     = 4,
                ['torso_1']      = 43,['torso_2']      = 0,
                ['arms']         = 18,
                ['pants_1']      = 51,['pants_2']      = 1,
                ['shoes_1']      = 25,['shoes_2']      = 0,
                ['mask_1']       = 0,['mask_2']       = 0,
                ['chain_1']      = 125,['chain_2']      = 0,
                ['helmet_1']     = 58,['helmet_2']     = 2,
                ['glasses_1']    = 7,['glasses_2']    = 1,
				['Bag']          = 45,['bag_2']      = 0,
                }
         },
         motorcyclist_wear = {
        male = {
                ['tshirt_1']     = 122, 	['tshirt_2']     = 0,
                ['torso_1']      = 55,		['torso_2']      = 0,
                ['arms']         = 30,
                ['pants_1']      = 32,		['pants_2']      = 0,
                ['shoes_1']      = 25,		['shoes_2']      = 0,
                ['mask_1']       = 0,		['mask_2']       = 0,
                ['chain_1']      = 0,		['chain_2']      = 0,
                ['helmet_1']     = 17,		['helmet_2']     = 1,
                ['glasses_1']    = 5,		['glasses_2']    = 1,
         	},
        female = {
         		['tshirt_1']     = 122,	['tshirt_2']     = 0,
                ['torso_1']      = 55,	['torso_2']      = 0,
                ['arms']         = 30,
                ['pants_1']      = 98,	['pants_2']      = 5,
                ['shoes_1']      = 51,	['shoes_2']      = 0,
                ['mask_1']       = 0,	['mask_2']       = 0,
                ['chain_1']      = 0,	['chain_2']      = 0,
                ['helmet_1']     = 17,	['helmet_2']     = 7,
                ['glasses_1']    = 5,	['glasses_2']    = 1,
               }
         },
    enquete_wear = {
		male = {
			['tshirt_1'] = 65,  ['tshirt_2'] = 0,
			['torso_1'] = 35,   ['torso_2'] = 1,
			['arms'] = 39,
			['pants_1'] = 35,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 6,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 53,  ['tshirt_2'] = 0,
			['torso_1'] = 168,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 53,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
--[[
	swat_wear = { -- currently the same as chef_wear
		male = {
		
			['tshirt_1'] = 129,  ['tshirt_2'] = 0,
			['torso_1'] = 111,   ['torso_2'] = 3,
			['decals_1'] = -1,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = 117,  ['helmet_2'] = 0,
			['mask_1'] = 52,  ['mask_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 2,
	['bag'] = 45,   ['face'] = 1,
	
			['chain_1'] = 112,    ['chain_2'] = 2,
			['ears_1'] = 5,     ['ears_2'] = 5,
			['glasses_1'] = -1,     ['glasses_2'] = 0


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
]]


swat_wear = { -- currently the same as chef_wear
		male = {
		
			['tshirt_1'] = 49,  ['tshirt_2'] = 0,
			['torso_1'] = 49,   ['torso_2'] = 2,
			['arms'] = 17,
			['pants_1'] = 31,   ['pants_2'] = 2,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['helmet_1'] = 75,  ['helmet_2'] = 0,
			['mask_1'] = 126,  ['mask_2'] = 10,
		--	['bproof_1'] = 16,  ['bproof_2'] = 2,
		--	['bag'] = 45,   
	
			--['chain_1'] = 119,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 5,
			['glasses_1'] = 15,     ['glasses_2'] = 0


		},
		female = {
			['tshirt_1'] = 32,  ['tshirt_2'] = 0,
			['torso_1'] = 42,   ['torso_2'] = 2,
			['decals_1'] = -1,   ['decals_2'] = 0,
			['arms'] = 18,
			['pants_1'] = 30,   ['pants_2'] = 2,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 74,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['mask_1'] = 126,  ['mask_2'] = 10,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['glasses_1'] = 9,     ['glasses_2'] = 1
		}
	},



	highway_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 1,
			['torso_1'] = 32,   ['torso_2'] = 0,
		
			['arms'] = 55,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
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
			['bproof_1'] = 12,  ['bproof_2'] = 3
		},
		female = {
			['bproof_1'] = 11,  ['bproof_2'] = 3
		}
	},
	gilet_wear = {
		male = {
			['bproof_1'] = 10,  ['tshirt_2'] = 1
		},
		female = {
			['bproof_1'] = 9,  ['bproof_2'] = 1
		}
	}

}


