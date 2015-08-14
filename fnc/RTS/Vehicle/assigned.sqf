private ["_vehicle","_role","_as"];
_vehicle = _this select 0;
_role = _this select 1;

_as = _vehicle call(compile(format["assigned%1 _this", _role]));
if (typename _as != "array") then
{
    if (isNull(_as)) then
    {
        _as = [];
    } else {
        _as = [_as];
    };
};

_as;