local status_ok, _ = pcall(require, "null-ls")
if not status_ok then
  return
end

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local codeActions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

-- register any number of sources simultaneously
local sources = {
	-- Formatting
	formatting.autopep8, -- not necessary if pylsp
	formatting.stylua,
	formatting.clang_format,
  formatting.fourmolu,
	--formatting.prettier,

  codeActions.gitsigns,
	-- null_ls.builtins.diagnostics.write_good,

  completion.luasnip,
}

null_ls.setup({
	sources = sources,
	-- you can reuse a shared lspconfig on_attach callback here
	-- on_attach = function(client)
	-- 	if client.resolved_capabilities.document_formatting then
	-- 		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	-- 	end
	-- end,
})
