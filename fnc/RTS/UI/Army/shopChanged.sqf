disableSerialization;

_ctrl = ["RTS_Army", "shopArmy"] call RTS_getCtrl;
_list = (RTS_LIST_GROUPS select RTS_PLAYER_SIDE);
if (count(_this) > 0) then {
	_ctrl = _this select 0;
};
if (count(_this) > 1) then {
	_list = _this select 1;
};

_index = lnbCurSelRow _ctrl;
	
if (_index >= 0) then {
	_group = _list select _index;
	
	_text = format["<t size='1.2'><img size='1.2' color='%3' shadow='0' image='%1'/> %2</t>", [RTS_PLAYER_SIDE, _group] call RTS_Group_Type_getIcon, (_group select 0) select 0, RTS_UI_MARKER_UNSELECTED call BIS_fnc_colorRGBAtoHTML];
	{
		_class = _x select 0;
		_name = getText(configFile >> "cfgVehicles" >> _class >> "displayName");
		_image = "";
		if (!(_class isKindOf "Man")) then {
			_image = getText(configFile >> "cfgVehicles" >> _class >> "picture");
		};
		_text = _text + format["<br /><img color='#ffffff' shadow='0' image='%1' size='1' /> %2", _image, _name];
	} foreach (_group select 2);
	
	_ctrl = ["RTS_Army", "groupInfo"] call RTS_getCtrl;
	_ctrl ctrlSetStructuredText parseText(_text);
	
	if (!isNull(RTS_UI_ARMY_GROUP)) then {
		{
			if (_x != player) then {
				if (vehicle(_x) != _x) then {
					deleteVehicle vehicle(_x);
				};
				deleteVehicle _x;
			};
		} foreach allUnits;
		deleteGroup RTS_UI_ARMY_GROUP;
		RTS_UI_ARMY_GROUP = grpNull;
	};
	
	_group spawn {
		sleep 0.1;
		_struct = [west, RTS_UI_ARMY_POS, _this, true] call RTS_Group_create;
		RTS_UI_ARMY_GROUP = _struct select 0;
		
		{
			_x disableAI "MOVE";
		} foreach units(RTS_UI_ARMY_GROUP);
	};
};