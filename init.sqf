//Make sure we can spawn everything
EQ = createcenter east;
WQ = createcenter west;
RQ = createcenter resistance;
CQ = createcenter civilian;

WEST setFriend [EAST, 0];
WEST setFriend [RESISTANCE, 0];
EAST setFriend [WEST, 0];
EAST setFriend [RESISTANCE, 0];
RESISTANCE setFriend [WEST, 0];
RESISTANCE setFriend [EAST, 0];

//Load options and basic variables
call compile(preprocessFileLineNumbers('variables.sqf'));
call compile(preprocessFileLineNumbers('options.sqf'));

//Load lists
call compile(preprocessFileLineNumbers('lists\groups.sqf'));

//Basic function that loads other functions
loadScript = {
	private ["_file", "_name", "_loaded", "_x", "_stop"];
	
	_file = "";
	_name = "";
	_stop = false;
	if (typename(_this) == "array") then {
		_file = "RTS";
		_name = "RTS";
		_loaded = [];
		{
			if (typename(_x) == "array") exitWith {
				{
					(_loaded + [_x]) call loadScript;
				} foreach _x;
				_stop = true;
			};
		
			_name = _name + "_" + _x;
			_file = _file + "\" + _x;
			
			_loaded = _loaded + [_x];
		} foreach _this;
	} else {
		_file = "RTS\" + _this;
		_name = "RTS_" + _this;
	};
	
	if (_stop) exitWith {
		true;
	};
	
	call compile format["%1 = compile(preprocessFileLineNumbers('fnc\%2.sqf'))", _name, _file];
};

//All functions
_functions = [
	"getCtrl",
	"getDisplay",
	"getSideIndex",
	"removeAt",
	"drawArc",
	"strInterval",
	"events",
	"onLoad",
	"onClosed",

	["Game","start"],
	
	["Map", [
		"start",
		"random",
		"randomLocation",
		"createPoint",
		"tick"
	]],
	
	["Unit",[
		"create",
		"killed",
		"fired"
	]],
	
	["Vehicle",[
		"killed",
		"fired"
	]],
	
	["Group",[
		"create",
		"getPosition",
		"select",
		"getIcon",
		"getColor"
	]],
	
	["Group", "Type", "getIcon"],
	
	["Units","setSelected"],
	
	["AI", [
		"start",
		"findGroup"
	]],
	["AI", "Persons", [
		"jack"
	]],
	
	["Stats", "Log"],
	
	["UI", [
		"start",
		"tick",
		"tickControls",
		"tickMarkers",
		"mouseDown",
		"mouseUp",
		"mouseMove",
		"mouseWheel",
		"mouseInterests",
		"mouseIdle",
		"updateTooltip",
		"keyDown",
		"keyUp",
		"updateCamera",
		"createGroupControls",
		"createPointMarker",
		"groupMouseUp",
		"deployClick",
		"deployRefresh",
		"deployRefreshColors",
		"deployTitleClick",
		"updateActions",
		"draw3D"
	]],
	
	["UI","Army",[
		"start",
		"updateArmy",
		"shopChanged",
		"armyPoints",
		"unload"
	]],
	
	["UI","Config",[
		"start"
	]],
	
	["UI","Result",[
		"start",
		"fillUnits",
		"unload",
		"effects"
	]],
	
	["UI", "Actions", [
		"behaviour",
		"speed",
		"formation",
		"stop",
		"getOut",
		"transport",
		"subactions",
		"formationSet",
		"speedSet",
		"behaviourSet"
	]],
	
	["OOP", "add"]
];

//Load functions
{
	_x call loadScript;
} foreach _functions;

//Load classes
call compile(preprocessFileLineNumbers('classes.sqf'));


waitUntil { time > 0 };
showcinemaborder false;

_loaded = profileNamespace getVariable ["RTS_ARMY", []];
if (count(_loaded) == 0) then {
	RTS_PLAYER_ARMY = [
		(RTS_LIST_GROUPS select SIDE_WEST) select 0,
		(RTS_LIST_GROUPS select SIDE_WEST) select 0,
		(RTS_LIST_GROUPS select SIDE_WEST) select 0,
		(RTS_LIST_GROUPS select SIDE_WEST) select 6
	];
} else {
	{
		RTS_PLAYER_ARMY set [count(RTS_PLAYER_ARMY), (RTS_LIST_GROUPS select RTS_PLAYER_SIDE) select _x];
	} foreach _loaded;
};

call RTS_UI_Config_start;
[] spawn RTS_events;