_who = _this select 0;
_by = _this select 1;

_killed_group = group(_who);
_killer_group = group(_by);

_side = _who getVariable ["RTS_SIDE", -1];
_name = getText(configFile >> "cfgVehicles" >> typeOf(_who) >> "displayName");

if (_side != -1) then {
	RTS_MAP_SCORE set [_side, (RTS_MAP_SCORE select _side) - RTS_OPTIONS_SCORE_PER_KILL];
};

/*if (_side == RTS_PLAYER_SIDE) then {*/
_leader = leader(group(_who));
if (isNull(_leader)) then {
	_leader = player;
};

if (!(_killed_group getVariable ["RTS_Lost", false])) then {
	_obj = _killed_group getVariable ["RTS_Object", []];
	
	if (count(_obj) > 0) then {
		_name = ((_obj select 1) select 0) select 0;
		_alive = { alive _x } count(units(_who));
		if (_alive == 0) then {
			if (_side == RTS_PLAYER_SIDE) then {
				player sideChat format["We lost %1", _name];
			};
			
			_playa = "Player";
			if (_side != RTS_PLAYER_SIDE) then {
				_playa = "Enemy";
			};
			(format["%1 lost %2", _playa, _name]) call RTS_Stats_Log;
			
			_killed_group setVariable ["RTS_Lost", true];
		} else {
			if (_side == RTS_PLAYER_SIDE) then {
				_leader sideChat format["%1 is at %2%3", _name, floor((_alive / (_obj select 3)) * 100), "%"];
			};
		};
	};
};
//};

if (!isNull(_killed_group)) then {
	_num = _killed_group getVariable ["RTS_LostUnits", 0];
	_killed_group setVariable ["RTS_LostUnits", _num + 1];
};

if (!isNull(_killer_group)) then {
	_num = _killer_group getVariable ["RTS_KilledUnits", 0];
	_killer_group setVariable ["RTS_KilledUnits", _num + 1];
};

if (isObjectHidden _who) then {
	_who spawn {
		sleep 2;
		_this hideObject false;
	};
};

if (RTS_CLEANING) then {
	_who spawn {
		sleep RTS_CLEANING_INTERVAL;
		deleteVehicle _this;
	};
};