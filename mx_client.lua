
local config = {
    ["MAP"] = "Google Map",
    ["STATUS"] = "Status",
    ["GAME"] = "Game",
    ["INFO"] = "Info",
    ["SETTINGS"] = "Settings",
    ["R*EDITOR"] = "Rockstar Editor",
    ["GALLERY"] = "Gallery"
}


function SetData()
	players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		table.insert( players, player )
end

	
	local name = GetPlayerName(PlayerId())
	local id = GetPlayerServerId(PlayerId())
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~t~MX~t~ | ~t~Discord: dsc.gg/mxthessdev~t~ | ~t~ID: ' .. id .. ' ~t~ | ~t~Name: ~t~' .. name .. " ~t~ | ~t~Players: " .. #players .. "/~w~128")
	--Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', "~o~MX~s~ | Discord : ~g~dsc.gg/mxthessdev~s~ | ID: "..id.." | ~r~".. #players .." Connected")
end

Citizen.CreateThread(function() 
	while true do
		Citizen.Wait(100)
		SetData()
	end
end)

Citizen.CreateThread(function()
    AddTextEntry("PM_PANE_LEAVE", "~r~Leave ~w~~y~City~s~ 😭")
end)

Citizen.CreateThread(function()
    AddTextEntry("PM_PANE_QUIT", "~r~Close your ~o~Eyes Forever 🐌")
end)

Citizen.CreateThread(function()
    AddTextEntry('PM_SCR_MAP', config["MAP"])
    AddTextEntry('PM_SCR_STA', config["STATUS"])
    AddTextEntry('PM_SCR_GAM', config["GAME"])
    AddTextEntry('PM_SCR_INF', config["INFO"])
    AddTextEntry('PM_SCR_SET', config["SETTINGS"])
    AddTextEntry('PM_SCR_RPL', config["R*EDITOR"])
    AddTextEntry('PM_SCR_GAL', config["GALLERY"])
end)

ReplaceHudColourWithRgba(
        117,
        21,32,43, --rgb
        255 -- alpha
)


print('^5Made By Mxthess^7: ^1'..GetCurrentResourceName()..'^7 started ^2successfully^7...') 
