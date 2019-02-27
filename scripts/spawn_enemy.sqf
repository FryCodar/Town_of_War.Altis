If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"

/*
Aufruf einfach je nach Fall im Trigger (Serverseitig):

_handle = [0] execVM "spawn_enemy.sqf";

0 steht für den Case den du beim Scriptaufruf ansteuerst

*/
private ["_with_groups","_group_position","_group_radius","_group_num","_group_units","_group_types","_group_behaviour","_group_combat","_with_vehicles","_vehicle_position",
         "_vehicle_radius","_vehicle_num","_vehicle_type","_vehicle_location","_vehicle_night_mode","_vehicle_behaviour","_vehicle_combat"];
params ["_idx"];


switch(_idx)do
{
  case 0:{
            // Gruppeneinstellungen_____________________________________________________________________________________________________________
            _with_groups = true;                     //spawne Gruppen true/false

            _group_position = ;                      //kannst du eine Position auslesen oder (getMarkerPos "DEINMARKERNAME") eintragen
            _group_radius = 200;                     //einen Durchmesser in was für einen Umkreis gespawnt werden soll in Meter
            _group_num = 10;                         // Anzahl der Gruppen
            _group_units = 4;                        //Anzahl der Soldaten in einer Gruppe

            _group_types = "NORMAL_UNITS";           // Typen der Einheiten (je nach Fraktion vorhanden):
                                                     // "NORMAL_UNITS","URBAN_UNITS","SPECIAL_UNITS","MIXED_NORMSPEC","MIXED_NORMSNIP","MIXED_ALL"

            _group_location = "MIXED";               //"AREA" - Auf dem Boden überall um dem Spawnpunkt herum
                                                     //"BORDER" - An den Grenzen des RADIUS, laufen dann zum angegeben Punkt (_group_position)
                                                     //"HOUSE" - Wenn Häuser vorhanden, in Random gewählten Häusern
                                                     //"HOUSE_TOP" - Versucht in Random Häusern die oberste Position zu wählen
                                                     //"MIXED" - Zusammensetzung von "AREA" Und "HOUSE"

            _group_behaviour = "COMBAT";              //"CARELESS", "SAFE","AWARE","COMBAT","STEALTH"
            _group_combat = "YELLOW";                 //"BLUE","GREEN","WHITE","YELLOW","RED"

            // Fahrzeugeinstellungen____________________________________________________________________________________________________________
            _with_vehicles = true;                    // spawne Fahrzeuge   true/false

            _vehicle_position = ;                     //kannst du eine Position auslesen oder (getMarkerPos "DEINMARKERNAME") eintragen
            _vehicle_radius = 200;                    //einen Durchmesser in was für einen Umkreis gespawnt werden soll in Meter
            _vehicle_num = 3;                         // Anzahl der Fahrzeuge

            _vehicle_type = "CAR";                    //Typen der Fahrzeuge (je nach Fraktion vorhanden)
                                                      //"CAR","APC","APC_AAIR","TANK","ARTY"

            _vehicle_location = "AREA";               //"AREA" - Auf random Strassen überall um dem Spawnpunkt herum
                                                      //"BORDER" - Auf den Strassen der Grenzen des RADIUS, fahren dann zum angegebenen Punkt(_vehicle_position)

            _vehicle_night_mode = false;              // NightMode - true/false eingeschaltet bleiben die Fahrzeuge am Spawnpunkt stehen um Geräusche in der Nacht zu vermeiden

            _vehicle_behaviour = "COMBAT";            //"CARELESS", "SAFE","AWARE","COMBAT","STEALTH"
            _vehicle_combat = "YELLOW";               //"BLUE","GREEN","WHITE","YELLOW","RED"


            If(_with_groups)then
            {
              //Aufruf der des Gruppenspawns
              [_group_position, _group_radius, _group_num, _group_units,_group_types,_group_location,_group_behaviour,_group_combat] call MSOT_creating_fnc_setUnits;
            };
            If(_with_vehicles)then
            {
              //Aufruf des Fahrzeugspawns
              [_vehicle_position, _vehicle_radius,_vehicle_num,_vehicle_type,_vehicle_location,_vehicle_night_mode,_vehicle_behaviour,_vehicle_combat] call MSOT_creating_fnc_setVehicles;
            };

          };
   case 1:{
              // Gruppeneinstellungen_____________________________________________________________________________________________________________
              _with_groups = true;                     //spawne Gruppen true/false

              _group_position = ;                      //kannst du eine Position auslesen oder (getMarkerPos "DEINMARKERNAME") eintragen
              _group_radius = 200;                     //einen Durchmesser in was für einen Umkreis gespawnt werden soll in Meter
              _group_num = 10;                         // Anzahl der Gruppen
              _group_units = 4;                        //Anzahl der Soldaten in einer Gruppe

              _group_types = "NORMAL_UNITS";           // Typen der Einheiten (je nach Fraktion vorhanden):
                                              // "NORMAL_UNITS","URBAN_UNITS","SPECIAL_UNITS","MIXED_NORMSPEC","MIXED_NORMSNIP","MIXED_ALL"

              _group_location = "MIXED";               //"AREA" - Auf dem Boden überall um dem Spawnpunkt herum
                                              //"BORDER" - An den Grenzen des RADIUS, laufen dann zum angegeben Punkt (_group_position)
                                              //"HOUSE" - Wenn Häuser vorhanden, in Random gewählten Häusern
                                              //"HOUSE_TOP" - Versucht in Random Häusern die oberste Position zu wählen
                                              //"MIXED" - Zusammensetzung von "AREA" Und "HOUSE"

              _group_behaviour = "COMBAT";              //"CARELESS", "SAFE","AWARE","COMBAT","STEALTH"
              _group_combat = "YELLOW";                 //"BLUE","GREEN","WHITE","YELLOW","RED"

              // Fahrzeugeinstellungen____________________________________________________________________________________________________________
              _with_vehicles = true;                    // spawne Fahrzeuge   true/false

              _vehicle_position = ;                     //kannst du eine Position auslesen oder (getMarkerPos "DEINMARKERNAME") eintragen
              _vehicle_radius = 200;                    //einen Durchmesser in was für einen Umkreis gespawnt werden soll in Meter
              _vehicle_num = 3;                         // Anzahl der Fahrzeuge

              _vehicle_type = "CAR";                    //Typen der Fahrzeuge (je nach Fraktion vorhanden)
                                               //"CAR","APC","APC_AAIR","TANK","ARTY"

              _vehicle_location = "AREA";               //"AREA" - Auf random Strassen überall um dem Spawnpunkt herum
                                               //"BORDER" - Auf den Strassen der Grenzen des RADIUS, fahren dann zum angegebenen Punkt(_vehicle_position)

              _vehicle_night_mode = false;              // NightMode - true/false eingeschaltet bleiben die Fahrzeuge am Spawnpunkt stehen um Geräusche in der Nacht zu vermeiden

              _vehicle_behaviour = "COMBAT";            //"CARELESS", "SAFE","AWARE","COMBAT","STEALTH"
              _vehicle_combat = "YELLOW";               //"BLUE","GREEN","WHITE","YELLOW","RED"


              If(_with_groups)then
              {
                //Aufruf der des Gruppenspawns
                [_group_position, _group_radius, _group_num, _group_units,_group_types,_group_location,_group_behaviour,_group_combat] call MSOT_creating_fnc_setUnits;
              };
              If(_with_vehicles)then
              {
                //Aufruf des Fahrzeugspawns
                [_vehicle_position, _vehicle_radius,_vehicle_num,_vehicle_type,_vehicle_location,_vehicle_night_mode,_vehicle_behaviour,_vehicle_combat] call MSOT_creating_fnc_setVehicles;
              };

          };
   case 2:{
              //Inhalt kann von den vorhergehenden Cases reinkopiert und angepasst werden

          };
   case 3:{
              //Inhalt kann von den vorhergehenden Cases reinkopiert und angepasst werden
          };
};
