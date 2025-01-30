require("lualine").setup {
    sections = {
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {},
        lualine_y = { "encoding", "fileformat", "filetype" },
        lualine_z = { "location" }
    },
    options = {
        theme = "tokyonight",
        icons_enabled = false,
        global_status = true,
        component_separators = "",
        section_separators = "",
    }
}
