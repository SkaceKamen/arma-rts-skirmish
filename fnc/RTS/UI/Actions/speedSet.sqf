["",[]] call RTS_UI_Actions_subactions;
_speed = _this select 1;

{
	(_x select 0) setSpeedMode _speed;
} foreach RTS_SELECTED;

RTS_UI_MOUSE_HANDLED = true;
call RTS_UI_updateActions;