private["_side", "_tags", "_randomize", "_matches", "_matched"];

_side = _this select 0;
_tags = _this select 1;
_randomize = true;
_matched = [];
if (count(_this) > 2) then {
	_randomize = _this select 2;
};
if (typeName(_tags) != typeName([])) then {
	_tags = [_tags];
};

_matches = [];
{
	_match = true;
	_grp = _x;
	{
		if (!(_x in (_grp select 3))) exitWith {
			_match = false;
		};
	} foreach _tags;
	if (_match) then {
		if (!_randomize) exitWith {
			_matches = [_grp];
		};
		_matches set [count(_matches), _grp];
	};
} foreach (RTS_LIST_GROUPS select _side);

if (count(_matched) >= 0) then {
	_matched = _matches select 0;
	if (count(_matches) > 1) then {
		_matched = [_matches] call BIS_fnc_selectRandom;
	};
} else {
	systemChat format["FATAL AI ERROR: Failed to find %1 for %2", _tags, _side];
};
_matched;