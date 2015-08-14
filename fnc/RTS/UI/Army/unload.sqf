if (!isNull(RTS_UI_ARMY_GROUP)) then {
	{
		if (_x != player) then {
			if (vehicle(_x) != _x) then {
				deleteVehicle vehicle(_x);
			};
			deleteVehicle _x;
		};
	} foreach allUnits;
	deleteGroup RTS_UI_ARMY_GROUP;
	RTS_UI_ARMY_GROUP = grpNull;
};

_load = [];
{
	_load set [count(_load), (RTS_LIST_GROUPS select RTS_PLAYER_SIDE) find _x];
} foreach RTS_PLAYER_ARMY;

profileNamespace setVariable ["RTS_ARMY", _load];

[] spawn RTS_UI_Config_start;