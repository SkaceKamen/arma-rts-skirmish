//Indexes used for various arrays
SIDE_EAST = 0;
SIDE_WEST = 1;
SIDE_RESISTANCE = 2;
SIDE_CIVILIAN = 3;

MOUSE_POSITION = [0,0];
MOUSE_PRESSED = [false, false, false];
MOUSE_LEFT = 0;
MOUSE_RIGHT = 1;
MOUSE_MIDDLE = 2;

RTS_UNITS = [[], []];
RTS_SELECTED = [];

RTS_CAMERA = objNull;
RTS_CAMERA_POSITION = [0,0,0];
//RTS_CAMERA_TARGET = [0,0,0];
RTS_CAMERA_DIRECTION = 0;
RTS_CAMERA_YAW = 45;
RTS_CAMERA_HEIGHT = 0;
RTS_CAMERA_DISTANCE = 50;

RTS_ICONS_PATH = "\A3\ui_f\data\map\Markers\NATO\";
RTS_ICONS_FRIENDLY_PREFIX = "b_";
RTS_ICONS_ENEMY_PREFIX = "o_";
RTS_ICONS_SUFFIX = ".paa";

RTS_FORMATIONS = [
	"COLUMN",
	"STAG COLUMN",
	"WEDGE",
	"ECH LEFT",
	"ECH RIGHT",
	"VEE",
	"LINE",
	"DIAMOND"
];

RTS_FORMATIONS_NAMES = [
	"Column",
	"Stagged column",
	"Wedge",
	"Echelon left",
	"Echelon right",
	"Vee",
	"Line",
	"Diamond"
];

RTS_FOW = true;

RTS_DEPLOY_RADIUS = 30;

RTS_CAMERA_HEIGHT_LIMIT = [5, 100];
RTS_MOUSE_LIMITS = [0.1, 0.1];

RTS_MOUSE_START = [[0,0],0,0];

RTS_HELPER_WAYPOINT = "Sign_Arrow_F";
RTS_HELPER_UNIT = "Sign_Arrow_Blue_F";
RTS_HELPER_FLAG = "FlagPole_F";

RTS_PLAYER_ARMY = [];
RTS_PLAYER_ARMY_CURRENT = [];

//Center of map
RTS_MAP_CENTER = [];
//Players spawns
RTS_MAP_SPAWNS = [];
//Target points
RTS_MAP_POINTS = [];
//Direction of spawns from center
RTS_MAP_DIRECTION = 0;
//Distance of spawns from center
RTS_MAP_DISTANCE = 0;

//Is map finished?
RTS_MAP_DONE = true;

//Time game started
RTS_MAP_STARTED = time;

RTS_STATS_BULLETS = 0;
RTS_STATS_MESSAGES = [];
RTS_STATS_COMMANDS = 0;

//Current map money
RTS_MAP_MONEY = [0,0];
//Current map score
RTS_MAP_SCORE = [0,0];

RTS_PLAYER_SIDE = SIDE_WEST;
RTS_ENEMY_SIDE = SIDE_EAST;

RTS_UI_ARMY_POS = getMarkerPos("CONFIG_ARMY_CENTER");
RTS_UI_ARMY_GROUP = grpNull;

RTS_UI_CONFIG_CENTER = getMarkerPos("CONFIG_CENTER");
RTS_UI_CONFIG_POS = getMarkerPos("CONFIG_CAMERA");
RTS_UI_CONFIG_POS set [2, parseNumber(markerText("CONFIG_CAMERA"))];

RTS_UI_RUNNING = false;
RTS_UI_DRAW = -1;
RTS_UI_POSITIONS = [];

RTS_COLOR_ENEMY = [1,0,0,1];
RTS_COLOR_NEUTRAL = [1,1,1,1];
RTS_COLOR_FRIENDLY = [0,0,1,1];

RTS_UI_MARKER_SELECTED = [1,1,1,1];
RTS_UI_MARKER_UNSELECTED = [0.75,0.75,1,1];
RTS_UI_MARKER_ENEMY = [1,0.75,0.75,1];

RTS_UI_TASKBAR_X = SafeZoneX + 0.01;
RTS_UI_TASKBAR_Y = SafeZoneY + SafeZoneH - 0.1;

RTS_UI_RESULT_SHOWN = false;

RTS_UI_MOUSE_HANDLED = false;
RTS_UI_MOUSE_LASTCLICK = 0;

RTS_UI_DEPLOYING = false;
RTS_UI_DEPLOYED = [];
RTS_UI_DEPLOYED_INDEX = 0;
RTS_UI_HOOKED = false;

RTS_UI_DEPLOY_SHOWN = true;
RTS_UI_DEPLOY_WIDTH = 0.3;
RTS_UI_DEPLOY_HEIGHT = 0.7;
RTS_UI_DEPLOY_X = SafeZoneX + SafeZoneW - RTS_UI_DEPLOY_WIDTH;
RTS_UI_DEPLOY_Y = SafeZoneY + SafeZoneH - RTS_UI_DEPLOY_HEIGHT;

_res = getresolution;
_coef = (SafeZoneW / SafeZoneH);

RTS_UI_ACTIONS = [];
RTS_UI_SUBACTIONS = [];
RTS_UI_SUBACTIONS_CURRENT = "";
RTS_UI_ACTION_W = 0.06;
RTS_UI_ACTION_H = RTS_UI_ACTION_W * (SafeZoneW / SafeZoneH);

RTS_UI_ACTIONS_P = 0.01;
RTS_UI_ACTIONS_X = RTS_UI_TASKBAR_X;
RTS_UI_ACTIONS_Y = RTS_UI_TASKBAR_Y - RTS_UI_ACTION_H - 0.02;

RTS_SIDES = [ RTS_PLAYER_SIDE, RTS_ENEMY_SIDE ];

//Save current UI state, for loading and ESCAPE players
RTS_STATE = "config";
RTS_RESULT = false;

KEYS = [];
for[{_i=0},{_i<256},{_i=_i+1}] do { KEYS set [_i,false]; };