// Example: receiveData( d )
function sv_example( d )
    if d == "" or d == nil then return end 
    d = d .. "Data"
    return eUtils:receiveData( d )
end 

// Example: setupServer( ip )
function sv_example( ip )
    if ip == "" or ip == nil then return end 
    ip = game.GetIPAddress()
    return eUtils:setupServer( ip )
end 

// Example: formHttp( url )
function sv_example( url )
    if url == "" or url == nil then return end 
    url = "https://github.com/eishius/eUtils-lib"
    return eUtils:formHttp( url )
end 

