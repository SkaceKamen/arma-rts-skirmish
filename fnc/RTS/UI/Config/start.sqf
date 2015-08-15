disableSerialization;

_ok = createDialog "RTS_Config";
if (!_ok) exitWith {
	systemChat "Fatal error. Couldn't create dialog.";
};

RTS_STATE = "config";

call RTS_UI_Config_load;

if (isNull(RTS_CAMERA)) then {
	RTS_CAMERA = "camera" camCreate RTS_CAMERA_POSITION;
	RTS_CAMERA camSetTarget player;
	RTS_CAMERA cameraEffect ["internal", "back"];
	RTS_CAMERA camCommit 0;
};

RTS_CAMERA camSetTarget RTS_UI_CONFIG_CENTER;
RTS_CAMERA camSetPos RTS_UI_CONFIG_POS;
RTS_CAMERA camCommit 0;