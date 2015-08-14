private ["_interval", "_pos", "_equ", "_target"];

_interval = 0;
if (!isNil("_this")) then {
	if (typeName(_this) == typeName(_interval)) then {
		_interval = _this;
	};
};

/*RTS_CAMERA_POSITION set [2, RTS_CAMERA_HEIGHT];

_pos = RTS_CAMERA_POSITION;
_equ = cos(RTS_CAMERA_YAW) * RTS_CAMERA_DISTANCE;
_target = [
	(_pos select 0) + cos(RTS_CAMERA_DIRECTION) * _equ,
	(_pos select 1) + sin(RTS_CAMERA_DIRECTION) * _equ,
	(_pos select 2) + sin(RTS_CAMERA_YAW) * RTS_CAMERA_DISTANCE
];

RTS_CAMERA camSetPos RTS_CAMERA_POSITION;
RTS_CAMERA camSetTarget _target;
RTS_CAMERA camCommit _interval;*/

RTS_CAMERA_POSITION set [2, 1];

_pos = RTS_CAMERA_POSITION;
_equ = cos(RTS_CAMERA_YAW) * RTS_CAMERA_DISTANCE;
_new = [
	(_pos select 0) + cos(RTS_CAMERA_DIRECTION) * _equ,
	(_pos select 1) + sin(RTS_CAMERA_DIRECTION) * _equ,
	(_pos select 2) + sin(RTS_CAMERA_YAW) * RTS_CAMERA_DISTANCE
];

RTS_CAMERA_HEIGHT = _new select 2;

RTS_CAMERA camSetPos _new;
RTS_CAMERA camSetTarget RTS_CAMERA_POSITION;
RTS_CAMERA camCommit _interval;
