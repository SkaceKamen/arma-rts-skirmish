_ctrl = ["RTS_UI", "DeployGroup"] call RTS_getCtrl;
_title = ["RTS_UI", "DeployTitle", ["controls", "DeployGroup", "controls"]] call RTS_getCtrl;

if (RTS_UI_DEPLOY_SHOWN) then {
	_ctrl ctrlSetPosition [RTS_UI_DEPLOY_X, SafeZoneY + SafeZoneH - ((ctrlPosition(_title)) select 3)];
} else {
	_ctrl ctrlSetPosition [RTS_UI_DEPLOY_X, RTS_UI_DEPLOY_Y];
};
_ctrl ctrlCommit 0.1;

RTS_UI_DEPLOY_SHOWN = !RTS_UI_DEPLOY_SHOWN;
RTS_UI_MOUSE_HANDLED = true;