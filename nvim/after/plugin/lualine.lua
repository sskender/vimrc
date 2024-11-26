local custom_gruvbox = require("lualine.themes.gruvbox")

custom_gruvbox.normal.c.bg = "NONE"
custom_gruvbox.insert.c.bg = "NONE"
custom_gruvbox.visual.c.bg = "NONE"
custom_gruvbox.replace.c.bg = "NONE"
custom_gruvbox.command.c.bg = "NONE"
custom_gruvbox.inactive.c.bg = "NONE"

custom_gruvbox.normal.c.fg = "#a89984"
custom_gruvbox.insert.c.fg = "#a89984"
custom_gruvbox.visual.c.fg = "#a89984"
custom_gruvbox.replace.c.fg = "#a89984"
custom_gruvbox.command.c.fg = "#a89984"
custom_gruvbox.inactive.c.fg = "#a89984"

require("lualine").setup {
    sections = {
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {},
        lualine_y = { "encoding", "fileformat", "filetype" },
        lualine_z = { "location" }
    },
    options = {
        theme = custom_gruvbox,
        icons_enabled = false,
        global_status = true,
        component_separators = "",
        section_separators = "",
    }
}
