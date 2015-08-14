private ["_side", "_position", "_params", "_name", "_cost", "_units", "_group", "_marker", "_markers", "_struct", "_list"];

_side = _this select 0;
_position = _this select 1;
_params = _this select 2;

_name = _params select 0;
_cost = _params select 1;
_units = _params select 2;

_group = creategroup _side;
_group allowFleeing 0;

{
	[_group, _position, _x] call RTS_UNIT_create;
} foreach _units;

_struct = [
	_group,
	_params,
	[],
	count(units(_group))
];


_markers = _struct call RTS_UI_createGroupControls;
_struct set [2, _markers];

_list = RTS_UNITS select (_side call RTS_getSideIndex);
_list set [count(_list), _struct];

_struct;