local get_node_at_cursor = require("nvim-treesitter.ts_utils").get_node_at_cursor

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

function utils.in_node(match, exclude)
  exclude = exclude == nil and {} or exclude
  local node = get_node_at_cursor()
  while node do
    if exclude[node:type()] then
      return false
    elseif match[node:type()] then
      -- set undo point
      vim.o.undolevels = vim.o.undolevels
      return true
    end
    node = node:parent()
  end
  return false
end

return utils
