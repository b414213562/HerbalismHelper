local lang = Turbine.Engine.GetLanguage();

_LANG = {

};

if (lang == Turbine.Language.French) then
    _LANG["FATEFUL_TOOLKIT"] = "Boîte à outils fatidique";
elseif (lang == Turbine.Language.German) then
    _LANG["FATEFUL_TOOLKIT"] = "Schicksalhafter Werkzeugsatz";
else -- default to English
    _LANG["FATEFUL_TOOLKIT"] = "Fateful Toolkit";
end

-- Russian values:
-- _LANG["FATEFUL_TOOLKIT"] = "Роковой набор инструментов";