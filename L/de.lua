if (Turbine.Engine.GetLanguage() ~= Turbine.Language.German) then return; end

FATEFUL_TOOLKIT = "Schicksalhafter Werkzeugsatz";
OPTIONS = {
    SCALING = "Maßstab: %.2fx";
};
STATUS = {
    LOADED = "Geladen " .. string.format("'%s' v%s, by Cube", plugin:GetName(), plugin:GetVersion());
    UNLOADED = string.format("'%s' unloaded", plugin:GetName());
};
