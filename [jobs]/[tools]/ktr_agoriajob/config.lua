Config                            = {}

Config.DrawDistance               = 5.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license


Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.PoliceStations = {

	LSPD = {

		

		Cloakrooms = {
			vector3(1118.47, -3143.54, -37.06)
		},

		Armories = {
			vector3(1122.46, -3162.10, -36.87)
		},

		Vehicles = {
			{
				Spawner = vector3(1758.26, -1650.85, 112.66),
				InsideShop = vector3(1109.20, -3162.53, -37.51),
				SpawnPoints = {
					{ coords = vector3(1760.67, -1658.70, 112.72), heading = 190.83, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(1111.43, -3151.76, -37.51),
				InsideShop = vector3(-1145.87, -2864.66, 13.94),
				SpawnPoints = {
					{ coords = vector3(1771.54, -1659.44, 112.64), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(1115.55, -3152.45, -40.87)
		}

	}

}

Config.AuthorizedWeapons = {
	malfrat = {
		
		{ weapon = 'GADGET_PARACHUTE', price = 3000 }
		
},
	chef = {
		
		{ weapon = 'GADGET_PARACHUTE', price = 3000 }
		
	},

	boss = {

		{ weapon = 'GADGET_PARACHUTE', price = 3000 }
		

	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'bf400', label = 'BF400', price = 8000 }
	},

	malfrat = {
		{ model = 'schafter5', label = 'Schafter V12 Blindé', price = 50000 }
	},

	chef = {
		{ model = 'kuruma2', label = 'Kuruma Blindé', price = 100000 },
		{ model = 'schafter5', label = 'Schafter V12 Blindé', price = 80000 },
		{ model = 'barracks', label = 'Transporteur', price = 158000 },
		{ model = 'trash', label = 'Camion Poubelle', price = 50000 },
		{ model = 'mule4', label = 'Camion', price = 90000 }


	},

	boss = {
		{ model = 'kuruma2', label = 'Kuruma Blindé', price = 100000 },
		{ model = 'schafter5', label = 'Schafter V12 Blindé', price = 80000 },
		{ model = 'barracks', label = 'Transporteur', price = 158000 },
		{ model = 'trash', label = 'Camion Poubelle', price = 50000 },
		{ model = 'mule4', label = 'Camion', price = 90000 },
		{ model = 'dominator4', label = 'Dominator blindé', price = 350000}
		

	}
}

Config.AuthorizedHelicopters = {
	malfrat = {
		
	},

	chef = {
		{ model = 'valkyrie', label = 'Valkyrie', livery = 0, price = 1500000 }
	},

	boss = {
		{ model = 'valkyrie', label = 'Valkyrie', livery = 0, price = 1500000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	




	chef_wear = { -- Co-Boss
		male = {
			['bproof_1'] = 16,  ['bproof_2'] = 2,
			['mask_1'] = 117,    ['mask_2'] = 8,
			['bags_1'] = 45,    ['bags_2'] = 0,
			
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 171,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,  	['arms_2'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,  ['chain_2'] = 0,
			['ears_1'] = -1,    ['ears_2'] = 0,
			['glasses_1'] = -1, ['glasses_2'] = 0


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




	

	boss_wear = { -- currently the same as chef_wear
		male = {
			['bproof_1'] = 16,  ['bproof_2'] = 2,
			['mask_1'] = 117,    ['mask_2'] = 8,
			['bags_1'] = 45,    ['bags_2'] = 0,
			
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 171,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,  	['arms_2'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,  ['chain_2'] = 0,
			['ears_1'] = -1,    ['ears_2'] = 0,
			['glasses_1'] = -1, ['glasses_2'] = 0


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

	malfrat_wear = { -- currently the same as chef_wear
		male = {
			['bproof_1'] = 16,  ['bproof_2'] = 2,
			['mask_1'] = 117,    ['mask_2'] = 8,
			['bags_1'] = 45,    ['bags_2'] = 0,
			
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 171,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,  	['arms_2'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,  ['chain_2'] = 0,
			['ears_1'] = -1,    ['ears_2'] = 0,
			['glasses_1'] = -1, ['glasses_2'] = 0


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
			['bproof_1'] = 11,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}