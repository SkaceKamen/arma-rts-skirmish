private ["_array","_index","_i"];
_array = _this select 0;
_index = _this select 1;
for[{_i = _index},{_i < count(_array)-1},{_i = _i + 1}] do
{
    _array set [_i, _array select (_i + 1)];
};
_array resize (count(_array)-1);
_array;