local status_ok, navic = pcall(require, "nvim-navic")
local icons = require("user.icons").vscode_icons
if not status_ok then
	return
end

navic.setup({
	icons = icons,
	highlight = true,
	separator = " " .. "" .. " ",
	depth_limit = 0,
	depth_limit_indicator = "..",
})

vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsField", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsString", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true })
vim.api.nvim_set_hl(0, "NavicText", { default = true })
vim.api.nvim_set_hl(0, "NavicSeparator", { default = true })
