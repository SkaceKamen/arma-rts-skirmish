private ["_pos", "_count", "_x", "_group","_index"];

_index = -1;
_group = _this select 0;
if (count(_this) > 1) then {
	_index = _this select 1;
	if (count(RTS_UNIT_POSITIONS) > _index) exitWith {
		RTS_UNIT_POSITIONS select _index;
	};
};

_pos = [0,0,0];
_count = 0;
{
	if (alive(_x)) then {
		_count = _count + 1;
		_pp = visiblePosition(_x);
		_pos = [
			(_pos select 0) + (_pp select 0),
			(_pos select 1) + (_pp select 1),
			(_pos select 2) + (_pp select 2)
		];
	};
} foreach units(_group select 0);

if (_count > 0) then {
	_pos = [
		(_pos select 0)/_count,
		(_pos select 1)/_count,
		(_pos select 2)/_count + 2
	];
};

if (_index != -1) then {
	RTS_UNIT_POSITIONS set [_index, _pos];
};

_pos;