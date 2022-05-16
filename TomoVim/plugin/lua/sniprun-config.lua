local status_ok, _ = pcall(require, "sniprun")
if not status_ok then
  return
end

require("sniprun").setup({
	display_options = { notification_timeout = 10 },
	display = { "NvimNotify" },
})
