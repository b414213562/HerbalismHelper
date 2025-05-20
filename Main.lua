import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Lotro";

import "CubePlugins.HerbalismHelper.GeneralFunctions";
import "CubePlugins.HerbalismHelper.Flora";

LocalPlayer = Turbine.Gameplay.LocalPlayer.GetInstance();

function RegisterTargetChanged()
    LocalPlayer.TargetChanged = function(sender, args)
        HandleTargetChanged();
    end
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
    RegisterTargetChanged();
    HandleTargetChanged();

end
Main();
