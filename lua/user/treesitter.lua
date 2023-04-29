local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
-- ft_to_parser.motoko = "typescript"

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
		disable = { "xml" },
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css", "markdown" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "python", "css", "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			typescript = { __default = "// %s", __multiline = "/* %s */" },
			tsx = {
				__default = "// %s",
				__multiline = "/* %s */",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = { __default = "// %s", __multiline = "/* %s */" },
				comment = { __default = "// %s", __multiline = "/* %s */" },
				call_expression = { __default = "// %s", __multiline = "/* %s */" },
				statement_block = { __default = "// %s", __multiline = "/* %s */" },
				spread_element = { __default = "// %s", __multiline = "/* %s */" },
			},
			javascript = {
				__default = "// %s",
				__multiline = "/* %s */",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = { __default = "// %s", __multiline = "/* %s */" },
				comment = { __default = "// %s", __multiline = "/* %s */" },
				call_expression = { __default = "// %s", __multiline = "/* %s */" },
				statement_block = { __default = "// %s", __multiline = "/* %s */" },
				spread_element = { __default = "// %s", __multiline = "/* %s */" },
			},
		},
	},
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {
		-- 	"Gold",
		-- 	"Orchid",
		-- 	"DodgerBlue",
		-- 	"Cornsilk",
		-- 	"Salmon",
		-- 	"LawnGreen",
		-- },
	},
	playground = {
		enable = true,
	},
	matchup = {
		enable = false, -- mandatory, false will disable the whole extension
		disable_virtual_text = true,
		disable = { "html" }, -- optional, list of language that will be disabled
		include_match_words = true,
		matchup_matchparen_enabled = false, -- To disable match highlighting at startup set 0
		matchup_matchparen_offscreen = { method = nil },
		matchup_surround_enabled = true,
		loaded_matchit = true, -- you may see a very slight start-up time improvement
		matchup_matchparen_fallback = false, -- Will highlight matchpairs such as (), [], & {}
	},
})
