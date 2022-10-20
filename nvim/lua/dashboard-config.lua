local if_nil = vim.F.if_nil

local default_terminal = {
    type = "terminal",
    command = nil,
    width = 69,
    height = 8,
    opts = {
        redraw = true,
        window_config = {},
    },
}

local default_header = {
    type = "text",
    val = {
    [[ ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗]],
    [[ ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║]],
    [[ ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║]],
    [[ ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║]],
    [[ ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║]],
    [[ ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝]],
    },
    opts = {
        position = "center",
        hl = "Type",
        -- wrap = "overflow";
    },
}

local proc = assert(io.popen('/home/gagan/.local/bin/print-quote'))
local output = proc:read('*all')
proc:close()

local footer = {
    type = "text",
    val = output,
    opts = {
        position = "center",
        hl = "Character",
    },
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl = "Normal",
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("", "                    New Session", "<cmd>NewFile<CR>"),
        button("", "                    File Browser", "<Cmd>FileBrowser<CR>"),
        button("", "                    Quit", "<Cmd>qa!<CR>"),
    },
    opts = {
        spacing = 1,
    },
}

local section = {
    terminal = default_terminal,
    header = default_header,
    buttons = buttons,
    footer = footer,
}

local config = {
    layout = {
        { type = "padding", val = 30 },
        section.header,
        { type = "padding", val = 3 },
        section.buttons,
        { type = "padding", val = 3 },
        section.footer,
    },
    opts = {
        margin = 1,
    },
}

return {
    button = button,
    section = section,
    config = config,
    -- theme config
    leader = leader,
    -- deprecated
    opts = config,
}
