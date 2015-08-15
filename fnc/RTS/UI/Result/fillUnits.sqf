_side = _this select 0;

_ctrl = ["RTS_Result", "statsResult"] call RTS_getCtrl;
_ctrl ctrlShow false;
_ctrl = ["RTS_Result", "unitsResult"] call RTS_getCtrl;
_ctrl ctrlShow true;

_list = [];
if (_side == -1) then {
	_list = (RTS_UNITS select RTS_PLAYER_SIDE) + (RTS_UNITS select RTS_ENEMY_SIDE);
} else {
	_list = RTS_UNITS select _side;
};

_most_kills_inf = 0;
_most_kills_inf_group = [];
_most_kills_veh = 0;
_most_kills_veh_group = [];
_most_effetive = 0;
_most_effetive_group = [];

_ctrl = ["RTS_Result", "unitsAll", ["controls", "unitsResult", "controls"]] call RTS_getCtrl;
lnbClear _ctrl;
{
	_group = _x select 0;
	_info = _x select 1;
	_icon = _x call RTS_Group_getIcon;
	_color = _x call RTS_Group_getColor;
	
	_kills_inf = _group getVariable ["RTS_KilledUnits", 0];
	_kills_veh = _group getVariable ["RTS_KilledVehicles", 0];
	_lost_inf = _group getVariable ["RTS_LostUnits", 0];
	_lost_veh = _group getVariable ["RTS_LostVehicles", 0];
	_deployed = _group getVariable ["RTS_Deployed", 0];
	_eff = (_kills_inf + _kills_veh) * 1.5;
	if (_lost_inf + _lost_veh != 0) then {
		_eff = (_kills_inf + _kills_veh) / (_lost_inf + _lost_veh);
	};
	
	_eff = round(_eff * 100)/100;
	
	_ctrl lnbAddRow [(_info select 0) select 0, _deployed call RTS_strInterval, str(_kills_inf), str(_kills_veh), str(_lost_inf), str(_lost_veh), str(_eff)];
	_ctrl lnbSetPicture [[_foreachIndex, 0], _icon];
	_ctrl lnbSetPictureColor [[_foreachIndex,0], _color];
	
	if (_eff > _most_effetive) then {
		_most_effetive = _eff;
		_most_effetive_group = _x;
	};
	
	if (_kills_inf > _most_kills_inf) then {
		_most_kills_inf = _kills_inf;
		_most_kills_inf_group = _x;
	};
	
	if (_kills_veh > _most_kills_veh) then {
		_most_kills_veh = _kills_veh;
		_most_kills_veh_group = _x;
	};
	
	//Disable units so fighting stops
	{
		_x enableSimulation false;
	} foreach units(_group);
	
} foreach _list;

{
	_ctrl = ["RTS_Result", (_x select 1), ["controls", "unitsResult", "controls"]] call RTS_getCtrl;
	if (count(_x select 0) > 0) then {
		_params = (_x select 0) select 1;
		_text = format["<t size='1.2'><img size='1.2' color='%3' shadow='0' image='%1'/> %2</t><br /><t color='#eee'>%4</t>", (_x select 0) call RTS_Group_getIcon, (_params select 0) select 0, ((_x select 0) call RTS_Group_getColor) call BIS_fnc_colorRGBAtoHTML, _x select 2];
		_ctrl ctrlSetStructuredText parseText(_text);
	} else {
		_ctrl ctrlSetStructuredText parseText("");
	};
} foreach [
	[_most_kills_inf_group,"unitsMostUnitKills",str(_most_kills_inf) + " kills"],
	[_most_kills_veh_group,"unitsMostVehicleKills",str(_most_kills_veh) + " vehicles destroyed"],
	[_most_effetive_group,"unitsMostEffective",str(_most_effetive) + " effectivity"]
];