import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Lotro";

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
            local output = SelectedTargetName .. ": " .. HerbalismFlora[herb]["YIELDS"];
            Debug(output);
        end
    else
        SelectedTargetName = nil;
    end
end


-- Basic debug function to look at a table:
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function Debug(message)
    if (not message) then
        return;
    end

    Turbine.Shell.WriteLine("<rgb=#FF5555>" .. message .. "</rgb>");
end
