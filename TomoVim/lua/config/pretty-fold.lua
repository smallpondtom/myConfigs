local status_ok, _ = pcall(require, "pretty-fold")
if not status_ok then
  return
end

require('pretty-fold').setup{
   keep_indentation = false,
   fill_char = '━',
   sections = {
      left = {
         '━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣'
      },
      right = {
         '┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
      }
   },
   remove_fold_markers = true,

   -- Possible values:
   -- "delete" : Delete all comment signs from the fold string.
   -- "spaces" : Replace all comment signs with equal number of spaces.
   -- false    : Do nothing with comment signs.
   process_comment_signs = 'spaces',

   -- List of patterns that will be removed from content foldtext section.
   stop_words = {
      '@brief%s*', -- (for cpp) Remove '@brief' and all spaces after.
   },

   add_close_pattern = true,
   matchup_patterns = {
      { '{', '}' },
      { '%(', ')' }, -- % to escape lua pattern char
      { '%[', ']' }, -- % to escape lua pattern char
      { 'if%s', 'end' },
      { 'do%s', 'end' },
      { 'for%s', 'end' },
   },
}

-- require('pretty-fold.preview').setup_keybinding('h') -- choose 'h' or 'l' key
