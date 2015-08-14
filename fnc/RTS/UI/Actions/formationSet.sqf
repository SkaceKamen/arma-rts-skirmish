["",[]] call RTS_UI_Actions_subactions;
_formation = _this select 1;

{
	(_x select 0) setFormation _formation;
} foreach RTS_SELECTED;

RTS_UI_MOUSE_HANDLED = true;
call RTS_UI_updateActions;