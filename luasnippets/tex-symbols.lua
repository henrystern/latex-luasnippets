local math_utils = require("latex-luasnippets.math-utils")
local node = require("latex-luasnippets.nodes")

return {
  -- regular
}, {
  -- autosnippets

  -- characters
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
  node.Ar_math("([^\\])inf", fmta("<>\\infty ", { l(l.CAPTURE1) })),
  node.b_math("inf", t("\\infty ")),

  -- sets
  node.A_math("RR", t("\\mathbb{R}")),
  node.A_math("QQ", t("\\mathbb{Q}")),
  node.A_math("ZZ", t("\\mathbb{Z}")),
  node.A_math("NN", t("\\mathbb{N}")),
  node.A_math("nee", t("\\not\\in ")),
  node.A_math("!ee", t("\\not\\in ")),
  node.A_math("ee", t("\\in ")),
  node.A_math("UU", t("\\cup ")),
  node.A_math("II", t("\\cap ")),
  node.A_math("cc", t("\\subseteq ")),
  node.A_math("cd", t("\\subset ")),

  -- operators
  node.A_math("EE", t("\\exists ")),
  node.A_math("AA", t("\\forall ")),
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
  node.A_math("//", fmta("\\frac{<>}{<>}", { i(1), i(2) })),
  node.A_math(" or", t(" \\vee ")),
  node.A_math(" and", t(" \\wedge ")),
  node.Ar_math("([^\\])iff", fmta("<>\\iff ", { l(l.CAPTURE1) })),
  node.b_math("iff", t("\\iff ")),
  node.Ar_math("([^\\])sq", fmta("<>\\sqrt{<>}", { l(l.CAPTURE1), i(1) })),
  node.b_math("sq", fmta("\\sqrt{<>}", { i(1) })),
  node.Ar_math("([^\\])lim", fmta("<>\\lim_{<>\\ \\to\\ <>}", { l(l.CAPTURE1), i(1), i(2) })),
  node.b_math("lim", fmta("\\lim_{<> \\to <>}", { i(1), i(2) })),
  node.Ar_math("([^\\])sum", fmta("<>\\sum_{<>}^{<>}", { l(l.CAPTURE1), i(1), i(2) })),
  node.b_math("sum", fmta("\\sum_{<>}^{<>}", { i(1), i(2) })),
  node.Ar_math("([^\\])prod", fmta("<>\\prod_{<>}^{<>}", { l(l.CAPTURE1), i(1), i(2) })),
  node.b_math("prod", fmta("\\prod_{<>}^{<>}", { i(1), i(2) })),
  node.Ar_math("([^\\])part", fmta("<>\\frac{\\partial <>}{\\partial <>}", { l(l.CAPTURE1), i(1), i(2) })),
  node.b_math("part", fmta("\\frac{\\partial <>}{\\partial <>}", { i(1), i(2) })),
  node.Ar_math("dd(%a)", fmta("\\frac{d}{d<>}", { l(l.CAPTURE1) })),
  node.Ar_math("d(%a)d(%a)", fmta("\\frac{d<>}{d<>}", { l(l.CAPTURE1), l(l.CAPTURE2) })),

  -- subscripts / superscripts
  node.A_math("std", fmta("_{<>}^{<>}", { i(1), i(2) })),
  node.A_math("td", fmta("^{<>}", { i(1) })),
  node.A_math("ss", fmta("_{<>}", { i(1) })),
  node.A_math("__", fmta("_{<>}", i(1))),
  node.A_math("compl", t("^{c}")),
  node.A_math("inv", t("^{-1}")),
  node.A_math("str", t("^{*}")),
  node.A_math("xnn", t("x_{n}")),
  node.A_math("ynn", t("y_{n}")),
  node.A_math("xjj", t("x_{j}")),
  node.A_math("yjj", t("y_{j}")),
  node.A_math("cb", t("^3")),
  node.A_math("sr", t("^2")),
  node.Ar_math("(%a)(%d)", fmta("<>_{<>}", { l(l.CAPTURE1), l(l.CAPTURE2) })),

  -- surrounds (automatically surround characters or parenthesis groups in a command)
  node.Ar_math("(%a)vec", fmta("\\vec{<>}", { l(l.CAPTURE1) })),
  node.Ar_math(
    "(.*%))vec",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")" }, "%s\\vec{%s}" } }) })
  ),
  node.Ar_math(
    "(.*%])vec",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "[", "]" }, "%s\\vec{%s}" } }) })
  ),

  node.Ar_math("(%a)bar", fmta("\\overline{<>}", { l(l.CAPTURE1) })),
  node.Ar_math(
    "(.*%))bar",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")" }, "%s\\overline{%s}" } }) })
  ),
  node.Ar_math(
    "(.*%])bar",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "[", "]" }, "%s\\overline{%s}" } }) })
  ),

  node.Ar_math("(%a)hat", fmta("\\hat{<>}", { l(l.CAPTURE1) })),
  node.Ar_math(
    "(.*%))hat",
    fmta("<>", { f(math_utils.format_group, {}, { user_args = { { "(", ")" }, "%s\\hat{%s}" } }) })
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
    "(.*%])/",
    fmta("<>{<>}", { f(math_utils.format_group, {}, { user_args = { { "[", "]" }, "%s\\frac{%s}" } }), i(1) })
  ),
  node.Ar_math("(\\?[%w]+\\?^%w)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  node.Ar_math("(\\?[%w]+\\?^{%w*})/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  node.Ar_math("(\\?[%w]+\\?_%w)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  node.Ar_math("(\\?[%w]+\\?_{%w*})/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
  node.Ar_math("(\\?%w+)/", fmta("\\frac{<>}{<>} ", { l(l.CAPTURE1), i(1) })),
}
