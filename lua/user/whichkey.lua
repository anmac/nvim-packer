local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	key_labels = {},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local m_opts = {
	mode = "n", -- NORMAL mode
	prefix = "m",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local m_mappings = {
	a = { "<cmd>BookmarkAnnotate<CR>", "Annotate" },
	c = { "<cmd>BookmarkClear<CR>", "Clear" },
	m = { "<cmd>BookmarkToggle<CR>", "Toggle" },
	h = { '<cmd>lua require("harpoon.mark").add_file()<CR>', "Harpoon" },
	j = { "<cmd>BookmarkNext<CR>", "Next" },
	k = { "<cmd>BookmarkPrev<CR>", "Prev" },
	s = { "<cmd>BookmarkShowAll<CR>", "Prev" },
	-- s = {
	--   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<CR>",
	--   "Show",
	-- },
	x = { "<cmd>BookmarkClearAll<CR>", "Clear All" },
	u = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', "Harpoon UI" },
}

local mappings = {
	["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },
	["a"] = { "<cmd>Alpha<CR>", "Alpha" },
	-- b = { "<cmd>lua require('user.bfs').open()<CR>", "Buffers" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
		"Buffers",
	},
	["e"] = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },
	["w"] = { "<cmd>w<CR>", "Write" },
	["q"] = { "<cmd>q<CR>", "Quit" },
	["Q"] = { "<cmd>q!<CR>", "Quit whitout save" },
	["h"] = { "<cmd>nohlsearch<CR>", "No HL" },
	["x"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<CR>", "Projects" },
	["z"] = { "<cmd>ZenMode<CR>", "Zen" },
	["gy"] = "Link",

	c = { -- set foldmethod=manual
		name = "Folding",
		c = { "<Esc>zfi{", "Curly Braces" },
		b = { "<Esc>zfi[", "Brackets" },
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<CR>", "Compile" },
		i = { "<cmd>PackerInstall<CR>", "Install" },
		s = { "<cmd>PackerSync<CR>", "Sync" },
		S = { "<cmd>PackerStatus<CR>", "Status" },
		u = { "<cmd>PackerUpdate<CR>", "Update" },
	},

	o = {
		name = "Options",
		w = { '<cmd>lua require("user.functions").toggle_option("wrap")<CR>', "Wrap" },
		r = { '<cmd>lua require("user.functions").toggle_option("relativenumber")<CR>', "Relative" },
		l = { '<cmd>lua require("user.functions").toggle_option("cursorline")<CR>', "Cursorline" },
		s = { '<cmd>lua require("user.functions").toggle_option("spell")<CR>', "Spell" },
		t = { '<cmd>lua require("user.functions").toggle_tabline()<CR>', "Tabline" },
	},

	s = {
		name = "Split",
		s = { "<cmd>split<CR>", "HSplit" },
		v = { "<cmd>vsplit<CR>", "VSplit" },
	},

	r = {
		name = "Replace",
		r = { "<cmd>lua require('spectre').open()<CR>", "Replace" },
		w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Replace Word" },
		f = { "<cmd>lua require('spectre').open_file_search()<CR>", "Replace Buffer" },
	},

	d = {
		name = "Debug",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
		i = { "<cmd>lua require'dap'.step_into()<CR>", "Into" },
		o = { "<cmd>lua require'dap'.step_over()<CR>", "Over" },
		O = { "<cmd>lua require'dap'.step_out()<CR>", "Out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Repl" },
		l = { "<cmd>lua require'dap'.run_last()<CR>", "Last" },
		u = { "<cmd>lua require'dapui'.toggle()<CR>", "UI" },
		x = { "<cmd>lua require'dap'.terminate()<CR>", "Exit" },
	},

	f = {
		name = "Find",
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
		f = {
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
			"Find files",
		},
		F = { "<cmd>Telescope find_files<CR>", "Find Files with preview" },
		g = { "<cmd>Telescope live_grep theme=ivy<CR>", "Find Text" },
		h = { "<cmd>Telescope help_tags<CR>", "Help" },
		i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<CR>", "Media" },
		l = { "<cmd>Telescope resume<CR>", "Last Search" },
		M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<CR>", "Recent File" },
		R = { "<cmd>Telescope registers<CR>", "Registers" },
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
		C = { "<cmd>Telescope commands<CR>", "Commands" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
		L = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Popup Blame" },
		l = { "<cmd>lua require 'gitsigns'.toggle_current_line_blame()<CR>", "Toggle Line Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<CR>",
			"Diff",
		},
		G = {
			name = "Gist",
			a = { "<cmd>Gist -b -a<CR>", "Create Anon" },
			d = { "<cmd>Gist -d<CR>", "Delete" },
			f = { "<cmd>Gist -f<CR>", "Fork" },
			g = { "<cmd>Gist -b<CR>", "Create" },
			l = { "<cmd>Gist -l<CR>", "List" },
			p = { "<cmd>Gist -b -p<CR>", "Create Private" },
		},
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		d = { "<cmd>TroubleToggle<CR>", "Diagnostics" },
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<CR>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting({ async = true })<CR>", "Format" },
		F = { "<cmd>LspToggleAutoFormat<CR>", "Toggle Autoformat" },
		i = { "<cmd>LspInfo<CR>", "Info" },
		I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
		o = { "<cmd>SymbolsOutline<CR>", "Outline" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		R = { "<cmd>TroubleToggle lsp_references<CR>", "References" },
		s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
			"Workspace Symbols",
		},
		t = { '<cmd>lua require("user.functions").toggle_diagnostics()<CR>', "Toggle Diagnostics" },
		u = { "<cmd>LuaSnipUnlinkCurrent<CR>", "Unlink Snippet" },
	},

	-- s = {
	--   name = "Surround",
	--   ["."] = { "<cmd>lua require('surround').repeat_last()<CR>", "Repeat" },
	--   a = { "<cmd>lua require('surround').surround_add(true)<CR>", "Add" },
	--   d = { "<cmd>lua require('surround').surround_delete()<CR>", "Delete" },
	--   r = { "<cmd>lua require('surround').surround_replace()<CR>", "Replace" },
	--   q = { "<cmd>lua require('surround').toggle_quotes()<CR>", "Quotes" },
	--   b = { "<cmd>lua require('surround').toggle_brackets()<CR>", "Brackets" },
	-- },

	S = {
		-- name = "Session",
		-- s = { "<cmd>SaveSession<CR>", "Save" },
		-- l = { "<cmd>LoadLastSession!<CR>", "Load Last" },
		-- d = { "<cmd>LoadCurrentDirSession!<CR>", "Load Last Dir" },
		-- f = { "<cmd>Telescope sessions save_current=false<CR>", "Find Session" },
		name = "SnipRun",
		c = { "<cmd>SnipClose<CR>", "Close" },
		f = { "<cmd>%SnipRun<CR>", "Run File" },
		i = { "<cmd>SnipInfo<CR>", "Info" },
		m = { "<cmd>SnipReplMemoryClean<CR>", "Mem Clean" },
		r = { "<cmd>SnipReset<CR>", "Reset" },
		t = { "<cmd>SnipRunToggle<CR>", "Toggle" },
		x = { "<cmd>SnipTerminate<CR>", "Terminate" },
	},

	t = {
		name = "Terminal",
		["1"] = { ":1ToggleTerm<CR>", "1" },
		["2"] = { ":2ToggleTerm<CR>", "2" },
		["3"] = { ":3ToggleTerm<CR>", "3" },
		["4"] = { ":4ToggleTerm<CR>", "4" },
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
		n = { "<cmd>lua _NODE_TOGGLE()<CR>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<CR>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<CR>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<CR>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<CR>", "Vertical" },
	},

	T = {
		name = "Treesitter",
		h = { "<cmd>TSHighlightCapturesUnderCursor<CR>", "Highlight" },
		p = { "<cmd>TSPlaygroundToggle<CR>", "Playground" },
	},
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
	s = { "<esc><cmd>'<,'>SnipRun<CR>", "Run range" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(m_mappings, m_opts)
