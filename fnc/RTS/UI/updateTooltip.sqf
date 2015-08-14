disableSerialization;

_ctrl = ["RTS_UI", "MouseTooltip"] call RTS_getCtrl;

//Find interesting objects under cursor, or hide tooltip
if (count(RTS_SELECTED) > 0) then {
	_helper = "";
	_color = [1,1,1,1];
	_interests = call RTS_UI_mouseInterests;
	_build = _interests select 2;
	_veh = _interests select 1;
	_enemy = _interests select 0;

	if (!isNull(_enemy)) then {
		_helper = format["Attack %1", getText(configFile >> "cfgVehicles" >> typeof(_enemy))];
		_color = [0.8,0,0,1];
	} else {
		if (!isNull(_veh)) then {
			_helper = format["Enter %1", getText(configFile >> "cfgVehicles" >> typeof(_veh))];
		} else {
			if (!isNull(_build)) then {
				_helper = "Clear building";
			};
		};
	};

	_ctrl ctrlSetPosition MOUSE_POSITION;
	_ctrl ctrlSetText _helper;
	_ctrl ctrlSetTextColor _color;
	_ctrl ctrlCommit 0;
} else {
	_ctrl ctrlShow false;
};