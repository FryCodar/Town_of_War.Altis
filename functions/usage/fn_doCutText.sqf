if(!hasInterface) exitwith {};
#include "msot_components.hpp"

params ["_first_txt","_second_txt"];

cutText [(format ["<t size='2' underline='true'>%1</t>", _first_txt splitString " " joinString toString [160]]) + (format ["<t size='2.5'><br/><br/>%1</t>",_second_txt]),"BLACK OUT",1,false,true];
sleep 4;
cutText [(format ["<t size='2' underline='true'>%1</t>", _first_txt splitString " " joinString toString [160]]) + (format ["<t size='2.5'><br/><br/>%1</t>",_second_txt]),"BLACK IN",1,false,true];
