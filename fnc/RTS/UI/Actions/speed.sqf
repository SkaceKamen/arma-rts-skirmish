_actions = [];
_speeds = [ "LIMITED", "NORMAL", "FULL" ];

{
	_actions set [count(_actions), [format["gfx\icon_speed_%1.paa", _x], format["[_this,'%1'] call RTS_UI_Actions_speedSet", _x], _x]];
} foreach _speeds;

["speed", _actions] call RTS_UI_Actions_subactions;

RTS_UI_MOUSE_HANDLED = true;