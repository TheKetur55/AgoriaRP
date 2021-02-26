-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

local generalLoaded = false
local PlayingAnim = false

-------------------------------------------------------------------------------------------------
-------------------------------------- AJOUTE de PNJ --------------------------------------------
-------------------------------------------------------------------------------------------------

local ShopClerk = {
  -- ID: id de PNJ | nom: Nom du Blip | BlipID: Icone de Blip | VoiceName: NPC Talk Quand près de lui | Ambiance: Ambiance de Boutique | Arme: Hash of Weapon | modelHash: Modèle | X: Position x | Y: Position Y | Z: Position Z | Rubrique: Où Npc regarde 
	
  --{id =666, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "s_m_y_shop_mask", x = -2770.14, y = 2732.42, z = 6.01, heading = 170.71}, -- Vendeur de masque
  --{id =667, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "cs_orleans", x = -2772.35, y = 2733.73, z = 6.01, heading = 211.17},
  --{id =668, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "u_m_y_rsranger_01", x = -2768.64, y = 2732.67, z = 6.01, heading = 160.22},
  --{id =555, name = "Police",  Weapon = 0x1B06D571, modelHash = "s_m_y_cop_01", x = -1033.17, y = -2735.81, z = 20.16, heading = 139.42},
  --{id =556, name = "Police",  Weapon = 0x1B06D571, modelHash = "s_m_y_cop_01", x = -1032.07, y = -2736.92, z = 20.16, heading = 105.87},
  --{id =557, name = "Police",  Weapon = 0x1B06D571, modelHash = "s_m_y_cop_01", x = 412.93, y = -1026.88, z = 29.66, heading = 66.34},
  --{id =558, name = "Police",  Weapon = 0x1B06D571, modelHash = "s_m_y_cop_01", x = 433.02, y = -985.71, z = 30.71, heading = 98.10},
  --{id =559, name = "Police",  Weapon = 0x1B06D571, modelHash = "s_m_y_cop_01", x = 432.77, y = -977.32, z = 30.71, heading = 46.24},
  --{id =560, name = "Gardien",  Weapon = 0x99AEEB3B, modelHash = "s_m_m_security_01", x = 213.86, y = -808.91, z = 31.01, heading = 338.78},
  {id =561, name = "Loueurs de voiture",  Weapon = 0xA2719263, modelHash = "a_f_y_business_01", x = -1137.95, y = -1734.91, z = 4.46, heading = 31.15},
  {id =561, name = "Pole emploi",  Weapon = 0xA2719263, modelHash = "a_f_y_business_01", x = -1178.38, y = -1715.87, z = 4.46, heading = 218.81},
  {id =562, name = "Vendeur bateaux",  Weapon = 0xA2719263, modelHash = "csb_reporter", x = -864.58, y = -1324.71, z = 0.60, heading = 291.49},
  {id =563, name = "Vendeur voiture",  Weapon = 0xA2719263, modelHash = "csb_reporter", x = -55.62, y = -1098.12, z = 25.42, heading = 357.15},
  {id =564, name = "Mécano au concess",  Weapon = 0xA2719263, modelHash = "s_m_y_xmech_01", x = -40.45, y = -1088.24, z = 25.42, heading = 82.08},
  --{id =564, name = "evenement",  Weapon = 0xA2719263, modelHash = "s_m_y_xmech_02", x = -86.80, y = -811.54, z = 150.10, heading = 82.08},
  --{id =564, name = "evenement",  Weapon = 0xA2719263, modelHash = "ig_fbisuit_01", x = -80.53, y = -817.01, z = 230.00, heading = 82.08},
  {id =565, name = "vendeur moto",  Weapon = 0xA2719263, modelHash = "ig_barry", x = 203.80, y = -994.66, z = -99.99, heading = 189.48},
  {id =565, name = "vendeur Camion",  Weapon = 0xA2719263, modelHash = "ig_barry", x = 968.24, y = -3005.56, z = -39.64, heading = 230.00},
  --{id =566, name = "Gardien",  Weapon = 0x99AEEB3B, modelHash = "s_m_m_security_01", x = -1112.17, y = -2448.68, z = 13.30, heading = 235.52},
  {id =567, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = -47.08, y = -1758.99, z = 29.42, heading = 45.23},
  {id =568, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 24.33, y = -1345.57, z = 29.49, heading = 265.64},
  {id =569, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = -705.97, y = -914.54, z = 19.21, heading = 87.48},
  {id =570, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = -1221.37, y = -908.10, z = 12.32, heading = 26.18},
  {id =571, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = -1486.60, y = -377.45, z = 40.16, heading = 134.14},
  {id =572, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 1134.11, y = -983.11, z = 46.41, heading = 271.49},
  {id =573, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 1164.97, y = -323.58, z = 69.20, heading = 97.84},
  {id =574, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 372.93, y = 328.18, z = 103.56, heading = 250.84},
  {id =575, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = -1819.41, y = 793.55, z = 138.08, heading = 128.28},
  {id =576, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = -2966.31, y = 391.52, z = 15.04, heading = 91.00},
  {id =577, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = -3040.48, y = 583.90, z = 7.90, heading = 16.36},
  {id =578, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = -3243.89, y = 1000.03, z = 12.83, heading = 350.15},
  {id =579, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 1728.48, y = 6416.79, z = 35.03, heading = 238.77},
  {id =580, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 1697.34, y = 4923.34, z = 42.06, heading = 322.38},
  {id =581, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 1959.25, y = 3741.49, z = 32.34, heading = 299.53},
  {id =582, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 1391.77, y = 3606.14, z = 34.98, heading = 192.34},
  {id =583, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 2676.48, y = 3280.20, z = 55.24, heading = 330.03},
  {id =584, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 1165.34, y = 2710.79, z = 38.15, heading = 177.81},
  {id =585, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 549.29, y = 2669.59, z = 42.15, heading = 88.58},
  {id =586, name = "vendeur",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 2555.59, y = 380.89, z = 108.62, heading = 1.56},
  {id =587, name = "coiffeur",  Weapon = 0xA2719263, modelHash = "ig_jewelass", x = 134.89, y = -1707.90, z = 29.29, heading = 159.36},
  {id =588, name = "coiffeur",  Weapon = 0xA2719263, modelHash = "ig_jewelass", x = -1284.04, y = -1115.32, z = 6.99, heading = 129.04},
  {id =589, name = "coiffeur",  Weapon = 0xA2719263, modelHash = "ig_jewelass", x = -822.67, y = -183.54, z = 37.56, heading = 211.26},
  {id =590, name = "coiffeur",  Weapon = 0xA2719263, modelHash = "ig_jewelass", x = -30.90, y = -151.92, z = 57.07, heading = 344.81},
  {id =591, name = "coiffeur",  Weapon = 0xA2719263, modelHash = "ig_jewelass", x = 1211.52, y = -470.78, z = 66.20, heading = 89.80},
  {id =592, name = "coiffeur",  Weapon = 0xA2719263, modelHash = "ig_jewelass", x = 1930.77, y = 3728.16, z = 32.84, heading = 237.71},
  {id =593, name = "coiffeur",  Weapon = 0xA2719263, modelHash = "ig_jewelass", x = -278.01, y = 6230.31, z = 31.69, heading = 50.69},
  {id =594, name = "Banquier",  Weapon = 0xA2719263, modelHash = "ig_bankman", x = 149.28, y = -1042.15, z = 29.36, heading = 334.61},
  {id =595, name = "Banquier",  Weapon = 0xA2719263, modelHash = "ig_bankman", x = 313.61, y = -280.68, z = 54.16, heading = 346.42},
  {id =596, name = "Banquier",  Weapon = 0xA2719263, modelHash = "ig_bankman", x = -351.49, y = -51.49, z = 49.03, heading = 342.26},
  {id =597, name = "Banquier",  Weapon = 0xA2719263, modelHash = "ig_bankman", x = -1211.95, y = -332.00, z = 37.78, heading = 23.07},
  {id =598, name = "Banquier",  Weapon = 0xA2719263, modelHash = "ig_bankman", x = -2961.13, y = 482.88, z = 15.69, heading = 86.21},
  {id =599, name = "Banquier",  Weapon = 0xA2719263, modelHash = "s_m_m_movprem_01", x = -111.16, y = 6470.08, z = 31.62, heading = 130.24},
  {id =600, name = "Banquier",  Weapon = 0xA2719263, modelHash = "u_m_m_bankman", x = -112.20, y = 6471.27, z = 31.62, heading = 130.24},
  {id =601, name = "Banquier",  Weapon = 0xA2719263, modelHash = "ig_bankman", x = -110.01, y = 6469.00, z = 31.62, heading = 130.24},
  {id =602, name = "Banquier",  Weapon = 0xA2719263, modelHash = "u_m_m_bankman", x = 1175.14, y = 2708.26, z = 38.08, heading = 180.71},
  {id =603, name = "Banquier",  Weapon = 0xA2719263, modelHash = "u_m_m_bankman", x = 254.04, y = 222.59, z = 106.28, heading = 159.54},
  {id =604, name = "Banquier",  Weapon = 0xA2719263, modelHash = "ig_bankman", x = 252.33, y = 223.32, z = 106.28, heading = 159.54},
  --{id =605, name = "Garde",  Weapon = 0x99AEEB3B, modelHash = "s_m_m_chemsec_01", x = 264.44, y = 219.76, z = 101.68, heading = 353.45},
  --{id =606, name = "Garde",  Weapon = 0x99AEEB3B, modelHash = "s_m_m_highsec_02", x = 253.56, y = 229.15, z = 101.68, heading = 251.24},
  --{id =607, name = "Garde",  Weapon = 0x99AEEB3B, modelHash = "s_m_m_highsec_01", x = 258.71, y = 222.98, z = 101.68, heading = 347.71},
  --{id =608, name = "Garde",  Weapon = 0x99AEEB3B, modelHash = "s_m_m_highsec_02", x = 261.74, y = 223.11, z = 106.28, heading = 95.98},
  --{id =609, name = "Garde",  Weapon = 0x99AEEB3B, modelHash = "s_m_m_highsec_01", x = 237.90, y = 217.99, z = 110.28, heading = 294.37},
  {id =610, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "s_m_y_ammucity_01", x = 22.60, y = -1105.42, z = 29.79, heading = 156.23},
  {id =612, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "s_m_y_ammucity_01", x = 842.31, y = -1035.40, z = 28.19, heading = 2.16},
  {id =613, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "s_m_y_ammucity_01", x = -662.10, y = -933.50, z = 21.82, heading = 169.38},
  {id =614, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "s_m_y_ammucity_01", x = -1304.10, y = -394.65, z = 36.69, heading = 70.69},
  {id =615, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "s_m_y_ammucity_01", x = -3173.63, y = 1088.21, z = 20.83, heading = 244.08},
  {id =616, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "s_m_y_ammucity_01", x = -1118.95, y = 2699.87, z = 18.55, heading = 212.90},
  {id =617, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "s_m_y_ammucity_01", x = -331.61, y = 6085.08, z = 31.45, heading = 229.36},
  {id =618, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "s_m_y_ammucity_01", x = 1692.20, y = 3760.85, z = 34.70, heading = 225.02},
  {id =619, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "s_m_y_ammucity_01", x = 2567.86, y = 292.54, z = 108.73, heading = 353.47},
  {id =619, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "s_m_y_ammucity_01", x = 253.87, y = -50.55, z = 69.94, heading = 69.87},
  {id =619, name = "acheteur lavande",  Weapon = 0xA2719263, modelHash = "s_f_m_fembarber", x = -1182.58, y = -1719.41, z = 4.46, heading = 218.71},
  {id =619, name = "acheteur ticket",  Weapon = 0xA2719263, modelHash = "a_m_y_soucent_01", x = -1189.14, y = -1723.98, z = 4.46, heading = 218.71},
  --{id =619, name = "Job livraison",  Weapon = 0xA2719263, modelHash = "a_f_y_bevhills_02", x = 29.30, y = -1770.29, z = 29.60, heading = 53.09},
  --{id =619, name = "Job livraison",  Weapon = 0xA2719263, modelHash = "s_m_y_chef_01", x = 46.74, y = -1749.70, z = 29.60, heading = 53.09},
  --{id =619, name = "Job livraison",  Weapon = 0xA2719263, modelHash = "a_f_y_bevhills_02", x = 54.76, y = -1739.98, z = 29.60, heading = 53.09},
  --{id =619, name = "Job livraison",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = 63.64, y = -1728.77, z = 29.60, heading = 53.09},
  {id =619, name = "Tatooshop",  Weapon = 0xA2719263, modelHash = "ig_ortega", x = 1324.57, y = -1650.09, z = 52.27, heading = 128.49},
  {id =619, name = "Tatooshop",  Weapon = 0xA2719263, modelHash = "ig_ortega", x = -1152.13, y = -1423.98, z = 4.95, heading = 120.72},
  {id =619, name = "Tatooshop",  Weapon = 0xA2719263, modelHash = "ig_ortega", x = 319.74, y = 181.00, z = 103.58, heading = 253.06},
  {id =619, name = "Tatooshop",  Weapon = 0xA2719263, modelHash = "ig_ortega", x = -3170.55, y = 1073.09, z = 20.82, heading = 336.49},
  {id =619, name = "Tatooshop",  Weapon = 0xA2719263, modelHash = "ig_ortega", x = 1862.70, y = 3748.48, z = 33.03, heading = 30.25},
  {id =619, name = "Tatooshop",  Weapon = 0xA2719263, modelHash = "ig_ortega", x = -292.08, y = 6199.68, z = 31.48, heading = 222.92},
  {id =619, name = "Job livraison",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = -1192.77, y = -1725.50, z = 4.46, heading = 218.37},
  {id =619, name = "Job livraison",  Weapon = 0xA2719263, modelHash = "s_m_y_chef_01", x = -1188.77, y = -1731.16, z = 4.46, heading = 218.37},
  {id =619, name = "Achat viande",  Weapon = 0xA2719263, modelHash = "s_m_y_chef_01", x = -1185.44, y = -1721.47, z = 4.46, heading = 218.37},
  {id =619, name = "achat pomme",  Weapon = 0xA2719263, modelHash = "a_f_y_bevhills_02", x = -1183.89, y = -1720.40, z = 4.46, heading = 218.37},
  {id =619, name = "Tabac",  Weapon = 0xA2719263, modelHash = "a_m_y_epsilon_02", x = -1173.73, y = -1713.42, z = 4.46, heading = 310.23},
  {id =619, name = "magazin vetement",  Weapon = 0xA2719263, modelHash = "a_f_y_bevhills_02", x = -1142.11, y = -1706.86, z = 4.46, heading = 119.57},
  
  


	--{id =669, name = "Ammunation",  Weapon = 0xA2719263, modelHash = "csb_ramp_gang", x = -153.13, y = -1641.41, z = 35.85, heading = 76.178}  -- Vendeur Arme
}



	Citizen.CreateThread(function()
	  while true do
		Citizen.Wait(0)
		if (not generalLoaded) then
		  for i=1, #ShopClerk do
			RequestModel(GetHashKey(ShopClerk[i].modelHash))
			while not HasModelLoaded(GetHashKey(ShopClerk[i].modelHash)) do
			  Wait(1)
			end
			ShopClerk[i].id = CreatePed(2, ShopClerk[i].modelHash, ShopClerk[i].x, ShopClerk[i].y, ShopClerk[i].z, ShopClerk[i].heading, false, false)
			SetPedFleeAttributes(ShopClerk[i].id, 0, 0)
			SetAmbientVoiceName(ShopClerk[i].id, ShopClerk[i].Ambiance)
			SetPedDropsWeaponsWhenDead(ShopClerk[i].id, false)
			SetPedDiesWhenInjured(ShopClerk[i].id, false)
			GiveWeaponToPed(ShopClerk[i].id, ShopClerk[i].Weapon, 2800, false, true)
		  end
		  generalLoaded = true
		end
		
	  end
	end)

	-------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------

	-- Action lorsque joueur Près de NPC (ou non)
	Citizen.CreateThread(function()
	  while true do
		Citizen.Wait(0)
			RequestAnimDict("random@shop_gunstore")
			while (not HasAnimDictLoaded("random@shop_gunstore")) do 
				Citizen.Wait(0) 
			end
			
			for i=1, #ShopClerk do
				distance = GetDistanceBetweenCoords(ShopClerk[i].x, ShopClerk[i].y, ShopClerk[i].z, GetEntityCoords(GetPlayerPed(-1)))
				if distance < 3 and PlayingAnim ~= true then
					TaskPlayAnim(ShopClerk[i].id,"random@shop_gunstore","_greeting", 1.0, -1.0, 4000, 0, 1, true, true, true)
					PlayAmbientSpeech1(ShopClerk[i].id, ShopClerk[i].VoiceName, "SPEECH_PARAMS_FORCE", 1)
					PlayingAnim = true
					Citizen.Wait(4000)
						TaskPlayAnim(ShopClerk[i].id,"random@shop_gunstore","_idle_b", 1.0, -1.0, -1, 0, 1, true, true, true)
						Citizen.Wait(4000)
				else
					
				end
				if distance > 4 and distance < 7 then
					PlayingAnim = false
				end


			end
	  end
	end)

