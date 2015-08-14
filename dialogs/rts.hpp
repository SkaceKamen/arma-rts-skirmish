#define RTS_UI_SCORE_WIDTH 0.15
#define RTS_UI_SCORE_HEIGHT 0.05
#define RTS_UI_DEPLOY_WIDTH 0.3
#define RTS_UI_DEPLOY_HEIGHT 0.7
#define RTS_UI_DEPLOY_TITLE_HEIGHT (RTS_UI_DEPLOY_HEIGHT * 0.09)
#define RTS_UI_DEPLOY_BUTTON_HEIGHT (RTS_UI_DEPLOY_HEIGHT * 0.09)
#define RTS_UI_DEPLOY_LIST_HEIGHT (RTS_UI_DEPLOY_HEIGHT - RTS_UI_DEPLOY_TITLE_HEIGHT - RTS_UI_DEPLOY_BUTTON_HEIGHT)
#define RTS_UI_DEPLOY_X (SafeZoneX + SafeZoneW - RTS_UI_DEPLOY_WIDTH)
#define RTS_UI_DEPLOY_Y (SafeZoneY + SafeZoneH - RTS_UI_DEPLOY_HEIGHT)

class ScoreDisplay : RscStatic
{
	x = SafeZoneX + SafeZoneW/2 - RTS_UI_SCORE_WIDTH;
	y = SafeZoneY;
	w = RTS_UI_SCORE_WIDTH;
	h = RTS_UI_SCORE_HEIGHT;
	style = ST_RIGHT;
	color[] = {1, 1, 1, 1};
	colorBackground[] = {0, 0.77, 0, 0.9};
	text = "...";
};

class RTS_UI
{
    idd = 1;
    movingEnable = 1;  
    class controlsBackground
    {
        class MOUSE : RscStatic
        {
            idc = 1;
            type = 0;
            style = 16;
            x = SafeZoneX - 1;
            y = SafeZoneY - 1;
            w = SafeZoneW + 2;
            h = SafeZoneH + 2;
            lineSpacing = 0;
            text = "";
            color[] = {0, 0, 0, 0};
            colorActive[] = {0, 0, 0, 0};
            colorBackground[] = {0, 0, 0, 0} ;
		};
		class SelectedBackground : RscStatic
		{
			idc = 3;
			colorBackground[] = {0, 0, 0, 0.5};
		};
		class DeployBackground : RscStatic
		{
			x = RTS_UI_DEPLOY_X;
			y = RTS_UI_DEPLOY_Y + RTS_UI_DEPLOY_TITLE_HEIGHT;
			w = RTS_UI_DEPLOY_WIDTH;
			h = RTS_UI_DEPLOY_LIST_HEIGHT;
			colorBackground[] = {0, 0, 0, 0.5};
		};
	};
	class controls
	{
		class MouseTooltip : RscStatic
		{
			style = 0;
			idc = 10;
			x = -1;
			y = -1;
			w = 1;
			h = 0.05;
			shadow = 1;
		};
		class Selection : RscStatic
		{
			idc = 2;
			type = 0;
			style = 64;
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			shadow = 1;
			colorText[] = { 0, 0, 0, 1 };
		};
		class ScoreFriendly : ScoreDisplay
		{
			idc = 4;
		};
		class ScoreEnemy : ScoreDisplay
		{
			idc = 5;
			x = SafeZoneX + SafeZoneW/2;
			colorBackground[] = {0.9, 0.14, 0.14, 0.9};
			style = ST_LEFT;
		};
		class DeployTitle : RscStatic
		{
			idc = 6;
			x = RTS_UI_DEPLOY_X;
			y = RTS_UI_DEPLOY_Y;
			w = RTS_UI_DEPLOY_WIDTH * 0.7;
			h = RTS_UI_DEPLOY_TITLE_HEIGHT;
			colorBackground[] = {0.6, 0.6, 0, 0.9};
			text = "Reinforcements";
		};
		class DeployPoints : RscStatic
		{
			idc = 7;
			style = ST_RIGHT;
			x = RTS_UI_DEPLOY_X + RTS_UI_DEPLOY_WIDTH * 0.7;
			y = RTS_UI_DEPLOY_Y;
			w = RTS_UI_DEPLOY_WIDTH * 0.3;
			h = RTS_UI_DEPLOY_TITLE_HEIGHT;
			colorBackground[] = {0, 0, 0, 0.9};
			text = "...";
		};
		class DeployList : RscListNBox
		{
			idc = 8;
			x = RTS_UI_DEPLOY_X;
			y = RTS_UI_DEPLOY_Y + RTS_UI_DEPLOY_TITLE_HEIGHT;
			w = RTS_UI_DEPLOY_WIDTH;
			h = RTS_UI_DEPLOY_LIST_HEIGHT;
			columns[] = { 0, 0.8 };
		};
		class DeployButton : RscButton
		{
			idc = 9;
			x = RTS_UI_DEPLOY_X;
			y = RTS_UI_DEPLOY_Y + RTS_UI_DEPLOY_TITLE_HEIGHT + RTS_UI_DEPLOY_LIST_HEIGHT;
			w = RTS_UI_DEPLOY_WIDTH;
			h = RTS_UI_DEPLOY_BUTTON_HEIGHT;
			text = "Deploy";
		};
	};
};