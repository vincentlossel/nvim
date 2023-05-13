return {
	"folke/tokyonight.nvim",

	config = function()
		local tokyonight = require("tokyonight")

		tokyonight.setup({
			style = "night",
			light_style = "day",
			transparent = true,
			terminal_colors = true,
			styles = {},
			sidebars = { "qf", "help" },
			day_brightness = 0.3,
			hide_inactive_statusline = false,
			dim_inactive = false,
			lualine_bold = false,
		})
	end,
}
