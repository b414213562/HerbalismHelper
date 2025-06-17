if (Turbine.Engine.GetLanguage() ~= Turbine.Language.English) then return; end

FATEFUL_TOOLKIT = "Fateful Toolkit";
OPTIONS = {
    SCALING = "Scaling: %.2fx";
};
STATUS = {
    LOADED = "Loaded " .. string.format("'%s' v%s, by Cube", plugin:GetName(), plugin:GetVersion());
    UNLOADED = string.format("'%s' unloaded", plugin:GetName());
};
