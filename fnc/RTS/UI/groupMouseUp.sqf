_event = _this select 0;
_index = _this select 1;
_ctrl = _event select 0;
_shift = _event select 4;

_group = (RTS_UNITS select RTS_PLAYER_SIDE) select _index;

if (count(_group) != 0) then {
	_selected = [];
	if (_shift) then {
		_selected = RTS_SELECTED;
	};
	if (!(_group in _selected)) then {
		_selected set [count(_selected), _group];
		_selected call RTS_Units_setSelected;
	};
	
	if (time - RTS_UI_MOUSE_LASTCLICK < 0.2) then {
		_pos = [_group] call RTS_Group_getPosition;
		if (count(_pos) > 0) then {
			if (_pos distance [0,0,0] > 10) then {
				_speed = 1 min ((RTS_CAMERA_POSITION distance _pos) / 100);
				
				RTS_CAMERA_POSITION = _pos;
				_speed call RTS_UI_updateCamera;
			};
		};
	};
};

RTS_UI_MOUSE_HANDLED = true;