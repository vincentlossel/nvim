-- Remove whitespaces on save
local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	command = [[:%s/\s\+$//e]],
	group = TrimWhiteSpaceGrp,
})

-- Don't autocomment on new line
vim.api.nvim_create_autocmd("BufEnter", {
	command = [[set formatoptions-=cro]],
})

-- Update Kitty
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "kanagawa",
	callback = function()
		if vim.o.background == "light" then
			vim.fn.system("kitty +kitten themes Kanagawa_light")
		elseif vim.o.background == "dark" then
			vim.fn.system("kitty +kitten themes Kanagawa_dragon")
		else
			vim.fn.system("kitty +kitten themes Kanagawa")
		end
	end,
})
