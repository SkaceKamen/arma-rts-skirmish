_who = _this select 0;
_by = _this select 1;

_killed_group = group(_who);
_killer_group = group(_by);

_side = _who getVariable ["RTS_SIDE", -1];
_name = getText(configFile >> "cfgVehicles" >> typeOf(_who) >> "displayName");

if (_side != -1) then {
	RTS_MAP_SCORE set [_side, (RTS_MAP_SCORE select _side) - RTS_OPTIONS_SCORE_PER_VEHICLE];
};

if (_side == RTS_PLAYER_SIDE) then {
	_leader = leader(group(_who));
	if (isNull(_leader)) then {
		_leader = player;
	};
	_leader sideChat format["We lost %1", _name];
};

if (!isNull(_killed_group)) then {
	_num = _killed_group getVariable ["RTS_LostVehicles", 0];
	_killed_group setVariable ["RTS_LostVehicles", _num + 1];
};

if (!isNull(_killer_group)) then {
	_num = _killer_group getVariable ["RTS_KilledVehicles", 0];
	_killer_group setVariable ["RTS_KilledVehicles", _num + 1];
};

_who spawn {
	sleep 2;
	_this hideObject false;
};