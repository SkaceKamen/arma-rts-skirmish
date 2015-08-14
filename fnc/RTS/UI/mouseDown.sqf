disableSerialization;

if (RTS_STATE != "ui") exitWith {
	false;
};

MOUSE_PRESSED set [_this select 1, true];

RTS_MOUSE_START = [
	MOUSE_POSITION,
	RTS_CAMERA_DIRECTION,
	RTS_CAMERA_YAW
];

if (_this select 1 == MOUSE_LEFT) then {
	_ctrl = (["RTS_UI", "Selection"] call RTS_getCtrl);
	_ctrl ctrlShow true;
	_ctrl ctrlSetPosition [MOUSE_POSITION select 0, MOUSE_POSITION select 1, 0, 0];
	_ctrl ctrlCommit 0;
};