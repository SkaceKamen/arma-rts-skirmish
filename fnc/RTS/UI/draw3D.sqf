
//Draw lines for groups
{
	//Draw lines to group members
	_group = _x select 0;
	_pos = [_x, _foreachIndex] call RTS_Group_getPosition;
	{
		if (alive _x) then {
			_unit = visiblePosition(_x);
			_height = 1; //_x call BIS_fnc_objectHeight;
			_unit set [2, (_unit select 2) + _height];
			drawLine3D [ _pos, _unit, [1,1,1,1]];
			_unit set [2, _height];
		};
	} foreach units(_group);
	
	//Draw lines for waypoints
	_last = _pos;
	{
		if (_foreachIndex >= currentWaypoint _group) then {
			_color = [1,1,0,1];
			
			_wp = waypointPosition _x;
			if (!isNull(waypointAttachedVehicle(_x))) then {
				_wp = getPos(waypointAttachedVehicle(_x));
			};
			_wp set [2, 0.5];
			if (waypointType(_x) == "DESTROY") then {
				_color = [1,0,0,1];
			};
			
			drawLine3D [_last, _wp, _color];
			_last = _wp;
		};
	} foreach waypoints(_group);
} foreach RTS_SELECTED;

//Draw points circles
{
	_position = _x select 0;
	_radius = _x select 1;
	_cap = _x select 2;
	
	[[_position select 0, _position select 1, 0.5], _radius, [1,1,1,1], 24] call RTS_drawArc;
	
	_radius = 1;
	[[_position select 0, _position select 1, 2], _radius, [1,1,1,1], 20, 360] call RTS_drawArc;
	{
		if (_x > 0) exitWith {
			_color = RTS_COLOR_NEUTRAL;
			if (_foreachIndex == RTS_PLAYER_SIDE) then {
				_color = RTS_COLOR_FRIENDLY;
			} else {
				_color = RTS_COLOR_ENEMY;
			};
			[[_position select 0, _position select 1, 2], _radius, _color, 20, round((_x / 100) * 360)] call RTS_drawArc;
		};
	} foreach _cap;			
} foreach RTS_MAP_POINTS;

//Draw deploy zone limits
if (RTS_UI_DEPLOYING) then {
	_pos = (RTS_MAP_SPAWNS select RTS_PLAYER_SIDE) vectorAdd [0, 0, 0.5];
	_color = [1,1,0,1];
	if (MOUSE_WORLD_POSITION distance (RTS_MAP_SPAWNS select RTS_PLAYER_SIDE) >= RTS_DEPLOY_RADIUS) then {
		if (round(time) == floor(time)) then {
			_color = [1,0,0,1];
		};
	};
	
	[_pos, RTS_DEPLOY_RADIUS, _color, 24] call RTS_drawArc;
};