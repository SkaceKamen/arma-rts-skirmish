disableSerialization;

_ctrl = ["RTS_UI", "DeployList", ["controls", "DeployGroup", "controls"]] call RTS_getCtrl;
{
	_colorText = [1,1,1,1];	
	_colorMoney = [1,1,1,1];
	if (_x select 1 > RTS_MAP_MONEY select RTS_PLAYER_SIDE) then {
		_colorText = [0.5,0.5,0.5,1];
		_colorMoney = [1, 0.2, 0.2, 1];
	};
	_ctrl lnbSetColor [[_foreachIndex, 0], _colorText];
	_ctrl lnbSetColor [[_foreachIndex, 1], _colorMoney];
} foreach RTS_PLAYER_ARMY_CURRENT;