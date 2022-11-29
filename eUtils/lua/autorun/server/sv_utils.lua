function eUtils:dataSave(id, path, name, data, bool)
    local a = eUtils.getPlayer32Bit( true )
    path = (path or "eUtils")
    file.CreateDir( path )
    file.CreateDir( path .. "/" .. a  )
    path = ( path .. "/" .. a .. "/" )
    path = ( path .. name .. ".dat" )
    file.Write( path, ( bool and util.TableToJSON( data, true ) or data ) )
end 

function eUtils:dataLoad( id, path, name, bool )
    local a = eUtils.getPlayer32Bit( true )
    path = ( path or "eUtils" )
    path = ( path .. "/" .. a .. "/" )
    path = ( path .. name .. ".dat" )
    if file.Exists( path, "DATA" ) then
        local r = file.Read( path, "DATA" )
        return ( bool and util.JSONToTable( r ) or r )
    end
    return false
end 


// Functional 
function eUtils:receiveData( d )
    local t = d 
    return t[k or ""] or false
end

function eUtils:setupServer( ip )
    if ip == "" or ip == nil then return end 
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

function eUtils:getAllIPAddress()
    for k, v in pairs( player.GetAll() ) do 
        if v:IsBot() then return "BOT" end 
        return v:IPAddress() 
    end 
end

function eUtils:getAllSteamID()
    for k, v in pairs( player.GetAll() ) do
        if v:IsBot() or !v:IsPlayer() then return end 
        return v:SteamID()
    end 
end 

function eUtils:getAllSteamID64()
    for k, v in pairs( player.GetAll() ) do
        if v:IsBot() or !v:IsPlayer() then return end 
        return v:SteamID64() 
    end 
end