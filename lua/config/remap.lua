vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", function() vim.cmd("w") end)
vim.keymap.set("i", "<C-h>", "<LEFT>")
vim.keymap.set("i", "<C-j>", "<DOWN>")
vim.keymap.set("i", "<C-k>", "<UP>")
vim.keymap.set("i", "<C-l>", "<RIGHT>")
vim.keymap.set("n", "<C-h>", function() vim.cmd("wincmd h") end, {silent=true})
vim.keymap.set("n", "<C-j>", function() vim.cmd("wincmd j") end, {silent=true})
vim.keymap.set("n", "<C-k>", function() vim.cmd("wincmd k") end, {silent=true})
vim.keymap.set("n", "<C-l>", function() vim.cmd("wincmd l") end, {silent=true})
vim.keymap.set("n", "<leader>x", function() vim.cmd(":wq") end)
vim.keymap.set("n", "<C-n>", function() vim.cmd("tabe") end)
vim.keymap.set("n", "<Tab>", function() vim.cmd("tabn") end)
vim.keymap.set("n", "<S-Tab>", function() vim.cmd("tabp") end)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
