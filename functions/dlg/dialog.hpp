#include "define.hpp"


class MSOT_Tactic_Table
{

idd = 36642;
movingEnable = 0;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['msot_dlg',[36642]];[] spawn MSOT_dlg_fnc_setDlgCtrl;";
onUnload = "uiNamespace setVariable ['msot_dlg',[]];";

  class controls
  {
    class DIARSC(Tactic_Tab,Picture): DIARSC(normal,RscPicture)
    {
	     idc = 10013;//9800
	     text = "functions\dlg\TacticTab.paa";
	     x = X_CENTERED(0.85);
	     y = Y_CENTERED(0.73);
	     w = W_SIZE(0.85);
	     h = H_SIZE(0.73);
    };

    class DIARSC(Pic_Use,show): DIARSC(alpha,RscPicture)
    {
	     idc = 10014;//1200
	     text = "pics\MSOT.paa";
	     x = X_CENTERED(0.46);//0.438151 * safezoneW + safezoneX;
	     y = Y_CENTERED(0.5);//0.33496 * safezoneH + safezoneY;
	     w = W_SIZE(0.46);
	     h = H_SIZE(0.5);
    };

    class DIARSC(Back_All,Btn): DIARSC(normal,RscPicButton)
		{
			idc = 10015;
      colorText[] = {0,0,0,0};
    	colorFocused[] = {0,0,0,0};   // border color for focused state
    	colorDisabled[] = {0,0,0,0};   // text color for disabled state
    	colorBackground[] = {0,0,0,0};
    	colorBackgroundDisabled[] = {0,0,0,0};   // background color for disabled state
    	colorBackgroundActive[] = {0,0,0,0};
      colorShadow[] = {0,0,0,0};
    	colorBorder[] = {0,0,0,0};
			x = X_CENTERED(0.07);
			y = Y_CALC(0.797);//0.797 * safezoneH + safezoneY;
			w = W_SIZE(0.07);
			h = H_SIZE(0.043);
			text = "";
      toolTip = "Close Tablet";
			action = "closeDialog ((uiNamespace getVariable ['msot_dlg',[0]]) select 0)";
		};

    class DIARSC(Artillery_1st,Btn): DIARSC(normal,RscPicButton)
		{
			idc = 10016;
      colorFocused[] = {0,0,0,0};   // border color for focused state
    	colorDisabled[] = {0,0,0,0};   // text color for disabled state
    	colorBackground[] = {0,0,0,0};
    	colorBackgroundDisabled[] = {0,0,0,0};
      colorShadow[] = {0,0,0,0};
    	colorBorder[] = {0,0,0,0};
			x = X_LEFT_SIDED(0.17,0.08);
			y = Y_UP_SIDED(0.2,0.08);
			w = W_SIZE(0.17);
			h = H_SIZE(0.2);
			text = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa";
      toolTip = "Call Artillery Strike";
			action = "createDialog 'MSOT_ARTILLERY_TABLE'";
		};
    class DIARSC(Airsupply_2nd,Btn): DIARSC(normal,RscPicButton)
		{
			idc = 10017;
      colorFocused[] = {0,0,0,0};   // border color for focused state
    	colorDisabled[] = {0,0,0,0};   // text color for disabled state
    	colorBackground[] = {0,0,0,0};
    	colorBackgroundDisabled[] = {0,0,0,0};
      colorShadow[] = {0,0,0,0};
    	colorBorder[] = {0,0,0,0};
			x = X_RIGHT_SIDED(0,0.08);
			y = Y_UP_SIDED(0.2,0.08);
			w = W_SIZE(0.17);
			h = H_SIZE(0.2);
			text = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa";
      toolTip = "Call Air Supplies";
			action = "hint 'Airsupply'";
		};
    class DIARSC(Aircas_3rd,Btn): DIARSC(normal,RscPicButton)
		{
			idc = 10018;
      colorFocused[] = {0,0,0,0};   // border color for focused state
    	colorDisabled[] = {0,0,0,0};   // text color for disabled state
    	colorBackground[] = {0,0,0,0};
    	colorBackgroundDisabled[] = {0,0,0,0};
      colorShadow[] = {0,0,0,0};
    	colorBorder[] = {0,0,0,0};
			x = X_LEFT_SIDED(0.17,0.08);
			y = Y_DOWN_SIDED(0,0.08);
			w = W_SIZE(0.17);
			h = H_SIZE(0.2);
      text = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\cas_ca.paa";
			toolTip = "Call Close Air Support (CAS)";
			action = "hint 'C A S'";
		};
    class DIARSC(Satview_4th,Btn): DIARSC(normal,RscPicButton)
		{
			idc = 10019;
      colorFocused[] = {0,0,0,0};   // border color for focused state
    	colorDisabled[] = {0,0,0,0};   // text color for disabled state
    	colorBackground[] = {0,0,0,0};
    	colorBackgroundDisabled[] = {0,0,0,0};
      colorShadow[] = {0,0,0,0};
    	colorBorder[] = {0,0,0,0};
			x = X_RIGHT_SIDED(0,0.08);
			y = Y_DOWN_SIDED(0,0.08);
			w = W_SIZE(0.17);
			h = H_SIZE(0.2);
			text = "\a3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\gps_ca.paa";
      toolTip = "Open SatView System";
			action = "hint 'SatView'";

		};
  };
};

class MSOT_ARTILLERY_TABLE
{
  idd = 36643;
  movingEnable = 0;
  enableSimulation = true;
  onLoad = "uiNamespace setVariable ['msot_dlg',[36643]];[0] spawn MSOT_dlg_fnc_wowArtillery;";
  onUnload = "[2] spawn MSOT_dlg_fnc_setArtilleryMarker;";

    class controls
    {
      class DIARSC(Backround_Artillery,Picture): DIARSC(normal,RscPicture)
      {
  	     idc = 10020;//9800
  	     text = "functions\dlg\TacticTab.paa";
  	     x = X_CENTERED(0.85);
  	     y = Y_CENTERED(0.73);
  	     w = W_SIZE(0.85);
  	     h = H_SIZE(0.73);
      };
       class DIARSC(Back_Artillery,Btn): DIARSC(normal,RscPicButton)
   		{
   			idc = 10021;
        colorText[] = {0,0,0,0};
       	colorFocused[] = {0,0,0,0};   // border color for focused state
       	colorDisabled[] = {0,0,0,0};   // text color for disabled state
       	colorBackground[] = {0,0,0,0};
       	colorBackgroundDisabled[] = {0,0,0,0};   // background color for disabled state
       	colorBackgroundActive[] = {0,0,0,0};
        colorShadow[] = {0,0,0,0};
       	colorBorder[] = {0,0,0,0};
   			x = X_CENTERED(0.07);
   			y = Y_CALC(0.797);//0.797 * safezoneH + safezoneY;
   			w = W_SIZE(0.07);
   			h = H_SIZE(0.043);
   			text = "";
        toolTip = "Go Back";
   			action = "closeDialog ((uiNamespace getVariable ['msot_dlg',[0]]) select 0)";
   		};
      class DIARSC(Map_Artillery,Screen): DIARSC(normal,Map)
      {
	       idc = 10022;
	       x = X_CALC(0.28);
	       y = Y_CENTERED(0.55);
	       w = W_SIZE(0.45);
	       h = H_SIZE(0.55);
         onMouseButtonClick = "[1,(_this select 0),(_this select 2),(_this select 3)] spawn MSOT_dlg_fnc_setArtilleryMarker;";
      };
      class DIARSC(Frame1_Artillery,Infoframe): DIARSC(normal,RscFrame)
      {
			     idc = 10023;
			     sizeEx = 0.04;
			     text = "Available Artillery: "; //--- ToDo: Localize;
           x = X_RIGHT_SIDED(0.071,0);
           y = Y_CALC(0.215);
           w = W_SIZE(0.32);
           h = H_SIZE(0.12);
      };
      class DIARSC(List1_Artillery,ListBox): DIARSC(normal,ListBox)
      {
        idc = 10024;
        style = "32 + 16";
        colorBackground[] = {0,0,0,0.6};
        x = X_RIGHT_SIDED(0.072,0);
        y = Y_CALC(0.240);
        w = W_SIZE(0.316);
        h = H_SIZE(0.09);
        onLBSelChanged = "[1,(_this select 1)] spawn MSOT_dlg_fnc_wowArtillery";
      };
      class DIARSC(AddBtn_Artillery,ListBtn): DIARSC(normal,RscButton)
      {
        idc = 10025;
        colorShadow[] = {0,0,0,0};
      	colorBorder[] = {0,0,0,0.5};
        colorBackground[] = {0.1, 0.8, 0.3, 0.8};
        period = 0;
        x = X_RIGHT_SIDED(0.228,0);
  			y = Y_CALC(0.34);//0.797 * safezoneH + safezoneY;
  			w = W_SIZE(0.14);
  			h = H_SIZE(0.03);
  			text = "Add";
        toolTip = "Add Vehicle";
  			action = "[2] spawn MSOT_dlg_fnc_wowArtillery";
      };
      class DIARSC(RemBtn_Artillery,ListBtn): DIARSC(normal,RscButton)
      {
        idc = 10026;
        colorShadow[] = {0,0,0,0};
      	colorBorder[] = {0,0,0,0.5};
        colorBackground[] = {1, 0,0, 0.8};
        period = 0;
        x = X_RIGHT_SIDED(0.08,0);
  			y = Y_CALC(0.34);//0.797 * safezoneH + safezoneY;
  			w = W_SIZE(0.14);
  			h = H_SIZE(0.03);
  			text = "Remove";
        toolTip = "Remove Vehicle";
  			action = "[4] spawn MSOT_dlg_fnc_wowArtillery";
      };
      class DIARSC(Frame2_Artillery,Infoframe): DIARSC(normal,RscFrame)
      {
			     idc = 10027;
			     sizeEx = 0.04;
			     text = "Selected Artillery: "; //--- ToDo: Localize;
           x = X_RIGHT_SIDED(0.071,0);
           y = Y_CALC(0.374);
           w = W_SIZE(0.32);
           h = H_SIZE(0.118);
      };
      class DIARSC(List2_Artillery,ListBox): DIARSC(normal,ListBox)
      {
        idc = 10028;
        style = "32 + 16";
        colorBackground[] = {0,0,0,0.6};
        x = X_RIGHT_SIDED(0.072,0);
        y = Y_CALC(0.397);
        w = W_SIZE(0.316);
        h = H_SIZE(0.09);
        onLBSelChanged = "[3,(_this select 1)] spawn MSOT_dlg_fnc_wowArtillery";
      };
      class DIARSC(Text1_Artillery,InfoText): DIARSC(normal,RscText)
      {
  	     idc = 10029;//9800
  	     text = "";
         colorBackground[] = {0.5, 0.2, 0.1, 0.8};
  	     x = X_RIGHT_SIDED(0.070,0);
  	     y = Y_CALC(0.492);
  	     w = W_SIZE(0.32);
  	     h = H_SIZE(0.03);
      };
      class DIARSC(Frame3_Artillery,Infoframe): DIARSC(normal,RscFrame)
      {
			     idc = 10030;
			     sizeEx = 0.04;
			     text = "Artillery Ammo: "; //--- ToDo: Localize;
           x = X_RIGHT_SIDED(0.071,0);
           y = Y_CALC(0.52);
           w = W_SIZE(0.16);
           h = H_SIZE(0.1);
      };
      class DIARSC(List3_Artillery,ListBox): DIARSC(normal,ListBox)
      {
        idc = 10031;
        colorBackground[] = {0,0,0,0.6};
        x = X_RIGHT_SIDED(0.072,0);
        y = Y_CALC(0.542);
        w = W_SIZE(0.155);
        h = H_SIZE(0.075);
        onLBSelChanged = "[5,(_this select 1)] spawn MSOT_dlg_fnc_wowArtillery";
      };
      class DIARSC(RelBtn_Artillery,ListBtn): DIARSC(normal,RscButton)
      {
        idc = 10032;
        colorShadow[] = {0,0,0,0};
      	colorBorder[] = {0,0,0,0.5};
        colorBackground[] = {0.1,0.3,0.4, 0.8};
        period = 0;
        x = X_RIGHT_SIDED(0.236,0);
  			y = Y_CALC(0.542);//0.797 * safezoneH + safezoneY;
  			w = W_SIZE(0.15);
  			h = H_SIZE(0.075);
  			text = "Reload";
        toolTip = "Reload Vehicle";
  			action = "[6] spawn MSOT_dlg_fnc_wowArtillery";
      };
      class DIARSC(Frame4_Artillery,Infoframe): DIARSC(normal,RscFrame)
      {
           idc = 10033;
           sizeEx = 0.04;
           text = "Rounds per Unit: "; //--- ToDo: Localize;
           x = X_RIGHT_SIDED(0.099,0);
           y = Y_CALC(0.62);
           w = W_SIZE(0.1);
           h = H_SIZE(0.06);
      };
      class DIARSC(Edit_Artillery,InputEdit): DIARSC(normal,Edit)
      {
        idc = 10034;
      	type = 2;
      	style = 1; // multi line + no border
        maxChars = 2;
      	x = X_RIGHT_SIDED(0.135,0);
      	y = Y_CALC(0.642);
      	w = W_SIZE(0.03);
      	h = H_SIZE(0.032);
        text = "0";
      };
      class DIARSC(Text2_Artillery,InfoText): DIARSC(normal,RscText)
      {
  	     idc = 10035;//9800
  	     text = "Total Rounds:";
         colorBackground[] = {0.5, 0.2, 0.1, 0.8};
  	     x = X_RIGHT_SIDED(0.236,0);
  	     y = Y_CALC(0.632);
  	     w = W_SIZE(0.07);
  	     h = H_SIZE(0.02);
      };
      class DIARSC(TRoundNum_Artillery,InfoText): DIARSC(normal,RscText)
      {
         idc = 10036;//9800
         style = 1;
         text = "0";
         colorBackground[] = {0.5, 0.2, 0.1, 0.8};
         x = X_RIGHT_SIDED(0.356,0);
         y = Y_CALC(0.632);
         w = W_SIZE(0.03);
         h = H_SIZE(0.02);
      };
      class DIARSC(Text3_Artillery,InfoText): DIARSC(normal,RscText)
      {
  	     idc = 10037;//9800
         style = 2;
  	     text = "ETA(sec):";
         colorBackground[] = {0.5, 0.2, 0.1, 0.8};
  	     x = X_RIGHT_SIDED(0.236,0);
  	     y = Y_CALC(0.655);
  	     w = W_SIZE(0.07);
  	     h = H_SIZE(0.02);
      };
      class DIARSC(ETANum_Artillery,InfoText): DIARSC(normal,RscText)
      {
         idc = 10038;//9800
         style = 1;
         text = "0";
         colorBackground[] = {0.5, 0.2, 0.1, 0.8};
         x = X_RIGHT_SIDED(0.356,0);
         y = Y_CALC(0.655);
         w = W_SIZE(0.03);
         h = H_SIZE(0.02);
      };
      class DIARSC(Frame5_Artillery,Infoframe): DIARSC(normal,RscFrame)
      {
           idc = 10033;
           sizeEx = 0.04;
           text = "Safety Switch: "; //--- ToDo: Localize;
           x = X_RIGHT_SIDED(0.099,0);
           y = Y_CALC(0.688);
           w = W_SIZE(0.1);
           h = H_SIZE(0.07);
      };
      class DIARSC(ChkBox1_Artillery,CheckBox): DIARSC(normal,Checkboxes)
      {
        idc = 10039;
      	x = X_RIGHT_SIDED(0.115,0);
      	y = Y_CALC(0.71);
      	w = W_SIZE(0.07);
      	h = H_SIZE(0.044);
        onCheckBoxesSelChanged = "[7,_this] spawn MSOT_dlg_fnc_wowArtillery";
      };
      class DIARSC(FireBtn_Artillery,ActBtn): DIARSC(normal,RscButton)
      {
        idc = 10040;
        colorShadow[] = {0,0,0,0};
      	colorBorder[] = {0,0,0,0.5};
        colorBackground[] = {1,0.4,0, 1};
        period = 0;
        x = X_RIGHT_SIDED(0.236,0);
  			y = Y_CALC(0.69);//0.797 * safezoneH + safezoneY;
  			w = W_SIZE(0.15);
  			h = H_SIZE(0.075);
  			text = "FIRE";
        toolTip = "";
  			action = "[8] spawn MSOT_dlg_fnc_wowArtillery";
      };
    };
};

class MSOT_TRAVEL_TABLE
{
  idd = 36646;
  movingEnable = 0;
  enableSimulation = true;
  onLoad = "uiNamespace setVariable ['msot_dlg',[36646]];[] spawn MSOT_dlg_fnc_setDlgCtrl;[0] spawn MSOT_dlg_fnc_useTravelService";
  onUnload = "[2] spawn MSOT_dlg_fnc_setArtilleryMarker; uiNamespace setVariable ['msot_dlg',[]];";

  class controls
  {
    class DIARSC(Travel_Tab,Picture): DIARSC(normal,RscPicture)
    {
       idc = 10041;//9800
       text = "functions\dlg\TacticTab.paa";
       x = X_CENTERED(0.85);
       y = Y_CENTERED(0.73);
       w = W_SIZE(0.85);
       h = H_SIZE(0.73);
    };
    class DIARSC(Travel_Map,Screen): DIARSC(normal,Map)
    {
       idc = 10042;
       x = X_CALC(0.28);
       y = Y_CENTERED(0.55);
       w = W_SIZE(0.774);
       h = H_SIZE(0.40);
       onMouseButtonClick = "[1,(_this select 0),(_this select 2),(_this select 3)] spawn MSOT_dlg_fnc_setArtilleryMarker;[1] spawn MSOT_dlg_fnc_useTravelService";
    };
    class DIARSC(Text1_Travel,InfoText): DIARSC(normal,RscText)
    {
       idc = 10043;//9800
       style = 2;
       sizeEx = 0.05;
       text = "Select Travel Position on Map!";
       colorBackground[] = {0.5, 0.2, 0.1, 0.8};
       x = X_CALC(0.28);
       y = Y_CALC(0.63);
       w = W_SIZE(0.774);
       h = H_SIZE(0.03);
     };
     class DIARSC(Teleport_Travel,ListBtn): DIARSC(normal,RscButton)
     {
       idc = 10044;
       colorShadow[] = {0,0,0,0};
       colorBorder[] = {0,0,0,0.5};
       colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
       colorBackground[] = {0,0,0,0.6};
       colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
       period = 1;
       x = X_CALC(0.28);
       y = Y_CALC(0.675);//0.797 * safezoneH + safezoneY;
       w = W_SIZE(0.17);
       h = H_SIZE(0.088);
       text = "Teleport";
       toolTip = "Normal Teleport";
       action = "[2] spawn MSOT_dlg_fnc_useTravelService";
     };
     class DIARSC(Parachute_Travel,ListBtn): DIARSC(normal,RscButton)
     {
       idc = 10045;
       colorShadow[] = {0,0,0,0};
       colorBorder[] = {0,0,0,0.5};
       colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
       colorBackground[] = {0,0,0,0.6};
       colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
       period = 1;
       x = X_CALC(0.46);
       y = Y_CALC(0.675);//0.797 * safezoneH + safezoneY;
       w = W_SIZE(0.17);
       h = H_SIZE(0.088);
       text = "HALO Jump";
       toolTip = "Jump with Parachute";
       action = "[3] spawn MSOT_dlg_fnc_useTravelService";
     };
     class DIARSC(Confirm_Travel,ListBtn): DIARSC(normal,RscButton)
     {
       idc = 10046;
       colorShadow[] = {0,0,0,0};
       colorBorder[] = {0,0,0,0.5};
       colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
       colorBackground[] = {1, 0,0, 0.8};
       colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
       period = 0;
       x = X_CALC(0.884);
       y = Y_CALC(0.675);//0.797 * safezoneH + safezoneY;
       w = W_SIZE(0.17);
       h = H_SIZE(0.088);
       text = "Action";
       toolTip = "Confirm Traveling";
       action = "[5] spawn MSOT_dlg_fnc_useTravelService";
     };
     class DIARSC(Frame_Travel,Infoframe): DIARSC(normal,RscFrame)
     {
          idc = 10046;
          sizeEx = 0.04;
          shadow = 2;
          colorText[] = {1, 1, 1, 1};
          text = "Altitude (in m): "; //--- ToDo: Localize;
          x = X_CALC(0.64);
          y = Y_CALC(0.665);
          w = W_SIZE(0.235);
          h = H_SIZE(0.1);
     };
     class DIARSC(Slider_Travel,Sliderbar): DIARSC(normal,Slider)
     {
	      idc = 10047;
        x = X_CALC(0.648);
        y = Y_CALC(0.69);
        w = W_SIZE(0.22);
        h = H_SIZE(0.025);
	      onSliderPosChanged = "[4] spawn MSOT_dlg_fnc_useTravelService";
     };
     class DIARSC(Text2_Travel,InfoText): DIARSC(normal,RscText)
     {
        idc = 10048;//9800
        style = 2;
        text = "500 m";
        colorBackground[] = {0, 0, 0, 1};
        x = X_CALC(0.725);
        y = Y_CALC(0.725);
        w = W_SIZE(0.07);
        h = H_SIZE(0.03);
      };
    class DIARSC(Back_All,Btn): DIARSC(normal,RscPicButton)
    {
      idc = 10049;
      colorText[] = {0,0,0,0};
      colorFocused[] = {0,0,0,0};   // border color for focused state
      colorDisabled[] = {0,0,0,0};   // text color for disabled state
      colorBackground[] = {0,0,0,0};
      colorBackgroundDisabled[] = {0,0,0,0};   // background color for disabled state
      colorBackgroundActive[] = {0,0,0,0};
      colorShadow[] = {0,0,0,0};
      colorBorder[] = {0,0,0,0};
      x = X_CENTERED(0.07);
      y = Y_CALC(0.797);//0.797 * safezoneH + safezoneY;
      w = W_SIZE(0.07);
      h = H_SIZE(0.043);
      text = "";
      toolTip = "Close Tablet";
      action = "closeDialog ((uiNamespace getVariable ['msot_dlg',[0]]) select 0)";
    };
  };
};
