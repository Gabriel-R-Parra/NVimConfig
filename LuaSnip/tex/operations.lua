local helpers = require('personal.luasnip-helper-funcs')
local get_visual = helpers.get_visual

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
    -- To the power of
    s({ 
        trig="([%d])po", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta([[<>^{<>}]],
    { 
        f(capture_regex()),
        i(1) 
    }),
    { condition = tex.in_mathzone }),
    
    -- Square root
    s({ 
        trig="sqrt", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta([[\sqrt{<>}]],
    { 
        i(1) 
    }),
    { condition = tex.in_mathzone }),

    -- Fraction with numerator pre-defined
    s({ 
        trig="([-%d]+)/", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta([[\frac{<>}{<>}]],
    { 
        f(capture_regex()),
        i(1) 
    }),
    { condition = tex.in_mathzone }),

    -- Fraction with nothing pre-defined
    s({ 
        trig="([ ])/", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta([[<>\frac{<>}{<>}]],
    { 
        f(capture_regex()),
        i(1),
        i(2) 
    }),
    { condition = tex.in_mathzone }),

    -- Complement
    s({ 
        trig="([%}%)%]]+)comp", -- matches for any container } ) ] and complements it
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta([[<>^{C}]],
    { 
        f(capture_regex()),
    }),
    { condition = tex.in_mathzone }),

    -- Hat
    s({ 
        trig="([%a])hatt", -- matches for any container } ) ] and complements it
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta([[\hat{<>}]],
    { 
        f(capture_regex()),
    }),
    { condition = tex.in_mathzone }),

    -- Tilde
    s({ 
        trig="([%a])tilde", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta([[\tilde{<>}]],
    { 
        f(capture_regex()),
    }),
    { condition =  tex.in_mathzone }),

    
    -- Bar
    s({ 
        trig="([%a])bar", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta([[\bar{<>}]],
    { 
        f(capture_regex()),
    }),
    { condition =  tex.in_mathzone }),


    -- Not equal
    s({ 
        trig="!=", 
        snippetType="autosnippet" 
    }, 
    fmta([[\neq]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Function domain/range arrow
    s({ 
        trig="!>", 
        snippetType="autosnippet" 
    }, 
    fmta([[\mapsto]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- ... for emphasis or gaps
    s({ 
        trig="...", 
        snippetType="autosnippet" 
    }, 
    fmta([[\dots]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Multiplication dot
    s({ 
        trig="**", 
        snippetType="autosnippet" 
    }, 
    fmta([[\cdot]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Plus minus sign
    s({ 
        trig="+-", 
        snippetType="autosnippet" 
    }, 
    fmta([[\pm]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Minus Plus sign
    s({ 
        trig="-+", 
        snippetType="autosnippet" 
    }, 
    fmta([[\mp]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Arrow sign
    s({ 
        trig="->", 
        snippetType="autosnippet" 
    }, 
    fmta([[\to]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Left to right arrow
    s({ 
        trig="leftrightarrow", 
        snippetType="autosnippet" 
    }, 
    fmta([[\leftrightarrow]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Less than equal to
    s({ 
        trig="<=", 
        snippetType="autosnippet" 
    }, 
    fmta([[\leq]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Implied by
    s({ 
        trig="=<", 
        snippetType="autosnippet" 
    }, 
    fmta([[\impliedby]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Equivalent
    s({ 
        trig="===", 
        snippetType="autosnippet" 
    }, 
    fmta([[\equiv]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Implies
    s({ 
        trig="=>", 
        snippetType="autosnippet" 
    }, 
    fmta([[\implies]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Greater than or equal
    s({ 
        trig=">=", 
        snippetType="autosnippet" 
    }, 
    fmta([[\geq]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Super greater than?? STUPID
    s({ 
        trig=">>", 
        snippetType="autosnippet" 
    }, 
    fmta([[\gg]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Complex Numbers
    s({ 
        trig="CC", 
        snippetType="autosnippet" 
    }, 
    fmta([[\mathbb{C}]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Natural Numbers
    s({ 
        trig="NN", 
        snippetType="autosnippet" 
    }, 
    fmta([[\mathbb{N}]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Rational Numbers
    s({ 
        trig="QQ", 
        snippetType="autosnippet" 
    }, 
    fmta([[\mathbb{Q}]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Real Numbers
    s({ 
        trig=";R", 
        snippetType="autosnippet" 
    }, 
    fmta([[\mathbb{R}]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Integers
    s({ 
        trig="ZZ", 
        snippetType="autosnippet" 
    }, 
    fmta([[\mathbb{Z}]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Intersection
    s({ 
        trig="andd", 
        snippetType="autosnippet" 
    }, 
    fmta([[\cap]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Dot hat
    s({ 
        trig="dot", 
        snippetType="autosnippet" 
    }, 
    fmta([[\dot{<>}]],
    { 
        i(1)
    }),
    { condition =  tex.in_mathzone }),


    -- Emptyset
    s({ 
        trig="eset", 
        snippetType="autosnippet" 
    }, 
    fmta([[\emptyset]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- There exists
    s({ 
        trig="exists", 
        snippetType="autosnippet" 
    }, 
    fmta([[\exists]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- In set
    s({ 
        trig="inn", 
        snippetType="autosnippet" 
    }, 
    fmta([[\in]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Gradient sign
    s({ 
        trig="nabl", 
        snippetType="autosnippet" 
    }, 
    fmta([[\nabla]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Not in
    s({ 
        trig="notin", 
        snippetType="autosnippet" 
    }, 
    fmta([[\notin]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Infinity
    s({ 
        trig="ooo", 
        snippetType="autosnippet" 
    }, 
    fmta([[\infty]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Union
    s({ 
        trig="orr", 
        snippetType="autosnippet" 
    }, 
    fmta([[\cup]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Parallel
    s({ 
        trig="paral", 
        snippetType="autosnippet" 
    }, 
    fmta([[\parallel]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Product
    s({ 
        trig="prod", 
        snippetType="autosnippet" 
    }, 
    fmta([[\prod_{<>}^{<>}]],
    { 
        i(1),
        i(2)
    }),
    { condition =  tex.in_mathzone }),


    -- Proportional
    s({ 
        trig="prop", 
        snippetType="autosnippet" 
    }, 
    fmta([[\propto]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Set
    s({ 
        trig="sett", 
        snippetType="autosnippet" 
    }, 
    fmta([[\{ <> \}]],
    { 
        i(1)
    }),
    { condition = tex.in_mathzone }),


    -- Symmetric Equals
    s({ 
        trig="sim=", 
        snippetType="autosnippet" 
    }, 
    fmta([[\simeq]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Symmetric
    s({ 
        trig="simm", 
        snippetType="autosnippet" 
    }, 
    fmta([[\sim]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Subset
    s({ 
        trig="sub=", 
        snippetType="autosnippet" 
    }, 
    fmta([[\subseteq]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Summation
    s({ 
        trig="sum", 
        snippetType="autosnippet" 
    }, 
    fmta([[\sum_{<>}^{<>}]],
    { 
        i(1),
        i(2)
    }),
    { condition =  tex.in_mathzone }),


    -- Times
    s({ 
        trig="xx", 
        snippetType="autosnippet" 
    }, 
    fmta([[\times]],
    { 
    }),
    { condition =  tex.in_mathzone }),


    -- Floor
    s({ 
        trig="([-%d]+)floor", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta([[\lfloor <> \rfloor]],
    { 
        f(capture_regex()),
    }),
    { condition = tex.in_mathzone}),


    -- Ceiling
    s({ 
        trig="([-%d]+)ceil", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta([[\lceil <> \rceil]],
    { 
        f(capture_regex()),
    }),
    { condition = tex.in_mathzone}),
}
