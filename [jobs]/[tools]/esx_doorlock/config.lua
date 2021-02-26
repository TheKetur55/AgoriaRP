Config = {}
Config.Locale = 'fr'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	--[[Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_door01',
				objYaw = -90.0,
				objCoords = vector3(434.7, -980.6, 30.8)
			},

			{
				objName = 'v_ilev_ph_door002',
				objYaw = -90.0,
				objCoords = vector3(434.7, -983.2, 30.8)
			}
		}
	},]]

{
		objName = 'hei_prop_station_gate',
	--	objYaw = 90.0,
		distance = 15,
		objCoords  = vector3(-370.4998779296875,-152.91162109375, 37.245365142822266),
		textCoords = vector3(-370.4998779296875,-152.91162109375, 37.245365142822266),
		authorizedJobs = { 'agocustom', 'agotuning' },
		locked = true
	},
	{
		objName = 'hei_prop_station_gate',
	--	objYaw = 90.0,
		distance = 15,
		objCoords  = vector3(-397.3304138183594,-105.75597381591797, 37.706478118896484),
		textCoords = vector3(-397.3304138183594,-105.75597381591797, 37.706478118896484),
		authorizedJobs = { 'agocustom', 'agotuning' },
		locked = true
	},

--[[GOUV
	{
		objName = 'prop_gate_airport_01',
	--	objYaw = 90.0,
		distance = 15,
		objCoords  = vector3(-271.35552978515625,-1012.8947143554688, 29.34905242919922),
		textCoords = vector3(-271.35552978515625,-1012.8947143554688, 29.34905242919922),
		authorizedJobs = { 'gouv', 'police' },
		locked = true
	},
	{
		objName = 'prop_gate_airport_01',
	--	objYaw = 90.0,
		distance = 15,
		objCoords  = vector3(-355.5675354003906,-1062.843505859375, 29.383575439453125),
		textCoords = vector3(-355.5675354003906,-1062.843505859375, 29.383575439453125),
		authorizedJobs = { 'gouv', 'police' },
		locked = true
	},
	{
		objName = 'prop_ss1_mpint_garage',
	--	objYaw = 90.0,
		distance = 10,
		objCoords  = vector3(-354.7096862792969,-1007.5780639648438, 32.16997146606445),
		textCoords = vector3(-354.7096862792969,-1007.5780639648438, 32.16997146606445),
		authorizedJobs = { 'gouv', 'police' },
		locked = true
	},
	{
		objName = 'p_cut_door_02',
	--	objYaw = 90.0,
		distance = 5,
		objCoords  = vector3(-350.5016784667969,-978.0029907226562, 36.89046096801758),
		textCoords = vector3(-350.5016784667969,-978.0029907226562, 36.89046096801758),
		authorizedJobs = { 'gouv'},
		locked = true
	},

	{
		textCoords = vector3(-310.605224609375, -989.6080932617188, 31.564363479614258),
		authorizedJobs = { 'police', 'gouv' } ,
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'prop_fnclink_02gate6_r',
			--	objYaw = 180.0,
				objCoords = vector3(-310.605224609375, -989.6080932617188, 31.564363479614258)
			},

			{
				objName = 'prop_fnclink_02gate6_r',
			--	objYaw = 0.0,
				objCoords = vector3(-306.8669128417969, -990.9782104492188, 31.564363479614258)
			}
		}
	},
]]


	--[[AL BONNE BOUF
	{
		textCoords = vector3(-1196.5394287109375, -883.4852294921875, 14.25259017944336)
		authorizedJobs = { 'fermier' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = '-1270304831',
			--	objYaw = 180.0,
				objCoords = vector3(-1196.5394287109375, -883.4852294921875, 14.25259017944336)
			},

			{
				objName = '1050821746',
			--	objYaw = 0.0,
				objCoords = vector3(-1199.033203125, -885.169921875, 14.25259017944336)
			}
		}
	},

	{
		textCoords = vector3(-1196.5394287109375, -883.4852294921875, 14.25259017944336)
		authorizedJobs = { 'fermier' } ,
		locked = true,
		distance = 4,
		doors = {
			{
				objName = '-1270304831',
			--	objYaw = 180.0,
				objCoords = vector3(-1183.2069091796875, -885.8312377929688, 14.251130104064941)
			},

			{
				objName = '1050821746',
			--	objYaw = 0.0,
				objCoords = vector3(-1184.891845703125, -883.3377075195312, 14.251130104064941)
			}
		}
	},

	{
		objName = '-1628879836',
	--	objYaw = 90.0,
		distance = 5,
		objCoords  = vector3(-1199.7276611328125,-892.0408325195312, 14.24616527557373),
		textCoords = vector3(-1199.7276611328125,-892.0408325195312, 14.24616527557373),
		authorizedJobs = { 'fermier' },
		locked = true
	},]]
  --Tequilala

{
		objName = 'v_ilev_roc_door4',
	--	objYaw = 90.0,
		distance = 5,
		objCoords  = vector3(-565.1712036132812,276.6259460449219, 83.28626251220703),
		textCoords = vector3(-565.1712036132812,276.6259460449219, 83.28626251220703),
		authorizedJobs = { 'unicorn' },
		locked = true
	},
  --Tequilala grille parking

{
		objName = 'prop_gate_airport_01',
	--	objYaw = 90.0,
		distance = 15,
		objCoords  = vector3(-555.6054077148438,330.8538818359375, 83.3732681274414),
		textCoords = vector3(-555.6054077148438,330.8538818359375, 83.3732681274414),
		authorizedJobs = { 'unicorn' },
		locked = true
	},
  --Tequilala grille parking privee

{
		objName = 'prop_lrggate_02_ld',
	--	objYaw = 90.0,
		distance = 15,
		objCoords  = vector3(-547.41552734375,305.9614562988281, 82.0397720336914),
		textCoords = vector3(-547.41552734375,305.9614562988281, 82.0397720336914),
		authorizedJobs = { 'unicorn' },
		locked = true
	},


{
		objName = 'v_ilev_roc_door2',
	--	objYaw = 90.0,
		distance = 5,
		objCoords  = vector3(-560.2373046875,293.01055908203125, 82.32608795166016),
		textCoords = vector3(-560.2373046875,293.01055908203125, 82.32608795166016),
		authorizedJobs = { 'unicorn' },
		locked = true
	},

{
		objName = 'v_ilev_roc_door5',
	--	objYaw = 90.0,
		distance = 5,
		objCoords  = vector3(-567.9359741210938,291.9264221191406, 85.52498626708984),
		textCoords = vector3(-567.9359741210938,291.9264221191406, 85.52498626708984),
		authorizedJobs = { 'unicorn' },
		locked = true
	},


{
		objName = 'lr_prop_supermod_door_01',
	--	objYaw = 90.0,
	distance = 10,
		objCoords  = vector3(-205.68283081054688, -1310.6826171875, 30.295719146728516),
		textCoords = vector3(-205.68283081054688, -1310.6826171875, 30.295719146728516),
		authorizedJobs = { 'mecano' },
		locked = true
	},




	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 90.0,
		objCoords  = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true
	},



-- Agoria İmmo
{
		objName = 'apa_prop_heist_cutscene_doorb',
		objYaw = -39.89,
		distance = 3,
		objCoords  = vector3(-1896.142822265625, -569.6981201171875, 11.917168617248535),
		textCoords = vector3(-1896.142822265625, -569.6981201171875, 12.917168617248535),
		authorizedJobs = { 'realestateagent' },
		locked = true
	},
	{
		objName = 'v_ilev_cbankcountdoor01',
		objYaw = -129.06,
		distance = 3,
		objCoords  = vector3(-1915.06005859375, -574.8300170898438, 19.360000610351562),
		textCoords = vector3(-1915.06005859375, -574.8300170898438, 20.360000610351562),
		authorizedJobs = { 'realestateagent' },
		locked = true
	},
	--[[Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objYaw = 90.0,
		objCoords  = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = { 'police' },
		locked = true
	},]]

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 90.0,
		objCoords  = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = -90.0,
		objCoords  = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = -180.0,
		objCoords  = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true
	},

	--To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 180.0,
				objCoords = vector3(443.9, -989.0, 30.6)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 0.0,
				objCoords = vector3(445.3, -988.7, 30.6)
			}
		}
	},

{
		objName = 'prop_facgate_01',
	--	objYaw = 90.0,
		distance = 15,
		objCoords  = vector3(-1036.470458984375,-2912.58056640625, 12.958410263061523),
		textCoords = vector3(-1036.470458984375,-2912.58056640625, 12.958410263061523),
		authorizedJobs = { 'eventluxury' },
		locked = true
	},

{
		objName = 'prop_facgate_01',
	--	objYaw = 90.0,
		distance = 15,
		objCoords  = vector3(-1067.454711914062,-2962.16259765625, 12.942750930786133),
		textCoords = vector3(-1067.454711914062,-2962.16259765625, 12.942750930786133),
		authorizedJobs = { 'eventluxury' },
		locked = true
	},



-- LSPD

{
		objName = 'hei_prop_station_gate',
		--objYaw = 90.0,
		objCoords  = vector3(-1142.8123779296875, -844.4967651367188, 13.409207344055176),
		textCoords = vector3(-1142.8123779296875, -844.4967651367188, 14.409207344055176),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true,
		distance = 14,
		size = 2
	},


	--
	-- Mission Row Cells
	--

	--[Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
	--	objYaw = 0.0,
		objCoords  = vector3(464.57012939453125, -992.6640625, 25.06442642211914),
		textCoords = vector3(464.57012939453125, -992.6640625, 25.06442642211914),
		authorizedJobs ={ 'police', 'agocustom' } ,
		locked = true
	},
	{
		objName = 'v_ilev_ph_cellgate',
	--	objYaw = 0.0,
		objCoords  = vector3(466.1449890136719, -997.6583862304688, 25.06442642211914),
		textCoords = vector3(465.6, -997.6583862304688, 25.2),
		authorizedJobs ={ 'police', 'agocustom' } ,
		locked = true
	},
	{
		objName = 'v_ilev_ph_cellgate',
	--	objYaw = 0.0,
		objCoords  = vector3(466.1449890136719, -1001.3058471679688, 25.06442642211914),
		textCoords = vector3(465.6, -1001.3058471679688, 25.2),
		authorizedJobs ={ 'police', 'agocustom' } ,
		locked = true
	},
	{
		objName = 'v_ilev_ph_cellgate',
	--	objYaw = 0.0,
		objCoords  = vector3(482.7369689941406, -988.293701171875, 25.06539535522461),
		textCoords = vector3(482.2, -988.293701171875, 25.2),
		authorizedJobs ={ 'police', 'agocustom' } ,
		locked = true
	},
	{
		objName = 'v_ilev_ph_cellgate',
	--	objYaw = 0.0,
		objCoords  = vector3(482.7369689941406, -991.7141723632812, 25.06539535522461),
		textCoords = vector3(482.2, -991.7141723632812, 25.2),
		authorizedJobs ={ 'police', 'agocustom' } ,
		locked = true
	},
	{
		objName = 'v_ilev_ph_gendoor005',
		objYaw = 0.0,
		objCoords  = vector3(478.3365173339844, -991.6564331054688, 25.06475830078125),
		textCoords = vector3(478.0365173339844, -991.6564331054688, 25.26475830078125),
		authorizedJobs ={ 'police', 'agocustom' } ,
		locked = true
	},
	{
		objName = 'v_ilev_ph_gendoor005',
		objYaw = 0.0,
		objCoords  = vector3(478.3365173339844, -988.3507690429688, 25.06475830078125),
		textCoords = vector3(478.0365173339844, -988.3507690429688, 25.26475830078125),
		authorizedJobs ={ 'police', 'agocustom' } ,
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = -90.0,
		objCoords  = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true
	},

	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true
	},

	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true
	},


	{
		textCoords = vector3(-1058.98, -876.92, 5.005575656890869),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true,
		distance = 14,
		doors = {
			{
				objName = 'prop_facgate_01b',
				--objYaw = 0.0,
				objCoords  = vector3(-1064.2025146484375, -879.7971801757812, 4.007066249847412)
			},

			{
				objName = 'prop_facgate_01',
				--objYaw = 180.0,
				objCoords  = vector3(-1053.84814453125, -873.4391479492188, 4.005575656890869)
			}
		}
	},

	--
	-- Mission Row Back
	--

	--[[ Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 0.0,
				objCoords  = vector3(467.3, -1014.4, 26.5)
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 180.0,
				objCoords  = vector3(469.9, -1014.4, 26.5)
			}
		}
	},]]

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objYaw = 90.0,
		objCoords  = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true,
		distance = 14,
		size = 2
	},

	-- BANK PRINCIPAL
	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		--objYaw = 90.0,
		objCoords  = vector3(262.1980895996094, 222.518798828125, 106.42955780029297),
		textCoords = vector3(262.1980895996094, 222.518798828125, 107.42955780029297),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true
	},




--[[FIB

{
		textCoords = vector3(105.76, -746.64, 45.18),
		authorizedJobs = { 'iaa' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_fibl_door02',
				--objYaw = 0.0,
				objCoords  = vector3(106.3792, -742.6982, 46.1817)
			},

			{
				objName = 'v_ilev_fibl_door01',
				--objYaw = 180.0,
				objCoords  = vector3(105.76, -746.64, 46.18)
			}
		}
	},

]]


	
	{
	textCoords = vector3(-1120.04, -2438.79, 14.94),
		authorizedJobs = { 'event', 'nightclub'} ,
		locked = true,
		distance = 10,
		doors = {
			{
				objName = 'prop_facgate_01b',
				--objYaw = 0.0,
				objCoords  = vector3(-1120.04, -2438.79, 12.94)
			}
		}
	},




	
	{
	textCoords = vector3(810.57, -2148.26, 30.00),
		authorizedJobs = { 'police', 'agocustom' } ,
		locked = true,
		distance = 10,
		doors = {
			{
				objName = 'v_ilev_gc_door03',
				--objYaw = 0.0,
				objCoords  = vector3(810.57, -2148.26, 29.76)
			},

			{
				objName = 'v_ilev_gc_door04',
				--objYaw = 180.0,
				objCoords  = vector3(813.17791748046887, -2148.26, 29.76)
			}
		}
	},


-- Luxury Event


-- intérieur porte
{
		textCoords = vector3(-1521.30517578125, 114.0316390991211, 73.19761657714844),
		authorizedJobs = { 'event' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'ex_prop_exec_office_door01',
				--objYaw = 0.0,
				objCoords  = vector3(-1521.30517578125, 114.0316390991211, 73.19761657714844)
			},

			{
				objName = 'ex_prop_exec_office_door01',
				--objYaw = 180.0,
				objCoords  = vector3(-1519.754638671875, 113.46730041503906, 73.19761657714844)
			}
		}
	},

--Portail
{
		textCoords = vector3(-2191.14990234375, -425.88, 13.75),
		authorizedJobs = { 'eventluxury' } ,
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'hei_prop_bh1_08_hdoor',
			--	objYaw = 180.0,
				objCoords = vector3(-2191.14990234375, -425.3999938964844, 13.75)
			},

			{
				objName = 'hei_prop_bh1_08_hdoor',
			--	objYaw = 0.0,
				objCoords = vector3(-2188.779052734375, -426.1714172363281, 13.75)
			}
		}
	},

{
		objName = 'prop_lrggate_02_ld',
		--objYaw = 90.0,
		distance = 15,
		objCoords  = vector3(-2188.5009765625, -375.9449768066406, 12.082061767578125),
		textCoords = vector3(-2188.5009765625, -375.9449768066406, 12.082061767578125),
		authorizedJobs = { 'eventluxury', 'nightclub'} ,
		locked = true
	},

{
		objName = 'prop_lrggate_05a',
		--objYaw = 90.0,
		distance = 5,
		objCoords  = vector3(-2174.094482421875, -367.6846008300781, 12.189910888671875),
		textCoords = vector3(-2174.094482421875, -367.6846008300781, 12.189910888671875),
		authorizedJobs = { 'eventluxury', 'nightclub'} ,
		locked = true
	},



{
		objName = 'prop_lrggate_02_ld',
		--objYaw = 90.0,
		distance = 10,
		objCoords  = vector3(-1616.2344970703125, 79.7787857055664, 60.77645492553711),
		textCoords = vector3(-1616.2344970703125, 79.7787857055664, 61.77645492553711),
		authorizedJobs = { 'event'} ,
		locked = true
	},

	-- Exterieur porte

{
		objName = 'prop_lrggate_02_ld',
		--objYaw = 90.0,
		distance = 10,
		objCoords  = vector3(-1474.1307373046875, 68.38720703125, 52.52357482910156),
		textCoords = vector3(-1474.1307373046875, 68.38720703125, 53.52357482910156),
		authorizedJobs = { 'event'} ,
		locked = true
	},


{
		objName = '-1859471240',
		--objYaw = 90.0,
	--	distance = 10,
		objCoords  = vector3(-1462.425048828125, 65.71588134765625, 53.38676071166992),
		textCoords = vector3(-1462.425048828125, 65.71588134765625, 54.38676071166992),
		authorizedJobs = { 'event'} ,
		locked = true
	},


{
		objName = '-1555108147',
		--objYaw = 90.0,
	--	distance = 10,
		objCoords  = vector3(-1607.53564453125, -3005.430908203125, -75.05606842041016),
		textCoords = vector3(-1607.53564453125, -3005.430908203125, -75.05606842041016),
		authorizedJobs = { 'nightclub'} ,
		locked = true
	},


{
		objName = '390840000',
		--objYaw = 90.0,
	--	distance = 10,
		objCoords  = vector3(-1610.12548828125, -3004.97021484375, -78.84087371826172),
		textCoords = vector3(-1610.12548828125, -3004.97021484375, -78.84087371826172),
		authorizedJobs = { 'nightclub'} ,
		locked = true
	},




	--
	-- Addons
	--

	--[[
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = vector3(420.1, -1017.3, 28.0),
		textCoords = vector3(420.1, -1021.0, 32.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	}
	--]]
}