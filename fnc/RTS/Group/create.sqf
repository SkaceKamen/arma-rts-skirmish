private ["_index", "_side", "_position", "_params", "_name", "_cost", "_units", "_group", "_marker", "_markers", "_struct", "_list", "_dont_add", "_direction"];

_side = _this select 0;
_position = _this select 1;
_params = _this select 2;
_direction = 0;
if (count(_this) > 3) then {
	_direction = _this select 3;
};
_direction = -_direction + 90;

_dont_add = false;
if (count(_this) > 4) then {
	_dont_add = _this select 4;
};

_index = (_side call RTS_getSideIndex);
_list = RTS_UNITS select _index;
_name = _params select 0;
_cost = _params select 1;
_units = _params select 2;

_group = creategroup _side;
_group setFormDir _direction;
_group setVariable ["RTS_Side", _side call RTS_getSideIndex];
_group setVariable ["RTS_KilledUnits", 0];
_group setVariable ["RTS_KilledVehicles", 0];
_group setVariable ["RTS_LostUnits", 0];
_group setVariable ["RTS_LostVehicles", 0];
_group setVariable ["RTS_Deployed", time - RTS_MAP_STARTED];
{
	[_group, _position, _x, _direction] call RTS_UNIT_create;
} foreach _units;

if (_dont_add) then {
	_group setFormation "DIAMOND";
};

//Stop from fleeing - doesn't seem to work properly
_group allowFleeing 0;
//Get to waypoints faster - works a little, COMBAT mode still takes forever
_group setSpeedMode "FULL";
//Typical behaviour
_group setBehaviour "AWARE";

_struct = [
	_group,
	_params,
	[],
	count(units(_group)),
	count(_list)
];

//This actually works? Why didn't I used  it instead of that _struct? Sigh
_group setVariable ["RTS_Object", _struct];


if (!_dont_add) then {
	//Somehow I commited to saving controls to the groups, rather than having stack of controls for each point in UI class, which would make more sence
	_markers = _struct call RTS_UI_createGroupControls;
	_struct set [2, _markers];

	_list set [count(_list), _struct];
	
	if (_side != side(player)) then {
		format["Enemy deployed %1", (_params select 0) select 0] call RTS_Stats_log;
	} else {
		format["Player deployed %1", (_params select 0) select 0] call RTS_Stats_log;
	};
};

_struct;