// Exmaple: getSteamID
function exmaple( p, d )
    if ! IsValid( p ) then return end 
    if d == "" then return end 
    local f = eUtils:getSteamID()
    return f(true, d) // Returns the sid formated to steam_0_0_111111
end 

function exmaple2( p, d )
    if ! IsValid( p ) then return end 
    if d == "" then return end 
    local f = eUtils:getSteamID()
    return f(false, d) // Returns the d formated to steam_0_0_111111
end 

// Example: getSteamID64
function exmaple( p, id )
    if !IsValid( p ) or !p:IsPlayer() then return end 
    if id == "" then return end 
    local f = eUtils:getSteamID64(id)
    return f
end 

// Example: getName
function exmaple( p, t )
    if !IsValid( p ) or !p:IsPlayer() then return end 
    if t == "" then return end 
    t.name = eUtils:getName() 
    return t.name
end 

// Example: getIPAddress
 function exmaple( p, ip )
    if !IsValid( p ) or !p:IsPlayer() then return end 
    if ip == "" then return end 
    ip = eUtils:getIPAddress(true, ip) 
    return ip 
end

function exmaple( p, ip )
    if !IsValid( p ) or !p:IsPlayer() then return end 
    if ip == "" then return end 
    ip = eUtils:getIPAddress(false, ip) 
    return ip 
end

// Example: getRandomStr
function exmaple( str )
    if str == "" then return end 
    str = eUtils:getRandomStr( math.random( 5, 10 ) )
    return str 
end 

// Example: getRandomI 
function exmaple( i )
    if i == 0 then return end 
    i = eUtils:getRandomI( math.random( 1, 10 ) )
    return i 
end 

// Example: tableCopy 

function exmaple( table )
    if table == "" then return end 
    local tableToCopy = {}
    table = eUtils:tableCopy(tableToCopy)
    return table 
end 

// Example: getCurrentOs

function exmaple( os )
    if !IsValid( p ) then return end 
    if os == "" then return end 
    local c = eUtils:getCurrentOs(os)
    return c
end 

// Example: getTableKey
function exmaple( t, k )
    if t == "" then return end
    return eUtils:getTableKey( t )
end 

// Example: printTable 
function example( t )
    if t == "" then return end 
    t = t or {}
    t["nerd"] = "name"
    eUtils:printTable( t )
end 


