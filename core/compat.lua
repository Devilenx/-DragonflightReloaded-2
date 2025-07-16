-- Dragonflight Reloaded 3.3.5 Compatibility Layer
-- Removed legacy ShaguTweaks compatibility code for proper Wrath operation

setfenv(1, DFRL:GetEnv())
debugprint("COMPAT 3.3.5 - Initializing")

--=================
-- WOW 3.3.5 COMPATIBILITY FIXES  
--=================
local CompatSetup = {
    initialized = false
}

function CompatSetup:FixAPI()
    -- Ensure proper 3.3.5 API compatibility
    debugprint("CompatSetup:FixAPI - Applying 3.3.5 fixes")
    
    -- Fix any remaining global namespace issues
    if not _G.geterrorhandler then
        _G.geterrorhandler = function() return function(err) DEFAULT_CHAT_FRAME:AddMessage("Error: " .. tostring(err)) end end
    end
    
    self.initialized = true
    debugprint("CompatSetup:FixAPI - 3.3.5 compatibility applied")
end

function CompatSetup:Init()
    if not self.initialized then
        self:FixAPI()
        debugprint("CompatSetup:Init - Compatibility layer initialized")
    end
end

-- Initialize compatibility layer
CompatSetup:Init()

debugprint("COMPAT 3.3.5 - Complete")