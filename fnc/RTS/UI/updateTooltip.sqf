disableSerialization;

_ctrl = ["RTS_UI", "MouseTooltip"] call RTS_getCtrl;
_curr = ctrlPosition(_ctrl);
_pos = [];
_pos set [0, (MOUSE_POSITION select 0) + 0.01];
_pos set [1, (MOUSE_POSITION select 1) - (_curr select 3)/2];

if (RTS_UI_DEPLOYING) exitWith {
	_helper = format["Deploy %1", (RTS_UI_DEPLOYED select 0) select 0];
	_color = [1,1,1,1];
	if (MOUSE_WORLD_POSITION distance (RTS_MAP_SPAWNS select RTS_PLAYER_SIDE) >= RTS_DEPLOY_RADIUS) then {
		_color = [1,0.5,0.5,1];
		_helper = "You can't deploy here";
	};
	
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetText _helper;
	_ctrl ctrlSetTextColor _color;
	_ctrl ctrlShow true;
	_ctrl ctrlCommit 0;
};

//Find interesting objects under cursor, or hide tooltip
if (count(RTS_SELECTED) > 0) then {
	_helper = "";
	_color = [1,1,1,1];
	_interests = call RTS_UI_mouseInterests;
	_build = _interests select 2;
	_veh = _interests select 1;
	_enemy = _interests select 0;

	if (!isNull(_enemy)) then {
		_helper = format["Attack %1", getText(configFile >> "cfgVehicles" >> typeof(_enemy) >> "displayName")];
		_color = [0.8,0,0,1];
	} else {
		if (!isNull(_veh)) then {
			_helper = format["Enter %1", getText(configFile >> "cfgVehicles" >> typeof(_veh) >> "displayName")];
		} else {
			if (!isNull(_build)) then {
				_helper = "Clear building";
			};
		};
	};

	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlSetText _helper;
	_ctrl ctrlSetTextColor _color;
	_ctrl ctrlShow true;
	_ctrl ctrlCommit 0;
} else {
	_ctrl ctrlShow false;
};