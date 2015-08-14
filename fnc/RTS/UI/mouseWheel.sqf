_how = _this select 1;
_dis = 0;
if (_how > 0) then {
    _dis = -5;
} else {
	_dis = 5;
};

if (_dis != 0) then {
	/*_pos = RTS_CAMERA_POSITION;
	_hei = RTS_CAMERA_HEIGHT + sin(RTS_CAMERA_YAW) * _dis;
	if (_hei < RTS_CAMERA_HEIGHT_LIMIT select 0) then {
		_dis = ((RTS_CAMERA_HEIGHT_LIMIT select 0) - RTS_CAMERA_HEIGHT) / sin(RTS_CAMERA_YAW);
	};
	if (_hei > RTS_CAMERA_HEIGHT_LIMIT select 1) then {
		_dis = ((RTS_CAMERA_HEIGHT_LIMIT select 1) - RTS_CAMERA_HEIGHT) / sin(RTS_CAMERA_YAW);
	};

	_equ = cos(RTS_CAMERA_YAW) * _dis;
	RTS_CAMERA_POSITION = [
		(_pos select 0) + cos(RTS_CAMERA_DIRECTION) * _equ,
		(_pos select 1) + sin(RTS_CAMERA_DIRECTION) * _equ,
		0
	];
	RTS_CAMERA_HEIGHT = ((RTS_CAMERA_HEIGHT + sin(RTS_CAMERA_YAW) * _dis) max (RTS_CAMERA_HEIGHT_LIMIT select 0)) min (RTS_CAMERA_HEIGHT_LIMIT select 1);*/
	RTS_CAMERA_DISTANCE = ((RTS_CAMERA_DISTANCE + _dis) max (RTS_CAMERA_HEIGHT_LIMIT select 0)) min (RTS_CAMERA_HEIGHT_LIMIT select 1);

	0.1 call RTS_UI_updateCamera;
};

true;