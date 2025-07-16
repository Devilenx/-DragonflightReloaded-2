-- =================
-- ADDON VALIDATION TEST  
-- =================

DFRL:NewDefaults("Test", {
    enabled = { true },
})

DFRL:NewMod("Test", 999, function()
    debugprint("TEST MODULE - Core systems validation")
    
    -- Test database access
    local testValue = DFRL:GetTempDB("Test", "enabled")
    debugprint("TEST: Database access - " .. tostring(testValue and "PASS" or "FAIL"))
    
    -- Test slash command override
    local originalSlashHandler = SlashCmdList["DFRL"]
    
    -- Delayed registration to override the basic one
    local f = CreateFrame("Frame")
    f:SetScript("OnUpdate", function(self, elapsed)
        if DFRL.gui and DFRL.gui.Base then
            SLASH_DFRL1 = "/dfrl"
            SlashCmdList["DFRL"] = function()
                if DFRL.gui.Base.mainFrame then
                    if DFRL.gui.Base.mainFrame:IsShown() then
                        DFRL.gui.Base.mainFrame:Hide()
                        DFRL.gui.Base.titleFrame:Hide()
                    else
                        DFRL.gui.Base.mainFrame:Show()
                        DFRL.gui.Base.titleFrame:Show()
                    end
                else
                    print("GUI system not ready yet")
                end
            end
            debugprint("TEST: Slash command updated to use GUI toggle")
            self:SetScript("OnUpdate", nil)
        end
    end)
    
    debugprint("TEST MODULE - Complete")
end)
