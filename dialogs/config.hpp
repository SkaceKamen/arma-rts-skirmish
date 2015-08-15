#define RTS_CONFIG_TITLE_W 0.4
#define RTS_CONFIG_TITLE_H 0.1
#define RTS_CONFIG_W (SafeZoneW * 0.6)
#define RTS_CONFIG_H 1
#define RTS_CONFIG_PADDING 0.05
#define RTS_CONFIG_BUTTON_W 0.2
#define RTS_CONFIG_BUTTON_H 0.05
#define RTS_CONFIG_LINE_W (RTS_CONFIG_W - RTS_CONFIG_PADDING*2 - RTS_CONFIG_MARGIN * 2)/2
#define RTS_CONFIG_LINE_H 0.05
#define RTS_CONFIG_LINE_HM (RTS_CONFIG_LINE_H + RTS_CONFIG_LINE_MARGIN)
#define RTS_CONFIG_LINE_L (RTS_CONFIG_LINE_W * 0.6)
#define RTS_CONFIG_LINE_R (RTS_CONFIG_LINE_W * 0.6)
#define RTS_CONFIG_MARGIN 0.01
#define RTS_CONFIG_LINE_MARGIN 0.02
#define RTS_CONFIG_SUBTITLE_H 0.05
#define RTS_CONFIG_X (SafeZoneX + (SafeZoneW - RTS_CONFIG_W)/2)
#define RTS_CONFIG_Y ((SafeZoneY + (SafeZoneH - RTS_CONFIG_H)/2) + RTS_CONFIG_TITLE_H + RTS_CONFIG_MARGIN * 2 + RTS_CONFIG_SUBTITLE_H)
#define RTS_CHECK_W 0.11

class RTS_Config_Subtitle : RscStatic
{
	w = RTS_CONFIG_W;
	h = RTS_CONFIG_SUBTITLE_H;
	colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.7 };
	text = " ... ";
};

class RTS_Config
{
    idd = 10001;
	movingEnable = false;
	
	class controlsBackground
	{
		class backConfig : RscBackground
		{
			x = RTS_CONFIG_X;
			y = RTS_CONFIG_Y;
			w = RTS_CONFIG_W;
			h = RTS_CONFIG_H;
		};
	};
	
	class controls
	{
		class mainTitle : RscStatic
		{
			x = RTS_CONFIG_X;
			y = RTS_CONFIG_Y - RTS_CONFIG_TITLE_H - RTS_CONFIG_SUBTITLE_H - RTS_CONFIG_MARGIN * 2;
			w = RTS_CONFIG_TITLE_W;
			h = RTS_CONFIG_TITLE_H;
			colorBackground[] = { 0,0,0,0.5 };
			text = "RTS Skirmish";
		};
		
		class mainSubtitle : RTS_Config_Subtitle
		{
			x = RTS_CONFIG_X;
			y = RTS_CONFIG_Y - RTS_CONFIG_SUBTITLE_H - RTS_CONFIG_MARGIN;
			text = "Battle configuration";
		};
		
		class buttonArmy : RscButton
		{
			idc = 2;
			x = RTS_CONFIG_X + RTS_CONFIG_PADDING;
			y = RTS_CONFIG_Y + RTS_CONFIG_PADDING;
			w = RTS_CONFIG_BUTTON_W;
			h = RTS_CONFIG_LINE_H;
			text = "Configure army";
		};
		
		class progressPoints : RscProgress
		{
			idc = 3;
			x = RTS_CONFIG_X + RTS_CONFIG_PADDING + RTS_CONFIG_BUTTON_W + RTS_CONFIG_MARGIN;
			y = RTS_CONFIG_Y + RTS_CONFIG_PADDING;
			w = RTS_CONFIG_BUTTON_W;
			h = RTS_CONFIG_LINE_H;
		};
		
		class textPoints : RscStatic
		{
			idc = 4;
			x = RTS_CONFIG_X + RTS_CONFIG_PADDING + RTS_CONFIG_BUTTON_W + RTS_CONFIG_MARGIN;
			y = RTS_CONFIG_Y + RTS_CONFIG_PADDING;
			w = RTS_CONFIG_BUTTON_W;
			h = RTS_CONFIG_LINE_H;
			style = 2;
			colorBackground[] = { 0,0,0,0.5 };
			text = "?/?";
		};
		
		class labelFog : RscStatic
		{
			x = RTS_CONFIG_X + RTS_CONFIG_PADDING;
			y = RTS_CONFIG_Y + RTS_CONFIG_PADDING + RTS_CONFIG_LINE_HM;
			w = RTS_CONFIG_LINE_L;
			h = RTS_CONFIG_LINE_H;
			text = "Fog of War (EXPERIMENTAL!)";
		};
		
		class checkFog : RscCheckbox
		{
			idc = 5;
			x = RTS_CONFIG_X + RTS_CONFIG_PADDING + RTS_CONFIG_LINE_L;
			y = RTS_CONFIG_Y + RTS_CONFIG_PADDING + RTS_CONFIG_LINE_HM;
			w = RTS_CHECK_W;
			h = RTS_CONFIG_LINE_H;
		};
		
		class buttonStart : RscButton
		{
			idc = 1;
			x = RTS_CONFIG_X + RTS_CONFIG_W - RTS_CONFIG_BUTTON_W - RTS_CONFIG_PADDING;
			y = RTS_CONFIG_Y + RTS_CONFIG_H - RTS_CONFIG_BUTTON_H - RTS_CONFIG_PADDING;
			w = RTS_CONFIG_BUTTON_W;
			h = RTS_CONFIG_BUTTON_H;
			text = "Start";
		};
	};
};