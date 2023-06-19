local get_node_at_cursor = require("nvim-treesitter.ts_utils").get_node_at_cursor

local MATH_NODES = {
  displayed_equation = true,
  inline_formula = true,
  math_environment = true,
}

local math_env = {}

local function find_group_index(match, chars)
  -- takes a string ending with chars[2] ie ")" and returns the index of the matching chars[1] ie "("
  local depth = 0
  local location = nil
  for index = (#match - 1), 1, -1 do
    local char = match:sub(index, index)
    if char == chars[2] then
      depth = depth + 1
    elseif char == chars[1] then
      depth = depth - 1
    end
    if depth == 0 then
      location = index
      break
    end
  end
  return location
end

function math_env.match_group(_, snip, chars)
  chars = chars == nil and { "(", ")" } or chars
  local match = snip.trigger
  local location = find_group_index(match, chars)
  if chars[1] ~= " " and location == nil then
    -- if matching parenthesis not found imply one at each space
    --   ie.  x+1)/ -> \frac{x+1}{}
    implied_before, implied_group = unpack(math_env.match_group(_, snip, { " ", chars[2] }))
    return { implied_before .. " ", implied_group }
  elseif location == nil then
    return { "", match:sub(1, #match - 2) }
  elseif location == 1 then
    return { "", match:sub(2, #match - 2) }
  else
    return { match:sub(1, location - 1), match:sub(location + 1, #match - 2) }
  end
end

-- https://github.com/iurimateus/luasnip-latex-snippets.nvim/blob/main/lua/luasnip-latex-snippets/util/ts_utils.lua
function math_env.is_math()
  local node = get_node_at_cursor()
  while node do
    if node:type() == "text_mode" then
      return false
    elseif MATH_NODES[node:type()] then
      -- set undo point
      vim.o.undolevels = vim.o.undolevels
      return true
    end
    node = node:parent()
  end
  return false
end

function math_env.not_math()
  return not math_env.is_math()
end

function math_env.no_backslash(line_to_cursor, matched_trigger)
  -- this only works if the matched_trigger starts the same as the latex trigger.
  --   ie: sq -> \sqrt wouldnt expand on \sq but
  --       rt -> \sqrt would expand on \sqrt to \sq\sqrt
  local _, col = unpack(vim.api.nvim_win_get_cursor(0))
  local preceding_index = col - #matched_trigger
  return line_to_cursor:sub(preceding_index, preceding_index) ~= "\\"
end

return math_env
