require("onenord").setup({
	theme = "dark", -- "dark" or "light"
	borders = true, -- Split window borders
	fade_nc = false, -- Fade non-current windows, making them more distinguishable
	styles = {
		comments = "bold,italic", -- Style that is applied to comments: see `highlight-args` for options
		strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
		keywords = "bold", -- Style that is applied to keywords: see `highlight-args` for options
		functions = "bold,italic", -- Style that is applied to functions: see `highlight-args` for options
		variables = "bold,italic", -- Style that is applied to variables: see `highlight-args` for options
		diagnostics = "underline", -- Style that is applied to diagnostics: see `highlight-args` for options
	},
	disable = {
		background = false, -- Disable setting the background color
		cursorline = false, -- Disable the cursorline
		eob_lines = true, -- Hide the end-of-buffer lines
	},
	inverse = {
		match_paren = false,
	},
	custom_highlights = {}, -- Overwrite default highlight groups
	custom_colors = {}, -- Overwrite default colors
})
