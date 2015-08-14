private ["_actions","_i"];

_display = "RTS_UI" call RTS_getDisplay;

_ident = _this select 0;
_actions = _this select 1;

if (RTS_UI_SUBACTIONS_CURRENT == _ident) then {
	_actions = [];
	RTS_UI_SUBACTIONS_CURRENT = "";
} else {
	RTS_UI_SUBACTIONS_CURRENT = _ident;
};

{
	if (_foreachIndex >= count(RTS_UI_SUBACTIONS)) then {
		RTS_UI_SUBACTIONS set [_foreachIndex, _display ctrlCreate ["RscPicture", -1]];
	};
	
	_ctrl = RTS_UI_SUBACTIONS select _foreachIndex;
	_ctrl ctrlSetTextColor [1,1,1,1];
	_ctrl ctrlSetPosition [RTS_UI_ACTIONS_X + (RTS_UI_ACTIONS_P + RTS_UI_ACTION_W) * _foreachIndex, RTS_UI_ACTIONS_Y, RTS_UI_ACTION_W, RTS_UI_ACTION_H];
	_ctrl ctrlSetText (_x select 0);
	_ctrl ctrlSetEventHandler ["MouseButtonUp", _x select 1];
	_ctrl ctrlSetTooltip (_x select 2);
	_ctrl ctrlShow true;
	_ctrl ctrlEnable true;
	_ctrl ctrlCommit 0;
	
	_ctrl ctrlSetPosition [RTS_UI_ACTIONS_X + (RTS_UI_ACTIONS_P + RTS_UI_ACTION_W) * _foreachIndex, RTS_UI_ACTIONS_Y - RTS_UI_ACTION_H - RTS_UI_ACTIONS_P, RTS_UI_ACTION_W, RTS_UI_ACTION_H];
	_ctrl ctrlCommit 0.1;
	
} foreach _actions;

for[{_i = count(_actions)},{_i < count(RTS_UI_SUBACTIONS)},{_i = _i + 1}] do {
	_ctrl = RTS_UI_SUBACTIONS select _i;
	_ctrl ctrlShow false;
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
};