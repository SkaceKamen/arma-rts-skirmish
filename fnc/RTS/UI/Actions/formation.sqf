_actions = [];

{
	_actions set [count(_actions), [format["gfx\icon_formation_%1.paa", [_x] call BIS_fnc_filterString], format["[_this,'%1'] call RTS_UI_Actions_formationSet", _x], RTS_FORMATIONS_NAMES select _foreachIndex]];
} foreach RTS_FORMATIONS;

["formation", _actions] call RTS_UI_Actions_subactions;

RTS_UI_MOUSE_HANDLED = true;