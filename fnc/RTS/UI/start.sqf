disableSerialization;

_ok = createDialog "RTS_UI";
if (!_ok) exitWith {
	systemChat "Fatal error. Couldn't create dialog.";
};

//This helps handle display closing
RTS_STATE = "ui";

//This events only works on display
_display = "RTS_UI" call RTS_getDisplay;
_display displayAddEventHandler ["KeyDown", RTS_UI_keyDown];
_display displayAddEventHandler ["KeyUp", RTS_UI_keyUp];

//This only needs to be added once
if (!RTS_UI_HOOKED) then {
	//Use #46, because only #46 catches middle mouse button
	(findDisplay 46) displayAddEventHandler ["MouseButtonDown", RTS_UI_mouseDown];
	(findDisplay 46) displayAddEventHandler ["MouseButtonUp", RTS_UI_mouseUp];
	RTS_UI_HOOKED = true;
};

//Display actually doesn't work properly with those events, that why ctrl is used
_ctrl = ["RTS_UI", "MOUSE", "controlsBackground"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["MouseMoving", RTS_UI_mouseMove];
_ctrl ctrlAddEventHandler ["MouseHolding", RTS_UI_mouseIdle];
_ctrl ctrlAddEventHandler ["MouseZChanged", RTS_UI_mouseWheel];

_ctrl = ["RTS_UI", "DeployButton"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["MouseButtonUp", RTS_UI_deployClick];

//Display deploy list
call RTS_UI_deployRefresh;

//Center camera on deploy zone
RTS_CAMERA_POSITION = RTS_MAP_SPAWNS select RTS_PLAYER_SIDE;

//Create camera if required
if (isNull(RTS_CAMERA)) then {
	RTS_CAMERA = "camera" camCreate RTS_CAMERA_POSITION;
	RTS_CAMERA camSetTarget player;
	RTS_CAMERA cameraEffect ["internal", "back"];
	RTS_CAMERA camCommit 0;
};

//Add draw 3d handler, if required
if (RTS_UI_DRAW == -1) then {
	RTS_UI_DRAW = addMissionEventHandler ["Draw3D", RTS_UI_draw3D];
};

//Regenerate controls for new display
{
	_x set [2, _x call RTS_UI_createGroupControls];
} foreach (RTS_UNITS select RTS_PLAYER_SIDE);

{
	_x set [2, _x call RTS_UI_createGroupControls];
} foreach RTS_MAP_POINTS;

//Reset controls stacks (should have used this for the groups and points too)
RTS_UI_ACTIONS = [];
RTS_UI_SUBACTIONS = [];

//Move camera
call RTS_UI_updateCamera;

//Start ticking
call RTS_UI_tick;