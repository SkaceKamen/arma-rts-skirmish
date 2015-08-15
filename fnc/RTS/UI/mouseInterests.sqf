private ["_center", "_objects", "_spots", "_build", "_veh", "_enemy"];

//Find objects around cursor
_center = MOUSE_WORLD_POSITION;
_objects = nearestObjects [_center, ["Man", "House", "LandVehicle", "Air"], 10];
_spots = ["gunner","commander","driver","cargo"];
_build = objNull;
_veh = objNull;
_enemy = objNull;

//Cycle objects
{
	_obj = _x;
	
	//Ignore hidden objects
	if (!isObjectHidden(_obj)) then {
		//Allow only houses with positions
		if (_obj isKindOf "House") then {
			//Buildings disabled for now
			/*if ((_obj buildingPos 0) distance [0,0,0] > 1) then {
				_build = _obj;
			};*/
		} else {
			//Enemy objects and vehicles requires more precision
			if (_obj distance _center <= 5) then {
				_man = _x isKindOf "Man";
				_isEnemy = ((side _x) getFriend (side player) < 0.6);
				if (_man) then {
					if (_isEnemy && alive _x) then {
						_enemy = _x;
					};
				} else {
					//Check for vehicle crew side instead of vehicle - more precise
					_crew = crew(_x);
					_side = side(_x);
					if (count(_crew) > 0) then {
						_side = side (_crew select 0);
					};
					_isEnemy = ((side _x) getFriend (side player) < 0.6);
					if (_isEnemy && count(crew(_x)) > 0 && alive(_x) && damage(_x) < 1) then {
						_enemy = _x;
					} else {	
						{
							if (_obj emptyPositions _x > 0) exitWith {
								_veh = _obj;
							};
						} foreach _spots;
					};
				};
			};
		};
	};
} foreach _objects;

//Return interesting objects in categories
[_enemy, _veh, _build];