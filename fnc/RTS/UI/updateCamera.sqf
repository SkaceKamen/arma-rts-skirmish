private ["_interval", "_pos", "_equ", "_target"];

//Speed of change - optional
_interval = 0;
if (!isNil("_this")) then {
	if (typeName(_this) == typeName(_interval)) then {
		_interval = _this;
	};
};

RTS_CAMERA_POSITION set [2,0];

//Restrict camera center to map bounds
if (RTS_CAMERA_POSITION distance RTS_MAP_CENTER > RTS_MAP_RADIUS) then {	
	_dir = [RTS_MAP_CENTER, RTS_CAMERA_POSITION] call RTS_dir;
	_dis = (RTS_CAMERA_POSITION distance RTS_MAP_CENTER) min RTS_MAP_RADIUS;
	RTS_CAMERA_POSITION = [
		(RTS_MAP_CENTER select 0) + cos(_dir) * _dis,
		(RTS_MAP_CENTER select 1) + sin(_dir) * _dis
	];
};

//Good camera center height - tested
RTS_CAMERA_POSITION set [2, 1];

//Now calculate camera position
_pos = RTS_CAMERA_POSITION;
_equ = cos(RTS_CAMERA_YAW) * RTS_CAMERA_DISTANCE;
_new = [
	(_pos select 0) + cos(RTS_CAMERA_DIRECTION) * _equ,
	(_pos select 1) + sin(RTS_CAMERA_DIRECTION) * _equ,
	(_pos select 2) + sin(RTS_CAMERA_YAW) * RTS_CAMERA_DISTANCE
];

RTS_CAMERA_HEIGHT = _new select 2;

//Apply camera position
RTS_CAMERA camSetPos _new;
RTS_CAMERA camSetTarget RTS_CAMERA_POSITION;
RTS_CAMERA camCommit _interval;
