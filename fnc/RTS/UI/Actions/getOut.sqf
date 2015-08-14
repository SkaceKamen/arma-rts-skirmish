{
	_group = _x select 0;
	{
		if (_x != vehicle(_x)) then {
			_x leaveVehicle vehicle(_x);
		};
	} foreach units(_group);
} foreach RTS_SELECTED;

RTS_UI_MOUSE_HANDLED = true;