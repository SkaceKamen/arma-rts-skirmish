private ["_color"];
if ((_this select 0) getVariable ["RTS_SIDE", RTS_PLAYER_SIDE] == RTS_PLAYER_SIDE) then {
	_color = RTS_UI_MARKER_UNSELECTED;
} else {
	_color = RTS_UI_MARKER_ENEMY;
};
_color;