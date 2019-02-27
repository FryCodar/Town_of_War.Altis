If(!hasInterface) exitWith {};
#include "msot_components.hpp"

private _ctrl = {
                 switch(true)do
                 {
                   case ((player getVariable ["ACE_isUnconscious", false])):{
                                                                              while{count (uiNamespace getVariable ['msot_dlg',[]]) > 0}do{closeDialog ((uiNamespace getVariable ['msot_dlg',[]]) select 0);};
                                                                              [(format["%1_msot_artillery_dlg",name player]),"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
                                                                            };
                   case (!alive player):{
                                          while{count (uiNamespace getVariable ['msot_dlg',[]]) > 0}do{closeDialog ((uiNamespace getVariable ['msot_dlg',[]]) select 0);};
                                          [(format["%1_msot_artillery_dlg",name player]),"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
                                        };
                   case (count (uiNamespace getVariable ['msot_dlg',[]]) == 0):{[(format["%1_msot_artillery_dlg",name player]),"onEachFrame"] call BIS_fnc_removeStackedEventHandler;};
                 };
                };

[(format["%1_msot_artillery_dlg",name player]),"onEachFrame",_ctrl] call BIS_fnc_addStackedEventHandler;
