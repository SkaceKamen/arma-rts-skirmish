_location = call RTS_Map_random;

_center = _location select 0;
_spawns = _location select 1;
_spawns_directions = _location select 2;
_distance = _location select 3;
_direction = _location select 4;
_points = [];

RTS_MAP_DONE = false;

RTS_MAP_CENTER = _center;
RTS_MAP_SPAWNS = _spawns;
RTS_MAP_SPAWNS_DIRECTIONS = _spawns_directions;
RTS_MAP_POINTS = _points;
RTS_MAP_DIRECTION = _direction;
RTS_MAP_DISTANCE = _distance;
RTS_MAP_STARTED = time;

RTS_STATS_MESSAGES = [];
RTS_STATS_BULLETS = 0;
RTS_STATS_COMMANDS = 0;

{
	RTS_MAP_MONEY set [_foreachIndex, RTS_OPTIONS_MONEY_START];
	RTS_MAP_SCORE set [_foreachIndex, RTS_OPTIONS_SCORE];
} foreach RTS_MAP_MONEY;

[] spawn RTS_MAP_tick;