local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip.loaders.from_vscode").lazy_load()
luasnip.filetype_extend("javascript", { "javascriptreact" })
luasnip.filetype_extend("php", { "html" })

local icons = require("user.icons").vscode_icons

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE" })
vim.g.cmp_active = true

cmp.setup({
	enabled = function()
		local buftype = vim.api.nvim_buf_get_option(0, "buftype")
		if buftype == "prompt" then
			return false
		end
		return vim.g.cmp_active
	end,
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Right>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	view = { -- entries can be "custom", "wildmenu" or "native"
		entries = { name = "custom", selection_order = { "near_cursor" } },
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local prsnt, lspkind = pcall(require, "lspkind")
			if not prsnt then
				-- Kind icons or VScode icons. Choose what you want
				vim_item.kind = icons[vim_item.kind] or ""

				if entry.source.name == "cmp_tabnine" then
					vim_item.kind = "ﮧ "
					vim_item.kind_hl_group = "CmpItemKindTabnine"
				end
				if entry.source.name == "copilot" then
					vim_item.kind = " "
					vim_item.kind_hl_group = "CmpItemKindCopilot"
				end
				if entry.source.name == "emoji" then
					vim_item.kind = "ﲃ "
					vim_item.kind_hl_group = "CmpItemKindEmoji"
				end

				vim_item.kind = " " .. vim_item.kind .. " "

				-- NOTE: order matters
				vim_item.menu = ({
					nvim_lsp = "  [LSP]",
					nvim_lua = "  [Lua]",
					luasnip = "  [LuaSnip]",
					buffer = "  [Buffer]",
					path = "  [Path]",
					cmp_tabnine = "  [Tabnine]",
					copilot = "  [Copilot]",
					emoji = "  [Emoji]",
				})[entry.source.name]

				return vim_item
			else
				-- Using lspkind plugin
				local kind =
					lspkind.cmp_format({ mode = "symbol_text", preset = "codicons", maxwidth = 50 })(entry, vim_item)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })

				if strings[1] == "" then
					strings[1] = ""
				end

				kind.kind = " " .. strings[1] .. " "
				-- kind.menu = " (" .. strings[2] .. ")"
				return kind
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "treesitter" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "emoji" },
		{ name = "copilot" },
		{ name = "cmp_tabnine" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = "rounded",
			winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
		},
		completion = {
			border = "rounded",
			winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},
	experimental = {
		ghost_text = false,
	},
})

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})

local tabnine_status, tabnine = pcall(require, "tabnine")
if not tabnine_status then
	return
end

tabnine.setup({
	disable_auto_comment = true,
	accept_keymap = "<Tab>",
	dismiss_keymap = "<C-]>",
	debounce_ms = 600,
	suggestion_color = { gui = "#808080", cterm = 244 },
	exclude_filetypes = { "TelescopePrompt" },
})
