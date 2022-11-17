// Data Utils

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

// Table Utils
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

function eUtils:getTableKey( tab )
    local t = {}
    local i = 1 

    for k, v in pairs( tab ) do 
        t[i] = k
        i = i + 1 
    end 
    return t 
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

// Utils: getVersion()
function eUtils.getVersion( ver )
    local str = ""
    str = str .. tostring( ver ) 
    return str
end 

// Util: checkVersion()
function eUtils.checkVersion( url )
    local http = http.Fetch(url, function( b ) end)
    if http then 
        if (eUtils.getVersion( b, url ) == b) then return end 
        return b or false
    end 
end 

// Util: Log(...)
function eUtils.Log(..., n)
    return MsgC(color_white, "[", color_white, n, color_white, "]: ", color_white, ...)
end 

// Util: Debug
function eUtils.Debug(..., n)
    return MsgC(color_white, "[", color_white, n .. " Debug", color_white, "]: ", color_white, ...)
end 

// Util: getCurrentOs()
function eUtils:getCurrentOs()
    local os = ""
    if system.IsWindows() then os = "windows" end 
    if system.IsLinux() then os = "linux" end 
    if system.IsOSX() then os = "mac" else os = "nil" end  
    return os 
end 


// Util: getRandomString()
function eUtils:getRandomString( str )
    for i = 0, 100 do 
        local char = math.random(1, 3)
        if (char) then str = str .. string.char( math.random(97, 122) ) or string.char( math.random(65, 90) ) end 
    end 
    return str 
end 

// Util: getRandomNumber()
function eUtils:getRandomNumber()
    local num = 0
    local max = 1999999999
    for i = 0, 100 do 
        if (num > max) then 
            num = max
        end 
        if (num == 0) then 
            num = math.random(i, max)
        else 
            num = math.random(num, max)
        end 
    end 
    return num 
end