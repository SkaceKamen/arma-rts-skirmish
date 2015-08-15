#define RTS_RESULT_X (SafeZoneX + (SafeZoneW - RTS_RESULT_W)/2)
#define RTS_RESULT_Y (SafeZoneY + (SafeZoneH - RTS_RESULT_H)/2)
#define RTS_RESULT_W (SafeZoneW * 0.6)
#define RTS_RESULT_H (SafeZoneH * 0.8)
#define RTS_RESULT_TITLE_W RTS_RESULT_W
#define RTS_RESULT_TITLE_H 0.1
#define RTS_RESULT_MARGIN 0.01
#define RTS_RESULT_PADDING 0.01
#define RTS_RESULT_SUBTITLE_H 0.05
#define RTS_RESULT_TITLE_BUTTON_W (RTS_RESULT_W - RTS_RESULT_MARGIN * 3)/4
#define RTS_RESULT_TITLE_BUTTON_H 0.05
#define RTS_RESULT_UNIT_W (RTS_RESULT_W - RTS_RESULT_MARGIN * 2)/3
#define RTS_RESULT_UNIT_H 0.3
#define RTS_RESULT_UNIT_PADDING RTS_RESULT_PADDING
#define RTS_RESULT_UNITS_HEADER_W 0.12
#define RTS_RESULT_UNITS_NAME_W (1 - RTS_RESULT_UNITS_HEADER_W * 6)
#define RTS_RESULT_GROUP_H (RTS_RESULT_H - (RTS_RESULT_TITLE_H + RTS_RESULT_TITLE_BUTTON_H + RTS_RESULT_MARGIN * 2))

class RTS_Result_Subtitle : RscStatic
{
	w = 1;
	h = RTS_RESULT_SUBTITLE_H;
	colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.7 };
	text = " ... ";
};

class RTS_Result_Header : RscStatic
{
	colorBackground[] = { 0, 0, 0, 0.2 };
	text = "";
};


class RTS_Result_UnitsGroup : RscControlsGroup
{
	x = RTS_RESULT_X;
	y = RTS_RESULT_Y + RTS_RESULT_TITLE_H + RTS_RESULT_TITLE_BUTTON_H + RTS_RESULT_MARGIN * 2;
	w = RTS_RESULT_W;
	h = RTS_RESULT_GROUP_H;
};

class RTS_Result
{
    idd = 1003;
    movingEnable = 1;
	
	class controlsBackground
	{
		
	};
	
	class controls
	{
		class resultTitle : RscStatic
		{
			idc = 1;
			
			x = RTS_RESULT_X;
			y = RTS_RESULT_Y;
			w = RTS_RESULT_TITLE_W;
			h = RTS_RESULT_TITLE_H;
			
			colorBackground[] = {0,0,0,0.5};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2)";
			text = "RESULT";
			
			style = 2;
		};
		
		class buttonGlobal : RscButton
		{
			idc = 2;
			x = RTS_RESULT_X;
			y = RTS_RESULT_Y + RTS_RESULT_TITLE_H + RTS_RESULT_MARGIN;
			w = RTS_RESULT_TITLE_BUTTON_W;
			h = RTS_RESULT_TITLE_BUTTON_H;
			text = "GLOBAL";
		};
		
		class buttonFriendly : RscButton
		{
			idc = 3;
			x = RTS_RESULT_X + RTS_RESULT_TITLE_BUTTON_W + RTS_RESULT_MARGIN;
			y = RTS_RESULT_Y + RTS_RESULT_TITLE_H + RTS_RESULT_MARGIN;
			w = RTS_RESULT_TITLE_BUTTON_W;
			h = RTS_RESULT_TITLE_BUTTON_H;
			text = "FRIENDLY";
		};
		
		class buttonEnemy : RscButton
		{
			idc = 5;
			x = RTS_RESULT_X + (RTS_RESULT_TITLE_BUTTON_W + RTS_RESULT_MARGIN) * 2;
			y = RTS_RESULT_Y + RTS_RESULT_TITLE_H + RTS_RESULT_MARGIN;
			w = RTS_RESULT_TITLE_BUTTON_W;
			h = RTS_RESULT_TITLE_BUTTON_H;
			text = "ENEMY";
		};
		
		class buttonStats : RscButton
		{
			idc = 6;
			x = RTS_RESULT_X + (RTS_RESULT_TITLE_BUTTON_W + RTS_RESULT_MARGIN) * 3;
			y = RTS_RESULT_Y + RTS_RESULT_TITLE_H + RTS_RESULT_MARGIN;
			w = RTS_RESULT_TITLE_BUTTON_W;
			h = RTS_RESULT_TITLE_BUTTON_H;
			text = "STATISTICS";
		};
		
		class buttonClose : RscButton
		{
			idc = 8;
			x = RTS_RESULT_X + RTS_RESULT_W - RTS_RESULT_TITLE_BUTTON_W;
			y = RTS_RESULT_Y + RTS_RESULT_H + RTS_RESULT_MARGIN;
			w = RTS_RESULT_TITLE_BUTTON_W;
			h = RTS_RESULT_TITLE_BUTTON_H;
			text = "Close";
		};
		
		class statsResult : RTS_Result_UnitsGroup
		{
			idc = 7;
			
			class controls
			{
				class eventsBack : RscBackground
				{
					x = 0;
					y = RTS_RESULT_GROUP_H * 0.4 + RTS_RESULT_MARGIN * 2 + RTS_RESULT_SUBTITLE_H;
					w = RTS_RESULT_W;
					h = (RTS_RESULT_GROUP_H * 0.6 - RTS_RESULT_SUBTITLE_H - RTS_RESULT_MARGIN * 2) - 0.01;
				};
				
				class textStatsBack : RscBackground
				{
					x = 0;
					y = 0;
					w = RTS_RESULT_W;
					h = RTS_RESULT_GROUP_H * 0.4;
				};
				
				class textStats : RscListNBox
				{
					idc = 701;
					x = RTS_RESULT_PADDING;
					y = RTS_RESULT_PADDING;
					w = RTS_RESULT_W - RTS_RESULT_PADDING * 2;
					h = RTS_RESULT_GROUP_H * 0.4 - RTS_RESULT_PADDING * 2;
					columns[] = { 0, 0.2 };
				};
				
				class eventsTitle : RTS_Result_Subtitle
				{
					x = 0;
					y = RTS_RESULT_GROUP_H * 0.4 + RTS_RESULT_MARGIN;
					w = RTS_RESULT_W;
					text = "Events";
				};
				
				class events : RscListNBox
				{
					idc = 702;
					x = 0;
					y = RTS_RESULT_GROUP_H * 0.4 + RTS_RESULT_MARGIN * 2 + RTS_RESULT_SUBTITLE_H;
					w = RTS_RESULT_W;
					h = (RTS_RESULT_GROUP_H * 0.6 - RTS_RESULT_SUBTITLE_H - RTS_RESULT_MARGIN * 2) - 0.01;
					columns[] = { 0, 0.1 };
				};
			};
		};
		
		class unitsResult : RTS_Result_UnitsGroup
		{
			idc = 4;
			
			class controls
			{
				class unitsMostUnitKillsBack : RscBackground
				{
					x = 0;
					y = 0;
					w = RTS_RESULT_UNIT_W;
					h = RTS_RESULT_UNIT_H;
				};
				
				class unitsMostVehicleKillsBack : RscBackground
				{
					x = RTS_RESULT_UNIT_W + RTS_RESULT_MARGIN;
					y = 0;
					w = RTS_RESULT_UNIT_W;
					h = RTS_RESULT_UNIT_H;
				};
				
				class unitsMostEffectiveBack : RscBackground
				{
					x = (RTS_RESULT_UNIT_W + RTS_RESULT_MARGIN) * 2;
					y = 0;
					w = RTS_RESULT_UNIT_W;
					h = RTS_RESULT_UNIT_H;
				};
				
				class unitsAllBack : RscBackground
				{
					x = 0;
					y = RTS_RESULT_UNIT_H + RTS_RESULT_MARGIN * 2 + RTS_RESULT_SUBTITLE_H;
					w = RTS_RESULT_W;
					h = RTS_RESULT_H - (RTS_RESULT_UNIT_H + RTS_RESULT_TITLE_H + RTS_RESULT_TITLE_BUTTON_H + RTS_RESULT_SUBTITLE_H + RTS_RESULT_MARGIN * 4) - 0.01;
				};
				
				class unitsMostUnitKillsTitle : RTS_Result_Subtitle
				{
					x = 0;
					y = 0;
					w = RTS_RESULT_UNIT_W;
					text = "Most infantry killed";
				};
				
				class unitsMostVehicleKillsTitle : RTS_Result_Subtitle
				{
					x = RTS_RESULT_UNIT_W + RTS_RESULT_MARGIN;
					y = 0;
					w = RTS_RESULT_UNIT_W;
					text = "Most vehicles destroyed";
				};
				
				class unitsMostEffectiveTitle : RTS_Result_Subtitle
				{
					x = (RTS_RESULT_UNIT_W + RTS_RESULT_MARGIN) * 2;
					y = 0;
					w = RTS_RESULT_UNIT_W;
					text = "Most effective";
				};
				
				class unitsAllTitle : RTS_Result_Subtitle
				{
					x = 0;
					y = RTS_RESULT_UNIT_H + RTS_RESULT_MARGIN;
					w = RTS_RESULT_W;
					text = "All units";
				};
				
				class unitsAllHeaderUnit : RTS_Result_Header
				{
					x = 0;
					y = RTS_RESULT_UNIT_H + RTS_RESULT_SUBTITLE_H + RTS_RESULT_MARGIN * 2;
					w = RTS_RESULT_W * RTS_RESULT_UNITS_NAME_W;
					h = RTS_RESULT_SUBTITLE_H;
					text = "Unit";
				};
				
				
				class unitsAllHeaderUnitDeployed : RTS_Result_Header
				{
					x = RTS_RESULT_W * RTS_RESULT_UNITS_NAME_W;
					y = RTS_RESULT_UNIT_H + RTS_RESULT_SUBTITLE_H + RTS_RESULT_MARGIN * 2;
					w = RTS_RESULT_W * RTS_RESULT_UNITS_HEADER_W;
					h = RTS_RESULT_SUBTITLE_H;
					text = "Deployed";
				};
				
				class unitsAllHeaderUnitKills : RTS_Result_Header
				{
					x = RTS_RESULT_W * (RTS_RESULT_UNITS_NAME_W + RTS_RESULT_UNITS_HEADER_W);
					y = RTS_RESULT_UNIT_H + RTS_RESULT_SUBTITLE_H + RTS_RESULT_MARGIN * 2;
					w = RTS_RESULT_W * RTS_RESULT_UNITS_HEADER_W;
					h = RTS_RESULT_SUBTITLE_H;
					text = "Infantry kills";
				};
				
				class unitsAllHeaderVehKills : RTS_Result_Header
				{
					x = RTS_RESULT_W * (RTS_RESULT_UNITS_NAME_W + RTS_RESULT_UNITS_HEADER_W * 2);
					y = RTS_RESULT_UNIT_H + RTS_RESULT_SUBTITLE_H + RTS_RESULT_MARGIN * 2;
					w = RTS_RESULT_W * RTS_RESULT_UNITS_HEADER_W;
					h = RTS_RESULT_SUBTITLE_H;
					text = "Vehicles destroyed";
				};
				
				class unitsAllHeaderUnitLost : RTS_Result_Header
				{
					x = RTS_RESULT_W * (RTS_RESULT_UNITS_NAME_W + RTS_RESULT_UNITS_HEADER_W * 3);
					y = RTS_RESULT_UNIT_H + RTS_RESULT_SUBTITLE_H + RTS_RESULT_MARGIN * 2;
					w = RTS_RESULT_W * RTS_RESULT_UNITS_HEADER_W;
					h = RTS_RESULT_SUBTITLE_H;
					text = "Infantry lost";
				};
				
				class unitsAllHeaderVehLost : RTS_Result_Header
				{
					x = RTS_RESULT_W * (RTS_RESULT_UNITS_NAME_W + RTS_RESULT_UNITS_HEADER_W * 4);
					y = RTS_RESULT_UNIT_H + RTS_RESULT_SUBTITLE_H + RTS_RESULT_MARGIN * 2;
					w = RTS_RESULT_W * RTS_RESULT_UNITS_HEADER_W;
					h = RTS_RESULT_SUBTITLE_H;
					text = "Vehicles lost";
				};
				
				class unitsAllHeaderEffectivity : RTS_Result_Header
				{
					x = RTS_RESULT_W * (RTS_RESULT_UNITS_NAME_W + RTS_RESULT_UNITS_HEADER_W * 5);
					y = RTS_RESULT_UNIT_H + RTS_RESULT_SUBTITLE_H + RTS_RESULT_MARGIN * 2;
					w = RTS_RESULT_W * RTS_RESULT_UNITS_HEADER_W;
					h = RTS_RESULT_SUBTITLE_H;
					text = "Effectivity";
				};
				
				class unitsMostUnitKills : RscStructuredText
				{
					idc = 401;
					x = RTS_RESULT_UNIT_PADDING;
					y = RTS_RESULT_UNIT_PADDING + RTS_RESULT_SUBTITLE_H;
					w = RTS_RESULT_UNIT_W - RTS_RESULT_UNIT_PADDING * 2;
					h = RTS_RESULT_UNIT_H - RTS_RESULT_SUBTITLE_H - RTS_RESULT_UNIT_PADDING * 2;
				};
				
				class unitsMostVehicleKills : RscStructuredText
				{
					idc = 402;
					x = RTS_RESULT_UNIT_PADDING + RTS_RESULT_UNIT_W + RTS_RESULT_MARGIN;
					y = RTS_RESULT_UNIT_PADDING + RTS_RESULT_SUBTITLE_H;
					w = RTS_RESULT_UNIT_W - RTS_RESULT_UNIT_PADDING * 2;
					h = RTS_RESULT_UNIT_H - RTS_RESULT_SUBTITLE_H - RTS_RESULT_UNIT_PADDING * 2;
				};
				
				class unitsMostEffective : RscStructuredText
				{
					idc = 403;
					x = RTS_RESULT_UNIT_PADDING + (RTS_RESULT_UNIT_W + RTS_RESULT_MARGIN) * 2;
					y = RTS_RESULT_UNIT_PADDING + RTS_RESULT_SUBTITLE_H;
					w = RTS_RESULT_UNIT_W - RTS_RESULT_UNIT_PADDING * 2;
					h = RTS_RESULT_UNIT_H - RTS_RESULT_SUBTITLE_H - RTS_RESULT_UNIT_PADDING * 2;
				};
				
				class unitsAll : RscListNBox
				{
					idc = 404;
					x = 0;
					y = RTS_RESULT_UNIT_H + RTS_RESULT_MARGIN * 3 + RTS_RESULT_SUBTITLE_H * 2;
					w = RTS_RESULT_W;
					h = RTS_RESULT_H - (RTS_RESULT_UNIT_H + RTS_RESULT_TITLE_H + RTS_RESULT_TITLE_BUTTON_H + RTS_RESULT_SUBTITLE_H * 2 + RTS_RESULT_MARGIN * 5) - 0.01;
					columns[] = { 0,
						RTS_RESULT_UNITS_NAME_W,
						RTS_RESULT_UNITS_NAME_W + RTS_RESULT_UNITS_HEADER_W,
						RTS_RESULT_UNITS_NAME_W + RTS_RESULT_UNITS_HEADER_W*2,
						RTS_RESULT_UNITS_NAME_W + RTS_RESULT_UNITS_HEADER_W*3,
						RTS_RESULT_UNITS_NAME_W + RTS_RESULT_UNITS_HEADER_W*4,
						RTS_RESULT_UNITS_NAME_W + RTS_RESULT_UNITS_HEADER_W*5
					};
				};
			};
		};
	};
};