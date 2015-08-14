_group = _params select 0;
_position = _params select 1;
_units = _this select RTS_Group_Type_Units;

{
	[_group, _position, _x] call RTS_UNIT_create;
} foreach _units;