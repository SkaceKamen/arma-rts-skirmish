private ["_text", "_color", "_image"];

_text = _this;
_color = [1,1,1,1];
_image = 0;
if (typeName(_this) == typeName([])) then {
	_text = _this select 0;
	if (count(_this) > 1) then {
		_color = _this select 1;
	};
	if (count(_this) > 2) then {
		_image = _this select 2;
	};
};

RTS_STATS_MESSAGES set [count(RTS_STATS_MESSAGES), [time, _text, _color, _image]];