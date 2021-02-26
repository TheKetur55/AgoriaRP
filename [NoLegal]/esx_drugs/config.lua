Config              = {}
Config.MarkerType   = 42
Config.DrawDistance = 2.0
Config.ZoneSize     = {x = 4.0, y = 4.0, z = 1.5}
Config.MarkerColor  = {r = 100, g = 204, b = 100}

Config.RequiredCopsCoke  = 2
Config.RequiredCopsMeth  = 2
Config.RequiredCopsWeed  = 2
Config.RequiredCopsOpium = 2

Config.RequiredCopsCoco = 2
Config.RequiredCopsVirus = 2
Config.RequiredCopsDatura = 2

Config.TimeToFarm    = 5 * 1000
Config.TimeToProcess = 7 * 1000
Config.TimeToSell    = 3  * 1000

Config.Locale = 'fr'

Config.Zones = {
	--[[
	CokeField =			{x = 274.23,	y = 6795.00,	z = 14.69,	name = _U('coke_field'),		sprite = 501,	color = 40}, -- 
	CokeProcessing =	{x = 1093.23,	y = -3196.62,	z = -38.99,	name = _U('coke_processing'),	sprite = 478,	color = 40}, --
	CokeDealer =		{x = -1536.99,	y = 130.55,		z =56.37,	name = _U('coke_dealer'),		sprite = 500,	color = 75}, --
	

	MethField =			{x = 1010.99,	y = -3197.66,	z = -38.99682,	name = _U('meth_field'),	sprite = 499,	color = 26},--
	MethProcessing =	{x = 1390.38,	y = 3606.84,	z = 37.94,	name = _U('meth_processing'),	sprite = 499,	color = 26}, --
	MethDealer =		{x = 1075.42,	y = -2330.57,	z = 29.29,	name = _U('meth_dealer'),		sprite = 500,	color = 75}, --
	

	WeedField =			{x = 1057.54,	y = -3199.71,	z = -39.14842,name = _U('weed_field'),		sprite = 496,	color = 52}, --
	WeedProcessing =	{x = 1037.52,		y = -3205.35,	z = -38.17,name = _U('weed_processing'),sprite = 496,	color = 52}, --
	--WeedDealer =		{x = -2.37,		y = -1821.92,	z = 28.54,	name = _U('weed_dealer'),		sprite = 500,	color = 75}, --
	

	OpiumField =		{x = -655.10,	y = 5494.85,	z = 48.93,	name = _U('opium_field'),		sprite = 51,	color = 60}, --
	OpiumProcessing =	{x = 2368.54,	y = 3056.58,	z = 47.30,	name = _U('opium_processing'),	sprite = 51,	color = 60}, --
	OpiumDealer =		{x = 712.33,	y = 2532.72,	z = 72.50,	name = _U('opium_dealer'),		sprite = 500,	color = 75} --
	]]



--New
	CocoField =			{x = 3057.23,	y = 5702.34,	z = 225.44,	name = _U('Coco_field'),		sprite = 501,	color = 40}, -- 
	CocoField2 =		{x = -10.15,	y = -1429.00,	z = 30.10,	name = _U('Coco2_field'),		sprite = 501,	color = 40}, -- 
	CocoProcessing =	{x = -12.36,	y = -1428.12,	z = 30.10,	name = _U('Coco_processing'),	sprite = 478,	color = 40}, --
	CocoDealer =		{x = -115.17,	y = 6368.89,	z =30.52,	name = _U('Coco_dealer'),		sprite = 500,	color = 75}, --

	VirusField =		{x = 1558.42,	y = -2118.88,	z = 76.37,	name = _U('Virus_field'),		sprite = 501,	color = 40}, -- 
	VirusField2 =		{x = 72.88,	y = -790.96,	z = 16.94,	name = _U('Virus2_field'),		sprite = 501,	color = 40}, -- 
	VirusProcessing =	{x = 49.75,	y = -778.90,	z = 16.78,	name = _U('Virus_processing'),	sprite = 478,	color = 40}, --
	VirusDealer =		{x = -2229.92,	y = 3481.48,	z =29.16,	name = _U('Virus_dealer'),		sprite = 500,	color = 75}, --

	DaturaField =		{x = -119.04,	y = 1430.75,	z = 293.27,	name = _U('Datura_field'),		sprite = 501,	color = 40}, -- 
	DaturaProcessing =	{x = -152.67,	y = 6140.52,	z = 31.33,	name = _U('Datura_processing'),	sprite = 478,	color = 40}, --
	DaturaDealer =		{x = -1701.86,	y = -1128.95 ,	z =12.15,	name = _U('Datura_dealer'),		sprite = 500,	color = 75}, --







-- Last
	CokeField =			{x = -796.78,	y = -2779.92,	z = 12.94,	name = _U('coke_field'),		sprite = 501,	color = 40}, -- 
	CokeProcessing =	{x = 1093.23,	y = -3196.62,	z = -38.99,	name = _U('coke_processing'),	sprite = 478,	color = 40}, --
	CokeDealer =		{x = 67.42,	y = -1960.52,	z =19.96,	name = _U('coke_dealer'),		sprite = 500,	color = 75}, --
	

	MethField =			{x = 2433.29,	y = 4968.61,	z = 41.34,	name = _U('meth_field'),	sprite = 499,	color = 26},--
	MethProcessing =	{x = 1390.37,	y = 3606.84,	z = 37.94,	name = _U('meth_processing'),	sprite = 499,	color = 26}, --
	MethDealer =		{x = 499.80,	y = -522.51,	z = 23.88,	name = _U('meth_dealer'),		sprite = 500,	color = 75}, --
	

	WeedField =			{x = -47.88,	y = 819.52,	z = 226.02,name = _U('weed_field'),		sprite = 496,	color = 52}, --
	WeedProcessing =	{x = 1037.38,		y = -3205.36,	z = -38.17,name = _U('weed_processing'),sprite = 496,	color = 52}, --
	--WeedDealer =		{x = -2.37,		y = -1821.92,	z = 28.54,	name = _U('weed_dealer'),		sprite = 500,	color = 75}, --
	

	OpiumField =		{x = 3395.17,	y = 3774.26,	z = 34.24,	name = _U('opium_field'),		sprite = 51,	color = 60}, --
	OpiumProcessing =	{x = 1010.91,	y = -3197.04,	z = -39.99,	name = _U('opium_processing'),	sprite = 51,	color = 60}, --
	OpiumDealer =		{x = -720.17,	y = -2235.49,	z = 6.23,	name = _U('opium_dealer'),		sprite = 500,	color = 75} --
}
