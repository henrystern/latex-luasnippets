local ls = require("luasnip")
local s = ls.snippet
local conds = require("luasnip.extras.expand_conditions")

local u = require("luasnip-md-utils.utils")
local m = require("luasnip-md-utils.math-utils")

local nodes = {}

-- Beginning of line and word
nodes.bw = ls.extend_decorator.apply(s, {}, { condition = conds.line_begin })

-- Beginning of word outside of math environment
nodes.w_no_math = ls.extend_decorator.apply(s, {}, { condition = m.not_math })
 
-- Beginning of line and word outside of math environment
nodes.bw_no_math = ls.extend_decorator.apply(s, {}, { condition = u.pipe({ conds.line_begin, m.not_math }) })

-- Beginning of line and word outside of math environment with regex trigger
nodes.bwr_no_math = ls.extend_decorator.apply(s, { regTrig = true },
  { condition = u.pipe({ conds.line_begin, m.not_math }) })

-- In math environment
nodes.math = ls.extend_decorator.apply(s, { wordTrig = false }, { condition = m.is_math })

-- In math environment with regex trigger
nodes.r_math = ls.extend_decorator.apply(s, { wordTrig = false, regTrig = true }, { condition = m.is_math })

-- In math environment without a preceding \ (for prefix snippets)
nodes.math_noslash = ls.extend_decorator.apply(s, { wordTrig = false },
  { condition = u.pipe({ m.is_math, m.no_backslash }) })

-- In math environment without a preceding \ with regex trigger
nodes.r_math_noslash = ls.extend_decorator.apply(s, { wordTrig = false, regTrig = true },
  { condition = u.pipe({ m.is_math, m.no_backslash }) })

-- Beginning of line and word inside of math environment
nodes.bw_math = ls.extend_decorator.apply(s, {},
  { condition = u.pipe({ conds.line_begin, m.is_math }) })

-- Beginning of word inside of math environment
nodes.w_math = ls.extend_decorator.apply(s, {}, { condition = m.is_math })

-- Beginning of word inside of math environment without a preceding \
nodes.w_math_noslash = ls.extend_decorator.apply(s, {},
  { condition = u.pipe({ m.is_math, m.no_backslash }) })

return nodes
