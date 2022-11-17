// Copyright (c) 2022
eUtils = eUtils or {}
eUtils.Version = "1.3.4"
eUtils.Debug = false
eUtils.Experimental = false
if CLIENT then return end 

// Version Checker
hook.Add("Think", "Version.Think", function()
    hook.Remove("Think", "Version.Think") 
    local url = "https://raw.githubusercontent.com/eishius/eUtils-lib/main/Version"
    http.Fetch(url, function( b )
        if eUtils.Version ~= string.Trim( b ) then 
            local r = Color(192, 27, 27)
            local w = color_white
            MsgC(w, "[", r, "Eishius Utils", w, "] There is an update available at: https://github.com/eishius/eUtils-lib/releases\n" )
            MsgC(w, "[", r, "Eishius Utils", w, "] Your version: " .. eUtils.Version .. "\n")
            MsgC(w, "[", r, "Eishius Utils", w, "] New version: " .. b .. "\n")
            return 
        end
    end)
end)