-- *WILL REQUIRE OCTAVE TO BE INSTALLED

-- Settings for Octave and MATLAB language highlighting

vim.cmd [[
  augroup filetypedetect
    au! BufRead,BufNewFile *.m,*.oct set filetype=octave
  augroup END
]]

-- Use keywords from Octave syntax language file for autocomplete
vim.cmd [[
  if has("autocmd") && exists("+omnifunc")
     autocmd Filetype octave
     \ if &omnifunc == "" |
     \ setlocal omnifunc=syntaxcomplete#Complete |
     \ endif
  endif
]]

-- custom highlight
vim.cmd("let octave_highlight_variables = 1")
vim.cmd("let octave_highlight_operators = 1")
