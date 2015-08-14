private ["_display", "_ctrl"];
disableSerialization;

_display = "RTS_UI" call RTS_getDisplay;
_res = getResolution;

/*_ctrl = _display ctrlCreate ["RscText", -1];
_ctrl ctrlSetPosition [0,0,0.04,0.04];
_ctrl ctrlSetBackgroundColor [0,0,0,0.5];
_ctrl ctrlShow false;
_ctrl ctrlCommit 0;*/

_ctrl = _display ctrlCreate ["RscPictureKeepAspect", -1];
_ctrl ctrlSetPosition [0,0,0.04,0.04];
_ctrl ctrlSetTextColor RTS_UI_MARKER_UNSELECTED;
_ctrl ctrlSetText ((_this select 0) select 1);
_ctrl ctrlShow false;
_ctrl ctrlCommit 0;

_ctrl;