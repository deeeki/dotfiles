set nocompatible

" NeoBundle - management plugins
" ------------------------------------------------------------------------------
filetype off "required for NeoBundle

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'groenewege/vim-less'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/nginx.vim'
NeoBundle 'vim-ruby/vim-ruby'
if v:version >= 702
NeoBundle 'ujihisa/quickrun'
endif

" Setting
" ------------------------------------------------------------------------------
filetype plugin indent on

if !has('gui_running')
	colorscheme darkblue
endif

set fileformat=unix
set fileencoding=utf-8
set enc=utf-8
set noswapfile "スワップファイルなし
set nobackup "バックアップなし
set undodir=~/.vim/undo "undoファイル保存場所統一
set laststatus=2 " 常にステータス行を表示 (詳細は:he laststatus)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set autoread "ファイル変更時自動再読み込み
set number "行番号表示
set title "タイトル表示
set cursorline "カーソル行をハイライト
set tabstop=4 "<Tab>に対応する空白の数
set softtabstop=0 "<Tab>押下時に挿入される空白の数。0だとtsの数
set shiftwidth=4 "シフト移動幅
set list "不可視文字を表示
set listchars=tab:>_,nbsp:%,extends:>,precedes:< "表示される文字フォーマット指定
set showmatch "閉じ括弧入力時に対応する括弧を表示
set matchtime=1 "showmatchの時間
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭/行末で止まらないように
set wildmenu " コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set smartcase "検索文字列に大文字が含まれている場合は区別して検索
set backupskip=/tmp/*,/private/tmp/* "バックアップSkip (for crontab)
set display=lastline "長い行表示
set pumheight=10 "補完メニューの高さ
"set paste "ペースト時にautoindentを無効に
"set hidden "編集中でも保存せずに他のファイルを表示

" スワップファイルをホームディレクトリに保存
"set swapfile
"set directory=~/.vimswap
" バックアップファイルをホームディレクトリに保存
"set backup
"set backupdir=~/.vimbackup
" セッションファイルをホームディレクトリに保存
"au VimLeave * mks! ~/session.vim
"au VimEnter * :so ~/session.vim

"indents
au FileType html,xhtml,css,scss,sass,less,javascript,coffee,handlebars setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
au FileType ruby,eruby,cucumber setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
au FileType php setlocal tabstop=2 shiftwidth=2

nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Return>

"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

"保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
"保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/  /ge

"複数行インデント連続実行
vnoremap <silent> > >gv
vnoremap <silent> < <gv

"vimでスペースやTabなどの見えない文字を表示させる方法 - Life is Try and Error
"http://d.hatena.ne.jp/potappo2/20061107/1162862536
if has("syntax")
	"行頭のスペースの連続をハイライトさせる
	"function! SOLSpaceHilight()
	"	syntax match SOLSpace '^\s\+' display containedin=ALL
	"	highlight SOLSpace term=underline ctermbg=darkblue
	"endf
	"全角スペースをハイライトさせる
	function! JISX0208SpaceHilight()
		syntax match JISX0208Space "　" display containedin=ALL
		highlight JISX0208Space term=underline ctermbg=darkblue
	endf
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
":set cursorcolumn
:highlight CursorLine term=underline cterm=underline guibg=Grey90
":highlight CursorColumn term=reverse ctermbg=7 guibg=Grey90

"vimエディタからクリップボードを利用する。 — 名無しのvim使い
"http://nanasi.jp/articles/howto/editing/clipboard.html
" GUI版vimエディタで、この機能を有効にするなら、この設定を追加する。
:set guioptions+=a
"GUI版でない場合は、こちらの設定を追加する。
" :set clipboard+=autoselect
"無名レジスタに入るデータを、*レジスタにも入れる。
:set clipboard+=unnamed

"括弧までを消したり置き換えたり
"http://vim-users.jp/2011/04/hack214/
onoremap ) t)
onoremap ( t(
vnoremap ) t)
vnoremap ( t(

"whitespaceEOL on highlight via. gunyara
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /s+$/

"Vimで 保存した UTF-8 なファイルが Quick Look で見られない問題に対処する - Yarukidenized:ヤルキデナイズド
"http://d.hatena.ne.jp/uasi/20110523/1306079612
au BufWritePost * call SetUTF8Xattr(expand("<afile>"))
function! SetUTF8Xattr(file)
	let isutf8 = &fileencoding == "utf-8" || ( &fileencoding == "" && &encoding == "utf-8")
	if has("unix") && match(system("uname"),'Darwin') != -1 && isutf8
		call system("xattr -w com.apple.TextEncoding 'utf-8;134217984' '" . a:file . "'")
	endif
endfunction

"[vim] HTML5のシンタックスハイライト・インデントをERBでも有効化 | CreativeStyle
"http://www.kadoppe.net/archives/2011/09/vim-html5-highlight-indent-erb.html
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

"VimでのMarkdown環境を整える - rcmdnk's blog
"http://rcmdnk.github.io/blog/2013/11/17/computer-vim/
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

"Keep lines fewer than 80 characters
"https://github.com/bbatsov/ruby-style-guide#formatting
if exists('+colorcolumn')
	set colorcolumn=80
else
	" Emulate
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

" Plugins
" ------------------------------------------------------------------------------
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
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
" http://d.hatena.ne.jp/ruedap/20110117/vim_unite_plugin_1_week
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

" Indent Guides
" --------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
augroup indentguides
    autocmd!
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=4
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=0
augroup END

" quickrun.vim
" --------------------------------------
"quickrun.vimでObjective-Cをコンパイル実行するための設定 - 今日もスミマセン。
"http://d.hatena.ne.jp/snaka72/20110504/1304478843
let g:quickrun_config = {
  \   'objc': {
  \     'command': 'cc',
  \     'exec': ['%c %s -o %s:p:r -framework Foundation', '%s:p:r %a', 'rm -f %s:p:r'],
  \     'tempfile': '{tempname()}.m',
  \   }
  \ }
