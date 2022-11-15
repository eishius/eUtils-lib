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
