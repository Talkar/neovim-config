vim.opt.number=true      ----Show line numbers
vim.opt.relativenumber	=true    ----Show relative line number
vim.opt.showcmd=true        ----Show command in bottom bar

--Visual settings
vim.opt.ruler=true            --Show the cursor position all the time
vim.opt.showmatch=true             --Highlight matching brackets
vim.opt.ignorecase=true       --Case insensitive searching
vim.opt.smartcase=true           --Case sensitive when search includes upper case
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.undofile = true
vim.opt.undodir = "$HOME/.vim/undodir"
vim.opt.swapfile = false
vim.opt.backup = false

--Searchsettings
vim.opt.incsearch=true                 --Incremental search
vim.opt.hlsearch=false                 --Highlight search results

--Indentationsettings
vim.opt.tabstop=2--Number of visual spaces per TAB
vim.opt.shiftwidth=2--Number of spaces to use for autoindent
vim.opt.expandtab=true--Convert tabs to spaces
vim.opt.smartindent=true--Enable smart indent
