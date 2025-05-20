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

LocalPlayer = Turbine.Gameplay.LocalPlayer.GetInstance();
LocalPlayer.TargetChanged = function(sender, args)
    HandleTargetChanged();
end

function HandleTargetChanged()
    local target = LocalPlayer:GetTarget();

    if (target) then
        local herb = HerbalismFloraLookup[target:GetName()];
        if (herb) then
            local output = FloraYieldsToString(HerbalismFlora[herb]);
            Debug(output);
        end
    end
end

-- Do plugin startup things:
function Main()
    HandleTargetChanged();

end
Main();
