/**
 * Update cycle for camera controls
 */
#include "keys.hpp"

//60 FPS please
_sleep = 1 / 60;

//End when RTS_UI is closed or game is finished
while { !RTS_MAP_DONE && dialog } do {
	_speed = 5 * (RTS_CAMERA_HEIGHT / (RTS_CAMERA_HEIGHT_LIMIT select 1));
	if (KEYS select DIK_LSHIFT ||
		KEYS select DIK_RSHIFT) then {
		_speed = _speed * 2;
	};
	
	_changed = false;
	if (KEYS select DIK_W) then {
		RTS_CAMERA_POSITION = [
			(RTS_CAMERA_POSITION select 0) - cos(RTS_CAMERA_DIRECTION) * _speed,
			(RTS_CAMERA_POSITION select 1) - sin(RTS_CAMERA_DIRECTION) * _speed,
			0
		];
		_changed = true;
	};
	if (KEYS select DIK_S) then {
		RTS_CAMERA_POSITION = [
			(RTS_CAMERA_POSITION select 0) + cos(RTS_CAMERA_DIRECTION) * _speed,
			(RTS_CAMERA_POSITION select 1) + sin(RTS_CAMERA_DIRECTION) * _speed,
			0
		];
		_changed = true;
	};
	if (KEYS select DIK_D) then {
		RTS_CAMERA_POSITION = [
			(RTS_CAMERA_POSITION select 0) - cos(RTS_CAMERA_DIRECTION - 90) * _speed,
			(RTS_CAMERA_POSITION select 1) - sin(RTS_CAMERA_DIRECTION - 90) * _speed,
			0
		];
		_changed = true;
	};
	if (KEYS select DIK_A) then {
		RTS_CAMERA_POSITION = [
			(RTS_CAMERA_POSITION select 0) + cos(RTS_CAMERA_DIRECTION - 90) * _speed,
			(RTS_CAMERA_POSITION select 1) + sin(RTS_CAMERA_DIRECTION - 90) * _speed,
			0
		];
		_changed = true;
	};
	
	if (_changed) then {
		_sleep call RTS_UI_updateCamera;
	};
	
	uisleep _sleep;
};