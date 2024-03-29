-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir", "DressingSelect", "tsplayground" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
	end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
	pattern = { "AlphaReady" },
	callback = function()
		vim.cmd([[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "term://*" },
	callback = function()
		vim.cmd("startinsert!")
		-- TODO: if java = 2
		vim.cmd("set cmdheight=1")
	end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
vim.cmd("autocmd BufWinLeave * let b:winview = winsaveview()")
vim.cmd("autocmd BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | endif")
-- vim.cmd("autocmd ModeChanged [vV\x16]*:* hi illuminatedWord guifg=NONE guibg=NONE")

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	callback = function()
-- 		vim.cmd("hi link illuminatedWord LspReferenceText")
-- 	end,
-- })

-- Matchup highlighting colors
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd([[
      hi MatchParen guifg=#fab387 cterm=italic gui=italic
      hi MatchWord cterm=bold gui=bold guifg=NONE guibg=NONE
    ]])
	end,
})

-- Restore last cursor position
vim.api.nvim_create_autocmd({ "BufReadPost " }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})
