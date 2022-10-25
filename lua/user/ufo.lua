local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
	return
end

local ftMap = {
	vim = "indent",
	python = { "indent" },
	git = "",
}

local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = ("  %d "):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, "MoreMsg" })
	return newVirtText
end

ufo.setup({
	open_fold_hl_timeout = 150,
	provider_selector = function(bufnr, filetype, buftype)
		-- return { "treesitter", "indent" }
		return ftMap[filetype]
	end,
	-- close_fold_kinds = { "imports", "comment" },
	close_fold_kinds = {},
	fold_virt_text_handler = handler,
	enable_get_fold_virt_text = true,
	preview = {
		win_config = {
			-- border = { "", "─", "", "", "", "─", "", "" },
			border = "rounded",
			winhighlight = "Normal:Folded",
			winblend = 0,
			-- winblend = 12,
			maxheight = 20,
		},
		mappings = {
			scrollU = "<C-u>",
			scrollD = "<C-d>",
		},
	},
})
