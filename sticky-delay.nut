function PlayerThink() {
    if (NetProps.GetPropInt(self, "m_lifeState") != 0) {
        return 1.0;
    }

    local secondary = NetProps.GetPropEntityArray(self, "m_hMyWeapons", 1);
    if (secondary == null) {
        return 1.0;
    }

    if (secondary.GetClassname() != "tf_weapon_pipebomblauncher") {
        return 1.0;
    }

    if (secondary == self.GetActiveWeapon()) {
        return -1;
    }

    if (NetProps.GetPropInt(self, "m_nButtons") & Constants.FButtons.IN_ATTACK2) {
        secondary.SecondaryAttack();
    }

    return -1;
}

AddThinkToEnt(GetListenServerHost(), "PlayerThink");
