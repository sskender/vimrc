return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" }
    },


    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

    { "HiPhish/rainbow-delimiters.nvim" },


    { "ellisonleao/gruvbox.nvim" },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },


    { "tpope/vim-fugitive" },


    -- LSP

    { "neovim/nvim-lspconfig" },

    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" }
}
