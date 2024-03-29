local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile", "quickfix", "prompt", "nvimtree" }
vim.g.indent_blankline_filetype_exclude = {
	"help",
	"man",
	"checkhealth",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
}
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏" -- │ ▎
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_context_patterns = {
	"class",
	"method",
	"return",
	"function",
	"^func",
	"^if",
	"^while",
	"^for",
	"with",
	"try",
	"except",
	"jsx_element",
	"^object",
	"^table",
	"block",
	"arguments",
	"arguments_list",
	"object",
	"dictionary",
	"element",
	"table",
	"tuple",
	"do_block",
	"if_statement",
	"else_clause",
	"jsx_element",
	"jsx_self_closing_element",
	"try_statement",
	"catch_clause",
	"import_statement",
	"operation_type",
  "arrays",
}
-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
-- vim.wo.colorcolumn = "99999"
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

indent_blankline.setup({
	show_end_of_line = false,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = false,
	-- char_highlight_list = {
	-- 	"IndentBlanklineIndent1",
	-- 	"IndentBlanklineIndent2",
	-- 	"IndentBlanklineIndent3",
	-- 	"IndentBlanklineIndent4",
	-- 	"IndentBlanklineIndent5",
	-- 	"IndentBlanklineIndent6",
	-- },
})
