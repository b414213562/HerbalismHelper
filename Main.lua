import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Lotro";
import "CubePlugins.HerbalismHelper.TurbineFiles.Class";

import "CubePlugins.HerbalismHelper.L.en";
import "CubePlugins.HerbalismHelper.L.de";
import "CubePlugins.HerbalismHelper.L.fr";

import "CubePlugins.HerbalismHelper.GeneralFunctions";
import "CubePlugins.HerbalismHelper.Flora";

import "CubePlugins.HerbalismHelper.Settings";
import "CubePlugins.HerbalismHelper.Options";

import "CubePlugins.HerbalismHelper.Libraries.DragBar.DragBar";
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
    if (craftTool and craftTool:GetName() == L["FATEFUL_TOOLKIT"]) then
        result = true;
    end

    return result;
end

ItemUnequippedHandler = Turbine.UI.Control();
ItemUnequippedHandler.Update = function(sender, args)
    ItemUnequippedHandler:SetWantsUpdates(false);

    HandleTargetChanged();
end

function RegisterEquipmentChanged()
    local equipment = LocalPlayer:GetEquipment();

    equipment.ItemEquipped = function(sender, args)
        if (args.Index == Turbine.Gameplay.Equipment.CraftTool) then
            HandleTargetChanged();
        end
    end

    equipment.ItemUnequipped = function(sender, args)
        if (args.Index == Turbine.Gameplay.Equipment.CraftTool) then
            ItemUnequippedHandler:SetWantsUpdates(true);
        end
    end

end

function RegisterForUnload()
    Turbine.Plugin.Unload = function(sender, args)
        SaveSettings();

        Turbine.Shell.WriteLine(L["STATUS"].UNLOADED);
    end
end

-- Do plugin startup things:
function Main()
    LoadSettings();
    RegisterForUnload();

    RegisterTargetChanged();
    RegisterEquipmentChanged();

    HandleTargetChanged();

    -- Make an options panel:
    local optionsControl = CreateOptionsControl();
    -- RegisterOptionsControl(optionsControl);

    Turbine.Shell.WriteLine(L["STATUS"].LOADED);

end
Main();
