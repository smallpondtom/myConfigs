-- LUA
-- htps://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local os = vim.fn.has('unix')
local sumneko_root_path = "/home/" .. USER .. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/"
local sumneko_binary = ""

if os then -- when Linux
  sumneko_binary = sumneko_root_path .. "bin/lua-language-server"
else -- if WSL windows
  sumneko_binary = sumneko_root_path .. "bin/Linux/lua-language-server"
end -- I don't use MAC

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}

-- PYTHON
USER = vim.fn.expand('$USER')
local pyright_binary = "/home/" .. USER .. "/.local/share/nvim/lsp_servers/python/node_modules/.bin/pyright-langserver"
require('lspconfig').pyright.setup {
  cmd = { pyright_binary, "--stdio" },
  filetypes = { "python" }
}

-- C/C++
USER = vim.fn.expand('$USER')
local clangd_binary = "/home/" .. USER .. "/.local/share/nvim/lsp_servers/clangd/clangd_13.0.0/bin/clangd"
require('lspconfig').clangd.setup {
  cmd = { clangd_binary, "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" }
}
