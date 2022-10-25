local status_illuminate_ok, illuminate = pcall(require, "illuminate")
if not status_illuminate_ok then
	return
end

vim.api.nvim_set_keymap("n", "<a-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<CR>', { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<a-p>",
	'<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<CR>',
	{ noremap = true }
)

illuminate.configure({
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	delay = 80,
	filetype_overrides = {},
	filetypes_denylist = {
		"alpha",
		"dapui_scopes",
		"dapui_breakpoints",
		"dapui_stacks",
		"dapui_watches",
		"dap-repl",
		"dap-terminal",
		"dapui_console",
		"dashboard",
		"dirvish",
		"fugitive",
		"help",
		"Markdown",
		"NvimTree",
		"packer",
		"startify",
		"toggleterm",
		"",
	},
	modes_denylist = { "Visual", "visual", "V", "v", "" },
	under_cursor = true,
})
