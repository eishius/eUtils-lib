// Nw Utils

// Util: NWInt
function eUtils:setNWInt( k, v )
    if k == nil or v == nil then return end 
    return self:SetNWInt(k, v)
end 

function eUtils:getNWInt( k, f )
    if k == nil or f == nil then return end 
    return self:GetNWInt(k, f)
end

// Util: NWBool
function eUtils:setNWBool( k, v )
    if k == nil or v == nil then return end 
    return self:SetNWBool(k, v)
end 

function eUtils:getNWBool( k, f )
    if k == nil or f == nil then return end 
    return self:GetNWBool(k, f)
end

// Util: NwString
function eUtils:setNWString( k, v )
    if k == nil or v == nil then return end 
    return self:SetNWString(k, v)
end 

function eUtils:getNWString( k, f )
    if k == nil or f == nil then return end 
    return self:GetNWString(k, f)
end

// Util: NWFloat
function eUtils:setNWFloat( k, v )
    if k == nil or v == nil then return end 
    return self:SetNWFloat(k, v)
end 

function eUtils:getNWFloat( k, f )
    if k == nil or f == nil then return end 
    return self:GetNWFloat(k, f)
end

// Util: NWAngle
function eUtils:setNWAngle( k, v )
    if k == nil or v == nil then return end 
    return self:SetNWAngle(k, v)
end 

function eUtils:getNWAngle( k, f )
    if k == nil or f == nil then return end 
    return self:GetNWAngle(k, f)
end

// Util: NwAmount 
function eUtils:nwInt( a, k, v )
    return self:getNWInt( k, v ) >= a and true or false
end 

// Util: nwBool 
function eUtils:nwBool( b, k, f )
    return self:getNWBool(k, f) >= b and true or false 
end 


// Util: nwString
function eUtils:nwString( str, k, f )
    return self:getNWBool(k, f) >= str and "" or tostring( str )
end 

// Util: nwFloat
function eUtils:nwFloat( float, k, f )
    return self:getNWFloat(k, f) >= float and true or false 
end 

// Util: nwAngle
function eUtils:nwAngle( ang, k, f )
    return self:getNWAngle(k, f) >= ang and Angle(ang, ang, ang) or Angle(0, 0, 0)
end 

// Player Utils

// Util: getPlayerIP 
function eUtils.getPlayerIP()
    return self:IPAddress() or string.sub( tostring( self:IPAddress() ), 1, string.find( tostring( self:IPAddress() ), ":", 1) )
end 

// Util: getPlayer32Bit
function eUtils.getPlayer32Bit()
    return self:SteamID() and string.Replace( self:SteamID(), ":", "_") or string.lower( string.Replace( self:SteamID(), ":", "_") )
end

// Util: getPlayer64Bit
function eUtils.getPlayer32Bit()
    return self:SteamID64()
end

// Util: getPlayerName()
function eUtils.getPlayerName()
    return self:Name()
end 

// Util: getPlayerNick()
function eUtils.getPlayerNick()
    return self:Nick()
end 

// Util: getPlayerRank()
function Utils.getPlayerRank()
    return self:GetUserGroup()
end

// Util: getPlayerOwnerID
function eUtils.getPlayerOwnerID( sid )
    return self:OwnerSteamID64()
end 

// Util: getPlayerLink()
function eUtils.getPlayerLink()
    local str = ""
    str = str .. "https://steamcommunity.com/id/" .. self:SteamID64() .. "/"
    return str
end 
