-- window navigation
vim.keymap.set("n", "<C-j>", "<C-W>j", { silent = true, desc = "Move window down" })
vim.keymap.set("n", "<C-k>", "<C-W>k", { silent = true, desc = "Move window up" })
vim.keymap.set("n", "<C-h>", "<C-W>h", { silent = true, desc = "Move window left" })
vim.keymap.set("n", "<C-l>", "<C-W>l", { silent = true, desc = "Move window right" })

-- explorer
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Explorer Ex" })

-- jump to first non-blank character
vim.keymap.set("n", "0", "^")

-- hackers use hjkl
vim.keymap.set({ "n", "v" }, "<Up>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Down>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Left>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Right>", "<NOP>", { silent = true })
