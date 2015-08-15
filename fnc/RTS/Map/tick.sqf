_side = side(player) call RTS_getSideIndex;
_list = RTS_UNITS select _side;

_prev = 0;
_money_median = 5 * 60;
_money_dividor = (_money_median ^ 2) / (RTS_OPTIONS_MONEY - RTS_OPTIONS_MONEY_START);

while { !RTS_MAP_DONE } do {
	_owned = [0,0,0];
	_max_owned = 0;

	{
		_pos = _x select 0;
		_size = _x select 1;
		_cap = _x select 2;
		_owner = _x select 3;
		_name = _x select 6;
		
		_winner = _owner;
		_units = nearestObjects [_pos, ["Man"], _size];
		_count = [0,0,0,0];
		{
			_index = side(_x) call RTS_getSideIndex;
			_count set [_index, (_count select _index) + 1];
		} foreach _units;
		
		//Nasty animals counting as civilians
		_count set [SIDE_CIVILIAN, 0];
		
		_max = 0;
		{
			if (_x > _max && _foreachIndex != SIDE_CIVILIAN) then {
				_winner = _foreachIndex;
				_max = _x;
			};
		} foreach _count;
		
		//this side shouldn't have any cap
		_cap set [SIDE_CIVILIAN, 0];
		
		if (_winner == _owner) then {
			if (_cap select _winner < 100) then {
				_cap set [_winner, (_cap select _winner) + _max];
			};
		} else {
			_ready = true;
			{
				if (_x > 0 && _foreachIndex != _winner) then {
					_cap set [_foreachIndex, (_x - (_max max 1)) max 0];
					_ready = false;
				};
			} foreach _cap;
			
			_poi = _cap select _winner;
			if (_ready) then {
				if (_cap select _owner > 0) then {
					_cap set [_owner, ((_cap select _owner) - _max) max 0];
				} else {
					if (_winner != SIDE_CIVILIAN && _owner != SIDE_CIVILIAN) then {
						_capturer = "Player";
						_capturerX = "We";
						if (_owner == RTS_ENEMY_SIDE) then {
							_capturer = "Enemy";
							_capturerX = "Enemy";
						};
						
						_msg = format["%1 lost control of %2", _capturer, _name];
						_msg call RTS_Stats_Log;
						_msg = format["%1 lost control of %2", _capturerX, _name];
						player sideChat _msg;
					};
				
					_owner = SIDE_CIVILIAN;
					if (_poi < 100) then {
						_cap set [_winner, (_poi + _max) min 100];
					} else {
						if (_owner != _winner) then {
							_capturer = "player";
							_capturerX = "us";
							if (_winner != RTS_PLAYER_SIDE) then {
								_capturer = "enemy";
								_capturerX = "enemy";
							};
							_msg = format["Point %1 was captured by %2", _name, _capturer];
							_msg call RTS_Stats_Log;
							_msg = format["Point %1 was captured by %2", _name, _capturerX];
							player sideChat _msg;
						};
						_owner = _winner;
					};
				};
			};
		};
		

		_owned set [_owner, (_owned select _owner) + 1];
		if (_owned select _owner > 	_max_owned) then {
			_max_owned = _owned select _owner;
		};
		
		_x set [3, _owner];
	} foreach RTS_MAP_POINTS;
	
	{
		if (_owned select _x < _max_owned) then {
			RTS_MAP_SCORE set [_x, (RTS_MAP_SCORE select _x) - RTS_OPTIONS_SCORE_PER_FLAG];
		};
	} foreach RTS_SIDES;
	
	/*
	RTS_MAP_SCORE set [SIDE_EAST, (RTS_MAP_SCORE select SIDE_EAST) - (_owned select SIDE_WEST) * RTS_OPTIONS_SCORE_PER_FLAG];
	RTS_MAP_SCORE set [SIDE_WEST, (RTS_MAP_SCORE select SIDE_WEST) - (_owned select SIDE_EAST) * RTS_OPTIONS_SCORE_PER_FLAG];
	*/
	
	if (time - RTS_MAP_STARTED > 60) then {
		{
			_side = _x;
			_x = RTS_UNITS select _side;
			_dead = true;
			{
				_alive = { alive _x } count units(_x select 0);
				if (_alive > 0) exitWith {
					_dead = false;
				};
			} foreach _x;
			
			if (_dead) then {
				RTS_MAP_SCORE set [_side, ((RTS_MAP_SCORE select _side) - 50) max 0];
			};
		} foreach RTS_SIDES;
	};
	
	{
		_side = _foreachIndex;
		if (_x <= 0) exitWith {
			_win = _side != RTS_PLAYER_SIDE;
			closeDialog 0;
			RTS_MAP_DONE = true;
			[_win] call RTS_UI_Result_start;
		};
	} foreach RTS_MAP_SCORE;
	
	_since = (time - RTS_MAP_STARTED);
	_now = (_since ^ (2 - (0 max (_since - _money_median))/2000))/_money_dividor;
	_inc = (_now - _prev) max 0;
	_prev = _now;
	
	{
		RTS_MAP_MONEY set [_foreachIndex, _x + _inc];
	} foreach RTS_MAP_MONEY;
	
	//Refresh deploy menu colors, but only if there is anything to deploy left
	if (count(RTS_PLAYER_ARMY_CURRENT) > 0) then {
		call RTS_UI_deployRefreshColors;
	};
	
	if (RTS_FOW) then {
		{
			if (_foreachIndex != RTS_PLAYER_SIDE) then {
				{
					{
						if (alive(_x)) then {
							_sld = vehicle(_x);
							_kn = side(player) knowsAbout _sld;
							if (_kn == 0) then {
								{
									{
										_kn = _x knowsAbout _sld;
										if (_kn <= 0) then {
											if (!lineIntersects [eyePos(_sld), eyePos(_x), _sld, _x] &&
												!terrainIntersect [eyePos(_sld), eyePos(_x)]) then {
												group(_x) reveal _sld;
												group(_sld) reveal _x;
												_kn = 1;
											};
										};
										if (_kn > 0) exitWith {};
									} foreach units(_x select 0);
									if (_kn > 0) exitWith { true; };
								} foreach _list;
							};
							
							if (_kn > 0) then {
								_sld hideObject false;
							} else {						
								_sld hideObject true;	
							};
						};
					} foreach units(_x select 0);
				} foreach _x;
			};
		} foreach RTS_UNITS;
	};

	sleep 1;
};