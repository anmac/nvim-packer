vim.g.moonlight_italic_comments = true
vim.g.moonlight_italic_keywords = true
vim.g.moonlight_italic_functions = true
vim.g.moonlight_italic_variables = true
vim.g.moonlight_contrast = true -- sidebars|popup menus like nvim-tree|telescope have different background
vim.g.moonlight_borders = true
vim.g.moonlight_disable_background = true -- for terminal
vim.api.nvim_exec(
	[[
  augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.clear_references()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  augroup END
]],
	false
)
