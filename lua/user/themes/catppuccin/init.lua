vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha | Has to be set in order for empty argument to work

require("catppuccin").setup({
	transparent_background = false,
	term_colors = true,
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = { "italic" },
		functions = { "bold,italic" },
		keywords = {},
		strings = {},
		variables = { "bold" },
		numbers = {},
		booleans = { "bold" },
		properties = { "bold" },
		types = { "bold" },
		operators = {},
	},
	integrations = {
		dap = {
			enabled = true,
			enable_ui = true,
		},
    illuminate = true,
		indent_blankline = {
			enabled = true,
      colored_indent_levels = true,
		},
		treesitter = true,
		treesitter_context = true,
		ts_rainbow = true,
    markdown = true,
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
		navic = {
			enabled = true,
			custom_bg = "NONE",
		},
		which_key = true,
	},
})
