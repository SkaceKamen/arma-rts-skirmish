
{
	[_x, false] call RTS_GROUP_select;
} foreach RTS_SELECTED;

RTS_SELECTED = [];

{
	if (_this find _x == _foreachIndex) then {
		RTS_SELECTED set [count(RTS_SELECTED), _x];
	};
} foreach _this;

{
	[_x, true] call RTS_GROUP_select;
} foreach RTS_SELECTED;

call RTS_UI_updateActions;