RTS_UI_RESULT_SHOWN = false;

RTS_UNITS = [];
RTS_SELECTED = [];
{
	RTS_UNITS set [_x, []];
} foreach RTS_SIDES;

{
	deleteVehicle _x;
} foreach allunits;

{
	deleteVehicle _x;
} foreach vehicles;

0 fadeMusic 0;

[] spawn RTS_UI_Config_start;