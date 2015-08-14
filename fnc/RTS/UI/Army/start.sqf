disableSerialization;

_ok = createDialog "RTS_Army";
if (!_ok) exitWith {
	systemChat "Fatal error. Couldn't create dialog.";
};

_display = "RTS_Army" call RTS_getDisplay;
_display displayAddEventHandler ["Unload", "_this call RTS_UI_Army_unload"];

call RTS_UI_Army_updateArmy;

_ctrl = ["RTS_Army", "playerArmy"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["LBSelChanged", "[_this select 0, RTS_PLAYER_ARMY] call RTS_UI_Army_shopChanged"];

_ctrl = ["RTS_Army", "shopArmy"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["LBSelChanged", "[] call RTS_UI_Army_shopChanged"];

_ctrl = ["RTS_Army", "buttonAdd"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["ButtonClick", {	
	_index = lnbCurSelRow (["RTS_Army", "shopArmy"] call RTS_getCtrl);
	
	if (_index >= 0) then {
		_group = (RTS_LIST_GROUPS select RTS_PLAYER_SIDE) select _index;
		_current = call RTS_UI_Army_armyPoints;
		if (_current + (_group select 1) > RTS_OPTIONS_MONEY) then {
			["You don't have enought command points.", "Can't add group"] spawn BIS_fnc_guiMessage;
		} else {
			RTS_PLAYER_ARMY set [count(RTS_PLAYER_ARMY), _group];
			0 spawn RTS_UI_Army_updateArmy;
		};
	};
}];

_ctrl = ["RTS_Army", "buttonRemove"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["ButtonClick", {	
	_index = lnbCurSelRow (["RTS_Army", "playerArmy"] call RTS_getCtrl);
	if (_index >= 0) then {
		RTS_PLAYER_ARMY = [RTS_PLAYER_ARMY,_index] call RTS_removeAt;
		0 spawn RTS_UI_Army_updateArmy;
	};
}];


_ctrl = ["RTS_Army", "buttonBack"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["ButtonClick", {	
	closeDialog 0;
	//call RTS_UI_Config_start;
}];

if (isNull(RTS_CAMERA)) then {
	RTS_CAMERA = "camera" camCreate RTS_CAMERA_POSITION;
	RTS_CAMERA camSetTarget player;
	RTS_CAMERA cameraEffect ["internal", "back"];
	RTS_CAMERA camCommit 0;
};

RTS_CAMERA camSetTarget RTS_UI_ARMY_POS;
RTS_CAMERA camSetRelPos [15, 15, 15];
RTS_CAMERA camCommit 0;