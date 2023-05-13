return {
	"kdheepak/lazygit.nvim",

	config = function()
		-- Keymaps
		vim.keymap.set("n", "<Leader>gg", "<Cmd>LazyGit <CR>")
	end,
}
