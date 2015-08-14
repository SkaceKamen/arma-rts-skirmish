RTS_PLAYER_SIDE = side(player) call RTS_getSideIndex;

{
	RTS_PLAYER_ARMY_CURRENT set [_foreachIndex, _x];
} foreach RTS_PLAYER_ARMY;

call RTS_MAP_start;
call RTS_UI_start;

[RTS_MAP_CENTER vectorAdd [
	RTS_MAP_DISTANCE * 0.5 * cos(RTS_MAP_DIRECTION + 90),
	RTS_MAP_DISTANCE * 0.5 * sin(RTS_MAP_DIRECTION + 90),
	0
], 20] call RTS_MAP_createPoint;
[RTS_MAP_CENTER, 30] call RTS_MAP_createPoint;
[RTS_MAP_CENTER vectorAdd [
	RTS_MAP_DISTANCE * 0.5 * cos(RTS_MAP_DIRECTION - 90),
	RTS_MAP_DISTANCE * 0.5 * sin(RTS_MAP_DIRECTION - 90),
	0
], 20] call RTS_MAP_createPoint;

_side = side(player);
_position = RTS_MAP_SPAWNS select RTS_PLAYER_SIDE;

//_position call RTS_MAP_createPoint;

/*
_info = ((RTS_LIST_GROUPS select SIDE_WEST) select 0);

[_side, _position, _info] call RTS_Group_create;
[_side, _position, _info] call RTS_Group_create;
[_side, _position, _info] call RTS_Group_create;

_info = ((RTS_LIST_GROUPS select SIDE_WEST) select 1);
_position set [1, (_position select 1) + 100];
[_side, _position, _info] call RTS_Group_create;
*/

/*{
	[_side, _position, _x] call RTS_Group_create;
	//[_side, _position, _x] call new_RTS_Group;
} foreach RTS_PLAYER_ARMY;*/

east call RTS_AI_start;
