private ["_group", "_position", "_params", "_classname", "_init", "_unit","_direction"];

_group = _this select 0;
_position = _this select 1;
_params = _this select 2;
_direction = 0;
if (count(_this) > 3) then {
	_direction = _this select 3;
};

_classname = _params select 0;
_init = {};
if (count(_params) > 1) then {
	_init = _params select 1;
};

if (_classname isKindOf "Man") then {
	_unit = _group createUnit [_classname, _position, [], 0, "FORM"];
	_unit addEventHandler ["Killed", RTS_Unit_killed];
	_unit addEventHandler ["Fired", RTS_Unit_fired];
	[_unit] joinSilent _group;
	/*_pos = formationPosition _unit;
	_unit setPos _pos;*/
	_unit setSkill 1;
	_unit setSkill ["courage", 1];
	_unit setVariable ["RTS_SIDE", side(_unit) call RTS_getSideIndex];
	_unit setDir _direction;
} else {
	_unit = createVehicle [_classname, _position, [], 0, "FORM"];
	_unit setDir _direction;
	createVehicleCrew _unit;
	_unit addEventHandler ["Killed", RTS_Vehicle_killed];
	_unit addEventHandler ["Fired", RTS_Vehicle_fired];
	_unit addEventHandler ["GetOut", {
		_v = _this select 0;
		if (count(crew(_v)) == 0) then {
			_v hideObject false;
		};
	}];

	crew(_unit) joinSilent _group;
	{
		_x addEventHandler ["Killed", RTS_Unit_killed];
		_x addEventHandler ["Fired", RTS_Unit_fired];
		_x setVariable ["RTS_SIDE", side(_x) call RTS_getSideIndex];
		_x setSkill 1;
	} foreach crew(_unit);
};

if (_group getVariable ["RTS_Side", RTS_PLAYER_SIDE] != RTS_PLAYER_SIDE && RTS_FOW) then {
	_unit hideObject true;
};

_unit call _init;

_unit;