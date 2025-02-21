require("gruvbox").setup({
    contrast = "hard",
    overrides = {
        SignColumn = { bg = "#1d2021" }
    }
})

vim.opt.background = "dark"

vim.cmd("colorscheme gruvbox")
