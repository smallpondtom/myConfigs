require("dap-config.dapui-config")

local dap_install = require("dap-install")

local dap_status, dap = pcall(require, "dap")

if not dap_status then
  vim.notify("Please Install 'nvim-dap'")
  return
end

dap.defaults.fallback.focus_terminal = true
dap.defaults.fallback.terminal_win_cmd = '50vsplit new'

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

-- python
dap_install.config("python", {})

-- c/c++
dap_install.config("ccppr_vsc", {})

-- nvim-dap-virtual-text. Show virtual text for current frame
require("nvim-dap-virtual-text").setup {
    enabled = true,                     -- enable this plugin (the default)
    enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,            -- show stop reason when stopped for exceptions
    commented = true,                  -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = true,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = 80,             -- position the virtual text at a fixed window column (starting from the first text column)
}

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})
