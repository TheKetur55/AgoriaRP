local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
Config								= {}
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true 
-- Pointer du doight
Config.pointing = {
	clavier = Keys["B"],
	manette = Keys["B"],
}
-- S'acroupir
Config.crouch = {
	clavier = Keys["LEFTCTRL"],
	manette = Keys["LEFTCTRL"],
}

Config.Animations = {
		
		{
		name	= 'rapide',
		label = 'Rapide',
		items = {
			{label = "Bras croisés", type = "movloopanim", data = {lib = "amb@world_human_hang_out_street@female_arms_crossed@idle_a", anim = "idle_a"}},
			{label = "S'asseoir (Par terre)", type = "loopanim", data = {lib = "anim@heists@fleeca_bank@ig_7_jetski_owner", anim = "owner_idle"}},
			{label = "Convulser", type = "loopanim", data = {lib = "missheistfbi3b_ig8_2", anim = "cpr_loop_victim"}},
			{label = "Doigt d'honneur", type = "movanim", data = {lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter"}},
			{label = "Position Fouille", type = "movloopanim", data = {lib = "random@arrests@busted", anim = "idle_c"}},
			{label = "Suspect : se rendre à la police (genoux)", type = "loopanim", data = {lib = "random@arrests@busted", anim = "idle_c"}},
			{label = "Récolte Champ", type = "scenario", data = {anim = "world_human_gardener_plant"}},
			{label = "S'asseoir", type = "scenario", data = {anim = "PROP_HUMAN_SEAT_BENCH"}},
					}
		},


		{
		name	= 'salutations',
		label = 'Salutations',
		items = {
						{label = "Saluer", type = "movanim", data = {lib = "gestures@m@standing@casual", anim = "gesture_hello"}},
						{label = "Salut bandit", type = "anim", data = {lib = "mp_ped_interaction", anim = "hugs_guy_a"}},
						{label = "Salut militaire", type = "movloopanim", data = {lib = "mp_player_int_uppersalute", anim = "mp_player_int_salute"}},
						{label = "Bisous", type = "movanim", data = {lib = "anim@mp_player_intcelebrationfemale@blow_kiss", anim = "blow_kiss"}},
						{label = "Siffler 1", type = "movanim", data = {lib = "taxi_hail", anim = "hail_taxi"}},
						{label = "Siffler 2", type = "movanim", data = {lib = "rcmnigel1c", anim = "hailing_whistle_waive_a"}},
						{label = "Agiter les bras", type = "movloopanim", data = {lib = "random@car_thief@victimpoints_ig_3", anim = "arms_waving"}},
					}
		},

		{
		name	= 'positions',
		label = 'Positions',
		items = {
						{label = "Prendre des photos (téléphone)", type = "scenario", data = {anim = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"}},
						--{label = "Fumer une cigarette", type = "scenario", data = {anim = "WORLD_HUMAN_SMOKING"}},
						{label = "S'asseoir", type = "loopanim", data = {lib = "anim@heists@prison_heistunfinished_biztarget_idle", anim = "target_idle"}},
						{label = "S'asseoir (Par terre) 1", type = "loopanim", data = {lib = "anim@heists@fleeca_bank@ig_7_jetski_owner", anim = "owner_idle"}},
						{label = "S'asseoir (Par terre) 2", type = "scenario", data = {anim = "WORLD_HUMAN_PICNIC"}},
						{label = "Couché sur le dos", type = "scenario", data = {anim = "WORLD_HUMAN_SUNBATHE_BACK"}},
						{label = "Couché sur le ventre", type = "scenario", data = {anim = "WORLD_HUMAN_SUNBATHE"}},
						{label = "Couché sur le côté", type = "scenario", data = {anim = "WORLD_HUMAN_BUM_SLUMPED"}},
						{label = "Position Latérale de Sécurité", type = "loopanim", data = {lib = "amb@world_human_bum_slumped@male@laying_on_right_side@base", anim = "base"}},
						{label = "Attendre contre un mur", type = "scenario", data = {anim = "world_human_leaning"}},
						{label = "Accoudé au comptoir", type = "scenario", data = {anim = "PROP_HUMAN_BUM_SHOPPING_CART"}},
						{label = "Appuyé sur une table", type = "loopanim", data = {lib = "abigail_mcs_1_concat-5", anim = "player_zero_dual-5"}},
						{label = "Position de Fouille", type = "anim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_bj_to_prop_female"}},
						{label = "Patienter 1", type = "scenario", data = {anim = "PROP_HUMAN_STAND_IMPATIENT"}},
						{label = "Patienter 2", type = "movloopanim", data = {lib = "mini@hookers_sp", anim = "idle_wait"}},
						{label = "Patienter 3", type = "loopanim", data = {lib = "anim@mp_corona_idles@female_c@base", anim = "base"}},
						{label = "Mains sur la ceinture", type = "movloopanim", data = {lib = "amb@world_human_cop_idles@male@base", anim = "base"}},
						{label = "Garde 1", type = "movloopanim", data = {lib = "mini@strip_club@idles@bouncer@base", anim = "base"}},
						{label = "Garde 2", type = "movloopanim", data = {lib = "mini@strip_club@idles@bouncer@idle_a", anim = "idle_a"}},
						{label = "Souffrir (avec une arme)", type = "anim", data = {lib = "combat@damage@injured_pistol@to_writhe", anim = "variation_b"}}, 
						{label = "Souffrir (sans arme)", type = "anim", data = {lib = "combat@damage@rb_writhe", anim = "rb_writhe_loop"}}, 
						{label = "Convulser", type = "loopanim", data = {lib = "missheistfbi3b_ig8_2", anim = "cpr_loop_victim"}},
						{label = "Joindre les mains", type = "movloopanim", data = {lib = "pro_mcs_7_concat-0", anim = "cs_priest_dual-0"}},
		}
		},

		{
		name	= 'gestuellesbon',
		label = 'Gestuelles (bon)',
		items = {
						{label = "Toi", type = "movanim", data = {lib = "gestures@m@standing@casual", anim = "gesture_point"}},
						{label = "Viens", type = "movanim", data = {lib = "gestures@m@standing@casual", anim = "gesture_come_here_soft"}},
						{label = "Féliciter", type = "scenario", data = {anim = "WORLD_HUMAN_CHEERING"}},
						{label = "Super 1", type = "movanim", data = {lib = "anim@mp_player_intcelebrationmale@thumbs_up", anim = "thumbs_up"}},
						{label = "Super 2", type = "movanim", data = {lib = "mp_action", anim = "thanks_male_06"}},
						{label = "Yeah", type = "movanim", data = {lib = "mini@dartsoutro", anim = "darts_outro_01_guy1"}},
						{label = "Enlacer", type = "anim", data = {lib = "mp_ped_interaction", anim = "kisses_guy_a"}},
						{label = "Bras croisés 1", type = "movloopanim", data = {lib = "amb@world_human_hang_out_street@female_arms_crossed@idle_a", anim = "idle_a"}},
						{label = "Bras croisés 2", type = "loopanim", data = {lib = "amb@world_human_hang_out_street@male_c@base", anim = "base"}},
						{label = "Selfie 1", type = "movanim", data = {lib = "cellphone@self@franklin@", anim = "peace"}},
						{label = "Selfie 2", type = "movanim", data = {lib = "cellphone@self@trevor@", anim = "aggressive_finger"}},
						{label = "Selfie 3", type = "scenario", data = {anim = "world_human_tourist_mobile"}},
						{label = "Prenez place", type = "movanim", data = {lib = "mini@strip_club@lap_dance@ld_girl_a_approach", anim = "ld_girl_a_approach_f"}},
						{label = "Je le ferais", type = "movanim", data = {lib = "gestures@m@standing@casual", anim = "gesture_i_will"}},
					}
		},

		{
		name	= 'gestuellesmauvais',
		label = 'Gestuelles (mauvais)',
		items = {
						{label = "Calme toi", type = "movanim", data = {lib = "gestures@m@standing@casual", anim = "gesture_easy_now"}},						
						{label = "Branleur", type = "movloopanim", data = {lib = "mp_player_int_upperwank", anim = "mp_player_int_wank_01"}},
						{label = "Keskya ?", type = "movanim", data = {lib = "gestures@m@standing@casual", anim = "gesture_bring_it_on"}},
						{label = "Fight ?", type = "anim", data = {lib = "anim@deathmatch_intros@unarmed", anim = "intro_male_unarmed_e"}},
						{label = "Craquer poings 1", type = "movanim", data = {lib = "anim@mp_player_intcelebrationfemale@knuckle_crunch", anim = "knuckle_crunch"}},
						{label = "Craquer poings 2", type = "movanim", data = {lib = "anim@mp_player_intcelebrationmale@knuckle_crunch", anim = "knuckle_crunch"}},
						{label = "Doigt d'honneur 1", type = "movanim", data = {lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter"}},
						{label = "Doigt d'honneur 2", type = "movanim", data = {lib = "anim@mp_player_intcelebrationfemale@finger", anim = "finger"}},
						{label = "Je t'emmerde", type = "movanim", data = {lib = "anim@mp_player_intcelebrationfemale@dock", anim = "dock"}},
						{label = "Se gratter les fesses", type = "movanim", data = {lib = "anim@heists@team_respawn@respawn_02", anim = "heist_spawn_02_ped_d"}},				
				}
		},

		{
		name	= 'humeurs',
		label = 'Humeurs',
		items = {
						{label = "Avoir peur", type = "anim", data = {lib = "amb@code_human_cower_stand@female@idle_a", anim = "idle_c"}},						
						{label = "Je suis dans la merde", type = "anim", data = {lib = "amb@world_human_bum_standing@depressed@idle_a", anim = "idle_a"}},
						{label = "Facepalm", type = "movanim", data = {lib = "anim@mp_player_intcelebrationmale@face_palm", anim = "face_palm"}},
						{label = "Balle dans la tête", type = "anim", data = {lib = "mp_suicide", anim = "pistol"}},
						{label = "Déprimer au sol", type = "loopanim", data = {lib = "amb@world_human_stupor@male@base", anim = "base"}},
						{label = "Bouder", type = "anim", data = {lib = "mini@hookers_sp", anim = "idle_reject"}},
						{label = "Merde !", type = "movanim", data = {lib = "mini@dartsoutro", anim = "darts_outro_01_guy2"}},
		}
		},

		{
		name	= 'travail',
		label = 'Travail',
		items = {
						{label = "Suspect : se rendre à la police (genoux)", type = "loopanim", data = {lib = "random@arrests@busted", anim = "idle_c"}},
						{label = "Suspect : se rendre à la police (debout)", type = "movloopanim", data = {lib = "random@arrests@busted", anim = "idle_c"}},
						{label = "Police : Verbaliser", type = "scenario", data = {anim = "CODE_HUMAN_MEDIC_TIME_OF_DEATH"}},
						{label = "Police : parler à la radio", type = "movloopanim", data = {lib = "random@arrests", anim = "generic_radio_chatter"}},
						{label = "Police : enquêter", type = "anim", data = {lib = "amb@code_human_police_investigate@idle_b", anim = "idle_f"}},
						{label = "Police : jumelles", type = "scenario", data = {anim = "WORLD_HUMAN_BINOCULARS"}},
						{label = "Dépanneur : réparer sous véhicule", type = "scenario", data = {anim = "world_human_vehicle_mechanic"}},
						{label = "Dépanneur : réparer le moteur", type = "loopanim", data = {lib = "mini@repair", anim = "fixing_a_ped"}},
						{label = "Dépanneur : utiliser un chalumeau", type = "scenario", data = {anim = "WORLD_HUMAN_WELDING"}},
						{label = "Médecin : observer", type = "scenario", data = {anim = "CODE_HUMAN_MEDIC_KNEEL"}},
						{label = "Médecin : massage cardiaque", type = "loopanim", data = {lib = "mini@cpr@char_a@cpr_str", anim = "cpr_pumpchest"}},
						{label = "Médecin : réanimation", type = "loopanim", data = {lib = "mini@cpr@char_a@cpr_def", anim = "cpr_intro"}},
						{label = "Médecin : bouche à bouche", type = "loopanim", data = {lib = "mini@cpr@char_a@cpr_str", anim = "cpr_kol"}},
						{label = "Barman : servir un shot", type = "anim", data = {lib = "mini@drinking", anim = "shots_barman_b"}},
						{label = "Videur", type = "movanim", data = {lib = "amb@code_human_police_crowd_control@idle_a", anim = "idle_a"}},
						--{label = "Journaliste : Prendre une photo", type = "scenario", data = {anim = "WORLD_HUMAN_PAPARAZZI"}},
						{label = "Pêcheur", type = "scenario", data = {anim = "world_human_stand_fishing"}},
						{label = "Agriculture : récolter", type = "scenario", data = {anim = "world_human_gardener_plant"}},
						{label = "Clochard : Faire la manche", type = "scenario", data = {anim = "WORLD_HUMAN_BUM_FREEWAY"}},						
						{label = "Tout métiers : Passer le balai", type = "scenario", data = {anim = "WORLD_HUMAN_JANITOR"}},																		
						{label = "Tout métiers : Coups de marteau", type = "scenario", data = {anim = "WORLD_HUMAN_HAMMERING"}},						
						{label = "Tout métiers : Nettoyage fixe", type = "scenario", data = {anim = "world_human_maid_clean"}},												
						{label = "Tout métiers : Nettoyage mobile", type = "movloopanim", data = {lib = "timetable@floyd@clean_kitchen@idle_a", anim = "idle_a"}},
						{label = "Tout métiers : Prendre des notes", type = "scenario", data = {anim = "WORLD_HUMAN_CLIPBOARD"}},						
						
		}
		},
		--
		  {
        name  = 'hakanonur61616',
        label = 'Dance',
        items = {
        
        {label = "Taniec 1", type = "anim", data = {lib = "anim@amb@nightclub@dancers@club_ambientpeds@med-hi_intensity", anim = "mi-hi_amb_club_10_v1_male^6"}},
        {label = "Taniec 2", type = "anim", data = {lib = "amb@code_human_in_car_mp_actions@dance@bodhi@ds@base", anim = "idle_a_fp"}},
        {label = "Taniec 3", type = "anim", data = {lib = "amb@code_human_in_car_mp_actions@dance@bodhi@rds@base", anim = "idle_b"}},
        {label = "Taniec 4", type = "anim", data = {lib = "amb@code_human_in_car_mp_actions@dance@std@ds@base", anim = "idle_a"}},
        {label = "Taniec 5", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", anim = "hi_dance_facedj_09_v2_male^6"}},
        {label = "Taniec 6", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", anim = "li_dance_facedj_09_v1_male^6"}},
        {label = "Taniec 7", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_09_v1_male^6"}},
        {label = "Taniec 8", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", anim = "trans_dance_facedj_li_to_hi_07_v1_male^6"}},
        {label = "Taniec 9", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_13_v2_male^6"}},
        {label = "Taniec 10", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", anim = "trans_dance_crowd_hi_to_li__07_v1_male^6"}},
        {label = "Taniec 11", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", anim = "hi_dance_prop_13_v1_male^6"}},
        {label = "Taniec 12", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", anim = "trans_crowd_prop_mi_to_li_11_v1_male^6"}},
        {label = "Taniec 13", type = "anim", data = {lib = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", anim = "med_center_up"}},
        {label = "Taniec 14", type = "anim", data = {lib = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", anim = "med_right_up"}},
        {label = "Taniec 15", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_groups@low_intensity", anim = "li_dance_crowd_17_v1_male^6"}},
        {label = "Taniec 16", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", anim = "trans_dance_facedj_mi_to_li_09_v1_male^6"}},
        {label = "Taniec Rak xD", type = "anim", data = {lib = "special_ped@zombie@monologue_4@monologue_4l", anim = "iamtheundead_11"}},
        {label = "Taniec 17", type = "anim", data = {lib = "timetable@tracy@ig_5@idle_b", anim = "idle_e"}},
        {label = "Taniec 18", type = "anim", data = {lib = "mini@strip_club@idles@dj@idle_04", anim = "idle_04"}},
        {label = "Taniec 19", type = "anim", data = {lib = "special_ped@mountain_dancer@monologue_1@monologue_1a", anim = "mtn_dnc_if_you_want_to_get_to_heaven"}},
        {label = "Taniec 20", type = "anim", data = {lib = "special_ped@mountain_dancer@monologue_4@monologue_4a", anim = "mnt_dnc_verse"}},
        {label = "Taniec 21", type = "anim", data = {lib = "special_ped@mountain_dancer@monologue_3@monologue_3a", anim = "mnt_dnc_buttwag"}},
        {label = "Taniec 22", type = "anim", data = {lib = "anim@amb@nightclub@dancers@black_madonna_entourage@", anim = "hi_dance_facedj_09_v2_male^5"}},
        {label = "Taniec 23", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_single_props@", anim = "hi_dance_prop_09_v1_male^6"}},
        {label = "Taniec 24", type = "anim", data = {lib = "anim@amb@nightclub@dancers@dixon_entourage@", anim = "mi_dance_facedj_15_v1_male^4"}},
        {label = "Taniec 25", type = "anim", data = {lib = "anim@amb@nightclub@dancers@podium_dancers@", anim = "hi_dance_facedj_17_v2_male^5"}},
        {label = "Taniec 26", type = "anim", data = {lib = "anim@amb@nightclub@dancers@tale_of_us_entourage@", anim = "mi_dance_prop_13_v2_male^4"}},
        {label = "Taniec 27", type = "anim", data = {lib = "misschinese2_crystalmazemcs1_cs", anim = "dance_loop_tao"}},
        {label = "Taniec 28", type = "anim", data = {lib = "misschinese2_crystalmazemcs1_ig", anim = "dance_loop_tao"}},
        {label = "Taniec 29", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@uncle_disco", anim = "uncle_disco"}},
        {label = "Taniec 30", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@raise_the_roof", anim = "raise_the_roof"}},
        {label = "Taniec 31", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@cats_cradle", anim = "cats_cradle"}},
        {label = "Taniec 32", type = "anim", data = {lib = "anim@mp_player_intupperbanging_tunes", anim = "idle_a"}},
        {label = "Taniec 33", type = "anim", data = {lib = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", anim = "high_center"}},
        {label = "Taniec 34", type = "anim", data = {lib = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", anim = "high_center"}},
        {label = "Taniec 35", type = "anim", data = {lib = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", anim = "high_center"}},
        {label = "Taniec 36", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@", anim = "trans_dance_facedj_hi_to_mi_11_v1_female^6"}},
        {label = "Taniec 37", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", anim = "trans_dance_facedj_hi_to_li_07_v1_female^6"}},
        {label = "Taniec 38", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_facedj@", anim = "hi_dance_facedj_09_v1_female^6"}},
        {label = "Taniec 39", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", anim = "hi_dance_crowd_09_v1_female^6"}},
        {label = "Taniec 40", type = "anim", data = {lib = "anim@amb@nightclub@lazlow@hi_podium@", anim = "danceidle_hi_06_base_laz"}},
    
        
             
        }
    },

		{
		name	= 'festives',
		label = 'Festives',
		items = {
						{label = "Danser", type = "loopanim", data = {lib = "amb@world_human_partying@female@partying_beer@base", anim = "base"}},
						{label = "Danse de la pluie", type = "loopanim", data = {lib = "anim@mp_player_intcelebrationpaired@f_f_sarcastic", anim = "sarcastic_left"}},
						{label = "Danse timide", type = "loopanim", data = {lib = "mini@strip_club@drink@idle_a", anim = "idle_a"}},
						{label = "Dance du ventre", type = "loopanim", data = {lib = "mini@strip_club@private_dance@idle", anim = "priv_dance_idle"}},
						{label = "Danse sexy", type = "loopanim", data = {lib = "mini@strip_club@private_dance@part1", anim = "priv_dance_p1"}},
						{label = "Jouer de la musique", type = "scenario", data = {anim = "WORLD_HUMAN_MUSICIAN"}},
						{label = "Dj", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@dj", anim = "dj"}},
						{label = "Air Guitar", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@air_guitar", anim = "air_guitar"}},
						{label = "Air Synth", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@air_synth", anim = "air_synth"}},						
						{label = "Air Shagging", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@air_shagging", anim = "air_shagging"}},
						{label = "Rock'n'roll", type = "movloopanim", data = {lib = "mp_player_int_upperrock", anim = "mp_player_int_rock"}},
						{label = "Bourré sur place", type = "anim", data = {lib = "amb@world_human_bum_standing@drunk@idle_a", anim = "idle_a"}},
						{label = "Boire une biere", type = "scenario", data = {anim = "WORLD_HUMAN_DRINKING"}},
						{label = "Bière en zik", type = "scenario", data = {anim = "WORLD_HUMAN_PARTYING"}},

				}
		},

		{
		name	= 'sportives',
		label = 'Sportives',
		items = {
						{label = "Montrer ses muscles", type = "movloopanim", data = {lib = "amb@world_human_muscle_flex@arms_at_side@base", anim = "base"}},
						{label = "Barre de musculation", type = "scenario", data = {anim = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS"}},
						{label = "Faire des pompes", type = "loopanim", data = {lib = "amb@world_human_push_ups@male@base", anim = "base"}},
						{label = "Faire des abdos", type = "loopanim", data = {lib = "amb@world_human_sit_ups@male@base", anim = "base"}},
						{label = "Traction", type = "scenario", data = {anim = "PROP_HUMAN_MUSCLE_CHIN_UPS"}},
						{label = "Traction 2", type = "scenario", data = {anim = "PROP_HUMAN_MUSCLE_CHIN_UPS_ARMY"}},
						{label = "Traction 3", type = "scenario", data = {anim = "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON"}},
						{label = "Faire du yoga", type = "loopanim", data = {lib = "amb@world_human_yoga@male@base", anim = "base_a"}},
						{label = "Faire du jogging", type = "scenario", data = {anim = "WORLD_HUMAN_JOG_STANDING"}},						
		}
		},


		{
		name	= 'sexytime',
		label = 'Sexy time',
		items = {
						{label = "Racoller", type = "scenario", data = {anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"}},
						{label = "Pose michto", type = "scenario", data = {anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"}},
						{label = "Aguicher 1", type = "anim", data = {lib = "mini@hookers_spvanilla", anim = "idle_b"}},
						{label = "Aguicher 2", type = "loopanim", data = {lib = "mini@strip_club@idles@stripper", anim = "stripper_idle_01"}},
						{label = "Aguicher 3", type = "anim", data = {lib = "mini@strip_club@idles@stripper", anim = "stripper_idle_04"}},
						{label = "Aguicher 4", type = "anim", data = {lib = "mini@strip_club@idles@stripper", anim = "stripper_idle_05"}},
						{label = "Aguicher 5", type = "anim", data = {lib = "mini@strip_club@idles@stripper", anim = "stripper_idle_06"}},
						{label = "Montrer ses fesses", type = "anim", data = {lib = "mini@hookers_sp", anim = "ilde_c"}},
						{label = "Strip Tease 1", type = "loopanim", data = {lib = "mini@strip_club@lap_dance@ld_girl_a_song_a_p1", anim = "ld_girl_a_song_a_p1_f"}},
						{label = "Strip Tease 2", type = "loopanim", data = {lib = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2"}},
						{label = "Stip Tease au sol", type = "loopanim", data = {lib = "mini@strip_club@private_dance@part3", anim = "priv_dance_p3"}},
				--		{label = "Homme se faire su*** en voiture", type = "loopanim", data = {lib = "oddjobs@towing", anim = "m_blow_job_loop"}},
				--		{label = "Femme faire une gaterie en voiture", type = "loopanim", data = {lib = "oddjobs@towing", anim = "f_blow_job_loop"}},
				--		{label = "Homme bais** en voiture", type = "loopanim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_sex_loop_player"}},
				--		{label = "Femme bais** en voiture", type = "loopanim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_sex_loop_female"}},
						{label = "Se gratter l'entrejambe", type = "movloopanim", data = {lib = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch"}},
		 
		}
  }
}

Config.Demarches = {
		
  {
    name	= 'ivresse',
    label = 'Ivresse',
    items = {
      {label = "Défoncé",                   value = 'move_m@buzzed' },
      {label = "Légère ivresse",            value = 'MOVE_M@BAIL_BOND_NOT_TAZERED' },
      {label = "Légère ivresse prononcée",  value = 'MOVE_M@DRUNK@SLIGHTLYDRUNK' },
      {label = "Ivresse",                   value = 'MOVE_M@BAIL_BOND_TAZERED' },
      {label = "Ivresse prononcée",         value = 'MOVE_M@DRUNK@VERYDRUNK' }
    }
  },
  {
    name	= 'sexyness',
    label = 'Sexyness',
    items = {
      {label = "Légèrement sexy",       value = 'MOVE_F@GANGSTER@NG' },
      {label = "Jeune aguicheuse",       value = 'move_characters@tracey' },
      {label = "Efféminé lent",         value = 'move_f@sexy@a' },
      {label = "Homme efféminé",        value = 'MOVE_M@FEMME@' },
      {label = "Femme prétentieuse",    value = 'MOVE_F@FEMME@' },
      {label = "Prétention 1",          value = 'MOVE_M@GANGSTER@NG' },
      {label = "Prétention 2",          value = 'MOVE_M@POSH@' },
      {label = "Canard",                value = 'move_f@heels@d' },
      {label = "Princesse",             value = 'MOVE_F@POSH@' },
      {label = "Gros paquet",           value = 'MOVE_M@TOUGH_GUY@' },
      {label = "Onduler du postérieur", value = 'MOVE_F@TOUGH_GUY@' }
    }
  },
  {
    name	= 'menace',
    label = 'Menace',
    items = {
      {label = "Gardien (avec arme)",     value = 'MOVE_M@PRISON_GAURD' },
      {label = "Policier (avec arme)",    value = 'move_cop@action' },
      {label = "Menaçant (arme) 1",       value = 'clipset@move@trash_fast_turn' },
      {label = "Menaçant (arme) 2",       value = 'move_m@intimidation@1h' },
      {label = "Menaçant lourd 1",        value = 'move_characters@franklin@fire' },
      {label = "Menaçant lourd 2",        value = 'move_characters@michael@fire' },
      {label = "Menaçant lent",           value = 'move_characters@Jimmy@slow@' }
    }
  },
  {
    name	= 'gangster',
    label = 'Gangster',
    items = {
      {label = "Gangster jeune",      value = 'move_m@JOG@' },
      {label = "Gangster vieux",      value = 'move_p_m_zero_janitor' },
      {label = "Gangster vieux lent", value = 'move_p_m_zero_slow' },
      {label = "Gangster latino",     value = 'move_m@casual@d' }
    }
  },
  {
    name	= 'gestuellesbad',
    label = 'Gestuelles (mauvais)',
    items = {
      {label = "Désespéré 1",     value = 'move_m@gangster@var_f' },
      {label = "Désespéré 2",       value = 'move_f@depressed@c' },
      {label = "Apeuré",        value = 'move_f@scared' },
      {label = "Regarder pieds",       value = 'move_m@leaf_blower' },
      {label = "Triste 1",       value = 'move_m@sad@a' },
      {label = "Triste 2",       value = 'move_m@sad@b' },
      {label = "Serré",         value = 'ANIM_GROUP_MOVE_BALLISTIC' },
    }
  },
  {
    name	= 'gestuellesgood',
    label = 'Gestuelles (bon)',
    items = {
      {label = "Déterminé 1",   value = 'move_m@fire' },
      {label = "Déterminé 2",   value = 'move_m@brave' },
      {label = "Heureux",       value = 'move_m@money' },
      {label = "Détendu 1",     value = 'move_m@gangster@var_e' },
      {label = "Détendu 2",     value = 'move_m@casual@a' },
      {label = "Détendu 3",     value = 'move_m@casual@b' },
      {label = "Swag 1",          value = 'move_m@swagger' },
      {label = "Swag 2",       value = 'move_m@swagger@b' },
      {label = "Arrogance",       value = 'move_f@arrogant@a' },
      {label = "Bouge épaules", value = 'move_m@bag' },
      {label = "Musclé",        value = 'move_m@muscle@a' }
    }
  },
  {
    name	= 'divers',
    label = 'Divers',
    items = {
      {label = "Pressé",        value = 'ANIM_GROUP_MOVE_LEMAR_ALLEY' },
      {label = "Très pressé",   value = 'move_m@gangster@var_i' },
      {label = "Footing",       value = 'FEMALE_FAST_RUNNER' },
      {label = "Sac à dos",     value = 'move_m@hiking' },
      {label = "Boiteux 1",     value = 'move_heist_lester' },
      {label = "Boiteux 2",     value = 'move_injured_generic' },
    }
  }


}

--[[
	{
		name	= 'attitudem',
		label = 'Attitudes',
		items = {
			{label = "Normal M", type = "attitude", data = {lib = "move_m@confident", anim = "move_m@confident"}},
			{label = "Normal F", type = "attitude", data = {lib = "move_f@heels@c", anim = "move_f@heels@c"}},
			{label = "Depressif", type = "attitude", data = {lib = "move_m@depressed@a", anim = "move_m@depressed@a"}},
			{label = "Depressif F", type = "attitude", data = {lib = "move_f@depressed@a", anim = "move_f@depressed@a"}},
			{label = "Business", type = "attitude", data = {lib = "move_m@business@a", anim = "move_m@business@a"}},
			{label = "Determine", type = "attitude", data = {lib = "move_m@brave@a", anim = "move_m@brave@a"}},
			{label = "Casual", type = "attitude", data = {lib = "move_m@casual@a", anim = "move_m@casual@a"}},
			{label = "Trop mange", type = "attitude", data = {lib = "move_m@fat@a", anim = "move_m@fat@a"}},
			{label = "Hipster", type = "attitude", data = {lib = "move_m@hipster@a", anim = "move_m@hipster@a"}},
			{label = "Blesse", type = "attitude", data = {lib = "move_m@injured", anim = "move_m@injured"}},
			{label = "Intimide", type = "attitude", data = {lib = "move_m@hurry@a", anim = "move_m@hurry@a"}},
			{label = "Hobo", type = "attitude", data = {lib = "move_m@hobo@a", anim = "move_m@hobo@a"}},
			{label = "Malheureux", type = "attitude", data = {lib = "move_m@sad@a", anim = "move_m@sad@a"}},
			{label = "Muscle", type = "attitude", data = {lib = "move_m@muscle@a", anim = "move_m@muscle@a"}},
			{label = "Choc", type = "attitude", data = {lib = "move_m@shocked@a", anim = "move_m@shocked@a"}},
			{label = "Sombre", type = "attitude", data = {lib = "move_m@shadyped@a", anim = "move_m@shadyped@a"}},
			{label = "Fatigue", type = "attitude", data = {lib = "move_m@buzzed", anim = "move_m@buzzed"}},
			{label = "Pressee", type = "attitude", data = {lib = "move_m@hurry_butch@a", anim = "move_m@hurry_butch@a"}},
			{label = "Fier", type = "attitude", data = {lib = "move_m@money", anim = "move_m@money"}},
			{label = "Petite course", type = "attitude", data = {lib = "move_m@quick", anim = "move_m@quick"}},
			{label = "Mangeuse d'homme", type = "attitude", data = {lib = "move_f@maneater", anim = "move_f@maneater"}},
			{label = "Impertinent", type = "attitude", data = {lib = "move_f@sassy", anim = "move_f@sassy"}},	
			{label = "Arrogante", type = "attitude", data = {lib = "move_f@arrogant@a", anim = "move_f@arrogant@a"}},
		}
		},
]]--
