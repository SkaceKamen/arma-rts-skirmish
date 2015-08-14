private ["_group", "_selected", "_ctrl"];

_group = _this select 0;
_selected = _this select 1;

_ctrl1 = ((_group select 2) select 0);
_ctrl2 = ((_group select 2) select 3);

if (_selected) then {
	_ctrl1 ctrlSetTextColor RTS_UI_MARKER_SELECTED;
	_ctrl2 ctrlSetTextColor RTS_UI_MARKER_SELECTED;
	/*{
		if (isNull(_x getVariable ["RTS_Helper", objNull])) then {
			_helper = RTS_HELPER_UNIT createVehicleLocal getPos(player);
			_helper attachTo [_x, [0,0,2.5]];
			_x setVariable ["RTS_Helper", _helper];
		};
	} foreach units(_group select 0);*/
} else {
	_ctrl1 ctrlSetTextColor RTS_UI_MARKER_UNSELECTED;
	_ctrl2 ctrlSetTextColor RTS_UI_MARKER_UNSELECTED;
	/*{
		_helper = _x getVariable ["RTS_Helper", objNull];
		if (!isNull(_helper)) then {
			deleteVehicle _helper;
			_x setVariable ["RTS_Helper", objNull];
		};
	} foreach units(_group select 0);*/
};