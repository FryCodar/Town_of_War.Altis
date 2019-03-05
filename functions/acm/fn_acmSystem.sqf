If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
["ACTIVATED","DETECTED","LEAVE","REFORCE"]

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
params[["_work_pos",[]],["_work_size",0],["_work_index","ACTIVATED"]];

private _work_datas = missionNamespace getVariable [STRVAR_DO(acm_main_pos),[]];
If(count _work_datas > 0)then
{
private _main_work_pos = (_work_datas select 0);
private _main_work_size = (_work_datas select 1);

If(count _work_pos < 1)then{_work_index = "ACTIVATED2";};






};
