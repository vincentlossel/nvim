return {
	"windwp/nvim-autopairs",

	config = function()
		local autopairs = require("nvim-autopairs")
		local cmp = require("cmp")
		local autopairs_cmp = require("nvim-autopairs.completion.cmp")

		autopairs.setup({
			event = "InsertEnter",
			check_ts = true,
			ts_config = {
				lua = { "string" },
			},
			disable_filetyp = { "TelescopePrompt" },
		})

		cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done())

	end,
}
