Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnableJobLogs              = true
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = false -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = false -- enable if you're using esx_license


Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.mecanoStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(-206.05, -1307.56, 30.26),
			Sprite  = 446,
			Display = 4,
			Scale   = 1.2,
			Colour  = 47
		},

		Cloakrooms = {
			vector3(-224.17, -1320.14, 29.89)
		},

		Armories = {
			vector3(-196.48, -1314.76, 30.28)
		},

		Vehicles = {
			{
				Spawner = vector3(-208.54, -1311.32, 30.89),
				InsideShop = vector3(225.43, -983.17, -99.5),
				SpawnPoints = {
					{ coords = vector3(-202.97, -1297.39, 29.92), heading = 180.7, radius = 6.0 },
					{ coords = vector3(-198.18, -1297.56, 29.93), heading = 180.7, radius = 6.0 },
					{ coords = vector3(-184.47, -1313.55, 29.93), heading = 359.65, radius = 6.0 },
					{ coords = vector3(-212.02, -1307.52, 29.93), heading = 271.75, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(-173.05, -1309.50, 31.33),
				InsideShop = vector3(-178.10, -1302.58, 30.76),
				SpawnPoints = {
					{ coords = vector3(-178.10, -1302.58, 30.76), heading = 269.42, radius = 6.0 }
				}
			}
		},



		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(-207.70, -1341.61, 33.89)
		}

	}

}



Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'towtruck2', label = 'SlamVan Remorque', price = 10000 },
			{ model = 'towtruck', label = 'Remorqueur', price = 10000 },
			{ model = 'flatbed', label = 'Plateau', price = 10000 },
			{ model = 'slamvan3', label = 'Slamvan', price = 10000 }
	},

	recrue = {
		
	},

	novice = {
		--{ model = 'mecano', label = 'mecano Cruiser Stanier', price = 1 }
	},

	experimente = {
		--{ model = 'mecano', label = 'mecano Cruiser Stanier', price = 1 },
		--{ model = 'mecano3', label = 'mecano Cruiser Interceptor', price = 1 }
	},

	chief = {


	},

	boss = {
	
	}
}

Config.AuthorizedHelicopters = {
	recrue = {
		{ model = 'cargobob2', label = 'Hélicoptère', livery = 0, price = 200000 }
	},

	novice = {
{ model = 'cargobob2', label = 'Hélicoptère', livery = 0, price = 200000 }
	},

	experimente = {
{ model = 'cargobob2', label = 'Hélicoptère', livery = 0, price = 200000 }
	},


	chief = {
	{ model = 'cargobob2', label = 'Hélicoptère', livery = 0, price = 200000 }
	},

	boss = {
	{ model = 'cargobob2', label = 'Hélicoptère', livery = 0, price = 200000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
    
	recrue_wear = {
	  male = {
		  ['tshirt_1']  = 88, ['tshirt_2']  = 0,
		  ['torso_1']   = 164,  ['torso_2']   = 1,
		  ['arms']      = 59,
		  ['pants_1']   = 103,  ['pants_2']   = 0,
		  ['shoes_1']   = 12,  ['shoes_2']   = 0,
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
	novice_wear = {
    male = {
		  ['tshirt_1']  = 88, ['tshirt_2']  = 0,
		  ['torso_1']   = 164,  ['torso_2']   = 1,
		  ['arms']      = 59,
		  ['pants_1']   = 103,  ['pants_2']   = 0,
		  ['shoes_1']   = 12,  ['shoes_2']   = 0,
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
	experimente_wear = {
	  male = {
		 ['tshirt_1']  = 88, ['tshirt_2']  = 0,
		  ['torso_1']   = 164,  ['torso_2']   = 1,
		  ['arms']      = 59,
		  ['pants_1']   = 103,  ['pants_2']   = 0,
		  ['shoes_1']   = 12,  ['shoes_2']   = 0,
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
	chief_wear = {
	  male = {
		 ['tshirt_1']  = 88, ['tshirt_2']  = 0,
		  ['torso_1']   = 164,  ['torso_2']   = 1,
		  ['arms']      = 59,
		  ['pants_1']   = 103,  ['pants_2']   = 0,
		  ['shoes_1']   = 12,  ['shoes_2']   = 0,
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
	boss_wear = {
	  male = {
		  ['tshirt_1']  = 88, ['tshirt_2']  = 0,
		  ['torso_1']   = 237,  ['torso_2']   = 18,
		  ['arms']      = 56,
		  ['pants_1']   = 103,  ['pants_2']   = 0,
		  ['shoes_1']   = 12,  ['shoes_2']   = 0,
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
	}
}