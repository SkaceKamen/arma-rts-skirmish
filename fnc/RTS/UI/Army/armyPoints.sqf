private ["_current"];
_current = 0;
{
	_current = _current + (_x select 1);
} foreach RTS_PLAYER_ARMY;
_current;