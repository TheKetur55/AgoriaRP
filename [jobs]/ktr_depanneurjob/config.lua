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

Config.depanneurStations = {

	LSPD = {

		--[[Blip = {
			Coords  = vector3(-206.05, -1307.56, 30.26),
			Sprite  = 446,
			Display = 4,
			Scale   = 1.2,
			Colour  = 47
		},]]

		Cloakrooms = {
			vector3(-1140.26, -2006.01, 13.18)
		},

		Armories = {
			vector3(-196.48, -1314.76, 30.28)
		},

		Vehicles = {
			{
				Spawner = vector3(-1142.30, -1992.82, 13.16),
				InsideShop = vector3(-1136.30, -1994.03, 13.16),
				SpawnPoints = {
					{ coords = vector3(-1136.30, -1994.03, 13.16), heading = 225.40, radius = 6.0 },
				}
			}
		},



		--[[Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},]]

		BossActions = {
			vector3(-1148.42, -1999.89, 13.18)
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


chef = {
		--{ model = 'depanneur', label = 'depanneur Cruiser Stanier', price = 1 }
	},
	employer = {
		--{ model = 'depanneur', label = 'depanneur Cruiser Stanier', price = 1 }
	},
	boss = {
	
	}
}

Config.AuthorizedHelicopters = {
	employer = {
		{ model = 'cargobob2', label = 'Hélicoptère', livery = 0, price = 200000 }
	},


	boss = {
	{ model = 'cargobob2', label = 'Hélicoptère', livery = 0, price = 200000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
    
	employer_wear = {
	  male = {
		  ['tshirt_1']  = 15, ['tshirt_2']  = 0,
		  ['torso_1']   = 65,  ['torso_2']   = 0,
		  ['arms']      = 92,
		  ['pants_1']   = 38,  ['pants_2']   = 0,
		  ['shoes_1']   = 25,  ['shoes_2']   = 0
		 
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
		['tshirt_1']  = 15, ['tshirt_2']  = 0,
		  ['torso_1']   = 65,  ['torso_2']   = 0,
		  ['arms']      = 92,
		  ['pants_1']   = 38,  ['pants_2']   = 0,
		  ['shoes_1']   = 25,  ['shoes_2']   = 0
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