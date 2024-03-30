local node = require("latex-luasnippets.nodes")

return {
	-- regular
}, {
	-- autosnippets
	-- environments
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
	node.b_no_math(
		"-i",
		fmta(
			[[
        \begin{itemize}
          \item{<>}
          <>
        \end{itemize}
      ]],
			{ i(1), i(2) }
		)
	),
	node.b_no_math(
		"-e",
		fmta(
			[[
        \begin{enumerate}
          \item{<>}
          <>
        \end{enumerate}
      ]],
			{ i(1), i(2) }
		)
	),
	node.b_no_math(
		"--",
		fmta(
			[[
        \item{<>}
        <>
      ]],
			{ i(1), i(2) }
		)
	),

	-- math environments
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
	node.A_math("box", fmta("\\Aboxed{<>}", { dl(1, l.LS_SELECT_RAW) })),
	node.A_math("}utt", fmta("\\underbrace{<>}_{\\text{<>}}", { dl(1, l.LS_SELECT_RAW), i(2) })),
	node.A_math("utt", fmta("\\underset{\\text{<>}}{<>}", { i(1), dl(2, l.LS_SELECT_RAW) })),
	node.A_math("itt", fmta("\\shortintertext{<>}", { dl(1, l.LS_SELECT_RAW) })),
	node.A_math("tt", fmta("\\text{<>}", { dl(1, l.LS_SELECT_RAW) })),
	node.A_math("ta", fmta("\\tag{<>}", { dl(1, l.LS_SELECT_RAW) })),

	-- formatting
	node.math("nd", t("&")),
	node.A_math("gr", fmta("{<>}", { i(1) })),
	node.A_math("\\quad   ", t("\\qquad ")),
	-- four consecutive spaces -> \quad
	node.Ar_math("^(.*[^%s].*)   ", fmta("<> \\quad ", { l(l.CAPTURE1) })),
}
