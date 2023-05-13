return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-dap.nvim",
	},

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			pickers = {
				file_browser = {
					hidden = true,
				},
				find_files = {
					hidden = true,
				},
			},
			defaults = {
				path_display = { "smart" },
				layout_config = {
					horizontal = {
						preview_cutoff = 100,
						preview_width = 0.6,
					},
				},
				file_ignore_patterns = {
					"node_modules",
					".git",
					".rye"
				},
			},
			extensions = {
				file_browser = {
					hidden = true,
					respect_gitignore = true,
				},
			},
		})

		-- Extensions
		telescope.load_extension("dap")
		telescope.load_extension("file_browser")
		telescope.load_extension("lazygit")

		-- Keymaps
		vim.keymap.set("", "<C-p>", "<Cmd>Telescope<CR>")
		vim.keymap.set("", "<Leader>gs", "<Cmd>Telescope find_git<CR>")
		vim.keymap.set("", "<Leader>ff", "<Cmd>Telescope find_files<CR>")
		vim.keymap.set("", "<Leader>fg", "<Cmd>Telescope live_grep<CR>")
		vim.keymap.set("", "<Leader>fb", "<Cmd>Telescope buffers<CR>")
		vim.keymap.set("", "<Leader>fh", "<Cmd>Telescope help_tags<CR>")
		vim.keymap.set("", "<Leader>fk", "<Cmd>Telescope keymaps<CR>")
		vim.keymap.set("", "<Leader>bb", "<Cmd>Telescope file_browser<CR>")
	end,
}
