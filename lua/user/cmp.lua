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
-- luasnip.filetype_extend("html", { "javascript" })

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_jin_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local icons = require("user.icons").vscode_icons

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030", bg = "NONE" })

vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE" })
-- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
-- vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE" })
-- vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
-- vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })
-- vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
-- vim.api.nvim_set_hl(0, "CmpItemKindKeyjord", { fg = "#C3E88D", bg = "#9FBD73" })
-- vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
-- vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
-- vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })
-- vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
-- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })
-- vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
-- vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
-- vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
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
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.jumpable(1) then
				luasnip.jump(1)
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
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
				kind.menu = " (" .. strings[2] .. ")"
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
		ghost_text = true,
	},
})
