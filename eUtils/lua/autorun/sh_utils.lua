// Copyright (c) 2022
eUtils = eUtils or {}
eUtils.Version = "1.0.2"
eUtils.Debug = false
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


// Meta table
local pMeta = FindMetaTable("Player")

function eUtils:getSteamID( b, k ) // Supports formats
    if b == true then 
        local a = string.lower( k )
        a = string.Replace( a, ":", "_" ) -- supports steamid32
        return a
    elseif b == false and !a then 
        return pMeta:SteamID()
    else
        return pMeta:SteamID()
    end 
end 

function eUtils:getSteamID64()
    return pMeta:SteamID64
end 

function eUtils:getName()
    return pMeta:Name() 
end 

function eUtils:getIPAddress( b, ip ) // Formats ip for you if you need it
    if b == true and ip != "" then 
        local n = tostring(ip)
        local p = string.find(n, ":", 1)
        n = string.sub(n, 1, p)
        return n
    elseif n == false and ip != "" then 
        return pMeta:IPAddress()
    end 
end 

function eUtils:getRandomStr( l ) 
    local str = ""
    for i = 1, l do 
        local char = math.random(1, 3)
        if ( char == 1) then 
            str = str .. string.char( math.random(65, 90) )
        else 
            if ( char == 2 ) then
				str = str .. string.char( math.random(97,122) )
			else
				str = str .. string.char( math.random(49,57) )
			end        
        end 
    end 
    return str 
end 

function eUtils:getRandomI( l ) // Yes it it copy pasted from getRandomstr kys 
    local str = ""
    for i = 1, l do 
        local n = math.random(1, 3)
        if ( n == 1 ) then 
            str = str .. math.random(1, 999)
        else 
            if ( n == 2 )
                str = str .. math.random(os.time(), 9999)
            else
                str = str .. math.random( os.time() + system.UpTime() + 1, 99999)
            end
        end 
    end 
    return str 
end 

function eUtils:tableCopy(t, lt)
    if (t == nil) then return end 
    local c = {}
    debug.setmetatable( c, debug.getmetatable(t, lt) )
    for i, v in pairs( t ) do 
        if ( !istable( v ) ) then 
            c[i] = v 
        else 
            lt = lt or {}
            lt[i] = c 
            if lt[v] then 
                c[i] = lt[v]
            else 
                c[i] = eUtils:tableCopy(v, lt)
            end 
        end 
    end 
    return c 
end 

function eUtils:getCurrentOs( os )
    local w,l,m = system.IsWindows(), system.IsLinux(), system.IsOSX()  
    if ( os == "windows" ) then 
        return w 
    else
        if ( os == "linux" ) then 
            return l   
        else 
            if ( os == "mac") then 
                return m 
            else 
                os = "bad os"
                return os
            end 
        end 
    end 
end 

function eUtils:getTableKey( tab )
    local t = {}
    local i = 1 

    for k, v in pairs( tab ) do 
        t[i] = k
        i = i + 1 
    end 
    return t 
end

function eUtils:printTable(t, ind, done)
    done = done or {}
    ind = ind or 0
    local keys = getTableKey( t )

    table.sort( keys , function( a, b) 
        if ( isnumber( a ) && isnumber( b ) ) then return a < b end
		return tostring( a ) < tostring( b )
    end)

    for i = 1, #keys do
		local key = keys[i]
		local v = t[key]
		Msg( string.rep( "\t", ind ) )
		if  ( istable( v ) && !done[v] ) then
			done[v] = true
			Msg( tostring( key ) .. ":" .. "\n" )
			PrintTable ( v, ind + 2, done )
			done[value] = nil
		else
			Msg( tostring( key ) .. "\t=\t" )
			Msg( tostring( v ) .. "\n" )
		end
	end
end 

function eUtils:versionChecker( version, url, releases )
    local t = {}
    t.url = url 
    t.version = version 
    if version == "" or t.version != version then return end
    if release == "" then return end 
    if t.url == "" or !string.StartWith(t.url, "https://") then return end 
    http.Fetch(t.url, function( b )
        if t.version ~= string.Trim( b ) then 
            local r = Color(192, 27, 27)
            local w = color_white
            MsgC(w, "[", r, "Eishius Utils", w, "] There is an update available at:" .. releases .. "\n" )
            MsgC(w, "[", r, "Eishius Utils", w, "] Your version: " .. eUtils.Version .. "\n")
            MsgC(w, "[", r, "Eishius Utils", w, "] New version: " .. b .. "\n")
            return 
        end 
    end)
end

function eUtils:dataSave(id, path, name, data, bool)
    local a = eUtils:getSteamID(true, self:SteamID())
    path = (path or "eUtils")
    file.CreateDir( path )
    file.CreateDir( path .. "/" .. a  )
    path = ( path .. "/" .. a .. "/" )
    path = ( path .. name .. ".dat" )
    file.Write( path, ( bool and util.TableToJSON( data, true ) or data ) )
end 

function eUtils:dataLoad( id, path, name, bool )
    local a = eUtils:getSteamID(true, self:SteamID())
    path = ( path or "eUtils" )
    path = ( path .. "/" .. a .. "/" )
    path = ( path .. name .. ".dat" )
    if file.Exists( path, "DATA" ) then
        local r = file.Read( path, "DATA" )
        return ( bool and util.JSONToTable( r ) or r )
    end
    return false
end 

// Debug eUtils
if eUtils.Debug == true then 
    function eUtils:playerConnect( folder, save, n, ip )
        local nIp = tostring( ip )
        if nIp != ip then return end
        for k, v in pairs( players ) do
            if i == 0 then return end 
            n = v:Name()
            nIp = string.sub(nIp, 1, string.find(nIp, ":", 1))
            i = i + 1 
            local str = ""
            str = str .. " [ " .. i .. " ] [ " .. nip .. " ] [ " .. n .. " ] " 
            if save == true then 
                timer.Simple(0.5,  dataSave( id, folder, str, true ))
            else 
                save = false 
                return save 
            end 
            return 
        end 
    end 

    function eUtils:getChance()
        local c = 0
        c = c + 1
        for i = 1, 100 do 
            if c >= 1 then 
                c = math.Rand(math.random(c, 5), 100)
            else
                if c > 50 then 
                    c = math.Rand(math.random(1, c), 100) 
                else 
                    c = math.Rand(math.random(c, 15), 100)
                end 
            end 
            return c
        end 
        return c or 0 
    end 
    
    // playerConnect("eishius", ip, true)
    if SERVER then 
        hook.Add("PlayerConnect", "eUtils:PlayerConnect", eUtils:playerConnect)
    elseif CLIENT then
        hook.Add("PlayerConnect", "eUtils:PlayerConnect", eUtils:playerConnect)
    end 
end