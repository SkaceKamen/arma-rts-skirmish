private ["_point", "_direction", "_distance"];

_point = [];
_direction = 0;
_distance = 0;
_spawns = [];

while { true } do {
	//Load random location
	_center = ["NameCityCapital","NameCity","NameVillage"] call RTS_MAP_randomLocation;

	//Direction and distance between two spanws
	_direction = random(360);
	_distance = 200 + random(50);

	//Save center position
	_point = getPos(_center);
	//RSTF_POINT = markerPos "TestCenter";
	_point set [2, 0];

	//Now find usable spawns
	_tries = 0;
	_water = true;
	while { _tries < 5 } do {
		//Load spawn locations
		_spawns = [
			[(_point select 0) + cos(_direction) * _distance,(_point select 1) + sin(_direction) * _distance],
			[(_point select 0) + cos(180 + _direction) * _distance,(_point select 1) + sin(180 + _direction) * _distance]
		];
		
		if (!surfaceIsWater(_spawns select 0) &&
			!surfaceIsWater(_spawns select 1)) exitWith {
			_water = false;
			true;
		};
		
		_direction = _direction + 30;
		_tries = _tries + 1;
	};
	
	if (!_water) exitWith {
		true;
	};
};

[_point, _spawns, _distance, _direction];