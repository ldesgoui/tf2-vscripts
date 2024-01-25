const BUILDING_DISPENSER = 0;
const BUILDING_SENTRY = 2;

function OnGameEvent_player_builtobject(params) {
    if (params.object == BUILDING_DISPENSER || params.object == BUILDING_SENTRY) {
        local building = EntIndexToHScript(params.index);
        printl("SetSolidToPlayer(1) " + building);
        EntFireByHandle(building, "SetSolidToPlayer", "1", -1, null, null);
    }
}

__CollectGameEventCallbacks(this);
