If(isMultiplayer)then{If(!isServer)exitWith{};};

private _objects_list = [];
private _spec_object = [];

params ["_obj_idx"];

switch(_obj_idx)do
{
  case 0:{ // Main Base
            _objects_list = [
                              ["Land_ClutterCutter_large_F",[2.89063,2.10742,-0.00111485],0,1,0,[0,0],"","",true,false],
                              ["Land_ClutterCutter_large_F",[-3.9043,-0.609375,9.53674e-007],0,1,0,[0,0],"","",true,false],
                              ["Land_HBarrier_3_F",[-0.988281,4.68359,0],0,1,0,[0,0],"","",true,false],
                              ["Campfire_burning_F",[-4.59766,-3.9043,0.029999],333.198,1,0,[0,0],"","",true,false],
                              ["Land_ClutterCutter_large_F",[4.74219,-3.76953,-0.00358295],0,1,0,[0,0.0740019],"","",true,false],
                              ["Land_HBarrier_5_F",[-5.17188,6.2207,0],0,1,0,[0,0],"","",true,false],
                              ["Land_HBarrier_3_F",[5.13477,4.28711,0],272.051,1,0,[0,0],"","",true,false],
                              ["Land_ClutterCutter_large_F",[-6.40625,-4.01172,-0.00500679],333.198,1,0,[0,0],"","",true,false],
                              ["Land_Sleeping_bag_F",[-7.68164,-2.16797,0],343.576,1,0,[0,0],"","",true,false],
                              ["Land_Sleeping_bag_brown_F",[-5.18359,-5.93359,0],114.945,1,0,[0,-0],"","",true,false],
                              ["Land_BagFence_Long_F",[7.19531,3.90234,-0.000999928],182.417,1,0,[0,0],"","",true,false],
                              ["Flag_Red_F",[4.03516,-6.33398,0],0,1,0,[0,0],"","",true,false],
                              ["Land_ClutterCutter_large_F",[-2.13672,8.88672,9.53674e-007],0,1,0,[0,0],"","",true,false],
                              ["Land_BagFence_Long_F",[-7.17188,5.67773,-0.000999928],0,1,0,[0,0],"","",true,false],
                              ["Land_BagFence_End_F",[9.49805,3.84766,-0.00100017],0,1,0,[0,0],"","",true,false],
                              ["Land_Laptop_device_F",[-8.44141,-5.38086,0],63.2703,1,0,[0,0],"","",true,false],
                              ["Land_BagFence_Long_F",[9.82617,-2.24219,-0.000999928],273.497,1,0,[0,0],"","",true,false],
                              ["Land_SandbagBarricade_01_hole_F",[10.2676,0.166016,0],89.8106,1,0,[0,0],"","",true,false],
                              ["Land_CanisterFuel_Blue_F",[-6.0625,-8.47461,0],333.198,1,0,[0,0],"","",true,false],
                              ["Land_TentDome_F",[-10.0137,-3.84961,0],158.26,1,0,[0,-0],"","",true,false],
                              ["Land_TentDome_F",[-7.69336,-7.52344,0],131.223,1,0,[0,-0],"","",true,false],
                              ["Land_SandbagBarricade_01_hole_F",[-10.5352,-0.164063,0],282.19,1,0,[0,0],"","",true,false],
                              ["B_supplyCrate_F",[-1.72461,10.5234,9.53674e-007],309.375,1,0,[0,0],"","",true,false],
                              ["Land_Camping_Light_F",[3.85352,10.0898,-0.00084877],0,1,0,[0,0],"","",true,false],
                              ["Land_BagFence_Long_F",[-10.7734,2,-0.000999928],233.725,1,0,[0,0],"","",true,false],
                              ["Land_BagFence_Long_F",[9.73242,-5.11914,-0.000999928],272.479,1,0,[0,0],"","",true,false],
                              ["Land_SandbagBarricade_01_hole_F",[-1.27344,-11.2109,0],181.723,1,0,[0,0],"","",true,false],
                              ["CamoNet_INDP_big_F",[0.339844,10.9258,9.53674e-007],0,1,0,[0,0],"","",true,false],
                              ["Land_BagFence_Long_F",[-3.62695,-10.8613,-0.000999928],2.57749,1,0,[0,0],"","",true,false],
                              ["Land_SolarPanel_1_F",[11.1289,-1.54883,0],89.8401,1,0,[0,0],"","",true,false],
                              ["Land_BagFence_Round_F",[-11.8066,-1.91797,-0.00130081],127.304,1,0,[0,-0],"","",true,false],
                              ["Land_SolarPanel_1_F",[-11.375,0.335938,0],280.219,1,0,[0,0],"","",true,false],
                              ["Land_ClutterCutter_large_F",[-8.0918,8.75977,-0.000300407],0,1,0,[0.0765974,-0.0766167],"","",true,false],
                              ["Land_SatelliteAntenna_01_F",[-10.041,-6.42578,0],311.328,1,0,[0,0],"","",true,false],
                              ["Land_SandbagBarricade_01_F",[3.97852,-11.3184,0],178.496,1,0,[0,-0],"","",true,false],
                              ["Land_HBarrier_Big_F",[-5.01758,11.2168,9.53674e-007],91.1859,1,0,[0,-0],"","",true,false],
                              ["Land_BagFence_Long_F",[6.42969,-10.6992,-0.000999928],168.731,1,0,[0,-0],"","",true,false],
                              ["Land_BagFence_Round_F",[-6.22461,-11.2422,-0.00130081],0.141122,1,0,[0,0],"","",true,false],
                              ["Land_HBarrier_Big_F",[5.38086,11.332,9.53674e-007],91.1859,1,0,[0,-0],"","",true,false],
                              ["Land_SandbagBarricade_01_hole_F",[10.0625,-7.73633,0],90.9061,1,0,[0,-0],"","",true,false],
                              ["Land_BagFence_Long_F",[-8.4668,-9.56445,-0.000999928],226.366,1,0,[0,0],"","",true,false],
                              ["Land_BagFence_Long_F",[-11.9199,-4.79688,-0.000999928],263.906,1,0,[0,0],"","",true,false],
                              ["Land_BagFence_Long_F",[-10.5762,-7.30273,-0.000999928],46.6523,1,0,[0,0],"","",true,false],
                              ["Land_SolarPanel_1_F",[-4.74219,-11.873,0],177.383,1,0,[0,-0],"","",true,false],
                              ["Land_BagFence_Round_F",[9.22266,-10.0098,-0.00130081],315.444,1,0,[0,0],"","",true,false],
                              ["Land_SolarPanel_1_F",[7.58984,-11.1348,0],169.548,1,0,[0,-0],"","",true,false],
                              ["Land_HBarrier_Big_F",[0.134766,14.4746,9.53674e-007],0,1,0,[0,0],"","",true,false]
                            ];
            _spec_object = ["Flag_Red_F","B_supplyCrate_F"];
         };

  case 1:{


            _objects_list = [
                              ["O_UAV_AI",[0.314453,2.8125,-0.057339],0.570656,1,0,[0,0],"","",true,false],
                              ["O_UAV_AI",[-2.98242,-0.632813,-0.057339],269.415,1,0,[0,0],"","",true,false],
                              ["O_HMG_01_A_F",[0.417969,3.17969,-0.0749998],0.570656,1,0,[0,0],"","",true,false],
                              ["O_HMG_01_A_F",[-3.35156,-0.537109,-0.0749998],269.415,1,0,[0,0],"","",true,false],
                              ["O_UAV_AI",[3.78711,-0.591797,-0.057339],91.7899,1,0,[0,-0],"","",true,false],
                              ["O_HMG_01_A_F",[4.15234,-0.703125,-0.0749998],91.7899,1,0,[0,-0],"","",true,false],
                              ["O_UAV_AI",[0.789063,-4.06641,-0.057339],175.006,1,0,[0,-0],"","",true,false],
                              ["O_HMG_01_A_F",[0.722656,-4.44336,-0.0749998],175.006,1,0,[0,-0],"","",true,false],
                              ["Land_TTowerBig_2_F",[0.458984,-0.560547,0],0,1,0,[0,0],"","",true,false]
                            ];
            _spec_object = ["Land_TTowerBig_2_F"];
          };
   case 2:{

             _objects_list = [
                               ["O_supplyCrate_F",[-0.111328,0.546875,0],0,1,0,[0,0],"","",true,false],
                               ["CamoNet_ghex_F",[0.244141,0.705078,0],0,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Long_F",[1.16016,-3.82031,-0.000999928],0,1,0,[0,0],"","",true,false],
                               ["Land_SandbagBarricade_01_F",[-1.39844,-4.17383,0],181.523,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Long_F",[1.1875,4.71484,-0.000999928],2.66087,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Long_F",[-1.71484,4.88477,-0.000999928],2.66087,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Short_F",[3.42969,-3.85938,-0.0010004],0,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Long_F",[4.08398,4.57031,-0.000999928],2.66087,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Short_F",[-4.03516,4.92188,-0.0010004],0,1,0,[0,0],"","",true,false],
                               ["Land_SandbagBarricade_01_F",[5.03906,-4.0918,0],180.143,1,0,[0,0],"","",true,false],
                               ["Land_SandbagBarricade_01_F",[-5.34766,-4.0625,0],182.741,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Long_F",[-3.38477,-6.17188,-0.000999928],0,1,0,[0,0],"","",true,false],
                               ["Land_SandbagBarricade_01_F",[-5.8418,4.14258,0],309.513,1,0,[0,0],"","",true,false],
                               ["Land_SandbagBarricade_01_F",[6.52148,3.94922,0],39.5993,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Round_F",[-7.53711,2.50977,-0.00130081],121.901,1,0,[0,-0],"","",true,false],
                               ["Land_BagFence_Long_F",[-7.76758,-0.130859,-0.000999928],270.812,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Round_F",[-7.50781,-2.96484,-0.00130081],50.4923,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Round_F",[7.37305,-3.29688,-0.00130081],314.676,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Long_F",[8.01563,-0.566406,-0.000999928],278.781,1,0,[0,0],"","",true,false],
                               ["Land_BagFence_Round_F",[8.13867,2.30078,-0.00130081],236.964,1,0,[0,0],"","",true,false]
                             ];


               _spec_object = ["O_supplyCrate_F"];
          };
   case 3:{

            _objects_list = [

                            ];
            _spec_object = [];
          };
   case 4:{


            _objects_list = [
                            ];
              _spec_object = [];
          };
   case 5:{
              _objects_list = [
                              ];

              _spec_object = [];
          };
   case 6:{
              _objects_list = [
                              ];
              _spec_object = [];
          };
   case 7:{
              _objects_list = [
                              ];
              _spec_object = [];

          };
   case 8:{
              _objects_list = [
                              ];
              _spec_object = [];
          };
   case 9:{

              _objects_list = [
                             ];
               _spec_object = [];
          };
   case 10:{

            _objects_list = [
                            ];
          };


};

BASES_STORE = [_objects_list,_spec_object];
