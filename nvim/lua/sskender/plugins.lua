return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" }
    },


    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

    { "HiPhish/rainbow-delimiters.nvim" },


    { "morhetz/gruvbox" },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },


    -- Git

    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },


    -- LSP

    { "neovim/nvim-lspconfig" },

    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" }
}
