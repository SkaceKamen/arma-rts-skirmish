private ["_group", "_actions", "_display", "_behaviour", "_speed", "_formation", "_leader", "_b", "_s", "_f"];

//Some groups may have additional actions, use dynamic actions array
_actions = [];
_display = "RTS_UI" call RTS_getDisplay;

if (count(RTS_SELECTED) > 0) then {
	_behaviour = "";
	_speed = "";
	_formation = "";
	_alive = 0;
	
	//Determine behaviour, speed and formation of current selection
	{
		_group = _x select 0;
		if ({alive _x} count units(_group) > 0) then {
			_leader = leader(_group);
			_b = behaviour(_leader);
			_s = speedMode(_group);
			_f = formation(_group);
			
			_alive = _alive + ({ alive _x } count units(_group));
			
			if (_behaviour != _b && _behaviour == "") then {
				_behaviour = _b;
			} else {
				if (_behaviour != _b && _behaviour != "") then {
					_behaviour = "multiple";
				};
			};
			
			if (_speed != _s && _speed == "") then {
				_speed = _s;
			} else {
				if (_speed != _s && _speed != "") then {
					_speed = "multiple";
				};
			};
			
			if (_formation != _f && _formation == "") then {
				_formation = _f;
			} else {
				if (_formation != _f && _formation != "") then {
					_formation = "multiple";
				};
			};
		};
	} foreach RTS_SELECTED;

	if (_alive > 0) then {
		//Get readable formation name
		_fname = _formation;
		if (_formation != "multiple") then {
			_fname = RTS_FORMATIONS find _formation;
			if (_fname != -1) then {
				_fname = RTS_FORMATIONS_NAMES select _fname;
			};
		};

		//Generate action - currently static
		_actions set [count(_actions), ["gfx\icon_stop.paa", "_this call RTS_UI_Actions_stop", "Stop"]];
		_actions set [count(_actions), [format["gfx\icon_behaviour_%1.paa", [_behaviour] call BIS_fnc_filterString],"_this call RTS_UI_Actions_behaviour", format["Behaviour: %1", _behaviour]]];
		_actions set [count(_actions), [format["gfx\icon_speed_%1.paa", [_speed] call BIS_fnc_filterString],"_this call RTS_UI_Actions_speed", format["Speed: %1", _speed]]];
		_actions set [count(_actions), [format["gfx\icon_formation_%1.paa", [_formation] call BIS_fnc_filterString],"_this call RTS_UI_Actions_formation", format["Formation: %1", _fname]]];
		_actions set [count(_actions), ["gfx\icon_getout.paa", "_this call RTS_UI_Actions_getOut", "Get out"]];
		_actions set [count(_actions), ["gfx\icon_transport.paa", "_this call RTS_UI_Actions_transport", "Unload transport"]];
	};
};

//Now display all allowed actions
{
	if (_foreachIndex >= count(RTS_UI_ACTIONS)) then {
		RTS_UI_ACTIONS set [_foreachIndex, _display ctrlCreate ["RscPicture", -1]];
	};
	
	_ctrl = RTS_UI_ACTIONS select _foreachIndex;
	_ctrl ctrlSetTextColor [1,1,1,1];
	_ctrl ctrlSetPosition [RTS_UI_ACTIONS_X + (RTS_UI_ACTIONS_P + RTS_UI_ACTION_W) * _foreachIndex, RTS_UI_ACTIONS_Y, RTS_UI_ACTION_W, RTS_UI_ACTION_H];
	_ctrl ctrlSetText (_x select 0);
	_ctrl ctrlSetEventHandler ["MouseButtonUp", _x select 1];
	_ctrl ctrlSetTooltip (_x select 2);
	_ctrl ctrlShow true;
	_ctrl ctrlEnable true;
	_ctrl ctrlCommit 0;
} foreach _actions;

//Hide unused buttons
for[{_i = count(_actions)},{_i < count(RTS_UI_ACTIONS)},{_i = _i + 1}] do {
	_ctrl = RTS_UI_ACTIONS select _i;
	_ctrl ctrlShow false;
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
};

//Reset subactions
["", []] call RTS_UI_Actions_subactions;