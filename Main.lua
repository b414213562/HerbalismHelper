import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Lotro";

import "CubePlugins.HerbalismHelper.GeneralFunctions";
import "CubePlugins.HerbalismHelper.Flora";


--[[

Design notes:
Pay attention to target
If target has the name of one of the herbalism flowers,
    Show window with expected flower output

]]

SelectedTargetName = nil;

LocalPlayer = Turbine.Gameplay.LocalPlayer.GetInstance();
LocalPlayer.TargetChanged = function(sender, args)
    local target = LocalPlayer:GetTarget();

    if (target) then
        SelectedTargetName = target:GetName();
        local herb = HerbalismFloraLookup[SelectedTargetName];
        if (herb) then
            local output = FloraYieldsToString(HerbalismFlora[herb]);
            Debug(output);
        end
    else
        SelectedTargetName = nil;
    end
end
