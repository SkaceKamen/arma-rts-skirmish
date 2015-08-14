disableSerialization;

_ctrl = ["RTS_UI", "DeployList"] call RTS_getCtrl;
lnbClear _ctrl;
{
	_name = (_x select 0) select 0;
	_image = (_x select 0) select 1;
	_ctrl lnbAddRow [_name,str(_x select 1)];
	_ctrl lnbSetPicture [[_foreachIndex,0],_image];
} foreach RTS_PLAYER_ARMY_CURRENT;