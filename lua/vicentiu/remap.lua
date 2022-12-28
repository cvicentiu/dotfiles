vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- In visual mode, J and K move the selected block up or down
-- and also indent it with the '=' operator.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- While J-ing in normal mode, keep cursor where it is.
vim.keymap.set("n", "J", "mzJ`z")

-- Normal up and down motions, but keep the cursor centered.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")


vim.keymap.set("n", "<leader>d", "\"_y")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Don't ever enter Ex mode.
vim.keymap.set("n", "Q", "<nop>")
