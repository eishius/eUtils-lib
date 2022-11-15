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


// Example dataSave
function example( p )
    if !p:IsPlayer() or p:IsBot() then return end 
    local d = {}
    d.name = p:Name()
    d.id = p:SteamID64()
    for k, v in pairs( player.GetAll() ) do 
        eUtils:dataSave( v:SteamID(), "example_folder", d, true)
    end 
end 

// Example dataLoad
function example()
    if !self:IsPlayer() or self:IsBot() then return end 
    for k, v in pairs( player.GetAll() ) do 
       local m = eUtils:dataLoad(self:SteamID(), "example_folder", "money", true)
        return m or  self:SetNWInt("money", m)
    end 
end 

// Debug Example playerConnect 
function example()
    for k, v in pairs( player.GetAll() ) do 
        if eUtils:playerConnect( true )  then 
            eUtils:playerConnect( "example_folder", true)
        end
    end 
end 

// Debug Example getChance
function example( c )
    if c == "" then return end 
    local i = tostring( c )
    for i = 1, 10 do 
        c = eUtils:getChance( i )
        return c 
    end 
end 


// Example versionChecker 
hook.Add("Think", "example.versionChecker", function() 
    hook.Remove("Think", "example.versionChecker")
    eUtils:versionChecker("1.0.0", "https://example_version_url", "https://example_update_url")
end)

// Example: Console()
function example()
    for k, v in pairs( player.GetAll() ) do 
        eUtils:Console("Player: " .. v:Name() .. " isPlayer", "exmaple prefix", true, false, false)
        eUtils:Console("Player: " .. v:Name() .. " isPlayer", "exmaple prefix", false, true, false)
        eUtils:Console("Player: " .. v:Name() .. " isPlayer", "exmaple prefix", false, false, true)
    end
end