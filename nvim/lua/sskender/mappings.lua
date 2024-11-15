-- window navigation
vim.keymap.set("n", "<C-j>", "<C-W>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-W>k", { silent = true })
vim.keymap.set("n", "<C-h>", "<C-W>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-W>l", { silent = true })

-- jump to first non-blank character
vim.keymap.set("n", "0", "^")

-- hackers use hjkl
vim.keymap.set({ "n", "v" }, "<Up>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Down>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Left>", "<NOP>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Right>", "<NOP>", { silent = true })
