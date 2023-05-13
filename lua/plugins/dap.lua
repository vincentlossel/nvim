return {
	"mfussenegger/nvim-dap",

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_virtual_text = require("nvim-dap-virtual-text")

		-- UI
		dap_virtual_text.setup()
		dapui.setup({
			icons = {
				expanded = "▾",
				collapsed = "▸",
			},
			mappings = {
				expand = { "<CR>", "" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			expand_lines = vim.fn.has("nvim-0.7"),
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						"breakpoints",
						"stacks",
						"watches",
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 0.25,
					position = "bottom",
				},
			},
			floating = {
				max_height = nil,
				max_width = nil,
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			windows = { indent = 1 },
			render = {
				max_type_length = nil,
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end

		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Languages
		local dap_python = require("dap-python")
		local dap_go = require("dap-go")

		dap_python.setup()
		dap_go.setup()

		-- Keymaps
		vim.keymap.set("n", "<Leader>dt", ":lua require'dap-go'.debug_test()<CR>")

		vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
		vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>")
		vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>")
		vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")

		vim.keymap.set("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
		vim.keymap.set("n", "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
		vim.keymap.set("n", "<Leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
		vim.keymap.set("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>")
	end,
}
