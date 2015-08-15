private ["_side", "_params", "_path"];

_side = _this select 0;
_params = _this select 1;

_path = RTS_ICONS_PATH;
if (_side == RTS_PLAYER_SIDE) then {
	_path = _path + RTS_ICONS_FRIENDLY_PREFIX;
} else {
	_path = _path + RTS_ICONS_ENEMY_PREFIX;
};

_path = _path + ((_params select 0) select 1);
_path = _path + RTS_ICONS_SUFFIX;

_path;