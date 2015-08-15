disableSerialization;

_ctrl = ["RTS_UI", "DeployList", ["controls", "DeployGroup", "controls"]] call RTS_getCtrl;
lnbClear _ctrl;
{
	_name = (_x select 0) select 0;
	_image = [RTS_PLAYER_SIDE, _x] call RTS_Group_Type_getIcon;
	_color = RTS_UI_MARKER_UNSELECTED;
	
	_ctrl lnbAddRow [_name,str(_x select 1)];
	_ctrl lnbSetPicture [[_foreachIndex,0],_image];
	_ctrl lnbSetPictureColor [[_foreachIndex,0], _color];
} foreach RTS_PLAYER_ARMY_CURRENT;

//Hide deploy control when there isn't anything to deploy
if (count(RTS_PLAYER_ARMY_CURRENT) == 0) then {
	_ctrl = ["RTS_UI", "DeployGroup"] call RTS_getCtrl;
	_position = ctrlposition _ctrl;
	_ctrl ctrlSetPosition [_position select 0, SafeZoneY + SafeZoneH];
	_ctrl ctrlCommit 0.5;
} else {
	call RTS_UI_deployRefreshColors;
};