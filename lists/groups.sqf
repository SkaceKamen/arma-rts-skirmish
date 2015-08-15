RTS_LIST_GROUPS = [];

/**
 * Structure:
 *  [ [ DISPLAY NAME, DISPLAY ICON ], COST, UNITS LIST, AI TAGS ]
 */
 
RTS_LIST_GROUPS set [SIDE_WEST, [
	[["Infantry squad","inf"], 150, [
		["B_Soldier_SL_F"],
		["B_Soldier_F"],
		["B_soldier_LAT_F"],
		["B_soldier_M_F"],
		["B_Soldier_TL_F"],
		["B_Soldier_A_F"],
		["B_soldier_AR_F"],
		["B_medic_F"]
	], ["IF_BASIC", "Squad", "AI"]],
	[["Assault squad","inf"], 200, [
		["B_Soldier_SL_F"],
		["B_HeavyGunner_F"],
		["B_soldier_AR_F"],
		["B_soldier_M_F"],
		["B_soldier_AAR_F"],
		["B_soldier_LAT_F"],
		["B_Sharpshooter_F"],
		["B_medic_F"]
	], ["IF_SPEC", "Squad", "SpecOps", "AI"]],
	[["Sniper team","recon"], 50, [
		["B_sniper_F"],
		["B_spotter_F"]
	], ["IF_SNIP", "Team", "Sniper", "AI"]],
	[["Fire team","inf"], 100, [
		["B_Soldier_TL_F"],
		["B_Soldier_GL_F"],
		["B_soldier_AR_F"],
		["B_soldier_LAT_F"]
	], ["IF_TEAM", "Team"]],
	[["AT Team","inf"], 100, [
		["B_Soldier_TL_F"],
		["B_soldier_AT_F"],
		["B_soldier_AT_F"],
		["B_soldier_AAT_F"]
	], ["IF_AT_TEAM", "Team", "AT", "AI"]],
	[["AA Team","inf"], 100, [
		["B_Soldier_TL_F"],
		["B_soldier_AA_F"],
		["B_soldier_AA_F"],
		["B_soldier_AAA_F"]
	], ["IF_AA_TEAM", "Team", "AA", "AI"]],
	[["Hunter HMG","motor_inf"], 200, [
		["B_MRAP_01_hmg_F"]
	], ["VEH_CAR", "Vehicle", "Car", "AI"]],
	[["Hunter GMG","motor_inf"], 250, [
		["B_MRAP_01_gmg_F"]
	], ["VEH_CAR", "Vehicle", "Car", "AI"]],
	[["IFV-6c Panther","armor"], 300, [
		["B_APC_Tracked_01_rcws_F"]
	], ["VEH_APC_WEAK", "Vehicle", "Armor", "AI"]],
	[["AMV-7 Marshall","armor"], 350, [
		["B_APC_Wheeled_01_cannon_F"]
	], ["VEH_APC_HEAVY", "Vehicle", "Armor", "AI", "AT"]],
	[["IFV-6a Cheetah","armor"], 350, [
		["B_APC_Tracked_01_AA_F"]
	], ["VEH_AA", "Vehicle", "Armor", "AA", "AI", "AT"]],
	[["M1 Slammer","armor"], 500, [
		["B_MBT_01_cannon_F"]
	], ["VEH_TANK", "Vehicle", "Armor", "Tank", "AA", "AI", "AT"]]
]];

RTS_LIST_GROUPS set [SIDE_EAST, [
	[["Infantry squad","inf"], 150, [
		["O_Soldier_SL_F"],
		["O_Soldier_F"],
		["O_soldier_LAT_F"],
		["O_soldier_M_F"],
		["O_Soldier_TL_F"],
		["O_Soldier_A_F"],
		["O_soldier_AR_F"],
		["O_medic_F"]
	], ["IF_BASIC", "Squad", "AI"]],
	[["Assault squad","inf"], 200, [
		["O_Soldier_SL_F"],
		["O_HeavyGunner_F"],
		["O_soldier_AR_F"],
		["O_soldier_M_F"],
		["O_soldier_AAR_F"],
		["O_soldier_LAT_F"],
		["O_Sharpshooter_F"],
		["O_medic_F"]
	], ["IF_SPEC", "Squad", "SpecOps", "AI"]],
	[["Sniper team","recon"], 50, [
		["O_sniper_F"],
		["O_spotter_F"]
	], ["IF_SNIP", "Team", "Sniper", "AI"]],
	[["Fire team","inf"], 100, [
		["O_Soldier_TL_F"],
		["O_Soldier_GL_F"],
		["O_soldier_AR_F"],
		["O_soldier_LAT_F"]
	], ["IF_TEAM", "Team"]],
	[["AT Team","inf"], 100, [
		["O_Soldier_TL_F"],
		["O_soldier_AT_F"],
		["O_soldier_AT_F"],
		["O_soldier_AAT_F"]
	], ["IF_AT_TEAM", "Team", "AT", "AI"]],
	[["AA Team","inf"], 100, [
		["O_Soldier_TL_F"],
		["O_soldier_AA_F"],
		["O_soldier_AA_F"],
		["O_soldier_AAA_F"]
	], ["IF_AA_TEAM", "Team", "AA", "AI"]],
	[["Ifrit HMG","motor_inf"], 200, [
		["O_MRAP_02_hmg_F"]
	], ["VEH_CAR", "Vehicle", "Car", "AI"]],
	[["Ifrit GMG","motor_inf"], 250, [
		["O_MRAP_02_gmg_F"]
	], ["VEH_CAR_G", "Vehicle", "Car", "AI"]],
	[["MSE-3 Madrid","armor"], 300, [
		["O_APC_Wheeled_02_rcws_F"]
	], ["VEH_APC_WEAK", "Vehicle", "Armor", "AI"]],
	[["BTR-K Kamysh","armor"], 350, [
		["O_APC_Tracked_02_cannon_F"]
	], ["VEH_APC_HEAVY", "Vehicle", "Armor", "AI", "AT"]],
	[["ZSU-39 Tigris","armor"], 350, [
		["O_APC_Tracked_02_AA_F"]
	], ["VEH_AA", "Vehicle", "Armor", "AA", "AI", "AT"]],
	[["T-100 Varsuk","armor"], 500, [
		["O_MBT_02_cannon_F"]
	], ["VEH_TANK", "Vehicle", "Armor", "Tank", "AA", "AI", "AT"]]
]];
