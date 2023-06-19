local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

local utils = {}

-- https://github.com/iurimateus/luasnip-latex-snippets.nvim/blob/main/lua/luasnip-latex-snippets/util/utils.lua
function utils.pipe(fns)
  return function(...)
    for _, fn in ipairs(fns) do
      if not fn(...) then
        return false
      end
    end
    return true
  end
end

return utils
