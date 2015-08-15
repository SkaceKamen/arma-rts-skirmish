disableSerialization;

_ds = _this select 0;
_x = _this select 1;
_y = _this select 2;
_z = _this select 3;

MOUSE_POSITION = [_x,_y];
MOUSE_WORLD_POSITION = screenToWorld MOUSE_POSITION;

//Camera controls and selection
if (MOUSE_PRESSED select MOUSE_MIDDLE ||
	(MOUSE_PRESSED select MOUSE_LEFT &&
	(KEYS select 0x1D || KEYS select 0x9D))) then {
	_pos = RTS_MOUSE_START select 0;
	_dir = RTS_MOUSE_START select 1;
	_yaw = RTS_MOUSE_START select 2;
	_mul = 50;
	
	RTS_CAMERA_DIRECTION = _dir + ((_pos select 0) - _x) * _mul;
	RTS_CAMERA_YAW = ((_yaw - ((_pos select 1) - _y) * _mul) max 0) min 89;
	
	call RTS_UI_updateCamera;
} else {
	if (MOUSE_PRESSED select MOUSE_LEFT) then {
		_m1 = RTS_MOUSE_START select 0;
		_m2 = MOUSE_POSITION;
		_from = [
			(_m1 select 0) min (_m2 select 0),
			(_m1 select 1) min (_m2 select 1)
		];
		_to = [
			(_m1 select 0) max (_m2 select 0),
			(_m1 select 1) max (_m2 select 1)
		];
		
		_ctrl = (["RTS_UI", "Selection"] call RTS_getCtrl);
		_ctrl ctrlSetPosition [
			_from select 0,
			_from select 1,
			(_to select 0) - (_from select 0),
			(_to select 1) - (_from select 1)
		];
		
		_ctrl ctrlCommit 0;
	};
};

//Request tooltip update
call RTS_UI_updateTooltip;