_actions = [];
_items = [ "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH" ];

{
	_actions set [count(_actions), [format["gfx\icon_behaviour_%1.paa", _x], format["[_this,'%1'] call RTS_UI_Actions_behaviourSet", _x], _x]];
} foreach _items;

["behaviour", _actions] call RTS_UI_Actions_subactions;

RTS_UI_MOUSE_HANDLED = true;