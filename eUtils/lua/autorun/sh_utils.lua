// Copyright (c) 2022
eUtils = eUtils or {}
eUtils.Version = "1.0.2"
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

function getTableKey( tab )
    local t = {}
    local i = 1 

    for k, v in pairs( tab ) do 
        t[i] = k
        i = i + 1 
    end 
    return t 
end

function printTable(t, ind, done)
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
