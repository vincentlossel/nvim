return {
	"danymat/neogen",

	config = function()
		local neogen = require("neogen")

		neogen.setup({
			enabled = true,
			snippet_engine = "luasnip",
			input_after_comment = true,
			languages = {
				go = {
					template = {
						annotation_convention = "godoc",
					},
				},
				lua = {
					template = {
						annotation_convention = "emmylua",
					},
				},
				python = {
					template = {
						annotation_convention = "google_docstrings",
					},
				},
				rust = {
					template = {
						annotation_convention = "rustdoc",
					},
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<Leader>nc", "<Cmd>Neogen class<CR>", { noremap = true })
		vim.keymap.set("n", "<Leader>nf", "<Cmd>Neogen func<CR>", { noremap = true })
		vim.keymap.set("n", "<Leader>nt", "<Cmd>Neogen type<CR>", { noremap = true })
	end,
}
