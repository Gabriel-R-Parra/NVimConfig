local helpers = require('personal.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local tex = {}

local function in_mathzone()
    return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

tex.in_mathzone = in_mathzone()
tex.in_text = function() return not tex.in_mathzone() end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return
{
    s({ 
        trig="text", 
        snippetType="autosnippet" 
    }, 
    fmta([[ \text{<>}<> ]],
    { 
        i(1),
        i(2),
    }),
    { condition = tex.in_mathzone }),
}
