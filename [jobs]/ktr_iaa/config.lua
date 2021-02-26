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

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.PoliceStations = {

	LSPD = {

		

		Cloakrooms = {
			vector3(132.23, -770.09, 241.15)
		},

		Armories = {
			vector3(118.39, -729.12, 241.15)
		},

		Vehicles = {
			{
				Spawner = vector3(149.50, -677.290, 33.128),
				InsideShop = vector3(94.79, -720.34, 32.13),
				SpawnPoints = {
					{ coords = vector3(150.055, -684.304, 33.130), heading = 251.25, radius = 6.0 },
					{ coords = vector3(148.773, -687.828, 33.129), heading = 251.25, radius = 6.0 },
					{ coords = vector3(156.197, -681.417, 33.130), heading = 156.59, radius = 6.0 },
					{ coords = vector3(159.871, -682.662, 33.129), heading = 156.59, radius = 6.0 },
					{ coords = vector3(154.959, -688.934, 33.129), heading = 156.59, radius = 6.0 }
				}
			}--,

			--{
			--	Spawner = vector3(473.3, -1018.8, 28.0),
			--	InsideShop = vector3(228.5, -993.5, -99.0),
			--	SpawnPoints = {
			--		{ coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0 },
			--		{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
			--	}
			--}
		},

		Helicopters = {
			{
				Spawner = vector3(-67.752, -814.094, 326.083),
				InsideShop = vector3(140.55, -628.19, 263.73),
				SpawnPoints = {
					{ coords = vector3(-75.051, -819.022, 326.175), heading = 319.2, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(145.15, -767.48, 241.15)
		}

	}

}

Config.AuthorizedWeapons = {
	

	chef = {
		{ weapon = 'WEAPON_KNUCKLE', price = 80 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 80 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 60 },
		{ weapon = 'WEAPON_STUNGUN', price = 800 },	
		{ weapon = 'WEAPON_BZGAS', price = 800 },
		{ weapon = 'WEAPON_FLARE', price = 800 },
		{ weapon = 'WEAPON_STICKYBOMB', price = 2000 },
	--	{ weapon = 'WEAPON_GRENADE', price = 1500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 2000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, nil, nil, nil, nil, nil }, price = 5000 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 6000 },
		{ weapon = 'WEAPON_ASSAULTSMG', components = { 0, 0, 0, 0, 0, nil }, price = 6000 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 8000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 0, 0, 0, 0, 0 }, price = 8000 },
		{ weapon = 'WEAPON_MARKSMANRIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 20000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0 }, price = 22000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', components = { 0, 0, nil, nil, nil, nil }, price = 25000 },
		{ weapon = 'WEAPON_SNIPERRIFLE',components = { 0, 0, 0,0}, price = 30000 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 },
		{ weapon = 'WEAPON_FLARE', price = 2500 },
		{ weapon = 'WEAPON_HOMINGLAUNCHER', price = 30000 }
		
	},

	boss = {
		{ weapon = 'WEAPON_KNUCKLE', price = 80 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 80 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 60 },
		{ weapon = 'WEAPON_STUNGUN', price = 800 },	
		{ weapon = 'WEAPON_BZGAS', price = 800 },
		{ weapon = 'WEAPON_FLARE', price = 800 },
		{ weapon = 'WEAPON_STICKYBOMB', price = 2000 },
	--	{ weapon = 'WEAPON_GRENADE', price = 1500 },		
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 0, 0, nil }, price = 2000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, nil, nil, nil, nil, nil }, price = 5000 },
		{ weapon = 'WEAPON_SMG', components = { 0, 0, 0, 0, 0, 0 }, price = 6000 },
		{ weapon = 'WEAPON_ASSAULTSMG', components = { 0, 0, 0, 0, 0, nil }, price = 6000 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 8000 },
		{ weapon = 'WEAPON_SPECIALCARBINE', components = { 0, 0, 0, 0, 0, 0 }, price = 8000 },
		{ weapon = 'WEAPON_MARKSMANRIFLE', components = { 0, 0, 0, 0, 0, 0 }, price = 20000 },
		{ weapon = 'WEAPON_SNIPERRIFLE', components = { 0, 0, 0 }, price = 22000 },
		{ weapon = 'WEAPON_HEAVYSNIPER', components = { 0, 0, nil, nil, nil, nil }, price = 25000 },
		{ weapon = 'WEAPON_SNIPERRIFLE',components = { 0, 0, 0,0}, price = 30000 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 },
		{ weapon = 'WEAPON_FLARE', price = 2500 }

	}
}

Config.AuthorizedVehicles = {
	Shared = {
		
	},

	

	chef = {
		{ model = 'police3', label = 'Police Cruiser Interceptor', price = 1 },
		{ model = 'ambulance', label = 'Ambulance', price = 1 },
		{ model = 'fbi', label = 'Buffalo FBİ', price = 1 },
--		{ model = 'fbi3', label = 'Kuruma Banalisé', price = 1 },
		{ model = 'fbi2', label = 'Granger FBİ', price = 1 },
		{ model = 'riot', label = 'Riot', price = 1 },
		{ model = 'baller4', label = 'Baller', price = 1 },
		{ model = 'schafter3', label = 'Schafter', price = 1 },
		{ model = 'speedo', label = 'Speedo', price = 1 },
		{ model = 'pounder2', label = 'Pounder', price = 1 },
		{ model = 'mule4', label = 'Pounder', price = 1},
		{ model = 'bf400', label = 'Moto Cross', price = 1 },
		{ model = 'baller6', label = 'baller blindé', price = 1 },
		{ model = 'kuruma2', label = 'Kuruma blindé', price = 1 },
		{ model = 'zr3802', label = 'ZR 380', price = 1 },
		{ model = 'dune3', label = 'Dune', price = 1 }


	},

	boss = {
		{ model = 'police3', label = 'Police Cruiser Interceptor', price = 1 },
		{ model = 'ambulance', label = 'Ambulance', price = 1 },
		{ model = 'fbi', label = 'Buffalo FBİ', price = 1 },
--		{ model = 'fbi3', label = 'Kuruma Banalisé', price = 1 },
		{ model = 'fbi2', label = 'Granger FBİ', price = 1 },
		{ model = 'riot', label = 'Riot', price = 1 },
		{ model = 'baller4', label = 'Baller', price = 1 },
		{ model = 'schafter3', label = 'Schafter', price = 1 },
		{ model = 'speedo', label = 'Speedo', price = 1 },
		{ model = 'pounder2', label = 'Pounder', price = 1 },
		{ model = 'mule4', label = 'Pounder', price = 1},
		{ model = 'bf400', label = 'Moto Cross', price = 1 },
		{ model = 'baller6', label = 'baller blindé', price = 1 },
		{ model = 'kuruma2', label = 'Kuruma blindé', price = 1 },
		{ model = 'zr3802', label = 'ZR 380', price = 1 },
		{ model = 'dune3', label = 'Dune', price = 1 }


	}
}

Config.AuthorizedHelicopters = {
	

	chef = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 },
		{ model = 'frogger2', label = 'FIB frogger', livery = 0, price = 1 },

		{ model = 'buzzard', label = 'Buzzard', livery = 0, price = 1 },
	--	{ model = 'fibvalkyrie', label = 'fibvalkyrie', livery = 0, price = 1 },
	--	{ model = 'uh1airam', label = 'uh1', livery = 0, price = 1 },
		{ model = 'valkyrie', label = 'Valkyrie', livery = 0, price = 1 }

	},

	boss = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 1 },
		{ model = 'frogger2', label = 'FIB frogger', livery = 0, price = 1 },

		{ model = 'buzzard', label = 'Buzzard', livery = 0, price = 1 },
	--	{ model = 'fibvalkyrie', label = 'fibvalkyrie', livery = 0, price = 1 },
	--	{ model = 'uh1airam', label = 'uh1', livery = 0, price = 1 },
		{ model = 'valkyrie', label = 'Valkyrie', livery = 0, price = 1 }

	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	
	

	boss2_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 111,   ['torso_2'] = 3,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 33,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 5,     ['ears_2'] = 5,
			['glasses_1'] = 5,     ['glasses_2'] = 5


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

	work_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 10,  ['tshirt_2'] = 0,
			['torso_1'] = 35,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 12,
			['pants_1'] = 10,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 10,  ['helmet_2'] = 4,
			['chain_1'] = 28,    ['chain_2'] = 2,
			['ears_1'] = 5,     ['ears_2'] = 5,
			['glasses_1'] = 5,     ['glasses_2'] = 5


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

	smocking_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
			['torso_1'] = 10,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 17,
			['pants_1'] = 10,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 117,    ['chain_2'] = 9,
			['ears_1'] = 5,     ['ears_2'] = 5,
			['glasses_1'] = 5,     ['glasses_2'] = 5


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
				['tshirt_1']     = 88,	['tshirt_2']     = 0,
                ['torso_1']      = 219,	['torso_2']      = 20,
                ['decals_1']	 = 0, 	['decals_2'] 	 = 0,
               	['arms']         = 17,
                ['pants_1']      = 31,	['pants_2']      = 2,
                ['shoes_1']      = 25,	['shoes_2']      = 0,
                ['mask_1']       = 104,	['mask_2']       = 13,
               	['chain_1']      = 0,	['chain_2']      = 0,
                ['helmet_1']     = 117,	['helmet_2']     = 0,
                ['glasses_1']    = 0,	['glasses_2']    = 0,
                ['bag'] = 41
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



	swat_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 22,  ['tshirt_2'] = 0,
			['torso_1'] = 207,   ['torso_2'] = 13,
			['decals_1'] = -1,   ['decals_2'] = 0,
			['arms'] = 17,   ['arms_2'] = 0,
			['pants_1'] = 102,   ['pants_2'] = 9,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			--['helmet_1'] = 115,  ['helmet_2'] = 2,
			--['mask_1'] = 52,  ['mask_2'] = 0,
			--['bproof_1'] = 5,  ['bproof_2'] = 3,
			['bags_1'] = 41,    ['bags_2'] = 0, 
			['chain_1'] = 0,  ['chain_2'] = 0,

			--['face'] = 1,
	
			
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

	fibems_wear = {
    male = {
        ['tshirt_1'] = 129,  ['tshirt_2'] = 0,
        ['torso_1'] = 250,   ['torso_2'] = 0,
        ['decals_1'] = 58,   ['decals_2'] = 0,
        ['helmet_1'] = 122, ['helmet_2'] = 0,
        ['glasses_1'] = 1, ['glasses_2'] = 1,
        ['arms'] = 85,
        ['pants_1'] = 96,    ['pants_2'] = 0,
        ['shoes_1'] = 54,   ['shoes_2'] = 0,
        ['chain_1'] = 126,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 0,   ['tshirt_2'] = 0,
        ['torso_1'] = 0,   ['torso_2'] = 14,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['helmet_1'] = 122, ['helmet_2'] = 0,
        ['glasses_1'] = 1, ['glasses_2'] = 1,
        ['arms'] = 98,
        ['pants_1'] = 3,   ['pants_2'] = 13,
        ['shoes_1'] = 1,   ['shoes_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  },
  fibpolice_wear = {
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
  helicopterpilot_wear = {
        male = {
                ['tshirt_1']     = 21,['tshirt_2']     = 0,
                ['torso_1']      = 54,['torso_2']      = 0,
                ['arms']         = 17,
                ['pants_1']      = 41,['pants_2']      = 0,
                ['shoes_1']      = 69,['shoes_2']      = 0,
                ['mask_1']       = 0,['mask_2']       = 0,
                ['mask_1']       = 125,['mask_2']       = 10,
                ['chain_1']      = 40,['chain_2']      = 0,
                ['helmet_1']     = 47,['helmet_2']     = 0,
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

	bullet_wear = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 2,
			['chain_1']      = 119,	['chain_2']      = 1
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	bullet1_wear = {
		male = {
			['bproof_1'] = 9,  ['bproof_2'] = 3,
			['chain_1']      = 119,	['chain_2']      = 0
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

Config.WeaponsSkins = {
	["WEAPON_PISTOL_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_PISTOL_MK2_CAMO",
			"COMPONENT_PISTOL_MK2_CAMO_02",
			"COMPONENT_PISTOL_MK2_CAMO_03",
			"COMPONENT_PISTOL_MK2_CAMO_04",
			"COMPONENT_PISTOL_MK2_CAMO_05",
			"COMPONENT_PISTOL_MK2_CAMO_06",
			"COMPONENT_PISTOL_MK2_CAMO_07",
			"COMPONENT_PISTOL_MK2_CAMO_08",
			"COMPONENT_PISTOL_MK2_CAMO_09",
			"COMPONENT_PISTOL_MK2_CAMO_10",
			"COMPONENT_PISTOL_MK2_CAMO_IND_01",
		}
	},
	["WEAPON_ASSAULTRIFLE_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_ASSAULTRIFLE_MK2_CAMO",
			"COMPONENT_ASSAULTRIFLE_MK2_CAMO_02",
			"COMPONENT_ASSAULTRIFLE_MK2_CAMO_03",
			"COMPONENT_ASSAULTRIFLE_MK2_CAMO_04",
			"COMPONENT_ASSAULTRIFLE_MK2_CAMO_05",
			"COMPONENT_ASSAULTRIFLE_MK2_CAMO_06",
			"COMPONENT_ASSAULTRIFLE_MK2_CAMO_07",
			"COMPONENT_ASSAULTRIFLE_MK2_CAMO_08",
			"COMPONENT_ASSAULTRIFLE_MK2_CAMO_09",
			"COMPONENT_ASSAULTRIFLE_MK2_CAMO_10",
			"COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01",
		}
	},
	["WEAPON_CARBINERIFLE_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_CARBINERIFLE_MK2_CAMO",
			"COMPONENT_CARBINERIFLE_MK2_CAMO_02",
			"COMPONENT_CARBINERIFLE_MK2_CAMO_03",
			"COMPONENT_CARBINERIFLE_MK2_CAMO_04",
			"COMPONENT_CARBINERIFLE_MK2_CAMO_05",
			"COMPONENT_CARBINERIFLE_MK2_CAMO_06",
			"COMPONENT_CARBINERIFLE_MK2_CAMO_07",
			"COMPONENT_CARBINERIFLE_MK2_CAMO_08",
			"COMPONENT_CARBINERIFLE_MK2_CAMO_09",
			"COMPONENT_CARBINERIFLE_MK2_CAMO_10",
			"COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01",
		}
	},
	["WEAPON_COMBATMG_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_COMBATMG_MK2_CAMO",
			"COMPONENT_COMBATMG_MK2_CAMO_02",
			"COMPONENT_COMBATMG_MK2_CAMO_03",
			"COMPONENT_COMBATMG_MK2_CAMO_04",
			"COMPONENT_COMBATMG_MK2_CAMO_05",
			"COMPONENT_COMBATMG_MK2_CAMO_06",
			"COMPONENT_COMBATMG_MK2_CAMO_07",
			"COMPONENT_COMBATMG_MK2_CAMO_08",
			"COMPONENT_COMBATMG_MK2_CAMO_09",
			"COMPONENT_COMBATMG_MK2_CAMO_10",
			"COMPONENT_COMBATMG_MK2_CAMO_IND_01",
		}
	},
	["WEAPON_HEAVYSNIPER_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_HEAVYSNIPER_MK2_CAMO",
			"COMPONENT_HEAVYSNIPER_MK2_CAMO_02",
			"COMPONENT_HEAVYSNIPER_MK2_CAMO_03",
			"COMPONENT_HEAVYSNIPER_MK2_CAMO_04",
			"COMPONENT_HEAVYSNIPER_MK2_CAMO_05",
			"COMPONENT_HEAVYSNIPER_MK2_CAMO_06",
			"COMPONENT_HEAVYSNIPER_MK2_CAMO_07",
			"COMPONENT_HEAVYSNIPER_MK2_CAMO_08",
			"COMPONENT_HEAVYSNIPER_MK2_CAMO_09",
			"COMPONENT_HEAVYSNIPER_MK2_CAMO_10",
			"COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01",
		}
	},
	["WEAPON_KNUCKLE"] = {
		labels = {
			"WCT_KNUCK_01",
			"WCT_KNUCK_02",
			"WCT_KNUCK_BG",
			"WCT_KNUCK_DLR",
			"WCT_KNUCK_DMD",
			"WCT_KNUCK_HT",
			"WCT_KNUCK_LV",
			"WCT_KNUCK_PC",
			"WCT_KNUCK_SLG",
			"WCT_KNUCK_VG",
		},
		hashes = {
			"COMPONENT_KNUCKLE_VARMOD_BASE",
			"COMPONENT_KNUCKLE_VARMOD_PIMP",
			"COMPONENT_KNUCKLE_VARMOD_BALLAS",
			"COMPONENT_KNUCKLE_VARMOD_DOLLAR",
			"COMPONENT_KNUCKLE_VARMOD_DIAMOND",
			"COMPONENT_KNUCKLE_VARMOD_HATE",
			"COMPONENT_KNUCKLE_VARMOD_LOVE",
			"COMPONENT_KNUCKLE_VARMOD_PLAYER",
			"COMPONENT_KNUCKLE_VARMOD_KING",
			"COMPONENT_KNUCKLE_VARMOD_VAGOS",
		}
	},
	["WEAPON_SNSPISTOL_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_SNSPISTOL_MK2_CAMO",
			"COMPONENT_SNSPISTOL_MK2_CAMO_02",
			"COMPONENT_SNSPISTOL_MK2_CAMO_03",
			"COMPONENT_SNSPISTOL_MK2_CAMO_04",
			"COMPONENT_SNSPISTOL_MK2_CAMO_05",
			"COMPONENT_SNSPISTOL_MK2_CAMO_06",
			"COMPONENT_SNSPISTOL_MK2_CAMO_07",
			"COMPONENT_SNSPISTOL_MK2_CAMO_08",
			"COMPONENT_SNSPISTOL_MK2_CAMO_09",
			"COMPONENT_SNSPISTOL_MK2_CAMO_10",
			"COMPONENT_SNSPISTOL_MK2_CAMO_IND_01",
		}
	},
	["WEAPON_REVOLVER_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_REVOLVER_MK2_CAMO",
			"COMPONENT_REVOLVER_MK2_CAMO_02",
			"COMPONENT_REVOLVER_MK2_CAMO_03",
			"COMPONENT_REVOLVER_MK2_CAMO_04",
			"COMPONENT_REVOLVER_MK2_CAMO_05",
			"COMPONENT_REVOLVER_MK2_CAMO_06",
			"COMPONENT_REVOLVER_MK2_CAMO_07",
			"COMPONENT_REVOLVER_MK2_CAMO_08",
			"COMPONENT_REVOLVER_MK2_CAMO_09",
			"COMPONENT_REVOLVER_MK2_CAMO_10",
			"COMPONENT_REVOLVER_MK2_CAMO_IND_01",
		}
	},
	["WEAPON_SPECIALCARBINE_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_SPECIALCARBINE_MK2_CAMO",
			"COMPONENT_SPECIALCARBINE_MK2_CAMO_02",
			"COMPONENT_SPECIALCARBINE_MK2_CAMO_03",
			"COMPONENT_SPECIALCARBINE_MK2_CAMO_04",
			"COMPONENT_SPECIALCARBINE_MK2_CAMO_05",
			"COMPONENT_SPECIALCARBINE_MK2_CAMO_06",
			"COMPONENT_SPECIALCARBINE_MK2_CAMO_07",
			"COMPONENT_SPECIALCARBINE_MK2_CAMO_08",
			"COMPONENT_SPECIALCARBINE_MK2_CAMO_09",
			"COMPONENT_SPECIALCARBINE_MK2_CAMO_10",
			"COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01",
		}
	},
	["WEAPON_BULLPUPRIFLE_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_BULLPUPRIFLE_MK2_CAMO",
			"COMPONENT_BULLPUPRIFLE_MK2_CAMO_02",
			"COMPONENT_BULLPUPRIFLE_MK2_CAMO_03",
			"COMPONENT_BULLPUPRIFLE_MK2_CAMO_04",
			"COMPONENT_BULLPUPRIFLE_MK2_CAMO_05",
			"COMPONENT_BULLPUPRIFLE_MK2_CAMO_06",
			"COMPONENT_BULLPUPRIFLE_MK2_CAMO_07",
			"COMPONENT_BULLPUPRIFLE_MK2_CAMO_08",
			"COMPONENT_BULLPUPRIFLE_MK2_CAMO_09",
			"COMPONENT_BULLPUPRIFLE_MK2_CAMO_10",
			"COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01",
		}
	},
	["WEAPON_PUMPSHOTGUN_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_PUMPSHOTGUN_MK2_CAMO",
			"COMPONENT_PUMPSHOTGUN_MK2_CAMO_02",
			"COMPONENT_PUMPSHOTGUN_MK2_CAMO_03",
			"COMPONENT_PUMPSHOTGUN_MK2_CAMO_04",
			"COMPONENT_PUMPSHOTGUN_MK2_CAMO_05",
			"COMPONENT_PUMPSHOTGUN_MK2_CAMO_06",
			"COMPONENT_PUMPSHOTGUN_MK2_CAMO_07",
			"COMPONENT_PUMPSHOTGUN_MK2_CAMO_08",
			"COMPONENT_PUMPSHOTGUN_MK2_CAMO_09",
			"COMPONENT_PUMPSHOTGUN_MK2_CAMO_10",
			"COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01",
		}
	},
	["WEAPON_MARKSMANRIFLE_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_MARKSMANRIFLE_MK2_CAMO",
			"COMPONENT_MARKSMANRIFLE_MK2_CAMO_02",
			"COMPONENT_MARKSMANRIFLE_MK2_CAMO_03",
			"COMPONENT_MARKSMANRIFLE_MK2_CAMO_04",
			"COMPONENT_MARKSMANRIFLE_MK2_CAMO_05",
			"COMPONENT_MARKSMANRIFLE_MK2_CAMO_06",
			"COMPONENT_MARKSMANRIFLE_MK2_CAMO_07",
			"COMPONENT_MARKSMANRIFLE_MK2_CAMO_08",
			"COMPONENT_MARKSMANRIFLE_MK2_CAMO_09",
			"COMPONENT_MARKSMANRIFLE_MK2_CAMO_10",
			"COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01",
		}
	},
	["WEAPON_SWITCHBLADE"] = {
		labels = {
			"WCT_SB_BASE",
			"WCT_SB_VAR1",
			"WCT_SB_VAR2",
		},
		hashes = {
			"COMPONENT_SWITCHBLADE_VARMOD_BASE",
			"COMPONENT_SWITCHBLADE_VARMOD_VAR1",
			"COMPONENT_SWITCHBLADE_VARMOD_VAR2",
		}
	},
	["WEAPON_SMG_MK2"] = {
		labels = {
			"WCT_CAMO_1",
			"WCT_CAMO_2",
			"WCT_CAMO_3",
			"WCT_CAMO_4",
			"WCT_CAMO_5",
			"WCT_CAMO_6",
			"WCT_CAMO_7",
			"WCT_CAMO_8",
			"WCT_CAMO_9",
			"WCT_CAMO_10",
			"WCT_CAMO_IND",
		},
		hashes = {
			"COMPONENT_SMG_MK2_CAMO",
			"COMPONENT_SMG_MK2_CAMO_02",
			"COMPONENT_SMG_MK2_CAMO_03",
			"COMPONENT_SMG_MK2_CAMO_04",
			"COMPONENT_SMG_MK2_CAMO_05",
			"COMPONENT_SMG_MK2_CAMO_06",
			"COMPONENT_SMG_MK2_CAMO_07",
			"COMPONENT_SMG_MK2_CAMO_08",
			"COMPONENT_SMG_MK2_CAMO_09",
			"COMPONENT_SMG_MK2_CAMO_10",
			"COMPONENT_SMG_MK2_CAMO_IND_01",
		}
	},
}