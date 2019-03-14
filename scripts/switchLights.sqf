If(isMultiplayer)then{If(!isServer)exitWith{};};
params ["_object","_range"];

private _normal_lights = ["Lamps_base_F","PowerLines_base_F","PowerLines_Small_base_F"];
private _spec_lights = ["Land_PortableHelipadLight_01_F","Land_runway_edgelight","Land_NavigLight"];

private _pos = switch(typeName _object)do
               {
                 case "OBJECT":{(position _object)};
                 case "ARRAY":{_object};
                 case "STRING":{(getMarkerPos _object)};
               };
{
  _x setHit ["light_1_hitpoint", 0.97];
  _x setHit ["light_2_hitpoint", 0.97];
  _x setHit ["light_3_hitpoint", 0.97];
  _x setHit ["light_4_hitpoint", 0.97];
}forEach nearestObjects [_pos,_normal_lights,_range];
{
  _x setDamage 1;
}forEach nearestObjects [_pos,_spec_lights,_range];
