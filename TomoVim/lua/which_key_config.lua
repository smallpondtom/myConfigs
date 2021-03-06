local status_ok, _ = pcall(require, "which-key")
if not status_ok then
  return
end

local wk = require("which-key")

wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = ":", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
})

local mappings = {
	e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
	o = { "<cmd>SymbolsOutline<CR>", "Outline" },
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<CR>", "Compile" },
		i = { "<cmd>PackerInstall<CR>", "Install" },
		l = { "<cmd>PackerLoad<cr>", "Load" },
		s = { "<cmd>PackerSync<CR>", "Sync" },
		S = { "<cmd>PackerStatus<CR>", "Status" },
		u = { "<cmd>PackerUpdate<CR>", "Update" },
	},
	s = {
		name = "Search",
		g = { "<cmd>Telescope git_branches<CR>", "Check Branch" },
		c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
		f = { "<cmd>Telescope find_files<CR>", "Find File" },
		h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
		M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
		R = { "<cmd>Telescope registers<CR>", "Registers" },
		t = { "<cmd>Telescope live_grep<CR>", "Text" },
		s = { "<cmd>Telescope grep_string<CR>", "String" },
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
		b = { "<cmd>Telescope file_browser<CR>", "File Browser" },
		C = { "<cmd>Telescope commands<CR>", "Commmands" },
		q = { "<cmd>Telescope quickfix<CR>", "List" },
		p = {
			"<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<CR>",
			"Preview Colorscheme",
		},
		d = { "<cmd>lua require('telescope').extensions.dap.list_breakpoints{}<CR>", "BreakPoints" },
		j = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search Buffer" },
		n = { "<cmd>Telescope notify<CR>", "Notify" },
		e = { "<cmd>Telescope env<CR>", "Envs" },
		o = { "<cmd>Telescope repo list<CR>", "Git Repos" },
	},
	M = {
		name = "Markdown",
		p = { "<Plug>MarkdownPreview", "Preview" },
		s = { "<Plug>MarkdownPreviewStop", "Stop" },
		t = { "<Plug>MarkdownPreviewToggle", "Toggle" },
	},
	n = {
		name = "NeoGen",
		c = { "<cmd>lua require('neogen').generate({ type = 'class' })<CR>", "function" },
		f = { "<cmd>lua require('neogen').generate({ type = 'func' })<CR>", "function" },
	},
	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},

	l = {
		name = "Lsp",
		a = { "<cmd>lua require('lvim.core.telescope').code_actions()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		p = {
			name = "Picker",
			r = { "<cmd>Telescope lsp_references", "References" },
			s = { "<cmd>Telescope lsp_workspace_symbols", "Workspace Symbols" },
			d = { "<cmd>Telescope lsp_definitions", "Definitions" },
			t = { "<cmd>Telescope lsp_type_definition", "Type Defs" },
		},
	},
	t = {
		name = "Trouble",
		t = { "<cmd>TroubleToggle<cr>", "Toggle" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnose" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Doc Diagnose" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
		l = { "<cmd>TroubleToggle loclist<cr>", "Locatior" },
		L = { "<cmd>TroubleToggle lsp_references<cr>", "Lsp Ref" },
	},
	T = {
		name = "Terminal",
		l = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		b = { "<cmd>lua _BPYTOP_TOGGLE()<CR>", "Bpytop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<CR>", "Bpytop" },
		h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Toggle Horz" },
		v = { "<cmd>ToggleTerm direction=vertical<cr>", "Toggle Vert" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Open Float" },
		t = { "<cmd>ToggleTerm direction=tab<cr>", "Open Tab" },
		a = { "<cmd>ToggleTermToggleAll<cr>", "Toggle All" },
	},
	d = {
		name = "Debug",
		s = {
			name = "Step",
			c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },  -- to run debugger
			v = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },  -- to move down a line
			i = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },  -- to run everything until the next breakpoint
			o = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },  -- step into the line where you are currently at
		},
		u = {
			name = "UI",
			s = { "<cmd>lua require('dapui').setup()<cr>", "Setup" },
			t = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle" },
			o = { "<cmd>lua require('dapui').open()<cr>", "Open" },
			c = { "<cmd>lua require('dapui').close()<cr>", "Close" },
    },
		r = {
			name = "REPL",
			o = { "<cmd>lua require('dap').repl.open()<cr>", "Open" },
			c = { "<cmd>lua require('dap').repl.close()<cr>", "Close" },
			t = { "<cmd>lua require('dap').repl.toggle()<cr>", "Toggle" },
			r = { "<cmd>lua require('dap').repl.run_last()<cr>", "Run Last" },
		},
    b = {
      name = "Breakpoints",
      c = {
				"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
				"Breakpoint Condition",
			},
			m = {
				"<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
				"Log Point Message",
			},
			t = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Create" },
			r = { "<cmd>lua require('dap').clear_breakpoints()<CR>", "Clear" },
		},
		T = { "<cmd>UltestDebug<CR>", "Test Debug" },
	},
}
local gopts = {
	mode = "n",
	prefix = "g",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local gmappings = {
	["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover" },
	["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
	["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
	["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Goto references" },
	["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "show signature help" },
}

local opts = {
	mode = "n",
	prefix = "<Leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

wk.register(mappings, opts)
wk.register(gmappings, gopts)
