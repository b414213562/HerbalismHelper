
SettingsDataScope = Turbine.DataScope.Character;
SettingsFilename = "HerbalismHelper_Settings";

function LoadSettings()
    local loadedSettings = Turbine.PluginData.Load(SettingsDataScope, SettingsFilename);

    -- did we load something good?
    if (type(loadedSettings) == 'table') then
        SETTINGS = loadedSettings;
    else
        SETTINGS = DEFAULT_SETTINGS
    end

end

function SaveSettings()
    Turbine.PluginData.Save(SettingsDataScope, SettingsFilename, SETTINGS);
end

DEFAULT_SETTINGS = {
    OPPONENT_VITALS_WINDOW = {
        LEFT = "550";
        TOP = "150";
        SCALING = "100"; -- Represents a percent. Can be between 40 and 300.
    }

};
