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
        trig="$$BEGIN", 
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    }, 
    fmta(
    [[
    \documentclass[12pt]{article}
    \usepackage{graphicx}
    \usepackage{amsmath}
    \usepackage{amssymb}
    \usepackage{amsfonts}
    \usepackage[margin=1in]{geometry}
    \usepackage{fancyhdr}
    \usepackage{enumerate}
    \usepackage[shortlabels]{enumitem}

    \pagestyle{fancy}
    \fancyhead[l]{Gabriel Parra}
    \fancyhead[c]{$TITLE$}
    \fancyhead[r]{\today}
    \fancyfoot[c]{\thepage}
    \renewcommand{\headrulewidth}{0.2pt}
    \setlength{\headheight}{15pt}

    \begin{document}
    \begin{enumerate}[start=1, label={\bfseries Problem:}, leftmargin=1in]
        \item
    \end{enumerate}
    \end{document}
    ]],
    { 
    }),
    { condition =  line_begin }),


}
