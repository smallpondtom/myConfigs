vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = {
   "████████╗ ██████╗ ███╗   ███╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
   "╚══██╔══╝██╔═══██╗████╗ ████║██╔═══██╗██║   ██║██║████╗ ████║",
   "   ██║   ██║   ██║██╔████╔██║██║   ██║██║   ██║██║██╔████╔██║",
   "   ██║   ██║   ██║██║╚██╔╝██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
   "   ██║   ╚██████╔╝██║ ╚═╝ ██║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
   "   ╚═╝    ╚═════╝ ╚═╝     ╚═╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
   '',
   '                ⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕               ',
   '                ⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕               ',
   '                ⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕               ',
   '                ⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕               ',
   '                ⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑               ',
   '                ⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐               ',
   '                ⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐               ',
   '                ⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔               ',
   '                ⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕               ',
   '                ⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕               ',
   '                ⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕               ',
   '                ⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕               ',
   '                ⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁               ',
   '                ⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿               ',
   '',
}

vim.g.dashboard_custom_section = {
  a = {
    description = { "             📂 Find File                    " },
    command = "Telescope find_files",
  },
  b = {
    description = { "              🤯 New File                      " },
    command = ":ene!",
  },
  c = {
    description = { "             🌊 Recent Projects              " },
    command = "Telescope projects",
  },
  d = {
    description = { "             🌈 Recently Opened Files        " },
    command = "Telescope oldfiles",
  },
  e = {
    description = { "             🎴 Find Word                    " },
    command = "Telescope live_grep",
  },
  f = {
    description = { "             🌀 Edit Config                  " },
    command = ":e $HOME/.config/nvim/init.lua",
  },
}

vim.g.dashboard_command_footer = { "TomoVim is Awesome" }
