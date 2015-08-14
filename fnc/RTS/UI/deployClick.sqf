_index = lnbCurSelRow (["RTS_UI", "DeployList"] call RTS_getCtrl);

if (_index >= 0) then {
	_info = RTS_PLAYER_ARMY_CURRENT select _index;
	if ((RTS_MAP_MONEY select RTS_PLAYER_SIDE) >= (_info select 1)) then {
		RTS_UI_DEPLOYING = true;
		RTS_UI_DEPLOYED = _info;
		RTS_UI_DEPLOYED_INDEX = _index;
		
		RTS_CAMERA_POSITION = (RTS_MAP_SPAWNS select RTS_PLAYER_SIDE);
		0 spawn RTS_UI_updateCamera;
	} else {
		["You don't have enought reinforcements points.", "Can't deploy"] spawn BIS_fnc_guiMessage;
	};
};

RTS_UI_MOUSE_HANDLED = true;

true;