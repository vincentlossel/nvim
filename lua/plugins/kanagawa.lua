return {
	"rebelot/kanagawa.nvim",

	config = function()
		local kanagawa = require("kanagawa")

		kanagawa.setup({
			compile = true,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false,
			dimInactive = false,
			terminalColors = true,
			theme = "wave",
			background = {
				dark = "wave",
				light = "lotus",
			},
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
		})

		vim.cmd("colorscheme kanagawa")
	end,
}
