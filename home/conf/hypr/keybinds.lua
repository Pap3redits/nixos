local mainMod = "SUPER"
local terminal = "ghostty -e nu" --todo figure out other solution
local fileManager = "ghostty -e yazi"--todo update later
local menu = "walker"
local browser = "flatpak run app.zen_browser.zen"

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. "+ SHIFT + RETURN", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("ghostty --class=com.example.clipse -e clipse"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ maximize, toggle}))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ fullscreen, toggle}))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.float({toggle}))

--Special workspaces
hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + escape", hl.dsp.workspace.toggle_special("sysmonitor"))
hl.bind(mainMod .. " + O", hl.dsp.workspace.toggle_special("obsidian"))
hl.bind(mainMod .. " + N", hl.dsp.workspace.toggle_special("note"))

--Screenshots
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m active"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

--Window resizing
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- change workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end


hl.workspace_rule({ workspace = "special:music", on_created_empty = "flatpak run org.jeffvli.feishin" })
hl.workspace_rule({ workspace = "special:sysmonitor", on_created_empty = "ghostty -e btop" })--todo update later
hl.workspace_rule({ workspace = "special:obsidian", on_created_empty = "obsidian" })
hl.workspace_rule({ workspace = "special:note", on_created_empty = "flatpak run io.github.nokse22.minitext" })
hl.workspace_rule({workspace = "4", monitor = "DP-10", default = true })
hl.window_rule({
    name = "mini note",
    match = {
        title = "Mini Text"
    },
    float = true,
    size = {500, 500},
})
hl.window_rule({
    name = "clipse",
    match = {
        class = "com.example.clipse"
    },
    float = true,
    size = {622, 652},
})
local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})