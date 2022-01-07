local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local codeActions = null_ls.builtins.code_actions

-- register any number of sources simultaneously
local sources = {
	-- Formatting
	formatting.autopep8, -- not necessary if pylsp
	formatting.stylua,
	formatting.clang_format,
	--formatting.prettier,

  codeActions.gitsigns,
	-- null_ls.builtins.diagnostics.write_good,
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
