MOUSE_PRESSED set [_this select 1, false];

//RTS_UI not deployed, don't do anything please
if (RTS_STATE != "ui") exitWith {
	false;
};

_shift = _this select 4;
_ctrl = _this select 5;

//Used for doubleclick checking
//@TODO: Is there better way?
RTS_UI_MOUSE_LASTCLICK = time;

//Hide user selection rectangle (not always visible, don't care)
(["RTS_UI", "Selection"] call RTS_getCtrl) ctrlShow false;

//Stop this event if button in UI was clicked - mouseDown event can't be stopped
if (RTS_UI_MOUSE_HANDLED) exitWith {
	RTS_UI_MOUSE_HANDLED = false;
};

//When user is deploying group
if (RTS_UI_DEPLOYING) exitWith {
	if (_this select 1 == MOUSE_RIGHT) then {
		RTS_UI_DEPLOYING = false;
	};
	if (_this select 1 == MOUSE_LEFT) then {
		_pos = MOUSE_WORLD_POSITION;
		if (_pos distance (RTS_MAP_SPAWNS select RTS_PLAYER_SIDE) < RTS_DEPLOY_RADIUS) then {
			_info = RTS_UI_DEPLOYED;
			_money = RTS_MAP_MONEY select RTS_PLAYER_SIDE;
			RTS_MAP_MONEY set [RTS_PLAYER_SIDE, _money - (_info select 1)];
			[RTS_PLAYER_ARMY_CURRENT, RTS_UI_DEPLOYED_INDEX] call RTS_removeAt;
			[side(player), _pos, _info] call RTS_Group_create;
			call RTS_UI_deployRefresh;
			
			RTS_UI_DEPLOYING = false;
		};
	};
};

//Group selection
if (_this select 1 == MOUSE_LEFT) then {	
	//Calculate correct selection rectangle
	_m1 = RTS_MOUSE_START select 0;
	_m2 = MOUSE_POSITION;
	_from = [
		(_m1 select 0) min (_m2 select 0),
		(_m1 select 1) min (_m2 select 1)
	];
	_to = [
		(_m1 select 0) max (_m2 select 0),
		(_m1 select 1) max (_m2 select 1)
	];
	
	//Reset selection, but only if shift is not pressed
	_selected = [];
	if (_shift) then {
		_selected = RTS_SELECTED;
	};
	
	//Load player group (why I used UNITS keyword? Am I stupid?)
	_list = RTS_UNITS select (side(player) call RTS_getSideIndex);
	{
		//For usage in futher loops
		_g = _x;
		if (!(_g in _selected)) then {
			//Get screen position of unit marker - it can too be used for selecting unit
			//Practical for infantry groups, which tend to go nuts
			_pos = worldToScreen ([_x, _foreachIndex] call RTS_Group_getPosition);
			if (count(_pos) == 0) then {
				_pos = [-1,-1];
			};
			
			//Check screen makrer
			if (_pos select 0 >= _from select 0 &&
				_pos select 0 <= _to select 0 &&
				_pos select 1 >= _from select 1 &&
				_pos select 1 <= _to select 1) then {
				_selected set [count(_selected), _g];
			} else {
				//Check each soldier
				{
					if (alive(_x)) then {
						_pos = worldToScreen getPos(_x);
						if (count(_pos) == 2) then {
							if (_pos select 0 >= _from select 0 &&
								_pos select 0 <= _to select 0 &&
								_pos select 1 >= _from select 1 &&
								_pos select 1 <= _to select 1) exitWith {
								_selected set [count(_selected), _g];
							};
						};
					};
				} foreach units(_x select 0);
			};
		};
	} foreach _list;
	
	//Apply selected units
	_selected call RTS_Units_setSelected;
};

//Process movement commands
if (_this select 1 == MOUSE_RIGHT) then {
	if (count(RTS_SELECTED) > 0) then {
		//For end game statistics
		RTS_STATS_COMMANDS = RTS_STATS_COMMANDS + 1;
		
		_pos = MOUSE_WORLD_POSITION;
		
		//Check for interesting objects on player cursor
		_interests = call RTS_UI_mouseInterests;
		_build = _interests select 2;
		_veh = _interests select 1;
		_enemy = _interests select 0;
		_spots = ["gunner","commander","driver","cargo"];

		//If there are any objects under player cursor do an action or add move order
		//@TODO: multiple vehicles 
		if (!isNull(_enemy) || !isNull(_veh) || !isNull(_build)) then {
			//Attack enemy / Enter vehicle / Clear building
			if (!isNull(_enemy)) then {
				{
					_group = _x select 0;
					/*
					_group = _x select 0;
					if (!_shift) then {
						while {(count (waypoints _group)) > 0} do {
							deleteWaypoint ((waypoints _group) select 0);
						};
					};
					_wp = _group addWaypoint [getPos(_enemy), 0];
					_wp setWaypointType "DESTROY";
					_wp setWaypointCombatMode "YELLOW";
					_wp waypointAttachVehicle _enemy;
					*/
					
					{
						_x commandTarget _enemy;
					} foreach units(_group);
					
				} foreach RTS_SELECTED;
				
			} else {
				if (!isNull(_veh)) then {
					{
						_group = _x select 0;
						if (!_shift) then {
							while {(count (waypoints _group)) > 0} do {
								deleteWaypoint ((waypoints _group) select 0);
							};
						};
						_wp = _group addWaypoint [getPos(_enemy), 0];
						_wp setWaypointType "GETIN";
						_wp waypointAttachVehicle _veh;
					} foreach RTS_SELECTED;
				} else {
					if (!isNull(_build)) then {
						_units = [];
						{
							_units = _units + units(_x select 0);
						} foreach RTS_SELECTED;
						_positions = [_build, count(_units)] call BIS_fnc_buildingPositions;
						
						{
							_unit = _units select _foreachIndex;
							_unit commandMove _x;
						} foreach _positions;
					};
				};
			};
		} else {
			//Add movement order
			{
				_group = _x select 0;
				if (!_shift) then {
					while {(count (waypoints _group)) > 0} do {
						deleteWaypoint ((waypoints _group) select 0);
					};
				};
				_wp = _group addWaypoint [_pos, 0];
				_wp setWaypointType "MOVE";
				//This could help with the COMBAT problem, it doesn't
				_wp setWaypointCombatMode "YELLOW";
				
				leader(_group) doMove _pos;		
			} foreach RTS_SELECTED;

			//@TODO: Either extract those from game, or record some
			/*
			playSound "responseMoving02";
			player commandRadio "responseMoving01";
			*/
			
			//Display moving marker
			_pos spawn {
				_height = 0;
				_this set [2, 1];
				_veh = RTS_HELPER_WAYPOINT createVehicleLocal _this;
				_index = 0;
				while { true } do {
					if (_height == 1) then {
						_height = 0;
					} else {
						_height = 1;
					};
					_this set [2, _height];
					_veh setPos _this;
					_index = _index + 1;
					if (_index > 5) exitWith { };
					sleep 0.2;
				};
				deleteVehicle _veh;
			};
		};
	};
};