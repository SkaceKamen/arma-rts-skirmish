/**
 * Create markers for point
 */

private ["_display", "_ctrl"];
disableSerialization;

_display = "RTS_UI" call RTS_getDisplay;
_res = getResolution;
_ctrl = _display ctrlCreate ["RscText", -1];
_ctrl ctrlSetPosition [0,0,0.1,0.04];
_ctrl ctrlSetBackgroundColor [0,0,0,0];
_ctrl ctrlSetTextColor [1,1,1,1];
_ctrl ctrlShow false;
_ctrl ctrlSetText _this;
_ctrl ctrlCommit 0;

_ctrl;