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
Config.EnableJobLogs              = false

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'
Config.gouvStations = {

	LSPD = {

		--[[Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},]]

		Cloakrooms = {
			vector3(-354.13, -998.23, 31.25)
		},

		Armories = {
			vector3(-345.09, -979.47, 36.75)
		},

	--	Armoriess = {
	--		vector3(465.13, -989.95, 24.90)
	--	},

		Vehicles = {
			{
				Spawner = vector3(-364.95, -994.68, 31.25),
				InsideShop = vector3(-347.02, -1009.76, 30.35),
				SpawnPoints = {
					{ coords = vector3(-347.02, -1009.76, 30.35), heading = 256.34, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-374.34, -994.21, 37.54),
				InsideShop = vector3(-366.95, -1004.21, 38.20),
				SpawnPoints = {
					{ coords = vector3(-366.95, -1004.21, 38.20), heading = 91.07, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(-347.67, -989.88, 36.74)
		}

	}

}

Config.AuthorizedWeapons = {
	gdc = {
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 750 },
		{ weapon = 'WEAPON_STUNGUN', price = 2500 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 10000 },
		{ weapon = 'WEAPON_SMG', price = 15000 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 }
	},


	gdcc = {
		{ weapon = 'WEAPON_FLASHLIGHT', price = 500 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 750 },
		{ weapon = 'WEAPON_STUNGUN', price = 2500 },
		{ weapon = 'WEAPON_COMBATPISTOL', price = 8500 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', price = 10000 },
		{ weapon = 'WEAPON_SMG', price = 15000 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 }
	},

	juge = {
{ weapon = 'GADGET_PARACHUTE', price = 5000 }
	},
	procureur = {
{ weapon = 'GADGET_PARACHUTE', price = 5000 }
	},

	boss = {
{ weapon = 'GADGET_PARACHUTE', price = 5000 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		
	},

	gdc = {
		{ model = 'cognoscenti2', label = 'Cognoscenti Blindé', price = 75000 },
		{ model = 'xls2', label = 'XLS Blindé', price = 75000 },
		{ model = 'baller6', label = 'Baller Blindé', price = 80000 },
		{ model = 'schafter5', label = 'Schafter Blindé', price = 75000 }
	},


	gdcc = {
		{ model = 'cognoscenti2', label = 'Cognoscenti Blindé', price = 75000 },
		{ model = 'xls2', label = 'XLS Blindé', price = 75000 },
		{ model = 'baller6', label = 'Baller Blindé', price = 80000 },
		{ model = 'schafter5', label = 'Schafter Blindé', price = 75000 }
	},

	juge = {
		{ model = 'schafter3', label = 'Schafter', price = 50000 }


	},

	procureur = {
		{ model = 'schafter3', label = 'Schafter', price = 50000 }


	},

	boss = {
		{ model = 'cognoscenti2', label = 'Cognoscenti Blindé', price = 75000 },
		{ model = 'xls2', label = 'XLS Blindé', price = 75000 },
		{ model = 'baller6', label = 'Baller Blindé', price = 80000 },
		{ model = 'schafter5', label = 'Schafter Blindé', price = 75000 }
	}
}

Config.AuthorizedHelicopters = {


	gdcc = {
		{ model = 'volatus', label = 'Volatus', livery = 0, price = 250000 }
	},

	gdc = {
		{ model = 'volatus', label = 'Volatus', livery = 0, price = 250000 }
	},

	juge = {
--		{ model = 'volatus', label = 'Volatus', livery = 0, price = 250000 }
	},

	procureur = {
--	{ model = 'volatus', label = 'Volatus', livery = 0, price = 250000 }
	},

	boss = {
		{ model = 'volatus', label = 'Volatus', livery = 0, price = 250000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
    tenu_gdc = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 49,   ['torso_2'] = 2,
			['arms'] = 39,
			['pants_1'] = 33,   ['pants_2'] = 0,
			['shoes_1'] = 50,   ['shoes_2'] = 0,
			['chain_1'] = 6,    ['chain_2'] = 0,
		--	['helmet_1'] = 10,  ['helmet_2'] = 6,
		--	['chain_1'] = 0,    ['chain_2'] = 0,
		--	['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 84,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 61,   ['pants_2'] = 0,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	 tenu_gdcc = {
		male = {
			['tshirt_1'] = 21,  ['tshirt_2'] = 0,
			['torso_1'] = 4,   ['torso_2'] = 0,
			['arms'] = 12,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
		--	['helmet_1'] = 10,  ['helmet_2'] = 6,
			['chain_1'] = 6,    ['chain_2'] = 0,
		--	['ears_1'] = 2,    
		 ['mask_1'] = 121
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 0,
			['torso_1'] = 84,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 61,   ['pants_2'] = 0,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},

	 juge_gdcc = {
		male = {
			['tshirt_1'] = 21,  ['tshir_t2'] = 0,
			['torso_1'] = 4,   ['torso_2'] = 0,
			['arms'] = 12,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
		--	['helmet_1'] = 10,  ['helmet_2'] = 6,
			['chain_1'] = 6,    ['chain_2'] = 0,
		--	['ears_1'] = 2,    
		 ['mask_1'] = 121
		},
		female = {
			['tshirt_1'] = 60,  ['tshirt_2'] = 1,
			['torso_1'] = 66,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 6,
			['pants_1'] = 6,   ['pants_2'] = 0,
			['shoes_1'] = 19,   ['shoes_2'] = 3,
			--['helmet_1'] = 45,  ['helmet_2'] = 0,
			--['chain_1'] = 0,    ['chain_2'] = 0,
		--	['ears_1'] = 2,     ['ears_2'] = 0
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
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}


