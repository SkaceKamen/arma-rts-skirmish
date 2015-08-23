{
	_stack = _x;
	{
		waitUntil { (RTS_MAP_MONEY select _index) >= (_x select 1) };
		RTS_MAP_MONEY set [_index, (RTS_MAP_MONEY select _index) - (_x select 1)];
		_group = [_side, _position, _x, _direction] call RTS_Group_create;
		[_group, _foreachIndex] call (_stack select 1);
	} foreach (_stack select 0);
} foreach _this;