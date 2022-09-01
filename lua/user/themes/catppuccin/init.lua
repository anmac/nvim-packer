vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha | Has to be set in order for empty argument to work

require("catppuccin").setup({
	transparent_background = false,
	term_colors = true,
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = { "italic" },
		functions = { "bold,italic" },
		keywords = {},
		strings = {},
		variables = { "bold" },
		numbers = {},
		booleans = {},
		properties = { "bold" },
		types = { "bold" },
		operators = {},
	},
	integrations = {
		treesitter = false,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "bold,italic" },
				hints = { "italic" },
				warnings = { "bold,italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		dap = {
			enabled = true,
			enable_ui = true,
		},
		which_key = true,
		indent_blankline = {
			enabled = false,
		},
		ts_rainbow = true,
	},
})
