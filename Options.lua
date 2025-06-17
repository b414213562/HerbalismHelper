
function RegisterOptionsControl(control)
    plugin.GetOptionsPanel = function(sender, args) return control; end
end

function CreateOptionsControl()
    local options = Turbine.UI.Control();

    options:SetBackColor(Turbine.UI.Color.DarkRed);
    options:SetSize(250, 300);

    local scalingScrollbarValue = SETTINGS["OPPONENT_VITALS_WINDOW"].SCALING;
    -- Label for the scaling scrollbar
    local scalingScrollbarLabel = Turbine.UI.Label();
    scalingScrollbarLabel:SetParent(options);
    scalingScrollbarLabel:SetSize(200, 25);
    scalingScrollbarLabel:SetText(string.format(L["OPTIONS"].SCALING, scalingScrollbarValue / 100));
    scalingScrollbarLabel:SetPosition(10, 60);

    -- Scrollbar to adjust image scaling
    local scalingScrollbar = Turbine.UI.Lotro.ScrollBar();
    scalingScrollbar:SetParent(options);
    scalingScrollbar:SetOrientation(Turbine.UI.Orientation.Horizontal);
    scalingScrollbar:SetSize(200, 10);
    scalingScrollbar:SetPosition(10, 90);
    scalingScrollbar:SetMinimum(40);
    scalingScrollbar:SetMaximum(300);
    scalingScrollbar:SetValue(scalingScrollbarValue);
    scalingScrollbar.ValueChanged = function(sender, args)
        local currentValue = scalingScrollbar:GetValue();

        scalingScrollbarLabel:SetText(string.format(L["OPTIONS"].SCALING, currentValue / 100));
        SETTINGS["OPPONENT_VITALS_WINDOW"].SCALING = tostring(currentValue);
        TargetWindow.GetInstance():Redraw();
    end


    return options;
end
