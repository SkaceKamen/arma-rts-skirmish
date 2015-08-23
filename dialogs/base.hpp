// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUT_BUTTON  16 // Arma 2 - textured button

#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_List_N_Box       102 // Arma 2 - N columns list box


// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define true 1
#define false 0

class RscStructuredText
{
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = { 1,1,1,1 };
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 1;
	class Attributes
	{
		font = "PuristaMedium";
		color = "#ffffff";
		align = "left";
		shadow = 0;
	};
};
class RscText
{
	type = 0;
	idc = -1;
	colorBackground[] = { 0,0,0,0 };
	colorText[] = { 1,1,1,1 };
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 1;
	colorShadow[] = { 0,0,0,0.5 };
	font = "PuristaMedium";
	SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	linespacing = 1;
};

class RscStatic: RscText
{
	shadow = false;
};

class RscButton
{
	type = 1;
	text = "";
	colorText[] = { 1,1,1,1 };
	colorDisabled[] = { 0.4,0.4,0.4,1 };
	colorBackground[] = { 0,0,0,1 };
	colorBackgroundDisabled[] = { 0.95,0.95,0.95,1 };
	colorBackgroundActive[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1 };
	colorFocused[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1 };
	colorShadow[] = { 0,0,0,0 };
	colorBorder[] = { 0,0,0,0 };
	soundEnter[] = { "\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1 };
	soundPush[] = { "\A3\ui_f\data\sound\RscButton\soundPush",0.09,1 };
	soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick",0.09,1 };
	soundEscape[] = { "\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1 };
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 0;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};
class RscPicture
{
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = { 0,0,0,0 };
	colorText[] = { 1,1,1,1 };
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};
class RscPictureKeepAspect
{
	type = 0;
	idc = -1;
	style = "0x30 + 0x800";
	colorBackground[] = { 0,0,0,0 };
	colorText[] = { 1,1,1,1 };
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};

class ScrollBar
{
	color[] = { 1,1,1,0.6 };
	colorActive[] = { 1,1,1,1 };
	colorDisabled[] = { 1,1,1,0.3 };
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};

class RscListBox
{
	type = 5;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = { 1,1,1,1 };
	colorDisabled[] = { 1,1,1,0.25 };
	colorScrollbar[] = { 1,0,0,0 };
	colorSelect[] = { 0,0,0,1 };
	colorSelect2[] = { 0,0,0,1 };
	colorSelectBackground[] = { 0.95,0.95,0.95,1 };
	colorSelectBackground2[] = { 1,1,1,0.5 };
	colorBackground[] = { 0,0,0,0.3 };
	soundSelect[] = { "\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1 };
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	style = 16;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	colorShadow[] = { 0,0,0,0.5 };
	period = 1.2;
	maxHistoryDelay = 1;
	tooltipColorText[] = { 1,1,1,1 };
	tooltipColorBox[] = { 1,1,1,1 };
	tooltipColorShade[] = { 0,0,0,0.65 };
	class ListScrollBar: ScrollBar
	{
		color[] = { 1,1,1,1 };
		autoScrollEnabled = 1;
	};
};

class RscListNBox
{
	type = 102;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = { 1,1,1,1 };
	colorScrollbar[] = { 0.95,0.95,0.95,1 };
	colorSelect[] = { 0,0,0,1 };
	colorSelect2[] = { 0,0,0,1 };
	colorSelectBackground[] = { 0.95,0.95,0.95,1 };
	colorSelectBackground2[] = { 1,1,1,0.5 };
	colorBackground[] = { 0,0,0,1 };
	maxHistoryDelay = 1;
	soundSelect[] = { "",0.1,1 };
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	drawSideArrows = 0;
	columns[] = { 0.3,0.6,0.7 };
	idcLeft = -1;
	idcRight = -1;
	style = 16;
	shadow = 0;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = { 0.95,0.95,0.95,1 };
	colorDisabled[] = { 1,1,1,0.25 };
	period = 1.2;
	class ListScrollBar: ScrollBar
	{
	};
	class ScrollBar: ScrollBar
	{
	};
};

class RscCombo
{
	type = 4;
	colorSelect[] = { 0,0,0,1 };
	colorText[] = { 1,1,1,1 };
	colorBackground[] = { 0,0,0,1 };
	colorScrollbar[] = { 1,0,0,1 };
	soundSelect[] = { "\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1 };
	soundExpand[] = { "\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1 };
	soundCollapse[] = { "\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1 };
	maxHistoryDelay = 1;
	style = "0x10 + 0x200";
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelectBackground[] = { 1,1,1,0.7 };
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	colorActive[] = { 1,0,0,1 };
	colorDisabled[] = { 1,1,1,0.25 };
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[] = { 1,1,1,1 };
	tooltipColorBox[] = { 1,1,1,1 };
	tooltipColorShade[] = { 0,0,0,0.65 };
	class ComboScrollBar: ScrollBar
	{
		color[] = { 1,1,1,1 };
	};
};

class RscMapControl
{
	type = 101;
	idc = 51;
	style = 48;
	colorBackground[] = { 0.969,0.957,0.949,1 };
	colorOutside[] = { 0,0,0,1 };
	colorText[] = { 0,0,0,1 };
	font = "TahomaB";
	sizeEx = 0.04;
	colorSea[] = { 0.467,0.631,0.851,0.5 };
	colorForest[] = { 0.624,0.78,0.388,0.5 };
	colorRocks[] = { 0,0,0,0.3 };
	colorCountlines[] = { 0.572,0.354,0.188,0.25 };
	colorMainCountlines[] = { 0.572,0.354,0.188,0.5 };
	colorCountlinesWater[] = { 0.491,0.577,0.702,0.3 };
	colorMainCountlinesWater[] = { 0.491,0.577,0.702,0.6 };
	colorForestBorder[] = { 0,0,0,0 };
	colorRocksBorder[] = { 0,0,0,0 };
	colorPowerLines[] = { 0.1,0.1,0.1,1 };
	colorRailWay[] = { 0.8,0.2,0,1 };
	colorNames[] = { 0.1,0.1,0.1,0.9 };
	colorInactive[] = { 1,1,1,0.5 };
	colorLevels[] = { 0.286,0.177,0.094,0.5 };
	colorTracks[] = { 0.84,0.76,0.65,0.15 };
	colorRoads[] = { 0.7,0.7,0.7,1 };
	colorMainRoads[] = { 0.9,0.5,0.3,1 };
	colorTracksFill[] = { 0.84,0.76,0.65,1 };
	colorRoadsFill[] = { 1,1,1,1 };
	colorMainRoadsFill[] = { 1,0.6,0.4,1 };
	colorGrid[] = { 0.1,0.1,0.1,0.6 };
	colorGridMap[] = { 0.1,0.1,0.1,0.6 };
	stickX[] = { 0.2, };
	stickY[] = { 0.2, };
	moveOnEdges = 1;
	x = "SafeZoneXAbs";
	y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "SafeZoneWAbs";
	h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	shadow = 0;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 20;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareObj = 9;
	showCountourInterval = 0;
	scaleMin = 0.001;
	scaleMax = 1;
	scaleDefault = 0.16;
	maxSatelliteAlpha = 0.85;
	alphaFadeStartScale = 2;
	alphaFadeEndScale = 2;
	fontLabel = "PuristaMedium";
	sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontGrid = "TahomaB";
	sizeExGrid = 0.02;
	fontUnits = "TahomaB";
	sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontNames = "EtelkaNarrowMediumPro";
	sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	fontInfo = "PuristaMedium";
	sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontLevel = "TahomaB";
	sizeExLevel = 0.02;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	class Legend
	{
		colorBackground[] = { 1,1,1,0.5 };
		color[] = { 0,0,0,1 };
		x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font = "PuristaMedium";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	};
	class ActiveMarker
	{
		color[] = { 0.3,0.1,0.9,1 };
		size = 50;
	};
	class Command
	{
		color[] = { 1,1,1,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Task
	{
		colorCreated[] = { 1,1,1,1 };
		colorCanceled[] = { 0.7,0.7,0.7,1 };
		colorDone[] = { 0.7,1,0.3,1 };
		colorFailed[] = { 1,0.3,0.2,1 };
		color[] = { "(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])" };
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class CustomMark
	{
		color[] = { 0,0,0,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Tree
	{
		color[] = { 0.45,0.64,0.33,0.4 };
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class SmallTree
	{
		color[] = { 0.45,0.64,0.33,0.4 };
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bush
	{
		color[] = { 0.45,0.64,0.33,0.4 };
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = "14/2";
		importance = "0.2 * 14 * 0.05 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Church
	{
		color[] = { 1,1,1,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Chapel
	{
		color[] = { 0,0,0,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Cross
	{
		color[] = { 0,0,0,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Rock
	{
		color[] = { 0.1,0.1,0.1,0.8 };
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bunker
	{
		color[] = { 0,0,0,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fortress
	{
		color[] = { 0,0,0,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fountain
	{
		color[] = { 0,0,0,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class ViewTower
	{
		color[] = { 0,0,0,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class Lighthouse
	{
		color[] = { 1,1,1,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Quay
	{
		color[] = { 1,1,1,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Fuelstation
	{
		color[] = { 1,1,1,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Hospital
	{
		color[] = { 1,1,1,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class BusStop
	{
		color[] = { 1,1,1,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Transmitter
	{
		color[] = { 1,1,1,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Stack
	{
		color[] = { 0,0,0,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Ruin
	{
		color[] = { 0,0,0,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
	};
	class Tourism
	{
		color[] = { 0,0,0,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.7;
		coefMax = 4;
	};
	class Watertower
	{
		color[] = { 1,1,1,1 };
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Waypoint
	{
		color[] = { 0,0,0,1 };
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
	};
	class WaypointCompleted
	{
		color[] = { 0,0,0,1 };
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
	};
	class power
	{
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = { 1,1,1,1 };
	};
	class powersolar
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = { 1,1,1,1 };
	};
	class powerwave
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = { 1,1,1,1 };
	};
	class powerwind
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = { 1,1,1,1 };
	};
	class shipwreck
	{
		icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = { 1,1,1,1 };
	};
};

class RscShortcutButton
{
	type = 16;
	x = 0.1;
	y = 0.1;
	shortcuts[] = {  };
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	color[] = { 1,1,1,1 };
	colorFocused[] = { 1,1,1,1 };
	color2[] = { 0.95,0.95,0.95,1 };
	colorDisabled[] = { 1,1,1,0.25 };
	colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1 };
	colorBackgroundFocused[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1 };
	colorBackground2[] = { 1,1,1,1 };
	soundEnter[] = { "\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1 };
	soundPush[] = { "\A3\ui_f\data\sound\RscButton\soundPush",0.09,1 };
	soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick",0.09,1 };
	soundEscape[] = { "\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1 };
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus = 1.2;
	periodOver = 0.8;
	period = 0.4;
	font = "PuristaMedium";
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	action = "";
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0;
		top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos
	{
		left = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	class Attributes
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
	};
};
class RscButtonMenu: RscShortcutButton
{
	idc = -1;
	type = 16;
	style = 0x02 + 0x0c;
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = { 0,0,0,0.8 };
	colorBackgroundFocused[] = { 1,1,1,1 };
	colorBackground2[] = { 0.75,0.75,0.75,1 };
	color[] = { 1,1,1,1 };
	colorFocused[] = { 0,0,0,1 };
	color2[] = { 0,0,0,1 };
	colorText[] = { 1,1,1,1 };
	colorDisabled[] = { 1,1,1,0.25 };
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[] = { 1,1,1,1 };
	tooltipColorBox[] = { 1,1,1,1 };
	tooltipColorShade[] = { 0,0,0,0.65 };
	soundEnter[] = { "\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1 };
	soundPush[] = { "\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1 };
	soundClick[] = { "\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1 };
	soundEscape[] = { "\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1 };
	class TextPos
	{
		left = "0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	class Attributes
	{
		font = "PuristaLight";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos
	{
		left = "(6.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
};

class RscCheckbox
{
	idc = -1;
	type = 7;
	style = 0;
	colorText[] = 
	{
		1,
		0,
		0,
		1
	};
	color[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBackground[] = 
	{
		0,
		0,
		1,
		1
	};
	colorTextSelect[] = 
	{
		0,
		0.8,
		0,
		1
	};
	colorSelectedBg[] = 
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",
		1
	};
	colorSelect[] = 
	{
		0,
		0,
		0,
		1
	};
	colorTextDisable[] = 
	{
		0.4,
		0.4,
		0.4,
		1
	};
	colorDisable[] = 
	{
		0.4,
		0.4,
		0.4,
		1
	};
	font = "PuristaMedium";
	rows = 1;
	columns = 1;
	strings[] = 
	{
		"DISABLED"
	};
	checked_strings[] = 
	{
		"ENABLED"
	};
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
};

class RscBackground : RscStatic
{
	colorBackground[] = { 0, 0, 0, 0.5 };
};

class RscProgress
{
	access = 0;
	colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
	colorFrame[] = {0,0,0,0};
	deletable = 0;
	fade = 0;
	shadow = 2;
	style = 0;
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	type = 8;
};

class RscControlsGroup  
{
	type = CT_CONTROLS_GROUP;
	idc = -1;
	style = ST_MULTI;
    x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	class VScrollbar : ScrollBar
	{
		width = 0.021;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
                shadow=0;
	};
	
	class HScrollbar : ScrollBar
	{
		height = 0.028;
		shadow=0;
	};
};

class RscHTML
{
	access = 0;
	type = 9;
	idc = -1;
	style = 0;
	filename = "";
	colorBackground[] = { 0,0,0,0 };
	colorText[] = { 1,1,1,1 };
	colorBold[] = { 1,1,1,1 };
	colorLink[] = { 1,1,1,0.75 };
	colorLinkActive[] = { 1,1,1,1 };
	colorPicture[] = { 1,1,1,1 };
	colorPictureLink[] = { 1,1,1,1 };
	colorPictureSelected[] = { 1,1,1,1 };
	colorPictureBorder[] = { 0,0,0,0 };
	tooltipColorText[] = { 0,0,0,1 };
	tooltipColorBox[] = { 0,0,0,0.5 };
	tooltipColorShade[] = { 1,1,0.7,1 };
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	prevPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_left_ca.paa";
	nextPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_right_ca.paa";
	shadow = 2;
	class H1
	{
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
		align = "left";
	};
	class H2
	{
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "right";
	};
	class H3
	{
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	class H4
	{
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	class H5
	{
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	class H6
	{
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
	class P
	{
		font = "PuristaMedium";
		fontBold = "PuristaSemibold";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		align = "left";
	};
};
