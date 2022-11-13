## Function: getSteamID
The way this function works is take a bool so `true` or `false` and a `steamid` and if the bool is true it will return it formated to `steam_0_0_111112` if the bool is false it will return it as normal.
```lua
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

```
## Function: getSteamID64
The way this function works is it returns a player 64 bit steamid 
```lua
function exmaple( p, id )
    if !IsValid( p ) or !p:IsPlayer() then return end 
    if id == "" then return end 
    local f = eUtils:getSteamID64(id)
    return f
end 
```

## Function: getName
The way this function works is it returns the players steam name
```lua
function exmaple( p, t )
    if !IsValid( p ) or !p:IsPlayer() then return end 
    if t == "" then return end 
    t.name = eUtils:getName() 
    return t.name
end 
```

## Function: getIPAddress
The way this function works is it returns the players ip either formated or as normal
```lua
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
```
## Function: getRandomStr
The way this function works is it return a randomly made string
```lua
function exmaple( str )
    if str == "" then return end 
    str = eUtils:getRandomStr( math.random( 5, 10 ) )
    return str 
end 
```

## Function: tableCopy
The way this function works grabs a table and copys it and returns it
```lua 
function exmaple( table )
    if table == "" then return end 
    local tableToCopy = {}
    table = eUtils:tableCopy(tableToCopy)
    return table 
end 
```

## Function: getCurrentOs
The way this function works is you input an os and it checks it and returns it
```lua 
function exmaple( os )
    if !IsValid( p ) then return end 
    if os == "" then return end 
    local c = eUtils:getCurrentOs(os)
    return c
end 
```

## Function: getTableKey
The way this function works is it grabs the table and return the keys of it
```lua
function exmaple( t, k )
    if t == "" then return end
    return eUtils:getTableKey( t )
end 
```

## Function: printTable 
The way this function works is it prints tables out to the console
```lua
function example( t )
    if t == "" then return end 
    t = t or {}
    t["nerd"] = "name"
    eUtils:printTable( t )
end 

```

