_position = _this select 0;
_radius = _this select 1;
_name = toString [ (toArray('A') select 0) + count(RTS_MAP_POINTS) ];
if (count(_this) > 2) then {
	_name = _this select 2;
};

_flag = RTS_HELPER_FLAG createvehicle _position;
_ctrl = [_name call RTS_UI_createPointMarker];
_struct = [
	_position,
	30,
	[0,0,0],
	SIDE_CIVILIAN,
	_ctrl,
	_flag,
	_name
];

RTS_MAP_POINTS set [count(RTS_MAP_POINTS), _struct];