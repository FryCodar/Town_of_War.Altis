#include "dlg_define.hpp"

class DIARSC(normal,RscShortcutButton)
{
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	color[] = {1,1,1,1.0};
	colorFocused[] = {1,1,1,1.0};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackground2[] = {1,1,1,1};
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus = 1.2;
	periodOver = 1.2;
	class HitZone
	{
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos
	{
		left = 0;
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos
	{
		left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	period = 0.8;
	font = "PuristaMedium";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
        textureNoShortcut = "";
	action = "";
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
class DIARSC(normal,RscPicButton)
{
	idc = -1;
	type = 1;
	style = 48;
	default = false;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"; //0.04
	colorText[] = { 1, 1, 1, 1 };
	colorFocused[] = { 1, 0, 0, 0.3 };   // border color for focused state
	colorDisabled[] = { 0, 0, 1, 0.4 };   // text color for disabled state
	colorBackground[] = { 0, 0, 0, 0};
	colorBackgroundDisabled[] = { 1, 1, 1, 0.2 };   // background color for disabled state
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};   // background color for active state
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorShadow[] = { 0, 0, 0, 0.4 };
	colorBorder[] = { 0, 0, 0, 0.6 };
	borderSize = 0;
	soundEnter[] = { "", 0, 1 };  // no sound
	soundPush[] = { "", 0.1, 1 };
	soundClick[] = { "", 0, 1 };  // no sound
	soundEscape[] = { "", 0, 1 };  // no sound
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0;
	text = "";
	action = "";
};
class DIARSC(normal,RscButton)
{
	idc = -1;
	type = 1;
	style = 2;
	default = false;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"; //0.04
	colorText[] = { 1, 1, 1, 1 };
	colorFocused[] = { 0, 0, 0, 0.1 };   // border color for focused state
	colorDisabled[] = { 0, 0, 1, 0.4 };   // text color for disabled state
	colorBackground[] = { 0, 0, 0, 0};
	colorBackgroundDisabled[] = { 1, 1, 1, 0.2 };   // background color for disabled state
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};   // background color for active state
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorShadow[] = { 0.5, 0.8, 0.3, 0.8 };
	colorBorder[] = { 0.5, 0.8, 0.3, 0.8 };
	borderSize = 0;
	soundEnter[] = { "", 0, 1 };  // no sound
	soundPush[] = { "", 0.1, 1 };
	soundClick[] = { "", 0, 1 };  // no sound
	soundEscape[] = { "", 0, 1 };  // no sound
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0;
	text = "";
	action = "";
};
class DIARSC(normal,RscText)
{

	type = 0;
	idc = -1;
	style = 0;
	colorBackground[] = {0, 0, 0, 0.7};
	colorText[] = {1, 1, 1, 1};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	h = 0.04;
	linespacing = 1;
};

class DIARSC(normal_1,RscText)
{

	type = 0;
	idc = -1;
	style = 0;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 0, 0, 1};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 14) * 1)";
	h = 0.04;
	linespacing = 1;
};

class DIARSC(normal,RscFrame)
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "RobotoCondensed";
	sizeEx = 0.02;
	text = "";
};

class DIARSC(normal,RscPicture)
{

	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {};
	colorText[] = {};
	font = "RobotoCondensed";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 1;
};

class DIARSC(alpha,RscPicture)
{

	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {};
	colorText[] = {0, 0, 0, 0.2};
	font = "RobotoCondensed";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 1;
};

class DIARSC(normal,Black_Backround)
{
    type = 0;
	idc = -1;
	style = 2;
	shadow = 1;
	colorBackground[] = {0,0,0,1};
	colorText[] = {1, 1, 1, 1};
	font = "RobotoCondensed";
	sizeEx = 0.04;
	text = "";
};

class DIARSC(normal,Backround)
{
    type = 0;
	idc = -1;
	style = 2;
	shadow = 1;
	colorBackground[] = {0,0,0,0.3};
	colorText[] = {0, 0, 0, 0.3};
	font = "RobotoCondensed";
	sizeEx = 0.04;
	text = "";
};

class DIARSC(normal,Slider)
{
	type = 43;
	idc = -1;
	style = 1024;
	shadow = 2;
	x = 0;
	y = 0;
	h = 0.029412;
	w = 0.400000;
	color[] = {1, 1, 1, 0.5};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.5};

	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

class DIARSC(normal,Combo)
{
	type = 4;
	idc = -1;
	style = 16;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelect[] = {0,0,0,1};
	colorText[] = {0.95,0.95,0.95,1};
	colorBackground[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.7};
	colorScrollbar[] = {1,0,0,1};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {1,1,1,1};
	colorActive[] = {1,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
	class ComboScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	soundSelect[] = { "", 0, 1 };
	soundExpand[] = { "", 0, 1 };
	soundCollapse[] = { "", 0, 1 };
	maxHistoryDelay = 0;
};

class DIARSC(normal,ListBox)
{
		style = 0;
		idc = -1;
		type = 5;
		w = 0.275;
		h = 0.04;
		font = "RobotoCondensed";
		colorSelect[] = {1, 1, 1, 1};
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0,0,0,0.9};
		colorSelect2[] = {1, 1, 1, 1};
		colorSelectBackground[] = {0.95, 0.95, 0.95, 0.5};
		colorSelectBackground2[] = {1, 1, 1, 0.5};
		colorScrollbar[] = {0.2, 0.2, 0.2, 1};
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		wholeHeight = 0.45;
		rowHeight = 0.04;
		color[] = {0.7, 0.7, 0.7, 1};
		colorActive[] = {0,0,0,1};
		colorDisabled[] = {0,0,0,0.3};
		sizeEx = 0.04;
		soundSelect[] = {"",0.1,1};
		soundExpand[] = {"",0.1,1};
		soundCollapse[] = {"",0.1,1};
		maxHistoryDelay = 1;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;

		class ListScrollBar
		{
			color[] = {1,1,1,0.6};
			colorActive[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,0.3};
			thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			shadow = 0;
			scrollSpeed = 0.06;
			width = 0;
			height = 0;
			autoScrollEnabled = 1;
			autoScrollSpeed = -1;
			autoScrollDelay = 5;
			autoScrollRewind = 0;
		};
};

class DIARSC(normal,Edit)
{
	idc = -1;
	type = 2;
	style = "16 + 512"; // multi line + no border
	x = 0;
	y = 0;
	h = 0;
	w = 0;
	font = "RobotoCondensed";
	sizeEx = 0.04;
	autocomplete = "";
	canModify = true;
	maxChars = 100;
	forceDrawCaret = false;
	colorSelection[] = {0,1,0,1};
	colorText[] = {1, 1, 1, 1};
	colorDisabled[] = {1,0,0,1};
	colorBackground[] = {0, 0, 0, 0.7};
	text = ""; // how to output multiline
};

class DIARSC(normal,Checkboxes)
{
	idc = -1;
	type = 7; // CT_CHECKBOXES
	style = 2;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	colorSelectedBg[] = {0, 0, 0, 1}; // selected item bg color
	colorText[] = {0, 1, 0, 1}; // checkbox unchecked color
	colorTextSelect[] = {1, 0, 0, 1}; // checkbox checked color
	colorBackground[] = {0, 0, 0, 0}; // control generic BG color 0, 0, 1, 0.3
	font = "RobotoCondensed";
	sizeEx = 0.04;
	onCheckBoxesSelChanged = "";
	columns = 1;
	rows = 1;
	strings[] = {"DISARMED"};
	checked_strings[] = {">> ARMED <<"};
};

class DIARSC(normal,Map)
{
	deletable = 0;
		fade = 0;
		access = 0;
		type = 101;
		idc = -1;
		style = 48;
		colorBackground[] = {0.969,0.957,0.949,1};
		colorOutside[] = {0,0,0,1};
		colorText[] = {0,0,0,1};
		font = "TahomaB";
		sizeEx = 0.04;
		colorSea[] = {0.467,0.631,0.851,0.5};
		colorForest[] = {0.624,0.78,0.388,0.5};
		colorRocks[] = {0,0,0,0.3};
		colorCountlines[] = {0.572,0.354,0.188,0.25};
		colorMainCountlines[] = {0.572,0.354,0.188,0.5};
		colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
		colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
		colorForestBorder[] = {0,0,0,0};
		colorRocksBorder[] = {0,0,0,0};
		colorPowerLines[] = {0.1,0.1,0.1,1};
		colorRailWay[] = {0.8,0.2,0,1};
		colorNames[] = {0.1,0.1,0.1,0.9};
		colorInactive[] = {1,1,1,0.5};
		colorLevels[] = {0.286,0.177,0.094,0.5};
		colorTracks[] = {0.84,0.76,0.65,0.15};
		colorRoads[] = {0.7,0.7,0.7,1};
		colorMainRoads[] = {0.9,0.5,0.3,1};
		colorTracksFill[] = {0.84,0.76,0.65,1};
		colorRoadsFill[] = {1,1,1,1};
		colorMainRoadsFill[] = {1,0.6,0.4,1};
		colorGrid[] = {0.1,0.1,0.1,0.6};
		colorGridMap[] = {0.1,0.1,0.1,0.6};
		stickX[] = {0.2,["Gamma",1,1.5]};
		stickY[] = {0.2,["Gamma",1,1.5]};
		class Legend
		{
			colorBackground[] = {1,1,1,0.5};
			color[] = {0,0,0,1};
			x = SafeZoneX + GUI_GRID_W;
			y = SafeZoneY + safezoneH - 4.5 * GUI_GRID_H;
			w = 10 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			font = "RobotoCondensed";
			sizeEx = GUI_TEXT_SIZE_SMALL;
		};
		class ActiveMarker
		{
			color[] = {0.3,0.1,0.9,1};
			size = 50;
		};
		class Command
		{
			color[] = {1,1,1,1};
			icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
			size = 18;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};
		class Task
		{
			taskNone = "#(argb,8,8,3)color(0,0,0,0)";
			taskCreated = "#(argb,8,8,3)color(0,0,0,1)";
			taskAssigned = "#(argb,8,8,3)color(1,1,1,1)";
			taskSucceeded = "#(argb,8,8,3)color(0,1,0,1)";
			taskFailed = "#(argb,8,8,3)color(1,0,0,1)";
			taskCanceled = "#(argb,8,8,3)color(1,0.5,0,1)";
			colorCreated[] = {1,1,1,1};
			colorCanceled[] = {0.7,0.7,0.7,1};
			colorDone[] = {0.7,1,0.3,1};
			colorFailed[] = {1,0.3,0.2,1};
			color[] =
			{
				"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
				"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
				"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
				"(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
			};
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
			color[] = {1,1,1,1};
			icon = "\a3\ui_f\data\map\mapcontrol\custommark_ca.paa";
			size = 18;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};
		class Tree
		{
			color[] = {0.45,0.64,0.33,0.4};
			icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
			size = 12;
			importance = "0.9 * 16 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class SmallTree
		{
			color[] = {0.45,0.64,0.33,0.4};
			icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
			size = 12;
			importance = "0.6 * 12 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class Bush
		{
			color[] = {0.45,0.64,0.33,0.4};
			icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
			size = "14/2";
			importance = "0.2 * 14 * 0.05 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class Church
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Chapel
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Cross
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Rock
		{
			color[] = {0.1,0.1,0.1,0.8};
			icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
			size = 12;
			importance = "0.5 * 12 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class Bunker
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
			size = 14;
			importance = "1.5 * 14 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class Fortress
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
			size = 16;
			importance = "2 * 16 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class Fountain
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
			size = 11;
			importance = "1 * 12 * 0.05";
			coefMin = 0.25;
			coefMax = 4;
		};
		class ViewTower
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
			size = 16;
			importance = "2.5 * 16 * 0.05";
			coefMin = 0.5;
			coefMax = 4;
		};
		class Lighthouse
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Quay
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Fuelstation
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Hospital
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class BusStop
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class LineMarker
		{
			textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
			lineWidthThin = 0.008;
			lineWidthThick = 0.014;
			lineDistanceMin = 3e-005;
			lineLengthMin = 5;
		};
		class Transmitter
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Stack
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
			size = 16;
			importance = "2 * 16 * 0.05";
			coefMin = 0.4;
			coefMax = 2;
		};
		class Ruin
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
			size = 16;
			importance = "1.2 * 16 * 0.05";
			coefMin = 1;
			coefMax = 4;
		};
		class Tourism
		{
			color[] = {0,0,0,1};
			icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
			size = 16;
			importance = "1 * 16 * 0.05";
			coefMin = 0.7;
			coefMax = 4;
		};
		class Watertower
		{
			color[] = {1,1,1,1};
			icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
		};
		class Waypoint
		{
			color[] = {1,1,1,1};
			importance = 1;
			coefMin = 1;
			coefMax = 1;
			icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
			size = 18;
		};
		class WaypointCompleted
		{
			color[] = {1,1,1,1};
			importance = 1;
			coefMin = 1;
			coefMax = 1;
			icon = "\a3\ui_f\data\map\mapcontrol\waypointcompleted_ca.paa";
			size = 18;
		};
		moveOnEdges = 1;
		x = "SafeZoneXAbs";
		y = SafeZoneY + 1.5 * GUI_GRID_H;
		w = "SafeZoneWAbs";
		h = SafeZoneH - 1.5 * GUI_GRID_H;
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
		colorTrails[] = {0.84,0.76,0.65,0.15};
		colorTrailsFill[] = {0.84,0.76,0.65,0.65};
		fontLabel = "RobotoCondensed";
		sizeExLabel = GUI_TEXT_SIZE_SMALL;
		fontGrid = "TahomaB";
		sizeExGrid = 0.02;
		fontUnits = "TahomaB";
		sizeExUnits = GUI_TEXT_SIZE_SMALL;
		fontNames = "EtelkaNarrowMediumPro";
		sizeExNames = GUI_TEXT_SIZE_SMALL * 2;
		fontInfo = "RobotoCondensed";
		sizeExInfo = GUI_TEXT_SIZE_SMALL;
		fontLevel = "TahomaB";
		sizeExLevel = 0.02;
		text = "#(argb,8,8,3)color(1,1,1,1)";
		idcMarkerColor = -1;
		idcMarkerIcon = -1;
		textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
		showMarkers = 1;
		class power
		{
			icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
			color[] = {1,1,1,1};
		};
		class powersolar
		{
			icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
			color[] = {1,1,1,1};
		};
		class powerwave
		{
			icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
			color[] = {1,1,1,1};
		};
		class powerwind
		{
			icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
			color[] = {1,1,1,1};
		};
		class Shipwreck
		{
			icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
			size = 24;
			importance = 1;
			coefMin = 0.85;
			coefMax = 1;
			color[] = {0,0,0,1};
		};
};

class DIARSC(normal,Controls_Group)
{
	type = 15;
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	style = 16;
	class VScrollbar {
		color[] = {1,1,1,1};
		width = 0.021;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		shadow = 0;
	};
	class HScrollbar {
		color[] = {1,1,1,1};
		height = 0.028;
		shadow = 0;
	};
	class ScrollBar {
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	class Controls{};
};
