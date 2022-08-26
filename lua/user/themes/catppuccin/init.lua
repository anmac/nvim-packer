require("catppuccin").setup({
	transparent_background = false,
	term_colors = true,
	styles = {
		comments = "italic",
		conditionals = "italic",
		loops = "italic",
		functions = "bold,italic",
		keywords = "NONE",
		strings = "NONE",
		variables = "bold",
		numbers = "NONE",
		booleans = "NONE",
		properties = "bold",
		types = "NONE",
		operators = "NONE",
	},
	integrations = {
		treesitter = false,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "bold,italic",
				hints = "italic",
				warnings = "bold,italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = false,
		},
		indent_blankline = {
			enabled = false,
		},
	},
})
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
