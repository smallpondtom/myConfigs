local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- LUh
-- htps://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand("$USER")

local os = vim.fn.has("unix")
local sumneko_root_path = "/home/" .. USER .. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/"
local sumneko_binary = ""

-- Detect whether it is WSL or pure linux
local is_wsl = vim.api.nvim_exec(
	[[
  function! Is_WSL() abort
    let proc_version = '/proc/version'
    return filereadable(proc_version)
          \  ? !empty(filter(
          \    readfile(proc_version, '', 1), { _, val -> val =~? 'microsoft' }))
          \  : v:false
  endfunction

  echo Is_WSL()
]],
	true
)

if os then -- when Linux
	if is_wsl == "1" then -- if WSL
		sumneko_binary = sumneko_root_path .. "bin/Linux/lua-language-server"
	elseif is_wsl == "0" then -- if pure Linux
		sumneko_binary = sumneko_root_path .. "bin/lua-language-server"
	else
		print("Not valid -> requires debugging.")
	end
else -- if windows or Mac
	print("I hate MacOS. Use Linux.")
end

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})

-- PYTHON PYLSP
-- USER = vim.fn.expand('$USER')
-- local pylsp_binary = "/home/" .. USER .. "/.local/share/nvim/lsp_servers/pylsp/venv/bin/pylsp"
-- require('lspconfig').pylsp.setup {
--   cmd = { pylsp_binary },
--   filetypes = { "python" }
-- }

-- PYRIGHT
USER = vim.fn.expand("$USER")
local pyright_binary = "/home/" .. USER .. "/.local/share/nvim/lsp_servers/python/node_modules/.bin/pyright-langserver"
require("lspconfig").pyright.setup({
	cmd = { pyright_binary, "--stdio" },
	filetypes = { "python" },
})

-- PYTHON JEDI
-- USER = vim.fn.expand('$USER')
-- local jedi_binary = "/home/" .. USER .. "/.local/share/nvim/lsp_servers/jedi_language_server/venv/bin/jedi-language-server"
-- require('lspconfig').jedi_language_server.setup {
--   cmd = { jedi_binary },
--   filetypes = { "python" }
-- }

-- C/C++
USER = vim.fn.expand("$USER")
local clangd_binary = "/home/" .. USER .. "/.local/share/nvim/lsp_servers/clangd/clangd_13.0.0/bin/clangd"
require("lspconfig").clangd.setup({
	cmd = { clangd_binary },
	filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp", "cfg" },
})

-- Cmake
local cmake_binary = "/home/" .. USER .. "/.local/share/nvim/lsp_servers/cmake/venv/bin/cmake-language-server"
require("lspconfig").cmake.setup({
	cmd = { cmake_binary },
	filetypes = { "cmake" },
})

-- Julia
require("lspconfig").julials.setup({})

-- Haskell
local hls_binary = "/home/" .. USER .. "/.local/share/nvim/lsp_servers/haskell/haskell-language-server-wrapper"
require("lspconfig").hls.setup({
	cmd = { hls_binary, "--lsp" },
	filetypes = { "haskell", "lhaskell", "hs", "lhs" },
	single_file_support = true,
})

-- JSON
local json_binary = "/home/"
	.. USER
	.. "/.local/share/nvim/lsp_servers/jsonls/node_modules/.bin/vscode-json-language-server"
require("lspconfig").jsonls.setup({
	cmd = { json_binary, "--stdio" },
	filetypes = { "json", "jsonc" },
	init_options = {
		provideFormatter = true,
	},
	single_file_support = true,
})

-- NIM
local nim_binary = "/home/" .. USER .. "/.nimble/bin/nimlsp"
require("lspconfig").nimls.setup({
	cmd = { nim_binary },
	filetypes = { "nim" },
	single_file_support = true,
})
