set autoindent smartindent
set clipboard& clipboard+=unnamedplus
set list
set number

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
if !dein#load_state(s:dein_dir)
  finish
endif
call dein#begin(s:dein_dir)
call dein#load_toml('~/.config/nvim/dein.toml',      {'lazy': 0})
call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
call dein#load_toml('~/.config/nvim/dein_ft.toml')
call dein#end()
if dein#check_install()
 call dein#install()
endif

filetype plugin indent on
syntax enable

autocmd BufWritePre * :%s/\s\+$//ge
