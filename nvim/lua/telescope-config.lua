local fb_actions = require "telescope".extensions.file_browser.actions

require('telescope').setup { 
    defaults = { 
        file_ignore_patterns = {"node_modules","Books"},
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                width = 300,
                height = 70,
            },
        },
    },
    extensions = {
        file_browser = {
            mappings = {
                ["i"] = {
                    ["<C-]>"] = fb_actions.change_cwd,
                    ["<C-h>"] = fb_actions.goto_home_dir
                },
            },
        },
    },
}
