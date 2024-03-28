# Latex Luasnippets

Building off of [Gilles Castel's snippets](https://github.com/gillescastel/latex-snippets) for UltiSnips and [Iurimateus' Luasnip port](https://github.com/iurimateus/luasnip-latex-snippets.nvim), this plugin aims to provide similar functionality while prioritizing extensibility and customization.

Instead of building the snippets into the plugin, new Luasnip nodes are exposed that allow you to easily define custom snippets that interface with vimtex and treesitter.

## Installation

For [lazy](https://github.com/folke/lazy.nvim) add this to your plugins file.

```
  {
    "henrystern/latex-luasnippets",
    ft = { "markdown", "rmarkdown", "quarto", "tex" },
    dependencies = { "L3MON4D3/LuaSnip", "nvim-treesitter/nvim-treesitter" },
  },
```

If you want to load the [included snippets](./luasnippets/tex-math.lua) add the following lines to your Luasnip configuration:

```
-- latex-luasnippets
require("luasnip").filetype_extend("quarto", { "md-math" })
require("luasnip").filetype_extend("markdown", { "md-math" })
require("luasnip").filetype_extend("rmarkdown", { "md-math" })
require("luasnip").filetype_extend("tex", { "tex-math" })
require("luasnip.loaders.from_lua").lazy_load {}
```

If you intend to load custom snippets create a `snippets` folder in your nvim configuration and add this to your Luasnip config:

```
-- custom snippets
require("luasnip.loaders.from_lua").load {
  paths = { vim.fn.stdpath "config" .. "/snippets" },
}
```

See the [Luasnip Docs](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md) to learn how to define snippets. If the snippet file has a name that matches a filetype it will be loaded automatically. Otherwise be sure to extend the filetype name to include the name of your snippet file.

I would recommend copying the included snippets to your config folder and then editing and expanding them to suit your needs.

For the snippets to work in latex you must have vimtex installed and running. Similarly, for markdown, both markdown treesitters must be installed.

## Nodes

### Exported Nodes

| Context                                                                   | node       |
| ------------------------------------------------------------------------- | ---------- |
| Beginning of line and word outside of math environment                    | b_no_math  |
| Beginning of line and word outside of math environment with regex trigger | br_no_math |
| Beginning of word outside of math environment                             | no_math    |
| Beginning of word outside of math environment with regex trigger          | r_no_math  |
| Anywhere outside of math environment                                      | A_no_math  |
| Anywhere outside of math environment with regex trigger                   | Ar_no_math |
| Beginning of line and word inside of math environment                     | b_math     |
| Beginning of line and word inside of math environment with regex trigger  | br_math    |
| Beginning of word inside of math environment                              | math       |
| Beginning of word inside of math environment with regex trigger           | r_math     |
| Anywhere in math environment                                              | A_math     |
| Anywhere in math environment with regex trigger                           | Ar_math    |

The nodes have to be imported into each snippet file before they can be used.

For example, a simple `tex.lua` snippets file might look like:

```
local n = require "latex-luasnippets.nodes"

return {
  -- regular snippets
  n.b_no_math(
    "item",
    fmta(
      [[
        \begin{itemize}
          \item{<>}
        \end{itemize}
      ]],
      { i(1) }
    )
  ),
}, {
  -- autosnippets
  n.no_math("mk", fmta("$<>$", dl(1, l.LS_SELECT_RAW))),
  n.A_math("tt", fmta("\\text{<>}", { dl(1, l.LS_SELECT_RAW) })),
}

```

### Defining Custom Nodes

New nodes can be defined easily by combining built-in Luasnip functions and this plugin's utilities.

For example after importing these libraries:

```
local ls = require("luasnip")
local s = ls.snippet
local conds = require("luasnip.extras.expand_conditions")

local u = require("latex-luasnippets.utils")
local m = require("latex-luasnippets.math-utils")
```

The `b_no_math` node could be defined as:

```
b_no_math = ls.extend_decorator.apply(s, {}, { condition = u.pipe({ conds.line_begin, m.not_math }) })
```

Then that node can be used to define new snippets. For example:

```
return {},
  {
  b_no_math(
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
  }
```

For more node examples see the [default nodes](./lua/latex-luasnippets/nodes.lua) and for more snippet examples see the included [luasnippets](./luasnippets/tex-math.lua).
