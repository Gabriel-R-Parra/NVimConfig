local helpers = require('personal.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return 
{
    s({
        trig="$$REGEX",
        snippetType="autosnippet" 
    }, 
    fmta(
    [[
    s({ 
        trig="<>", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta(<>,
    { 
        f(capture_regex()),
    }),
    { condition = <> }),
    ]],
    { 
        i(1),
        i(2),
        i(3)
    })
    ),


    s({
        trig="$$SNIPPET",
        snippetType="autosnippet" 
    }, 
    fmta(
    [[
    s({ 
        trig="<>", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta(<>,
    { 
    }),
    { condition = <> }),
    ]],
    { 
        i(1),
        i(2),
        i(3)
    })
    ),

    s({ 
        trig="$$BEGIN", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta(
    [[
    local tex = {}

    local function in_mathzone()
        return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
    end

    local function capture_regex()
        local function capture_capture_group(_, snip)
            return snip.captures[1]
        end
        return capture_capture_group
    end

    tex.in_mathzone = in_mathzone()
    tex.in_text = function() return not tex.in_mathzone() end

    local line_begin = require("luasnip.extras.expand_conditions").line_begin

    return 
    {

    }
    ]],
    { 
    })
    ),
}
