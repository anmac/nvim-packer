local colorscheme = "catppuccin"

local status_config_theme_ok, _ = pcall(require, "user.themes." .. colorscheme)
if not status_config_theme_ok then
	vim.notify(colorscheme .. " config file not found!")
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

if colorscheme == "gruvbox" or colorscheme == "gruvbox-material" then
	vim.cmd([[highlight CursorLineNR guibg=NONE]])
	vim.cmd([[highlight LineNr guifg=#5EACD3]])
	if colorscheme == "gruvbox" then
		vim.cmd([[highlight Normal guibg=NONE ctermfg=NONE]])
	end
end

---------------------------------------------------
-- Choose one colorscheme and replace at the top --
---------------------------------------------------
-- darkplus
-- tokyonight
-- tokyodark
-- gruvbox
-- gruvbox-material
-- rose-pine
-- onedarkpro
-- nightfly
-- moonlight
-- onenord
-- catppuccin
