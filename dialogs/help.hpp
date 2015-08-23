#define RTS_HELP_X 0
#define RTS_HELP_Y 0
#define RTS_HELP_W 1
#define RTS_HELP_H 1
#define RTS_HELP_SUBTITLE_H 0.05
#define RTS_HELP_MARGIN 0.01

class RTS_Help_Subtitle : RscStatic
{
	w = RTS_HELP_W;
	h = RTS_HELP_SUBTITLE_H;
	colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.7 };
	text = "";
};

class RTS_Help
{
    idd = 10050;
	movingEnable = false;
	
	class controlsBackground
	{
		class backConfig : RscBackground
		{
			x = RTS_HELP_X;
			y = RTS_HELP_Y;
			w = RTS_HELP_W;
			h = RTS_HELP_H;
		};
	};
	
	class controls
	{
		class mainText : RscStructuredText
		{
			idc = 1;
			x = RTS_HELP_X;
			y = RTS_HELP_Y;
			w = RTS_HELP_W;
			h = RTS_HELP_H;
			text = "";
		};
		class mainTitle : RTS_Help_Subtitle
		{
			x = RTS_HELP_X;
			y = RTS_HELP_Y - RTS_HELP_MARGIN - RTS_HELP_SUBTITLE_H;
			text = "Help";
		};
		class buttonClose : RscButton
		{
			idc = 2;
			x = RTS_HELP_X + RTS_HELP_W - 0.1;
			y = RTS_HELP_Y + RTS_HELP_H + RTS_HELP_MARGIN;
			w = 0.1;
			text = "Close";
		};
	};
};