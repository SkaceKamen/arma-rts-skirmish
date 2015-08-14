private ["_name", "_vars", "_methods", "_name_str", "_name_path", "_default", "_creator"];

_name = _this select 0;
_vars = _this select 1;
_methods = _this select 2;

_name_str = "";
_name_path = "";
_default = [];

{
	if (_foreachIndex != 0) then {
		_name_str = _name_str + "_";
		_name_path = _name_path + "\";
	};
	_name_str = _name_str + _x;
	_name_path = _name_path + _x;
} foreach _name;

{
	missionNamespace setVariable [format["%1_%2", _name_str, _x select 0], _foreachIndex];
	_default set [_foreachIndex, _x select 1];
	
} foreach _vars;

_creator = format["_params = _this; _this = %1; _this;", _default];

{
	_name = format["%1_%2", _name_str, _x];
	_contents = preprocessFileLineNumbers format["fnc\%1\%2.sqf", _name_path, _x];
	_contents = "private ['_obj']; _obj = _this select 0; _params = _this; _this = _obj;" + _contents;
	missionNamespace setVariable [_name, compile(_contents)];
	
	if (_x == "create") then {
		_creator = _creator + "([_this] + _params) call " + _name + "; _this;";
	};
} foreach _methods;

missionNamespace setVariable["new_" + _name_str, compile(_creator)];