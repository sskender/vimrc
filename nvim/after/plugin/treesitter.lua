require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "bash",
        "dockerfile",
        "go",
        "hcl",
        "json",
        "lua",
        "terraform",
        "yaml",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
