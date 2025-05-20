
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

    local phialsControl = Turbine.UI.Control();
    phialsControl:SetParent(self);
    phialsControl:SetSize(
        self:GetWidth() - self.leftMargin - self.rightMargin,
        self:GetHeight() - self.topMargin - self.bottomMargin);
    phialsControl:SetPosition(self.leftMargin, self.topMargin);

end

function TargetWindow:ShowLoot(herb)
    if (not herb) then
        self:SetVisible(false);
        return;
    end

    -- Clear the current display:

    -- Populate the window's display:

    -- Now that everything is ready, show the window:
    self:SetVisible(true);
end
