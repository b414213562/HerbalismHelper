import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Lotro";
import "CubePlugins.HerbalismHelper.TurbineFiles.Class";

import "CubePlugins.HerbalismHelper.Strings";
import "CubePlugins.HerbalismHelper.GeneralFunctions";
import "CubePlugins.HerbalismHelper.Flora";

import "CubePlugins.HerbalismHelper.Images";
import "CubePlugins.HerbalismHelper.TargetWindow";

LocalPlayer = Turbine.Gameplay.LocalPlayer.GetInstance();

function RegisterTargetChanged()
    LocalPlayer.TargetChanged = function(sender, args)
        HandleTargetChanged();
    end
end

function HandleTargetChanged()
    local target = LocalPlayer:GetTarget();

    local herb = nil;
    if (target) then
        herb = HerbalismFloraLookup[target:GetName()];
    end
    HandleHerbTarget(herb);
end

function HandleHerbTarget(herb)
    TargetWindow.GetInstance():ShowLoot(herb);

    if (herb) then
        local output = FloraYieldsToString(HerbalismFlora[herb]);
        Debug(output);
    end
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
