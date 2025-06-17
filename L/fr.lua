if (Turbine.Engine.GetLanguage() ~= Turbine.Language.French) then return; end

FATEFUL_TOOLKIT = "Boîte à outils fatidique";
OPTIONS = {
    SCALING = "Echelle: %.2fx";
};
STATUS = {
    LOADED = "Loaded " .. string.format("'%s' v%s, by Cube", plugin:GetName(), plugin:GetVersion());
    UNLOADED = string.format("'%s' unloaded", plugin:GetName());
};
