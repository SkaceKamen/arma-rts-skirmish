{
	_group = _x select 0;
	while {(count (waypoints _group)) > 0} do {
		deleteWaypoint ((waypoints _group) select 0);
	};
} foreach RTS_SELECTED;

RTS_UI_MOUSE_HANDLED = true;