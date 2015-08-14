/*_side = _this;
_index = (_side call RTS_getSideIndex);
_position = RTS_MAP_SPAWNS select _index;
_list = RTS_LIST_GROUPS select _index;
_opp = RTS_LIST_GROUPS select RTS_PLAYER_SIDE;

{
	_find = _opp find _x;
	_info = _list select _find;

	_group = [_side, _position, _info] call RTS_Group_create;
	_group = _group select 0;
	_wp = _group addWaypoint [(RTS_MAP_POINTS select 0) select 0, 20];
	_wp setWaypointType "SAD";
} foreach RTS_PLAYER_ARMY;*/

_side = _this;
_index = (_side call RTS_getSideIndex);
_position = RTS_MAP_SPAWNS select _index;

_group = (creategroup _side);
_general = _group createUnit [typeOf(player), _position, [], 0, "NONE"];
[_general] joinSilent _group;
removeAllWeapons _general;
_general hideObject true;
_general allowDamage false;
_general enableSimulation false;

_persons = [
	RTS_AI_Persons_jack
];
_person = _persons call BIS_fnc_selectRandom;
[
	_side,
	_index,
	_position,
	_general
] spawn _person;