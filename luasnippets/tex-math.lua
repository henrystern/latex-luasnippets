local math_utils = require("latex-luasnippets.math-utils")
local node = require("latex-luasnippets.nodes")

return {
  -- regular
}, {
  -- autosnippets

  -- Environments
  node.b_no_math(
    "beg",
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
    ]],
      { i(1), dl(2, l.LS_SELECT_RAW), rep(1) }
    )
  ),
  node.b_math(
    "beg",
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
    ]],
      { i(1), dl(2, l.LS_SELECT_RAW), rep(1) }
    )
  ),
  node.b_no_math(
    "ali",
    fmta(
      [[
      \begin{align*}
        <>
      \end{align*}
    ]],
      dl(1, l.LS_SELECT_RAW)
    )
  ),
  node.b_math(
    "case",
    fmta(
      [[
      \begin{cases}
        <>
      \end{cases}
    ]],
      dl(1, l.LS_SELECT_RAW)
    )
  ),
  node.math(
    "split",
    fmta(
      [[
      \begin{split}
        <>
      \end{split}
    ]],
      dl(1, l.LS_SELECT_RAW)
    )
  ),
  node.b_no_math(
    "gather",
    fmta(
      [[
      \begin{gather}
        <>
      \end{gather}
    ]],
      dl(1, l.LS_SELECT_RAW)
    )
  ),
  node.no_math(
    "#dm",
    fmta(
      [[
      \[
        <>
      \] {#eq-<>}
    ]],
      { dl(1, l.LS_SELECT_RAW), i(2, "noref") }
    )
  ),
  node.no_math(
    "dm",
    fmta(
      [[
      \[ <> \]
    ]],
      dl(1, l.LS_SELECT_RAW)
    )
  ),
  node.no_math("mk", fmta("\\(<>\\)", dl(1, l.LS_SELECT_RAW))),

  -- Symbols
  node.A_math(";a", t("\\alpha ")),
  node.A_math(";A", t("\\Alpha ")),
  node.A_math(";b", t("\\beta ")),
  node.A_math(";B", t("\\beta ")),
  node.A_math(";d", t("\\delta ")),
  node.A_math(";D", t("\\Delta ")),
  node.A_math(";e", t("\\epsilon ")),
  node.A_math(";E", t("\\varepsilon ")),
  node.A_math(";t", t("\\theta ")),
  node.A_math(";T", t("\\Theta ")),
  node.A_math(";l", t("\\lambda ")),
  node.A_math(";L", t("\\Lambda ")),
  node.A_math(";s", t("\\sigma ")),
  node.A_math(";S", t("\\Sigma ")),
  node.A_math("EE", t("\\exists ")),
  node.A_math("AA", t("\\forall ")),
  node.A_math("RR", t("\\mathbb{R}")),
  node.A_math("QQ", t("\\mathbb{Q}")),
  node.A_math("ZZ", t("\\mathbb{Z}")),
  node.A_math("NN", t("\\mathbb{N}")),
  node.A_math("ee", t("\\in ")),
  node.A_math("UU", t("\\cup ")),
  node.A_math("II", t("\\cap ")),
  node.A_math("cc", t("\\subset ")),
  node.A_math("<->", t("\\leftrightarrow ")),
  node.A_math("...", t("\\ldots ")),
  node.A_math("!>", t("\\mapsto ")),
  node.A_math("->", t("\\to ")),
  node.A_math("xx", t("\\times ")),
  node.A_math("**", t("\\cdot ")),
  node.A_math("!=", t("\\neq ")),
  node.A_math("~=", t("\\approx ")),
  node.A_math("===", t("\\equiv ")),
  node.A_math("=>", t("\\implies ")),
  node.A_math("=<", t("\\impliedby ")),
  node.A_math("<=", t("\\le ")),
  node.A_math(">=", t("\\ge ")),
  node.A_math(" or", t(" \\vee ")),
  node.A_math(" and", t(" \\wedge ")),

  -- Shortcuts
  node.math("nd", t("&")),
  node.A_math("gr", fmta("{<>}", { i(1) })),
  node.A_math("std", fmta("_{<>}^{<>}", { i(1), i(2) })),
  node.A_math("td", fmta("^{<>}", { i(1) })),
  node.A_math("ss", fmta("_{<>}", { i(1) })),
  node.A_math("__", fmta("_{<>}", i(1))),
  node.A_math("cb", t("^3")),
  node.A_math("sr", t("^2")),
  node.A_math("xnn", t("x_{n}")),
  node.A_math("ynn", t("y_{n}")),
  node.A_math("xjj", t("x_{j}")),
  node.A_math("yjj", t("y_{j}")),
  node.A_math("nee", t("\\not\\in ")),
  node.A_math("//", fmta("\\frac{<>}{<>}", { i(1), i(2) })),
  node.A_math("compl", t("^{c}")),
  node.A_math("inv", t("^{-1}")),
  node.A_math("str", t("^{*}")),
  node.A_math("mat ", fmta("\\begin{matrix} <> \\end{matrix}", { i(1) })),
  node.A_math("mat)", fmta("\\begin{pmatrix} <> \\end{pmatrix}", { i(1) })),
  node.A_math("mat]", fmta("\\begin{bmatrix} <> \\end{bmatrix}", { i(1) })),
  node.A_math("mat}", fmta("\\begin{Bmatrix} <> \\end{Bmatrix}", { i(1) })),
  node.A_math("mat|", fmta("\\begin{vmatrix} <> \\end{vmatrix}", { i(1) })),
  node.A_math("lr ", fmta("\\left <> \\right", { dl(1, l.LS_SELECT_RAW) })),
  node.A_math("lr)", fmta("\\left( <> \\right)", { dl(1, l.LS_SELECT_RAW) })),
  node.A_math("lr]", fmta("\\left[ <> \\right]", dl(1, l.LS_SELECT_RAW))),
  node.A_math("lr}", fmta("\\left\\{ <> \\right\\}", dl(1, l.LS_SELECT_RAW))),
  node.A_math("lr|", fmta("\\left| <> \\right|", dl(1, l.LS_SELECT_RAW))),
  node.Ar_math("dd(%a)", fmta("\\frac{d}{d<>}", { l(l.CAPTURE1) })),
  node.Ar_math("d(%a)d(%a)", fmta("\\frac{d<>}{d<>}", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.Ar_math("(%a)vec", fmta("\\vec{<>}", { l(l.CAPTURE1) })),
  node.Ar_math(
    "(.*%))vec",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")" }, "%s\\vec{%s}" } }) })
  ),
  node.Ar_math(
    "(.*%})vec",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "{", "}" }, "%s\\vec{%s}" } }) })
  ),
  node.Ar_math(
    "(.*%])vec",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "[", "]" }, "%s\\vec{%s}" } }) })
  ),
  node.Ar_math("(%a)(%d)", fmta("<>_{<>}", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.Ar_math("(%a)bar", fmta("\\overline{<>}", { l(l.CAPTURE1) })),
  node.Ar_math("(%a)hat", fmta("\\hat{<>}", { l(l.CAPTURE1) })),
  node.Ar_math(
    "(.*%))bar",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")" }, "%s\\overline{%s}" } }) })
  ),
  node.Ar_math(
    "(.*%})bar",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "{", "}" }, "%s\\overline{%s}" } }) })
  ),
  node.Ar_math(
    "(.*%])bar",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "[", "]" }, "%s\\overline{%s}" } }) })
  ),
  node.Ar_math(
    "(.*%))hat",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")" }, "%s\\hat{%s}" } }) })
  ),
  node.Ar_math(
    "(.*%})hat",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "{", "}" }, "%s\\hat{%s}" } }) })
  ),
  node.Ar_math(
    "(.*%])hat",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "[", "]" }, "%s\\hat{%s}" } }) })
  ),
  node.Ar_math(
    "(.*%))/",
    fmta("<>{<>}", { f(math_utils.format_group, {}, { user_args = { { "(", ")" }, "%s\\frac{%s}" } }), i(1) })
  ),
  node.Ar_math(
    "(.*%})/",
    fmta("<>{<>}", { f(math_utils.format_group, {}, { user_args = { { "{", "}" }, "%s\\frac{%s}" } }), i(1) })
  ),
  node.Ar_math(
    "(.*%])/",
    fmta("<>{<>}", { f(math_utils.format_group, {}, { user_args = { { "[", "]" }, "%s\\frac{%s}" } }), i(1) })
  ),
  node.Ar_math("(\\?[%w]+\\?^%w)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  node.Ar_math("(\\?[%w]+\\?_%w)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  node.Ar_math("(\\?[%w]+\\?^{%w*})/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  node.Ar_math("(\\?[%w]+\\?_{%w*})/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  node.Ar_math("(\\?%w+)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),

  -- Styling
  node.A_math("box", fmta("\\Aboxed{<>}", { dl(1, l.LS_SELECT_RAW) })),
  node.A_math("}utt", fmta("\\underbrace{<>}_{\\text{<>}}", { dl(1, l.LS_SELECT_RAW), i(2) })),
  node.A_math("utt", fmta("\\underset{\\text{<>}}{<>}", { i(1), dl(2, l.LS_SELECT_RAW) })),
  node.A_math("itt", fmta("\\shortintertext{<>}", { dl(1, l.LS_SELECT_RAW) })),
  node.A_math("tt", fmta("\\text{<>}", { dl(1, l.LS_SELECT_RAW) })),
  node.A_math("ta", fmta("\\tag{<>}", { dl(1, l.LS_SELECT_RAW) })),
  node.A_math("\\quad   ", t("\\qquad ")),
  -- four consecutive spaces -> \quad
  node.Ar_math("^(.*[^%s].*)   ", fmta("<> \\quad ", { l(l.CAPTURE1) })),

  -- Auto backslash (one regex entry for if no starting \ and another for if at beginning of line)
  node.Ar_math("([^\\])sq", fmta("<>\\sqrt[]{<>}", { l(l.CAPTURE1), i(1) })),
  node.b_math("sq", fmta("\\sqrt[]{<>}", { i(1) })),
  node.Ar_math("([^\\])hat", fmta("<>\\hat{<>}", { l(l.CAPTURE1), dl(1, l.LS_SELECT_RAW) })),
  node.b_math("hat", fmta("\\hat{<>}", { dl(1, l.LS_SELECT_RAW) })),
  node.Ar_math("([^\\])bar", fmta("<>\\overline{<>}", { l(l.CAPTURE1), dl(1, l.LS_SELECT_RAW) })),
  node.b_math("bar", fmta("\\overline{<>}", { dl(1, l.LS_SELECT_RAW) })),
  node.Ar_math("([^\\])abs", fmta("<>\\abs{<>}", { l(l.CAPTURE1), dl(1, l.LS_SELECT_RAW) })),
  node.b_math("abs", fmta("\\abs{<>}", { dl(1, l.LS_SELECT_RAW) })),
  node.Ar_math("([^\\])binom", fmta("<>\\binom{<>}{<>}", { l(l.CAPTURE1), i(1), i(2) })),
  node.b_math("binom", fmta("\\binom{<>}{<>}", { i(1), i(2) })),
  node.Ar_math("([^\\])lim", fmta("<>\\lim_{<>\\ \\to\\ <>}", { l(l.CAPTURE1), i(1), i(2) })),
  node.b_math("lim", fmta("\\lim_{<> \\to <>}", { i(1), i(2) })),
  node.Ar_math("([^\\])sum", fmta("<>\\sum_{<>}^{<>}", { l(l.CAPTURE1), i(1), i(2) })),
  node.b_math("sum", fmta("\\sum_{<>}^{<>}", { i(1), i(2) })),
  node.Ar_math("([^\\])prod", fmta("<>\\prod_{<>}^{<>}", { l(l.CAPTURE1), i(1), i(2) })),
  node.b_math("prod", fmta("\\prod_{<>}^{<>}", { i(1), i(2) })),
  node.Ar_math("([^\\])part", fmta("<>\\frac{\\partial <>}{\\partial <>}", { l(l.CAPTURE1), i(1), i(2) })),
  node.b_math("part", fmta("\\frac{\\partial <>}{\\partial <>}", { i(1), i(2) })),
  node.Ar_math("([^\\])QED", fmta("<> \\quad \\blacksquare", { l(l.CAPTURE1) })),
  node.b_math("QED", t("\\blacksquare \\quad ")),
  node.Ar_math("([^\\])iff", fmta("<>\\iff ", { l(l.CAPTURE1) })),
  node.b_math("iff", t("\\iff ")),
  node.Ar_math("([^\\])inf", fmta("<>\\infty ", { l(l.CAPTURE1) })),
  node.b_math("inf", t("\\infty ")),
  node.Ar_math("([^\\])sin", fmta("<>\\sin ", { l(l.CAPTURE1) })),
  node.b_math("sin", t("\\sin ")),
  node.Ar_math("([^\\])cos", fmta("<>\\cos ", { l(l.CAPTURE1) })),
  node.b_math("cos", t("\\cos ")),
  node.Ar_math("([^\\])tan", fmta("<>\\tan ", { l(l.CAPTURE1) })),
  node.b_math("tan", t("\\tan ")),
  node.Ar_math("([^\\])csc", fmta("<>\\csc ", { l(l.CAPTURE1) })),
  node.b_math("csc", t("\\csc ")),
  node.Ar_math("([^\\])sec", fmta("<>\\sec ", { l(l.CAPTURE1) })),
  node.b_math("sec", t("\\sec ")),
  node.Ar_math("([^\\])cot", fmta("<>\\cot ", { l(l.CAPTURE1) })),
  node.b_math("cot", t("\\cot ")),
  node.Ar_math("([^\\])ln", fmta("<>\\ln ", { l(l.CAPTURE1) })),
  node.b_math("ln", t("\\ln ")),
  node.Ar_math("([^\\])log", fmta("<>\\log ", { l(l.CAPTURE1) })),
  node.b_math("log", t("\\log ")),
  node.Ar_math("([^\\])exp", fmta("<>\\exp ", { l(l.CAPTURE1) })),
  node.b_math("exp", t("\\exp ")),
  node.Ar_math("([^\\])star", fmta("<>\\star ", { l(l.CAPTURE1) })),
  node.b_math("star", t("\\star ")),
  node.Ar_math("([^\\])perp", fmta("<>\\perp ", { l(l.CAPTURE1) })),
  node.b_math("perp", t("\\perp ")),
  node.Ar_math("([^\\])int", fmta("<>\\int", { l(l.CAPTURE1) })),
  node.b_math("int", t("\\int")),
  node.Ar_math("([^\\])arcsin", fmta("<>\\arcsin ", { l(l.CAPTURE1) })),
  node.b_math("arcsin", t("\\arcsin ")),
  node.Ar_math("([^\\])arctan", fmta("<>\\arctan ", { l(l.CAPTURE1) })),
  node.b_math("arctan", t("\\arctan ")),
  node.Ar_math("([^\\])arcsec", fmta("<>\\arcsec ", { l(l.CAPTURE1) })),
  node.b_math("arcsec", t("\\arcsec ")),
  node.Ar_math("([^\\])nab", fmta("<>\\nabla ", { l(l.CAPTURE1) })),
  node.b_math("nab", t("\\nabla ")),
  node.Ar_math("([^\\])([aA]lpha)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([aA]lpha)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([bB]eta)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([bB]eta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([gG]amma)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([gG]amma)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([dD]elta)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([dD]elta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([eE]psilon)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([eE]psilon)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([zZ]eta)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([zZ]eta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([tT]heta)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([tT]heta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^bBhzZ\\])([eE]ta)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([^bBhzZ\\])([eE]ta)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([iI]ota)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([iI]ota)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([kK]appa)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([kK]appa)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([lL]ambda)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([lL]ambda)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([mM]u)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([mM]u)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([nN]u)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([nN]u)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([pP]i)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([pP]i) ", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([rR]ho)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([rR]ho)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([sS]igma)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([sS]igma)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([tT]au)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([tT]au)", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([pP]hi)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([pP]hi) ", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([cC]hi)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([cC]hi) ", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([pP]si)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([pP]si) ", fmta("\\<> ", { l(l.CAPTURE1) })),
  node.Ar_math("([^\\])([oO]mega)", fmta("<>\\<> ", { l(l.CAPTURE1), l(l.CAPTURE2) })),
  node.br_math("([oO]mega)", fmta("\\<> ", { l(l.CAPTURE1) })),
}
