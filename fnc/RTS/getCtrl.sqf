private ["_display", "_ctrl", "_displayCtrl", "_ns", "_result"];

disableSerialization;

_display = _this select 0;
_ctrl = _this select 1;
_ns = ["controls"];
if (count(_this) > 2) then {
	_ns = _this select 2;
};
if (typeName(_ns) != typeName([])) then {
	_ns = [_ns];
};

_config = missionConfigFile >> _display;
{
	_config = _config >> _x;
} foreach _ns;

_displayCtrl = findDisplay getNumber(missionConfigFile >> _display >> "idd");
_result = _displayCtrl displayCtrl getNumber(_config >> _ctrl >> "idc");

if (isNull(_result)) then {
	systemChat format["Failed to find %1/%2", _display, _ctrl];
};

_result;