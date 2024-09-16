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
        trig="mk", 
        snippetType="autosnippet" 
    }, 
    fmta([[ $<>$ ]],
    { 
        i(1) 
    }),
    { condition = tex.in_mathzone }),

    s({ 
        trig="dm", 
        snippetType="autosnippet" 
    }, 
    fmta([[ 
    $$
    <>
    $$ 
    ]], 
    { i(1) }), 
    { condition = line_begin }),


    s({
        trig="beg",
        snippetType="autosnippet"
    },
    fmta([[
    \begin{<>}
    \end{<>}
    ]],
    {
        i(1),
        rep(1),
    }),
    {condition = line_begin}),


    s({ 
        trig="gather", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta(
    [[
    \setcounter{equation}{0}
    \begin{gather}
        <>
    \end{gather}
    ]],
    { 
        i(1)
    }),
    { condition = line_begin }),
}
