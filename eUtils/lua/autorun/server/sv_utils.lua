eUtils.ServerTable = {}
// Experimental
if eUtils.Experimental == true then
    function eUtils:familyShare( p, sid, punish )
        if !p:IsPlayer() or p:IsBot() then return end 
        if sid == "" or sid == nil then return end 
        if punish == "" or punish == nil then return end 
        if string.upper(punsih) then return string.lower(punish) end 
        for k, v in pairs( player.GetAll() ) do 
            sid = v:SteamID() 
            local oid = v:OwnerSteamID64()
            if sid == oid then or oid == sid return end 
            if punish == "ban" then
                v:Ban("Banned.")
            elseif punish == "kick" then 
                v:Kick("Disconnected.")
            else 
                return
            end
        end
    end

    local api = {
        {"https://proxycheck.io/v2/%s?vpn=1&asn=1", "IP"},
    }

    function eUtils:getVpn( ip, data, p )
        if data:isPlayer() then 
            ip = eUtils:getIPAddress(true, data:IPAddress() )
            p = data
        else 
            ip = eUtils:getIPAddress(true, data )
        end
        url = url:format(ip, "%s", "%s", "%s")
        http.Fetch(url, function(b) 
            local tD = util.JSONToTable( b )
            if tD.status ~= "ok" then
                return PrintError("Failed to lookup ", Data..(tD.message and (" [".. tD.message .. "]["..Data.."]") or ""))
            end

            if tD[ip] == nil then
                for k,v in pairs(tD) do
                    if k ~= "status" then
                        tD = v
                        break
                    end
                end
            else
                tD = tD[ip]
            end
        end)
    end 

    function eUtils:checkPlayerVpn( p )
        return eUtils:getVpn( p )
    end 
end


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

function eUtils:getAllSteamID( b )
    for k, v in pairs( player.GetAll() ) do 
        if v:IsBot() then return "BOT" end 
        if b == true then
            local str = string.replace( tostring( string.lower(v:SteamID() ) ), ":", "_" ) 
            return str 
        else 
            return v:SteamID()
        end 
    end 
end 

function eUtils:getAllSteamID64()
    for k, v in pairs( player.GetAll() ) do
        if v:IsBot() then return "BOT" end 
        return v:SteamID64() 
    end 
end
