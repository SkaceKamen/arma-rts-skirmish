private ["_display", "_ctrl"];
disableSerialization;

_display = "RTS_UI" call RTS_getDisplay;
_res = getResolution;
_params = _this select 1;

_ctrls = [];

//0: Unit icon
_ctrl = _display ctrlCreate ["RscPictureKeepAspect", -1];
_ctrl ctrlSetPosition [0,0,0.04,0.04];
_ctrl ctrlSetTextColor RTS_UI_MARKER_UNSELECTED;
_ctrl ctrlSetText (_this call RTS_Group_getIcon);
_ctrl ctrlShow false;
_ctrl ctrlCommit 0;

_ctrls set [count(_ctrls), _ctrl];

//1: Background of healthbar
_ctrl = _display ctrlCreate ["RscText", -1];
_ctrl ctrlSetPosition [0,0,0.04,0.01];
_ctrl ctrlSetBackgroundColor [0,0,0,1];
_ctrl ctrlShow false;
_ctrl ctrlCommit 0;

_ctrls set [count(_ctrls), _ctrl];

//2: Healthbar
_ctrl = _display ctrlCreate ["RscProgress", -1];
_ctrl ctrlSetPosition [0,0,0.04,0.01];
_ctrl ctrlSetTextColor [0.8,0.8,0.8,1];
_ctrl ctrlSetBackgroundColor [0,0,0,1];
_ctrl ctrlShow false;
_ctrl ctrlCommit 0;

_ctrls set [count(_ctrls), _ctrl];

//3: TASKBAR - Unit icon
_ctrl = _display ctrlCreate ["RscPictureKeepAspect", -1];
_ctrl ctrlSetPosition [0,0,0.08,0.08];
_ctrl ctrlSetTextColor RTS_UI_MARKER_UNSELECTED;
_ctrl ctrlSetText (_this call RTS_Group_getIcon);
_ctrl ctrlSetEventHandler ["MouseButtonUp", format["[_this,%1] call RTS_UI_groupMouseUp", _this select 4]];
//_ctrl setVariable ["RTS_GROUP", _this];
_ctrl ctrlShow false;
_ctrl ctrlEnable true;
_ctrl ctrlCommit 0;

_ctrls set [count(_ctrls), _ctrl];

//4: TASKBAR - Background of healthbar
_ctrl = _display ctrlCreate ["RscText", -1];
_ctrl ctrlSetPosition [0,0,0.08,0.01];
_ctrl ctrlSetBackgroundColor [0,0,0,1];
_ctrl ctrlShow false;
_ctrl ctrlCommit 0;

_ctrls set [count(_ctrls), _ctrl];

//5: TASKBAR - Healthbar
_ctrl = _display ctrlCreate ["RscProgress", -1];
_ctrl ctrlSetPosition [0,0,0.08,0.01];
_ctrl ctrlSetTextColor [0.8,0.8,0.8,1];
_ctrl ctrlSetBackgroundColor [0,0,0,1];
_ctrl ctrlShow false;
_ctrl ctrlCommit 0;

_ctrls set [count(_ctrls), _ctrl];

_ctrls;