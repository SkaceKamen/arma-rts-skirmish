/**
 * Update cycle for UI related stuff
 */

disableSerialization;

//60 FPS - at least a try
_sleep = 1 / 60;

//Player units
_list = RTS_UNITS select RTS_PLAYER_SIDE;

//Basic ui elements
_display = "RTS_UI" call RTS_getDisplay;
_units_bg = ["RTS_UI", "SelectedBackground", "controlsBackground"] call RTS_getCtrl;

_score_friendly = ["RTS_UI", "ScoreFriendly"] call RTS_getCtrl;
_score_enemy = ["RTS_UI", "ScoreEnemy"] call RTS_getCtrl;
_deploy_money = ["RTS_UI", "DeployPoints", ["controls", "DeployGroup", "controls"]] call RTS_getCtrl;

//Only cycle when playing and there is dialog on
while { !RTS_MAP_DONE && dialog } do {
	//This is used to cache groups positions - cleared only in this loop
	RTS_UNIT_POSITIONS = [];
	
	//Display units markers and health - both in map and in UI
	{
		//Markers in map
		_marker = ((_x select 2) select 0);
		_health = ((_x select 2) select 2);
		_health_bg = ((_x select 2) select 1);
		
		_current = ctrlPosition _marker;
		_pos = [_x, _foreachIndex] call RTS_Group_getPosition;
		_pos = worldToScreen _pos;
		_alive = {alive _x} count units(_x select 0);
		
		if (count(_pos) != 0 && _alive > 0) then {
			_pos set [0, (_pos select 0) - (_current select 2)/2];
			_pos set [1, (_pos select 1) - (_current select 3)/2];
			
			_marker ctrlSetPosition _pos;
			_marker ctrlShow true;
			_marker ctrlCommit 0;
			
			_pos set [1, (_pos select 1) + (_current select 3)];
			//_current = ctrlPosition _health;
			
			_health ctrlShow true;
			_health ctrlSetPosition _pos;
			_health progressSetPosition (_alive / (_x select 3));
			_health ctrlCommit 0;
			
			_health_bg ctrlShow true;
			_health_bg ctrlSetPosition _pos;
			_health_bg ctrlCommit 0;
		} else {
			_marker ctrlShow false;
			_health ctrlShow false;
			_health_bg ctrlShow false;
		};
		
		//Markers in UI
		_marker = ((_x select 2) select 3);
		_health = ((_x select 2) select 5);
		_health_bg = ((_x select 2) select 4);
		
		_current = ctrlPosition _marker;
		_current2 = ctrlPosition _health;
		
		_pad = 0.01;
		_xx = RTS_UI_TASKBAR_X + ((_current select 2) + _pad) * _foreachIndex;
		_yy = RTS_UI_TASKBAR_Y;
		
		_marker ctrlSetPosition [_xx, _yy + (_current2 select 3)];
		_marker ctrlCommit 0;
		_marker ctrlShow true;
		
		_health_bg ctrlSetPosition [_xx, _yy];
		_health_bg ctrlSetBackgroundColor [0,0,0,0.8];
		_health_bg ctrlCommit 0;
		_health_bg ctrlShow true;
		
		_health ctrlSetPosition [_xx, _yy];
		_health progressSetPosition (_alive / (_x select 3));
		_health ctrlSetBackgroundColor [1,1,1,0.8];
		_health ctrlCommit 0;
		_health ctrlShow true;
	} foreach _list;
	
	//Resize background for player units
	_units_bg ctrlSetPosition [SafeZoneX, SafeZoneY + SafeZoneH - 0.11, count(_list) * 0.09 + 0.01, 0.11];
	_units_bg ctrlCommit 0;
	
	//Display scores
	_score_friendly ctrlSetText str(floor(RTS_MAP_SCORE select RTS_PLAYER_SIDE));
	_score_enemy ctrlSetText str(floor(RTS_MAP_SCORE select RTS_ENEMY_SIDE));
	
	//Display deploy points
	_deploy_money ctrlSetText str(floor(RTS_MAP_MONEY select RTS_PLAYER_SIDE));
	
	//Update points makrers in map
	{
		_pos = _x select 0;
		_cap = _x select 2;
		_owner = _x select 3;
		_ctrls = _x select 4;
		
		_ctrl = _ctrls select 0;
		_current = ctrlPosition _ctrl;
		_pos = worldToScreen [_pos select 0, _pos select 1, (_pos select 2) + 5];
				
		if (count(_pos) != 0) then {		
			//Select correct color
			if (_owner == RTS_PLAYER_SIDE) then {
				_ctrl ctrlSetTextColor RTS_COLOR_FRIENDLY;
			} else {
				if (_owner == SIDE_CIVILIAN) then {
					_ctrl ctrlSetTextColor RTS_COLOR_NEUTRAL;
				} else {
					_ctrl ctrlSetTextColor RTS_COLOR_ENEMY;
				};
			};
			
			_pos set [0, (_pos select 0) - (_current select 2)/2];
			_pos set [1, (_pos select 1) - (_current select 3)/2];
			
			_ctrl ctrlSetPosition _pos;
			_ctrl ctrlShow true;
			_ctrl ctrlCommit 0;
		} else {
			_ctrl ctrlShow false;
		};
	} foreach RTS_MAP_POINTS;

	//Wait a while so we don't
	sleep _sleep;
};