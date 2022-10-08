local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

comment.setup({
	padding = true,
	sticky = true,
	toggler = {
		line = "gcc",
		block = "gbc",
	},
	opleader = {
		line = "gc",
		block = "gb",
	},
	extra = {
		above = "gcO", ---Add comment on the line above
		below = "gco", --Add comment on the line below
		eol = "gcA", --Add comment at the end of line
	},
	mappigns = {
		basic = true,
		extra = true,
		extended = true,
	},
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	-- pre_hook = function(ctx)
	-- 	-- Only calculate commentstring for tsx filetypes
	-- 	if vim.bo.filetype == "typescriptreact" then
	-- 		local U = require("Comment.utils")

	-- 		-- Determine whether to use linewise or blockwise commentstring
	-- 		local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

	-- 		-- Determine the location where to calculate commentstring from
	-- 		local location = nil
	-- 		if ctx.ctype == U.ctype.blockwise then
	-- 			location = require("ts_context_commentstring.utils").get_cursor_location()
	-- 		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
	-- 			location = require("ts_context_commentstring.utils").get_visual_start_location()
	-- 		end

	-- 		return require("ts_context_commentstring.internal").calculate_commentstring({
	-- 			key = type,
	-- 			location = location,
	-- 		})
	-- 	end
	-- end,
	ignore = "^$",
})
