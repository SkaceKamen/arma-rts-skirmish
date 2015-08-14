disableSerialization;

_ok = createDialog "RTS_Result";
if (!_ok) exitWith {
	systemChat "Fatal error. Couldn't create dialog.";
};

_result = RTS_RESULT;

if (count(_this) > 0) then {
	_result = _this select 0;
	RTS_RESULT = _result;
};

_ctrl = ["RTS_Result", "resultTitle"] call RTS_getCtrl;
if (_result) then {
	_ctrl ctrlSetText "Victory";
	_ctrl ctrlSetTextColor [0,0.72,0,1];
	_ctrl ctrlCommit 0;
} else {
	_ctrl ctrlSetText "Defeat";	
	_ctrl ctrlSetTextColor [0.88,0.20,0.20,1];
	_ctrl ctrlCommit 0;
};

RTS_STATE = "result";
RTS_UI_RESULT_SHOWN = true;

_display = "RTS_Result" call RTS_getDisplay;
_display displayAddEventHandler ["Unload", "_this call RTS_UI_Result_unload"];

_ctrl = ["RTS_Result", "statsResult"] call RTS_getCtrl;
_ctrl ctrlShow false;
_ctrl = ["RTS_Result", "unitsResult"] call RTS_getCtrl;
_ctrl ctrlShow false;

[-1] call RTS_UI_Result_fillUnits;

_ctrl = ["RTS_Result", "buttonClose"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["ButtonClick", {	
	closeDialog 0;
	true;
}];

_ctrl = ["RTS_Result", "buttonGlobal"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["ButtonClick", {	
	[-1] call RTS_UI_Result_fillUnits;
	true;
}];

_ctrl = ["RTS_Result", "buttonFriendly"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["ButtonClick", {	
	[RTS_PLAYER_SIDE] call RTS_UI_Result_fillUnits;
	true;
}];

_ctrl = ["RTS_Result", "buttonEnemy"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["ButtonClick", {	
	[RTS_ENEMY_SIDE] call RTS_UI_Result_fillUnits;
	true;
}];

_ctrl = ["RTS_Result", "buttonStats"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["ButtonClick", {	
	_ctrl = ["RTS_Result", "statsResult"] call RTS_getCtrl;
	_ctrl ctrlShow true;
	_ctrl = ["RTS_Result", "unitsResult"] call RTS_getCtrl;
	_ctrl ctrlShow false;
	true;
}];

_survived = [0,0,0,0];
_total = 0;
{
	_side = _foreachIndex;
	{
		_lost_inf = (_x select 0) getVariable ["RTS_LostUnits", 0];
		_sur = { alive _x } count units(_x select 0);
		_survived set [_side, (_survived select _side) + _sur];
		_total = _total + _sur;
	} foreach _x;
} foreach RTS_UNITS;

_data = [
	["Player points", str(RTS_MAP_SCORE select RTS_PLAYER_SIDE)],
	["Enemy points", str(RTS_MAP_SCORE select RTS_ENEMY_SIDE)],
	["Battle took", (time - RTS_MAP_STARTED) call RTS_strInterval],
	["Bullets fired", str(RTS_STATS_BULLETS)],
	["Friendly survivors", str(_survived select RTS_PLAYER_SIDE)],
	["Enemy survivors", str(_survived select RTS_ENEMY_SIDE)],
	["Total people survived", str(_total)],
	["Comands given", str(RTS_STATS_COMMANDS)]
];

_ctrl = ["RTS_Result", "textStats", ["controls", "statsResult", "controls"]] call RTS_getCtrl;
{
	_ctrl lnbAddRow _x;
	_ctrl lnbSetColor [[_foreachIndex, 0], [0.6, 0.6, 0.6, 1]];
} foreach _data;

_ctrl = ["RTS_Result", "events", ["controls", "statsResult", "controls"]] call RTS_getCtrl;
{
	_ctrl lnbAddRow [((_x select 0) - RTS_MAP_STARTED) call RTS_strInterval, _x select 1];
	if (count(_x) > 2) then {
		_ctrl lnbSetColor [[_foreachIndex,1], _x select 2];
	};
	if (count(_x) > 3) then {
		if (typeName(_x select 3) == typeName("")) then {
			_ctrl lnbSetPicture [[_foreachIndex,0], _x select 3];
		};
	};
} foreach RTS_STATS_MESSAGES;


[] spawn {
	_dead = allDead;
	_index = 0;
	if (count(_dead) == 0) exitWith { false; };
	
	while{dialog && RTS_UI_RESULT_SHOWN} do {
		RTS_CAMERA camSetTarget (_dead select _index);
		RTS_CAMERA camSetRelPos [3,3,4];
		RTS_CAMERA camCommit 0;
		
		_index = _index + 1;
		if (_index >= count(_dead)) then {
			_index = 0;
		};
	
		sleep 5;
	};
};