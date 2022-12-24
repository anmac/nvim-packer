local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup({
	level = 2,
	timeout = 3000,
  max_width = 60,
  max_height = 10,
	stages = "static", -- fade_in_slide_out, fade, slide, static
  background_colour = "Normal",
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
  on_open = nil,
  on_close = nil,
  render = "default", -- default, minimal, simple
	minimum_width = 10,
	fps = 30,
	top_down = false,
})

-- Other plugins can use the notification windows by setting it as your default notify function
-- vim.notify = notify

local notify_filter = vim.notify
vim.notify = function(msg, ...)
	if msg:match("character_offset must be called") then
		return
	end
	if msg:match("method textDocument") then
		return
	end

	notify_filter(msg, ...)
end
