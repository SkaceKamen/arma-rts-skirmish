#define RTS_ARMY_X (SafeZoneX + 0.1)
#define RTS_ARMY_Y (SafeZoneY + 0.1)
#define RTS_ARMY_W (SafeZoneW - 0.2)
#define RTS_ARMY_H (SafeZoneH - 0.2)
#define RTS_ARMY_MARGIN_V 0.01
#define RTS_ARMY_LIST_W 0.4
#define RTS_ARMY_LIST_H 0.5
#define RTS_ARMY_TITLE_W 0.4
#define RTS_ARMY_TITLE_H 0.1
#define RTS_ARMY_SUBTITLE_H 0.05
#define RTS_ARMY_INFO_W 0.4
#define RTS_ARMY_INFO_H 1
#define RTS_ARMY_BUTTON_H 0.05
#define RTS_BACK_BUTTON_W 0.2
#define RTS_BACK_BUTTON_H 0.1

class RTS_Army_Subtitle : RscStatic
{
	w = RTS_ARMY_LIST_W;
	h = RTS_ARMY_SUBTITLE_H;
	colorBackground[] = { "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.7 };
	text = " ... ";
};

class RTS_Army
{
    idd = 10002;
    movingEnable = 1;
	
	class controlsBackground
	{
		class backPlayerArmy : RscBackground
		{
			x = RTS_ARMY_X;
			y = RTS_ARMY_Y + RTS_ARMY_TITLE_H + RTS_ARMY_SUBTITLE_H + RTS_ARMY_MARGIN_V * 2;
			w = RTS_ARMY_LIST_W;
			h = RTS_ARMY_LIST_H;
		};
		class backShopArmy : RscBackground
		{
			x = RTS_ARMY_X;
			y = RTS_ARMY_Y + RTS_ARMY_TITLE_H + RTS_ARMY_SUBTITLE_H * 2 + RTS_ARMY_LIST_H + RTS_ARMY_BUTTON_H * 2 + RTS_ARMY_MARGIN_V * 7;
			w = RTS_ARMY_LIST_W;
			h = RTS_ARMY_LIST_H;
		};
		class backGroupInfo : RscBackground
		{
			x = RTS_ARMY_X + RTS_ARMY_W - RTS_ARMY_INFO_W;
			y = RTS_ARMY_Y + RTS_ARMY_SUBTITLE_H + RTS_ARMY_MARGIN_V;
			w = RTS_ARMY_INFO_W;
			h = RTS_ARMY_INFO_H;
		};
	};
	
	class controls
	{
		class foo: RscStatic
		{
			x = -1;
			y = -1;
			w = 0;
			h = 0;
		};
		
		class mainTitle : RscBackground
		{
			x = RTS_ARMY_X;
			y = RTS_ARMY_Y;
			w = RTS_ARMY_TITLE_W;
			h = RTS_ARMY_TITLE_H;
			text = "ARMY CONFIG";
			colorBackground[] = { 0, 0, 0, 0.5 };
		};
		
		class playerArmyTitle : RTS_Army_Subtitle
		{
			x = RTS_ARMY_X;
			y = RTS_ARMY_Y + RTS_ARMY_TITLE_H + RTS_ARMY_MARGIN_V;
			text = "Current army";
		};
		
		class playerArmy : RscListNBox
		{
			idc = 1;
			x = RTS_ARMY_X;
			y = RTS_ARMY_Y + RTS_ARMY_TITLE_H + RTS_ARMY_SUBTITLE_H + RTS_ARMY_MARGIN_V * 2;
			w = RTS_ARMY_LIST_W;
			h = RTS_ARMY_LIST_H;
			columns[] = { 0, 0.8 };
		};
		
		class progressPoints : RscProgress
		{
			idc = 2;
			x = RTS_ARMY_X;
			y = RTS_ARMY_Y + RTS_ARMY_TITLE_H + RTS_ARMY_SUBTITLE_H + RTS_ARMY_LIST_H + RTS_ARMY_MARGIN_V * 3;
			w = RTS_ARMY_LIST_W;
			h = RTS_ARMY_BUTTON_H;
		};
		
		class textPoints : RscStatic
		{
			idc = 3;
			x = RTS_ARMY_X;
			y = RTS_ARMY_Y + RTS_ARMY_TITLE_H + RTS_ARMY_SUBTITLE_H + RTS_ARMY_LIST_H + RTS_ARMY_MARGIN_V * 3;
			w = RTS_ARMY_LIST_W;
			h = RTS_ARMY_BUTTON_H;
			style = 2;
			colorBackground[] = { 0,0,0,0.5 };
			text = "?/?";
		};
		
		class buttonRemove : RscButton
		{
			idc = 4;
			x = RTS_ARMY_X;
			y = RTS_ARMY_Y + RTS_ARMY_TITLE_H + RTS_ARMY_SUBTITLE_H + RTS_ARMY_LIST_H + RTS_ARMY_BUTTON_H + RTS_ARMY_MARGIN_V * 4;
			w = RTS_ARMY_LIST_W;
			h = RTS_ARMY_BUTTON_H;
			text = "Remove";
		};
		
		class shopArmyTitle : RTS_Army_Subtitle
		{
			x = RTS_ARMY_X;
			y = RTS_ARMY_Y + RTS_ARMY_TITLE_H + RTS_ARMY_SUBTITLE_H + RTS_ARMY_LIST_H + RTS_ARMY_BUTTON_H * 2 + RTS_ARMY_MARGIN_V * 6;
			text = "Avaible groups";
		};
		
		class shopArmy : RscListNBox
		{
			idc = 5;
			x = RTS_ARMY_X;
			y = RTS_ARMY_Y + RTS_ARMY_TITLE_H + RTS_ARMY_SUBTITLE_H * 2 + RTS_ARMY_LIST_H + RTS_ARMY_BUTTON_H * 2 + RTS_ARMY_MARGIN_V * 7;
			w = RTS_ARMY_LIST_W;
			h = RTS_ARMY_LIST_H;
			columns[] = { 0, 0.8 };
		};
		
		class buttonAdd : RscButton
		{
			idc = 6;
			x = RTS_ARMY_X;
			y = RTS_ARMY_Y + RTS_ARMY_TITLE_H + RTS_ARMY_SUBTITLE_H * 2 + RTS_ARMY_LIST_H * 2 + RTS_ARMY_BUTTON_H * 2 + RTS_ARMY_MARGIN_V * 8;
			w = RTS_ARMY_LIST_W;
			h = RTS_ARMY_BUTTON_H;
			text = "Add";
		};
		
		class groupInfoTitle : RTS_Army_Subtitle
		{
			x = RTS_ARMY_X + RTS_ARMY_W - RTS_ARMY_INFO_W;
			y = RTS_ARMY_Y;
			text = "Informations";
		};
		
		class groupInfo : RscStructuredText
		{
			idc = 7;
			x = RTS_ARMY_X + RTS_ARMY_W - RTS_ARMY_INFO_W;
			y = RTS_ARMY_Y + RTS_ARMY_SUBTITLE_H + RTS_ARMY_MARGIN_V;
			w = RTS_ARMY_INFO_W;
			h = RTS_ARMY_INFO_H;
		};

		class buttonBack : RscButton
		{
			idc = 8;
			x = RTS_ARMY_X + RTS_ARMY_W - RTS_BACK_BUTTON_W;
			y = RTS_ARMY_Y + RTS_ARMY_H - RTS_BACK_BUTTON_H;
			w = RTS_BACK_BUTTON_W;
			h = RTS_BACK_BUTTON_H;
			text = "Back";
		};
	};
};