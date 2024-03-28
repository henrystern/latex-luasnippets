local ls = require("luasnip")
local s = ls.snippet
local conds = require("luasnip.extras.expand_conditions")

local u = require("latex-luasnippets.utils")
local m = require("latex-luasnippets.math-utils")

local nodes = {}

--
-- NO MATH
--

-- Beginning of line and word outside of math environment
nodes.b_no_math = ls.extend_decorator.apply(s, {}, { condition = u.pipe({ conds.line_begin, m.not_math }) })

-- Beginning of line and word outside of math environment with regex trigger
nodes.br_no_math = ls.extend_decorator.apply(
  s,
  { regTrig = true },
  { condition = u.pipe({ conds.line_begin, m.not_math }) }
)

-- Beginning of word outside of math environment
nodes.no_math = ls.extend_decorator.apply(s, {}, { condition = m.not_math })

-- Beginning of word outside of math environment with regex trigger
nodes.r_no_math = ls.extend_decorator.apply(s, { regTrig = true }, { condition = m.not_math })

-- Anywhere outside of math environment
nodes.A_no_math = ls.extend_decorator.apply(s, { wordTrig = false }, { condition = m.not_math })

-- Anywhere outside of math environment with regex trigger
nodes.Ar_no_math = ls.extend_decorator.apply(s, { wordTrig = false, regTrig = true }, { condition = m.not_math })

--
-- MATH
--

-- Beginning of line and word inside of math environment
nodes.b_math = ls.extend_decorator.apply(s, {}, { condition = u.pipe({ conds.line_begin, m.is_math }) })

-- Beginning of line and word inside of math environment with regex trigger
nodes.br_math = ls.extend_decorator.apply(
  s,
  { regTrig = true },
  { condition = u.pipe({ conds.line_begin, m.is_math }) }
)

-- Beginning of word inside of math environment
nodes.math = ls.extend_decorator.apply(s, {}, { condition = m.is_math })

-- Beginning of word inside of math environment with regex trigger
nodes.r_math = ls.extend_decorator.apply(s, { regTrig = true }, { condition = m.is_math })

-- Anywhere in math environment
nodes.A_math = ls.extend_decorator.apply(s, { wordTrig = false }, { condition = m.is_math })

-- Anywhere in math environment with regex trigger
nodes.Ar_math = ls.extend_decorator.apply(s, { wordTrig = false, regTrig = true }, { condition = m.is_math })

return nodes
