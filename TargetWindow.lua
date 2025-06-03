
TargetWindow = class(Turbine.UI.Window);
TargetWindow.instance = nil;

function TargetWindow.GetInstance()
    if (TargetWindow.instance ~= nil) then
        return TargetWindow.instance;
    end
    return TargetWindow();
end

function TargetWindow:Constructor()
    -- Enforce only one such window:
    if (TargetWindow.instance) then
        return;
    end
    Turbine.UI.Window.Constructor(self);
    TargetWindow.instance = self;

    -- other initialization here:
    self:SetSize(314, 80);
    self:SetPosition(557, 150);
    self:SetBackground(_IMAGES.TARGET_WINDOW_BACKGROUND);
    self.leftMargin = 11;
    self.topMargin = 9;
    self.rightMargin = 11;
    self.bottomMargin = 9;

    self.UsedOpacity = 1.0;
    self.UnusedOpacity = 0.25;

    local phialsControl = Turbine.UI.Control();
    phialsControl:SetParent(self);
    phialsControl:SetSize(
        self:GetWidth() - self.leftMargin - self.rightMargin,
        self:GetHeight() - self.topMargin - self.bottomMargin);
    phialsControl:SetPosition(self.leftMargin, self.topMargin);

    -- Create all 5 phials here: (Crimson, Umber, Verdant, Golden, Violet).
    local iconWidth = 32;
    local iconHeight = 32;
    local iconLeftMargin = 5;
    local textTopMargin = 5;
    local expectedMinMaxWidth = 100;

    -- Opacity needs to be 25% or less to be obviously opaque. 
    -- It was hard to tell the difference for 60%+ or higher.
    local phialIcons = {};
    local phialTexts = {};
    for phial = PHIAL_CRIMSON, PHIAL_VIOLET do
        local phialZeroIndexed = phial - 1;
        local left = (phialZeroIndexed) * (iconWidth + iconLeftMargin)
        if (phial > PHIAL_VERDANT) then left = left + 25; end

        local icon = Turbine.UI.Window();
        icon:SetParent(phialsControl);
        icon:SetSize(iconWidth, iconHeight);
        icon:SetBackground(HerbIcons[phial]);
        icon:SetLeft(left);
        icon:SetVisible(true);
        phialIcons[phial] = icon;

        local text = Turbine.UI.Label();
        text:SetParent(phialsControl);
        text:SetVisible(false);
        text:SetWidth(iconWidth);
        text:SetPosition(left, iconHeight + textTopMargin);
        text:SetTextAlignment(Turbine.UI.ContentAlignment.TopCenter);
        phialTexts[phial] = text;
    end
    self.PhialIcons = phialIcons;
    self.PhialTexts = phialTexts;

    local expectedMinMaxText = Turbine.UI.Label();
    expectedMinMaxText:SetParent(phialsControl);
    expectedMinMaxText:SetVisible(false);
    expectedMinMaxText:SetWidth(expectedMinMaxWidth);
    expectedMinMaxText:SetPosition(self.PhialIcons[PHIAL_VIOLET]:GetLeft() + iconWidth + 0, iconHeight + textTopMargin);
    self.ExpectedMinMaxText = expectedMinMaxText;

end

function TargetWindow:ShowLoot(herb)
    if (not herb) then
        self:SetVisible(false);
        return;
    end

    -- Clear the current display:
    for phial = PHIAL_CRIMSON, PHIAL_VIOLET do
        self.PhialIcons[phial]:SetOpacity(self.UnusedOpacity);
        self.PhialTexts[phial]:SetVisible(false);
    end

    -- Populate the window's display:
    local isFatefulToolkitEquipped = IsFatefulToolkitEquipped();

    local flora = HerbalismFlora[herb];
    for key, value in ipairs(flora.YIELDS) do
        local phial = value.PHIAL;
        self.PhialIcons[phial]:SetOpacity(self.UsedOpacity);
        self.PhialTexts[phial]:SetVisible(true);

        -- Generate the count for the phial:
        local count = "";
        if (value.MIN == value.MAX) then
            if (isFatefulToolkitEquipped) then
                count = tostring(value.MIN + 1);
            else
                count = tostring(value.MIN);
            end
        else
            if (isFatefulToolkitEquipped) then
                if (value.MIN == 0) then
                    count = value.MIN .. "-" .. (value.MAX + 1);
                else
                    count = (value.MIN + 1) .. "-" .. (value.MAX + 1);
                end
            else
                count = value.MIN .. "-" .. value.MAX;
            end
        end

        self.PhialTexts[phial]:SetText(count);
    end

    -- Generate the expected min/max, if present:
    local expectedMinMax = nil;
    if (#flora.YIELDS > 1) then
        local min = flora.YIELDS.MIN;
        local max = flora.YIELDS.MAX;

        if (isFatefulToolkitEquipped) then
            min = min + 1;
            max = max + #flora.YIELDS;
        end
        if (min == max) then
            expectedMinMax = " (" .. min  .. " total)";
        else
            expectedMinMax = " (" .. min .. "-" .. max .. " total)";
        end
    end
    if (expectedMinMax) then
        self.ExpectedMinMaxText:SetText(expectedMinMax);
        self.ExpectedMinMaxText:SetVisible(true);
    else
        self.ExpectedMinMaxText:SetVisible(false);
    end

    -- Now that everything is ready, show the window:
    self:SetVisible(true);
end
