local ls = require("luasnip")
local cmp = require("cmp")

vim.keymap.set('', '<Leader>U', '<Cmd>lua require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})<CR><Cmd>echo "Snippets refreshed!"<CR>')

vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
