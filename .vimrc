" Default
" ------------------------------------------------------------------------------
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file
" endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Additional
" ------------------------------------------------------------------------------
" セッションファイルをホームディレクトリに保存
"au VimLeave * mks! ~/session.vim
"au VimEnter * :so ~/session.vim
" スワップファイルをホームディレクトリに保存
"set swapfile
"set directory=~/.vimswap
" バックアップファイルをホームディレクトリに保存
"set backup
"set backupdir=~/.vimbackup

set noswapfile " スワップファイルなし
set nobackup " バックアップなし

" 検索文字列に大文字が含まれている場合は区別して検索
set smartcase
" インデント
set tabstop=4 "<Tab>に対応する空白の数
set softtabstop=0 "<Tab>押下時に挿入される空白の数。0だとtsの数
set shiftwidth=4 "シフト移動幅
" ペースト時にautoindentを無効に
"set paste
" 編集中でも保存せずに他のファイルを表示
"set hidden
set list "不可視文字を表示
set listchars=tab:>_ "表示される文字フォーマット指定
set showmatch "閉じ括弧入力時に対応する括弧を表示
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭/行末で止まらないように

set fileformat=unix
set fileencoding=utf-8
set enc=utf-8

set wildmenu
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set number "行番号表示
set title
"カーソル行をハイライト
set cursorline
"バックアップSkip (for crontab)
set backupskip=/tmp/*,/private/tmp/*

nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Return>

"tab文字も区別されずにハイライトされるので、区別したいときはTab文字の表示を別に設定する必要がある。
"function! SOLSpaceHilight()
"	syntax match SOLSpace '^\s\+' display containedin=ALL
"	highlight SOLSpace term=underline ctermbg=darkblue
"endf

"全角スペースをハイライトさせる。
function! JISX0208SpaceHilight()
	syntax match JISX0208Space "　" display containedin=ALL
	highlight JISX0208Space term=underline ctermbg=darkblue
endf

"syntaxの有無をチェックし、新規バッファと新規読み込み時にハイライトさせる
if has("syntax")
	syntax on
	augroup invisible
		autocmd! invisible
"		autocmd BufNew,BufRead * call SOLSpaceHilight()
		autocmd BufNew,BufRead * call JISX0208SpaceHilight()
	augroup END
endif

"カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=black guibg=black

":set cursorcolumn
:highlight CursorLine     term=underline cterm=underline guibg=Grey90
":highlight CursorColumn   term=reverse ctermbg=7 guibg=Grey90

"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

"保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
"保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/  /ge

" GUI版vimエディタで、この機能を有効にするなら、この設定を追加する。
:set guioptions+=a
" GUI版でない場合は、こちらの設定を追加する。
" :set clipboard+=autoselect

" 無名レジスタに入るデータを、*レジスタにも入れる。
:set clipboard+=unnamed

" 括弧までを消したり置き換えたり
" http://vim-users.jp/2011/04/hack214/
onoremap ) t)
onoremap ( t(
vnoremap ) t)
vnoremap ( t(

" whitespaceEOL on highlight via. gunyara
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /s+$/

" Vimで 保存した UTF-8 なファイルが Quick Look で見られない問題に対処する - Yarukidenized:ヤルキデナイズド
" http://d.hatena.ne.jp/uasi/20110523/1306079612
au BufWritePost * call SetUTF8Xattr(expand("<afile>"))
function! SetUTF8Xattr(file)
	let isutf8 = &fileencoding == "utf-8" || ( &fileencoding == "" && &encoding == "utf-8")
	if has("unix") && match(system("uname"),'Darwin') != -1 && isutf8
		call system("xattr -w com.apple.TextEncoding 'utf-8;134217984' '" . a:file . "'")
	endif
endfunction

" Ruby softtab 2
au FileType ruby,eruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Plugins
" ------------------------------------------------------------------------------
" Vundle
" --------------------------------------
"filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Bundle 'rails.vim'
Bundle 'bbommarito/vim-slim'
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
if v:version >= 702
Bundle 'ujihisa/quickrun'
endif

"filetype plugin indent on

" neocomplcache
" http://vim-users.jp/2010/10/hack177/
" http://vim-users.jp/2010/11/hack185/
" http://vim-users.jp/2011/01/hack193/
" --------------------------------------
" disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" ref.vim
" --------------------------------------
nmap ,rr :<C-u>Ref refe<Space>
nmap ,ra :<C-u>Ref alc<Space>
nmap ,rp :<C-u>Ref phpmanual<Space>

let g:ref_alc_start_linenumber = 39 " 表示する行数
if isdirectory(expand('~/.vim/reference/phpmanual'))
	let g:ref_phpmanual_path = $HOME . '/.vim/reference/phpmanual'
endif

" unite.vim
" https://github.com/Shougo/unite.vim/blob/master/doc/unite.jax
" --------------------------------------
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]

"nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
"nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
"nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
"nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
"nnoremap  [unite]f  :<C-u>Unite source<CR>

nnoremap <silent> [unite]a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]m  :<C-u>Unite -buffer-name=files file_mru<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
	" Overwrite settings.

	nmap <buffer> <ESC>      <Plug>(unite_exit)
	imap <buffer> jj      <Plug>(unite_insert_leave)
	"imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

	" <C-l>: manual neocomplcache completion.
	inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>
	" ウィンドウを分割して開く
	au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	" ウィンドウを縦に分割して開く
	au FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('vsplit')
	au FileType unite inoremap <silent> <buffer> <expr> <C-k> unite#do_action('vsplit')
	" ESCキーを2回押すと終了する
	nmap <silent><buffer> <ESC><ESC> q
	imap <silent><buffer> <ESC><ESC> <ESC>q

	" Start insert.
	let g:unite_enable_start_insert = 1
endfunction"}}}

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
" http://d.hatena.ne.jp/ruedap/20110117/vim_unite_plugin_1_week
