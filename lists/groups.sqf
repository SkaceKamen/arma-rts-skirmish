RTS_LIST_GROUPS = [];

/**
 * Structure:
 *  [ [ DISPLAY NAME, DISPLAY ICON ], COST, UNITS LIST, AI TAGS ]
 */

RTS_LIST_GROUPS set [SIDE_WEST, [
	[["Infantry squad","b_inf.paa"], 150, [
		["B_Soldier_SL_F"],
		["B_Soldier_F"],
		["B_soldier_LAT_F"],
		["B_soldier_M_F"],
		["B_Soldier_TL_F"],
		["B_Soldier_A_F"],
		["B_soldier_AR_F"],
		["B_medic_F"]
	]],
	[["Assault squad","b_inf.paa"], 200, [
		["B_Soldier_SL_F"],
		["B_HeavyGunner_F"],
		["B_soldier_AR_F"],
		["B_soldier_M_F"],
		["B_soldier_AAR_F"],
		["B_soldier_LAT_F"],
		["B_Sharpshooter_F"],
		["B_medic_F"]
	]],
	[["Sniper team","b_inf.paa"], 50, [
		["B_sniper_F"],
		["B_spotter_F"]
	]],
	[["Fire team","b_inf.paa"], 100, [
		["B_Soldier_TL_F"],
		["B_Soldier_GL_F"],
		["B_soldier_AR_F"],
		["B_soldier_LAT_F"]
	]],
	[["AT Team","b_inf.paa"], 100, [
		["B_Soldier_TL_F"],
		["B_soldier_AT_F"],
		["B_soldier_AT_F"],
		["B_soldier_AAT_F"]
	]],
	[["AA Team","b_inf.paa"], 100, [
		["B_Soldier_TL_F"],
		["B_soldier_AA_F"],
		["B_soldier_AA_F"],
		["B_soldier_AAA_F"]
	]],
	[["Hunter HMG","b_inf.paa"], 200, [
		["B_MRAP_01_hmg_F"]
	]],
	[["Hunter GMG","b_inf.paa"], 250, [
		["B_MRAP_01_gmg_F"]
	]],
	[["IFV-6c Panther","b_inf.paa"], 300, [
		["B_APC_Tracked_01_rcws_F"]
	]],
	[["AMV-7 Marshall","b_inf.paa"], 350, [
		["B_APC_Wheeled_01_cannon_F"]
	]],
	[["IFV-6a Cheetah","b_inf.paa"], 350, [
		["B_APC_Tracked_01_AA_F"]
	]],
	[["M1 Slammer","b_inf.paa"], 500, [
		["B_MBT_01_cannon_F"]
	]]
]];

RTS_LIST_GROUPS set [SIDE_EAST, [
	[["Infantry squad","b_inf.paa"], 150, [
		["O_Soldier_SL_F"],
		["O_Soldier_F"],
		["O_soldier_LAT_F"],
		["O_soldier_M_F"],
		["O_Soldier_TL_F"],
		["O_Soldier_A_F"],
		["O_soldier_AR_F"],
		["O_medic_F"]
	], ["IF_BASIC"]],
	[["Assault squad","b_inf.paa"], 200, [
		["O_Soldier_SL_F"],
		["O_HeavyGunner_F"],
		["O_soldier_AR_F"],
		["O_soldier_M_F"],
		["O_soldier_AAR_F"],
		["O_soldier_LAT_F"],
		["O_Sharpshooter_F"],
		["O_medic_F"]
	], ["IF_SPEC"]],
	[["Sniper team","b_inf.paa"], 50, [
		["O_sniper_F"],
		["O_spotter_F"]
	], ["IF_SNIP"]],
	[["Fire team","b_inf.paa"], 100, [
		["O_Soldier_TL_F"],
		["O_Soldier_GL_F"],
		["O_soldier_AR_F"],
		["O_soldier_LAT_F"]
	], ["IF_TEAM"]],
	[["AT Team","b_inf.paa"], 100, [
		["O_Soldier_TL_F"],
		["O_soldier_AT_F"],
		["O_soldier_AT_F"],
		["O_soldier_AAT_F"]
	], ["IF_AT_TEAM"]],
	[["AA Team","b_inf.paa"], 100, [
		["O_Soldier_TL_F"],
		["O_soldier_AA_F"],
		["O_soldier_AA_F"],
		["O_soldier_AAA_F"]
	], ["IF_AA_TEAM"]],
	[["Ifrit HMG","b_inf.paa"], 200, [
		["O_MRAP_02_hmg_F"]
	], ["VEH_CAR"]],
	[["Ifrit GMG","b_inf.paa"], 250, [
		["O_MRAP_02_gmg_F"]
	], ["VEH_CAR_G"]],
	[["MSE-3 Madrid","b_inf.paa"], 300, [
		["O_APC_Wheeled_02_rcws_F"]
	], ["VEH_APC_WEAK"]],
	[["BTR-K Kamysh","b_inf.paa"], 350, [
		["O_APC_Tracked_02_cannon_F"]
	], ["VEH_APC_HEAVY"]],
	[["ZSU-39 Tigris","b_inf.paa"], 350, [
		["O_APC_Tracked_02_AA_F"]
	], ["VEH_AA"]],
	[["T-100 Varsuk","b_inf.paa"], 500, [
		["O_MBT_02_cannon_F"]
	], ["VEH_TANK"]]
]];
