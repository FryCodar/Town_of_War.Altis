#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_curator_fnc_setCuratorEvent

Description: Add EventHandler to Curators for send Ownership to Server.

Parameters:

Returns: Nothing

Examples:
            call MSOT_curator_fnc_setCuratorEvent

Author: Fry

----------------------------------------------------------------------------------------------------------------- */

If(count allCurators > 0)then
{
  diag_log "CURATOR_EVENT: START EVENTHANDLER ATTACHING";
  {_x addEventHandler ["CuratorGroupPlaced",{REMOTE_TRIEXESM(_this,curator,setGroupAttribute,0);}];}forEach allCurators;
};
