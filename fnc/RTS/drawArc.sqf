private ["_center", "_radius", "_segments", "_color", "_segment", "_prev", "_max"];

_center = _this select 0;
_radius = _this select 1;
_color = _this select 2;
_segments = 12;
_max = 360;
if (count(_this) > 3) then {
	_segments = _this select 3;
};
if (count(_this) > 4) then {
	_max = _this select 4;
};

_segment = 360 / _segments;
_prev = [];

for[{_d = 0},{_d <= _max},{_d = _d + _segment}] do {
	_x = (_center select 0) + cos(_d) * _radius;
	_y = (_center select 1) + sin(_d) * _radius;
	_pos = [_x,_y,_center select 2];
	if (_d != 0) then {
		drawLine3D [_prev, _pos, _color];
	};
	_prev = _pos;
};