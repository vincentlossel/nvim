return {
	"nvim-treesitter/nvim-treesitter",

	dependencies = {
		"nvim-treesitter/playground",
		"romgrk/nvim-treesitter-context",
	},

	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			ensure_installed = {
				"bash",
				"cpp",
				"c",
				"css",
				"dockerfile",
				"graphql",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"make",
				"markdown",
				"php",
				"python",
				"rust",
				"scss",
				"sql",
				"toml",
				"tsx",
				"vim",
				"yaml",
				"typescript",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "yaml", },
			},
			autotag = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}
