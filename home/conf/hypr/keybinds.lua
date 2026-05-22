local mainMod = "SUPER"
local terminal = "ghostty -e nu"
local fileManager = terminal .. "-e yazi"
local menu = "walker"
local browser = "flatpak run app.zen_browser.zen"

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ maximized, toggle}))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ fullscreen, toggle}))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.float({toggle}))



-- change workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end