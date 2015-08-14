private ["_ctrl", "_i", "_name", "_image", "_ctrl"];
disableSerialization;

_ctrl = ["RTS_Army", "playerArmy"] call RTS_getCtrl;
lnbClear _ctrl;
{
	_name = (_x select 0) select 0;
	_image = (_x select 0) select 1;
	_ctrl lnbAddRow [_name,str(_x select 1)];
	_ctrl lnbSetPicture [[_foreachIndex,0],_image];
	_ctrl lnbSetPictureColor [[_foreachIndex,0], RTS_UI_MARKER_UNSELECTED];
} foreach RTS_PLAYER_ARMY;

_current = call RTS_UI_Army_armyPoints;

_ctrl = ["RTS_Army", "shopArmy"] call RTS_getCtrl;
lnbClear _ctrl;
{
	_name = (_x select 0) select 0;
	_image = (_x select 0) select 1;
	_ctrl lnbAddRow [_name,str(_x select 1)];
	_ctrl lnbSetPicture [[_foreachIndex,0], _image];
	_ctrl lnbSetPictureColor [[_foreachIndex,0], RTS_UI_MARKER_UNSELECTED];
	
	if ((_x select 1) + _current > RTS_OPTIONS_MONEY) then {
		_ctrl lnbSetColor [[_foreachIndex,0], [1,1,1,0.5]];
	};
} foreach (RTS_LIST_GROUPS select RTS_PLAYER_SIDE);

_ctrl = ["RTS_Army", "textPoints"] call RTS_getCtrl;
_ctrl ctrlSetText format["Points limit: %1/%2", _current, RTS_OPTIONS_MONEY];
_ctrl = ["RTS_Army", "progressPoints"] call RTS_getCtrl;
_ctrl progressSetPosition (_current / RTS_OPTIONS_MONEY);