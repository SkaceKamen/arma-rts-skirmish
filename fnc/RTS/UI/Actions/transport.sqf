{
	_group = _x select 0;
	{
		if (_x != vehicle(_x)) then {
			if ((AssignedVehicleRole _x) select 0 == "CARGO") then {
				unassignVehicle _x;
			};
		};
	} foreach units(_group);
} foreach RTS_SELECTED;

RTS_UI_MOUSE_HANDLED = true;