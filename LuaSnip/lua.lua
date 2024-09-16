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
}
