-- Commands for autopep8 formatting
vim.cmd("autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>")
vim.cmd("let g:autopep8_max_line_length=79")
vim.cmd("let g:autopep8_indent_size=2")
