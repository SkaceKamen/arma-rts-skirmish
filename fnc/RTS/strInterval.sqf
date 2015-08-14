private ["_minutes", "_seconds", "_str"];

_minutes = str(floor(_this / 60));
_seconds = str(floor(_this  % 60));

if (count(toArray(_minutes)) == 1) then {
	_minutes = "0" + _minutes;
};
if (count(toArray(_seconds)) == 1) then {
	_seconds = "0" + _seconds;
};

_str = format["%1:%2", _minutes, _seconds];
_str;