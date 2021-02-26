Config = {}
--Config.Blip			= {sprite= 290, color = 30}
--Config.MecanoBlip	= {sprite= 290, color = 20}
Config.Price		= 250

Config.Garages = {
	
	Garage_Centre5 = {	
		Pos = {x=-764.68, y=-1421.33, z=1.00},
		Marker = { w= 1.0, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=-774.42, y= -1427.63, z= 0.00},
			Heading = 138.39,
			Marker = { w= 1.5, h= 2.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x=-785.13, y=-1442.49, z=0.50},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},



	
	Garage_Centre3 = {	
		Pos = {x = 1299.20,y = 4217.87,z = 33.90},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = 1292.87,y = 4220.80,z = 31.00},
			Heading = 79.20,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = 1307.28,y = 4225.69,z = 30.50},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},	



	

	--[[
	Garage_SandyShore = {	
		Pos = {x=1694.571, y=3610.924, z=35.319},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x=1713.492, y= 3598.938, z= 35.238},
			Heading = 160.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = 1695.156,y = 3601.061,z = 35.530},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},
	Garage_Ocean1 = {	
		Pos = {x = -3140.323,y = 1124.463,z = 20.706},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = -3132.638,y = 1126.662,z = 20.667},
			Heading = 160.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = -3136.902,y = 1102.685,z = 20.654},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},	
	Garage_Ocean2 = {	
		Pos = {x = -2982.561,y = 327.506,z = 14.935},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = -2977.238,y = 337.777,z = 14.768},
			Heading = 160.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = -2971.814,y = 355.331,z = 14.771},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},		
	Garage_Sud = {	
		Pos = {x = 443.6696,y = -1969.4372,z = 24.401},
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = 437.8140,y = -1958.572,z = 22.957},
			Heading = 182.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = 457.91,y = -1971.343,z = 22.553},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},
	Garage_Lake = {	
		Pos = {x = -73.165504455566,y = 908.08734130859,z = 235.62712097168 },
		Marker = { w= 1.0, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = -72.099822998047,y = 902.85479736328,z = 235.63186645508 },
			Heading = 134.409,
			Marker = { w= 1.0, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = -66.987632751465,y = 891.65881347656,z = 235.55270385742 },
			Marker = { w= 1.0, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},	
	Garage_Occaz = {	
		Pos = {x = 472.00717163086,y = -1113.5531005859,z = 29.198709487915 },
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = 465.24938964844,y = -1122.1062011719,z = 29.306407928467 },
			Heading = 179.84,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = 480.43997192383,y = -1123.5560302734,z = 29.329828262329 },
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},
	Garage_Groove = {	
		Pos = {x = -69.514305114746,y = -1822.9477539063,z = 26.941974639893 },
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = -67.72095489502,y = -1835.7784423828,z = 26.883722305298 },
			Heading = 225.887,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = -60.4020652771,y = -1829.5288085938,z = 26.836933135986 },
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},
	Garage_venise = {	
		Pos = {x = -1081.974609375,y = -1254.1881103516,z = 5.4244246482849 },
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = -1077.2590332031,y = -1239.3200683594,z = 5.161093711853 },
			Heading = 144.887,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = -1097.2971191406,y = -1253.8725585938,z = 5.2441983222961 },
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},	
	Garage_tequila = {	
		Pos = {x = -570.92272949219,y = 313.41049194336,z = 84.493560791016 },
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = -569.47564697266,y = 323.53549194336,z = 84.474433898926 },
			Heading = 22.52,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = -560.84375,y = 322.41586303711,z = 84.402587890625 },
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},	
	Garage_banque = {	
		Pos = {x = 363.48370361328,y = 296.83682250977,z = 103.50011444092 },
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = 378.00622558594,y = 288.13024902344,z = 103.1661529541 },
			Heading = 62.22,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = 364.76132202148,y = 285.18911743164,z = 103.37410736084 },
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},	
	Garage_mirrorpark = {	
		Pos = {x = 1033.9229736328,y = -767.10662841797,z = 58.003326416016 },
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = 1040.6834716797,y = -778.18170166016,z = 58.022853851318 },
			Heading = 359.92,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = 1022.7816772461,y = -763.78955078125,z = 57.961227416992 },
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},	]]
	--[[ Garage_Tournoi = {	
		Pos = {x = 3171.8381347656,y = -1667.3009033203,z = 6.4746117591858 },
		Marker = { w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
		Name = 'Garage',
		HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour ouvrir le garage",
		Functionmenu = OpenMenuGarage,
		SpawnPoint = {
			Pos = {x = 3164.1762695313,y = -1667.0953369141,z = 6.4746117591858 },
			Heading = 264.63,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir votre véhicule",
			Functionmenu = ListVehiclesMenu,
		},
		DeletePoint = {
			Pos = {x = 3158.0983886719,y = -1661.5126953125,z = 7.0836601257324 },
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer votre véhicule",
			Functionmenu = StockVehicleMenu,
		}, 	
	},]]		
}

Config.GaragesMecano = {
--[[	Bennys = {
		Name = 'Fourriere Externe',
		SpawnPoint = {
			Pos = {x = 477.729,y = -1888.856,z = 26.094},
			Heading = 303.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir un véhicule de fourrière",
			Functionmenu = ListVehiclesFourriereMenu,
		},
		DeletePoint = {
			Pos = {x = 459.733,y = -1890.335,z = 25.776},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer le véhicule en fourrière",
			Functionmenu = StockVehicleFourriereMenu,
		}, 	
	},		
	police = {
		Name = 'Fourriere Externe',
		SpawnPoint = {
			Pos = {x = 449.253,y = -1024.322,z = 28.57},
			Heading = 100.0,
			Marker = { w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour sortir un véhicule de fourrière",
			Functionmenu = ListVehiclesFourriereMenu,
		},
		DeletePoint = {
			Pos = {x = 452.305,y = -996.752,z = 25.776},
			Marker = { w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Appuyer sur ~INPUT_PICKUP~ pour rentrer le véhicule en fourrière",
			Functionmenu = StockVehicleFourriereMenu,
		}, 	
	},	]]
	--[[ Bennys2 = {
		Marker = 1,
		SpawnPoint = {
			Pos = {x=-190.455, y= -1290.654, z= 30.295},
			Color = {r=0,g=255,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		},
		DeletePoint = {
			Pos = {x=-190.379, y=-1284.667, z=30.233},
			Color = {r=255,g=0,b=0},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Marker = 1
		}, 	
	},]]
}
