local custom_gruvbox = require("lualine.themes.gruvbox")

custom_gruvbox.normal.c.bg = "#112233"

require("lualine").setup {
    options = {
        theme = custom_gruvbox,
        icons_enabled = false,
        global_status = true,
    }
}
