
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

    if (not DebugOutput) then
        return;
    end

    Turbine.Shell.WriteLine("<rgb=#FF5555>" .. message .. "</rgb>");
end
