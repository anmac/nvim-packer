local colorscheme = "catppuccin"

local status_config_theme_ok, _ = pcall(require, "user.themes." .. colorscheme)
if not status_config_theme_ok then
	vim.notify(colorscheme .. " config file not found!")
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify(colorscheme .. " colorscheme not found!")
	return
end

if colorscheme == "gruvbox" or colorscheme == "gruvbox-material" then
	vim.cmd([[highlight CursorLineNR guibg=NONE]])
	vim.cmd([[highlight LineNr guifg=#5EACD3]])
	if colorscheme == "gruvbox" then
		vim.cmd([[highlight Normal guibg=NONE ctermfg=NONE]])
	end
else
	vim.cmd([[highlight LineNr guifg=#6d707c]])
	vim.cmd([[highlight CursorLineNr guifg=#5eacd3]])
	vim.cmd([[highlight Comment guifg=#9EA0AA]])
	vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#6d707c]])
	vim.cmd([[highlight NonText guifg=#50545d]])
	vim.cmd([[highlight Visual cterm=bold gui=bold guibg=#264f78]])
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
-- synthwave84
