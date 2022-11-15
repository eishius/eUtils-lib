eUtils.ServerTable = {}
// Experimental

// Functional 
function eUtils:receiveData( d )
    if !SERVER or (CLIENT) then return end 
    if d == "" or d == nil return end 
    local t = d 
    return t[k or ""] or false
end

function eUtils:setupServer( ip )
    if ip == "" or ip == nil then return end 
    if !SERVER or CLIENT then return end 
    local sip = tostring( ip )
    if sip then 
        local t = { name = GetHostName(), connect = "steam://connect/" .. sip, }
        return t 
    end 
    return sip 
end 

function eUtils:formHttp( url )
    if url == "" or url == nil then return end 
    if !string.StartWith(url, "https://" or "steam://" or "http://") then return end 
    return ( http.Fetch(url, function( b ) end) )
end