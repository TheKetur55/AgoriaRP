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
			vector3(903.86, -3199.97, -97.18)
		},

		Armories = {
			vector3(893.72, -3220.92, -98.23)
		},
		
		Armories2 = {
			vector3(842.72, -3244.92, -98.69)
		},

		Vehicles = {
			{
				Spawner = vector3(835.47,-3237.33,-98.69),
				InsideShop = vector3(839.20 , -3238.13 ,  -98.69),
				SpawnPoints = {
					{ coords = vector3(839.20 , -3238.13 ,  -98.69), heading = 257.91, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(2690.90  ,  1363.65  ,  23.94),
				InsideShop = vector3(2691.08 ,  1358.08  , 24.52),
				SpawnPoints = {
					{ coords = vector3(2691.08 ,  1358.08  , 24.52), heading = 181.39, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(891.75, -3227.12, -98.23)
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
		{ model = 'schafter5', label = 'Schafter V12 Blindé', price = 50000 },
		{ model = 'baller5', label = 'Baller blindé', price = 150000},
		{ model = 'airtug', label = 'airtug', price = 1 },
		{ model = 'kuruma2', label = 'Kuruma Blindé', price = 200000 }
	},

	chef = {
		{ model = 'kuruma2', label = 'Kuruma Blindé', price = 100000 },
		{ model = 'schafter5', label = 'Schafter V12 Blindé', price = 80000 },
		{ model = 'barracks', label = 'Transporteur', price = 158000 },
		{ model = 'trash', label = 'Camion Poubelle', price = 50000 },
		{ model = 'mule4', label = 'Camion', price = 90000 },
		{ model = 'airtug', label = 'airtug', price = 1 },
		{ model = 'baller5', label = 'Baller blindé', price = 150000}


	},

	boss = {
		{ model = 'kuruma2', label = 'Kuruma Blindé', price = 200000 },
		{ model = 'schafter5', label = 'Schafter V12 Blindé', price = 80000 },
		{ model = 'barracks', label = 'Transporteur', price = 158000 },
		{ model = 'trash', label = 'Camion Poubelle', price = 50000 },
		{ model = 'mule4', label = 'Camion', price = 90000 },
		{ model = 'airtug', label = 'airtug', price = 1 },
		{ model = 'dominator4', label = 'Dominator blindé', price = 350000},
		{ model = 'baller5', label = 'Baller blindé', price = 150000}
		

	}
}

Config.AuthorizedHelicopters = {
	malfrat = {
		
	},

	chef = {
		{ model = 'valkyrie', label = 'Valkyrie', livery = 0, price = 2500000 }
	},

	boss = {
		{ model = 'valkyrie', label = 'Valkyrie', livery = 0, price = 2500000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	




	chef_wear = { -- Co-Boss
		male = {
			['bproof_1'] = 27,  ['bproof_2'] = 5,
			['mask_1'] = 117,    ['mask_2'] = 8,
			['bags_1'] = 45,    ['bags_2'] = 0,
			
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 182,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,  	['arms_2'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 2,
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
			['bproof_1'] = 27,  ['bproof_2'] = 5,
			['mask_1'] = 117,    ['mask_2'] = 8,
			['bags_1'] = 45,    ['bags_2'] = 0,
			
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 182,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,  	['arms_2'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 2,
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
			['bproof_1'] = 27,  ['bproof_2'] = 5,
			['mask_1'] = 117,    ['mask_2'] = 8,
			['bags_1'] = 45,    ['bags_2'] = 0,
			
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 182,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,  	['arms_2'] = 0,
			['pants_1'] = 31,   ['pants_2'] = 2,
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
	
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
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
	
	
	ambl_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 250,   ['torso_2'] = 1,
			['decals_1'] = 58,   ['decals_2'] = 0,
			['arms'] = 74,
			['pants_1'] = 96,   ['pants_2'] = 1,
			['shoes_1'] = 15,   ['shoes_2'] = 1,
			['helmet_1'] = 122,  ['helmet_2'] = 1,
			['chain_1'] = 126,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0
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
	
	novice_wear = {
    male = {
		  ['tshirt_1']  = 15, ['tshirt_2']  = 0,
		  ['torso_1']   = 80,  ['torso_2']   = 1,
		  ['arms']      = 19,
		  ['pants_1']   = 62,  ['pants_2']   = 0,
		  ['shoes_1']   = 12,  ['shoes_2']   = 6,
		  ['glasses_1'] = 0,   ['glasses_2'] = 0,
		  ['ears_1']    = -1,   ['ears_2']    = 0,
		  ['mask_1']    = 0,   ['mask_2']    = 0,
		  ['helmet_1']  = 56,  ['helmet_2']  = 4,
		  ['chain_1']   = 0,   ['chain_2']   = 0
	  },
    female = {
      ['tshirt_1']  = 14, ['tshirt_2']  = 0,
      ['torso_1']   = 86,  ['torso_2']   = 0,
      ['arms']      = 9,
      ['pants_1']   = 45,  ['pants_2']   = 2,
      ['shoes_1']   = 52,  ['shoes_2']   = 0,
      ['glasses_1'] = 5,   ['glasses_2'] = 0,
      ['ears_1']    = 0,   ['ears_2']    = 0,
      ['mask_1']    = 0,   ['mask_2']    = 0,
      ['helmet_1']  = -1,  ['helmet_2']  = 0,
      ['chain_1']   = 0,   ['chain_2']   = 0,
      ['ears_1']    = -1,  ['ears_2']    = 0
    }
	},
	
	tireur_wear = {
    male = {
		  ['tshirt_1']  = 15, ['tshirt_2']  = 0,
		  ['torso_1']   = 139,  ['torso_2']   = 3,
		  ['arms']      = 33,
		  ['pants_1']   = 24,  ['pants_2']   = 0,
		  ['shoes_1']   = 10,  ['shoes_2']   = 0,
		  ['glasses_1'] = 0,   ['glasses_2'] = 0,
		  ['ears_1']    = -1,   ['ears_2']    = 0,
		  ['mask_1']    = 117,   ['mask_2']    = 8,
		  ['helmet_1']  = -1,  ['helmet_2']  = 0,
		  ['chain_1']   = 0,   ['chain_2']   = 0,
		  ['bags_1'] = 45,    ['bags_2'] = 0
	  },
    female = {
      ['tshirt_1']  = 15, ['tshirt_2']  = 0,
		  ['torso_1']   = 139,  ['torso_2']   = 3,
		  ['arms']      = 33,
		  ['pants_1']   = 24,  ['pants_2']   = 0,
		  ['shoes_1']   = 10,  ['shoes_2']   = 0,
		  ['glasses_1'] = 0,   ['glasses_2'] = 0,
		  ['ears_1']    = -1,   ['ears_2']    = 0,
		  ['mask_1']    = 117,   ['mask_2']    = 8,
		  ['helmet_1']  = -1,  ['helmet_2']  = 0,
		  ['chain_1']   = 0,   ['chain_2']   = 0,
		  ['bags_1'] = 45,    ['bags_2'] = 0
    }
	},
	


	bullet_wear = {
		male = {
			['bproof_1'] = 27,  ['bproof_2'] = 5
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