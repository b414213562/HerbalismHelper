import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Lotro";

import "CubePlugins.HerbalismHelper.Strings";
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
            HandleHerbTarget(herb);
        end
    end
end

function HandleHerbTarget(herb)
    local isFatefulToolkitEquipped = IsFatefulToolkitEquipped();

    local output = FloraYieldsToString(HerbalismFlora[herb], isFatefulToolkitEquipped);
    Debug(output);
end

function IsFatefulToolkitEquipped()
    local result = false;

    local equipment = LocalPlayer:GetEquipment();
    local craftTool = equipment:GetItem(Turbine.Gameplay.Equipment.CraftTool);
    if (craftTool and craftTool:GetName() == _LANG["FATEFUL_TOOLKIT"]) then
        result = true;
    end

    return result;
end

-- Do plugin startup things:
function Main()
    RegisterTargetChanged();
    HandleTargetChanged();

end
Main();
