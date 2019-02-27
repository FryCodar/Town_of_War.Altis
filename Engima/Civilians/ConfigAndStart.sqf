/*
 * This file contains config parameters and a function call to start the civilian script.
 * The parameters in this file may be edited by the mission developer.
 *
 * See file Engima\Civilians\Documentation.txt for documentation and a full reference of
 * how to customize and use Engima's Civilians.
 */

private ["_parameters"];

// Set civilian parameters.
_parameters = [
	["UNIT_CLASSES", MSOT_CIVMEN],
	["UNITS_PER_BUILDING", 0.1],
	["MAX_GROUPS_COUNT", 15],
	["MIN_SPAWN_DISTANCE", 50],
	["MAX_SPAWN_DISTANCE", 500],
	["BLACKLIST_MARKERS", []],
	["HIDE_BLACKLIST_MARKERS", true],
	["ON_UNIT_SPAWNED_CALLBACK", {removeAllAssignedItems (_this select 0);}],
	["ON_UNIT_REMOVE_CALLBACK", { true }],
	["DEBUG", false]
];

// Start the script
_parameters spawn ENGIMA_CIVILIANS_StartCivilians;
