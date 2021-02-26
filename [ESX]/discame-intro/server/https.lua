dc_intro.version = "1.0"

local function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
 end

local function process_version(data)
    local result = {}
    for line in string.gmatch(data, "[^|]+") do 
        table.insert( result, trim(line))
    end
    return result
end

PerformHttpRequest("https://raw.githubusercontent.com/363O/discame-intro/master/version", function(statusCode, data, headers)
    if (statusCode == 200) then
        local data_split = process_version(data)
        if (data_split[1] ~= dc_intro.version) then 
            print("\n[Discame Intro] Version "..data_split[1].." available (since "..data_split[2]..") !")
            print("Developper Note : "..data_split[3])
            print("Available here -> https://github.com/363O/discame-intro\n")
        else 
            print("\n[Discame Intro] Version is updated !\n") 
        end 
    else 
        print("\n[Discame Intro] Error for check update !\n")
    end 

end)
