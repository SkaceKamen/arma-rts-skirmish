disableSerialization;

_ok = createDialog "RTS_Config";
if (!_ok) exitWith {
	systemChat "Fatal error. Couldn't create dialog.";
};

RTS_STATE = "config";

_ctrl = ["RTS_Config", "buttonArmy"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["ButtonClick", {	
	closeDialog 0;
	call RTS_UI_Army_start;
	
	//Used to test battle result
	/*
	_side = side(player);
	_position = getPos(player); //RTS_MAP_SPAWNS select RTS_PLAYER_SIDE;

	{
		_g = [_side, _position, _x] call RTS_Group_create;
		//[_side, _position, _x] call new_RTS_Group;
		_g = _g select 0;
		_g setVariable ["RTS_KilledUnits", floor(random(10))];
		_g setVariable ["RTS_KilledVehicles", floor(random(10))];
		_g setVariable ["RTS_LostUnits", floor(random(10))];
		_g setVariable ["RTS_LostVehicles", floor(random(10))];
	} foreach RTS_PLAYER_ARMY;
	
	"TEST 1" call RTS_Stats_Log;
	["TEST 2",[1,0.8,0.8,1]] call RTS_Stats_Log;
	"TEST 3" call RTS_Stats_Log;
		
	[false] call RTS_UI_Result_start;
	*/
}];

_ctrl = ["RTS_Config", "buttonStart"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["ButtonClick", {	
	_ctrl = ["RTS_Config", "checkFog"] call RTS_getCtrl;
	RTS_FOW = ctrlChecked _ctrl;
	
	closeDialog 0;
	call RTS_Game_start;
}];

_current = call RTS_UI_Army_armyPoints;

_ctrl = ["RTS_Config", "textPoints"] call RTS_getCtrl;
_ctrl ctrlSetText format["Used: %1/%2", _current, RTS_OPTIONS_MONEY];
_ctrl = ["RTS_Config", "progressPoints"] call RTS_getCtrl;
_ctrl progressSetPosition (_current / RTS_OPTIONS_MONEY);

_ctrl = ["RTS_Config", "checkFog"] call RTS_getCtrl;
_ctrl ctrlSetChecked RTS_FOW;

if (isNull(RTS_CAMERA)) then {
	RTS_CAMERA = "camera" camCreate RTS_CAMERA_POSITION;
	RTS_CAMERA camSetTarget player;
	RTS_CAMERA cameraEffect ["internal", "back"];
	RTS_CAMERA camCommit 0;
};

RTS_CAMERA camSetTarget RTS_UI_CONFIG_CENTER;
RTS_CAMERA camSetPos RTS_UI_CONFIG_POS;
RTS_CAMERA camCommit 0;