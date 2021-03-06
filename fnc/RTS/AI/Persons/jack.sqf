/**
 * Jack, simplest AI
 */

_side = _this select 0;
_index = _this select 1;
_position = _this select 2;
_general = _this select 3;
_direction = RTS_MAP_SPAWNS_DIRECTIONS select _index;

_general setName "Jack";

//When group spawn, send it to one of the points and hope for the best
_stack_deployed = {
	_struct = _this select 0;
	_stack_index = _this select 1;
	_point = RTS_MAP_POINTS select (_stack_index % count(RTS_MAP_POINTS));
	_wp = (_struct select 0) addWaypoint [_point select 0, (_point select 1) / 2];
	_wp setWaypointType "SAD";
	_wp setWaypointSpeed "FULL";
};

//Prepare army
_options = RTS_LIST_GROUPS select _index;
_basic = [_index, "IF_BASIC"] call RTS_AI_findGroup;
_car = [_index, "VEH_CAR"] call RTS_AI_findGroup;
_armor = [_index, "VEH_APC_HEAVY"] call RTS_AI_findGroup;
_heavy = [_index, "IF_SPEC"] call RTS_AI_findGroup;
_snip = [_index, "IF_SNIP"] call RTS_AI_findGroup;

_army = [
	[
		[_basic, _basic, _basic],
		_stack_deployed
	],
	[
		[_car, _car, _car],
		_stack_deployed
	],
	[
		[_armor, _armor, _heavy, _snip],
		_stack_deployed
	]
];

_army call RTS_AI_deployStack;