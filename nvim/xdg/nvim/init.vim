"set nocompatible

" Enable mouse
set mouse=a

" Line number
set number

" Syntax highlight
syntax on
colorscheme monokai

" Better backspace handling
set backspace=indent,eol,start

" Highlight current line
set cursorline

" Bugfix for scroll lag
set lazyredraw

" Allow buffers to be hidden
set hidden

" block select not limited by shortest line
set virtualedit=

" Better vim command autocompletion
set wildmenu
set wildmode=list:longest,full

" Indentation
set autoindent
filetype plugin on
set expandtab
set shiftwidth=2
set tabstop=2

" Activate mouse
"set mouse=a
"set ttymouse=urxvt

" Faster escape key
set timeoutlen=30 ttimeoutlen=0

" Ctrl+Arrow to switch buffer
nnoremap <c-h> :bp<CR>
nnoremap <c-l> :bn<CR>
inoremap <c-h> :bp<CR>
inoremap <c-l> :bn<CR>
tnoremap <c-h> :bp<CR>
tnoremap <c-l> :bn<CR>

" Alt+Arrow to switch window
nnoremap <A-k> :wincmd k<CR>
nnoremap <A-j> :wincmd j<CR>
nnoremap <A-h> :wincmd h<CR>
nnoremap <A-l> :wincmd l<CR>
tnoremap <A-k> <C-\><C-n>:wincmd k<CR>
tnoremap <A-j> <C-\><C-n>:wincmd j<CR>
tnoremap <A-h> <C-\><C-n>:wincmd h<CR>
tnoremap <A-l> <C-\><C-n>:wincmd l<CR>


" Map leader to print key
nmap [29~ <leader>

" Map tab to re-indent
nmap <tab> mZgg=G'Z

" Scroll gaps
set scrolloff=5

" Display tab and insecable space
"set listchars=tab:··,nbsp:#
set listchars=tab:\¦·,trail:·
set list

" Live display command you are typing
set showcmd

" No character in vertical spliter
set fillchars+=vert:\|

" Kikoo cursor
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

if &term =~ "xterm\\|rxvt"
	" insert mode
	" let &t_SI = "\<Esc>]12;orange\x7"
	let &t_SI .= "\<Esc>[5 q"
	" normal mode
	" let &t_EI = "\<Esc>]12;orange\x7"
	" silent !echo -ne "\033]12;orange\007"
	let &t_EI .= "\<Esc>[2 q"
	" reset cursor when vim exits
	" autocmd VimLeave * silent !echo -ne "\033]12;gray\007"
	" 1 or 0 -> blinking block
	" 3 -> blinking underscore
	" 5 -> blinking vertical bar
	" 6 -> solid vertical bar
endif

" Use incremental search
set incsearch

" Show relative number when it's needed
set relativenumber

autocmd InsertEnter * set relativenumber!
autocmd InsertLeave * set relativenumber

" Always show gutter
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" Highlight current line and cursor
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

" Better QuickFix window height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
	let l = 1
	let n_lines = 0
	let w_width = winwidth(0)
	while l <= line('$')
		" number to float for division
		let l_len = strlen(getline(l)) + 0.0
		let line_width = l_len/w_width
		let n_lines += float2nr(ceil(line_width))
		let l += 1
	endw
	exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Autoindent
filetype plugin indent on

"""""
" Plug
"""""

call plug#begin()

Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
" Fugitive is required for Conflicted
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'
Plug 'scrooloose/nerdcommenter'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
" Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mxw/vim-jsx'
Plug 'othree/jsdoc-syntax.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'djoshea/vim-autoread'
" Plug 'severin-lemaignan/vim-minimap'
Plug 'ryanoasis/vim-devicons'
Plug 'chilicuil/vim-sprunge'
Plug 'leafgarland/typescript-vim'
Plug 'dsimidzija/vim-nerdtree-ignore'
Plug 'ashisha/image.vim'
Plug 'fatih/vim-go'
Plug 'mileszs/ack.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'neomake/neomake'
Plug 'guns/xterm-color-table.vim'

" Syntax
Plug 'HerringtonDarkholme/yats.vim'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 " JS
 "Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
 Plug 'carlitux/deoplete-ternjs' ", { 'for': ['javascript', 'javascript.jsx'] }
 Plug 'othree/jspc.vim' ", { 'for': ['javascript', 'javascript.jsx'] }
 " TS
 Plug 'mhartington/nvim-typescript'
 " Go
 Plug 'zchee/deoplete-go', { 'do': 'make'}
 " Ruby
 Plug 'fishbullet/deoplete-ruby'
"Plugin 'helino/vim-json'
"call dein#add('Quramy/tsuquyomi', {'build': 'make'})
"call dein#add('Valloric/YouCompleteMe', {'build': './install.py --clang-completer --tern-completer'})

call plug#end()

"""""
" Neomake
"""""

autocmd! BufWritePost * Neomake

let b:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }

"""""
" vim-monster
"""""

" Set async completion.
let g:monster#completion#rcodetools#backend = "async_rct_complete"

" deoplete.nvim
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

"""""
" Vim-go
"""""

let g:go_fmt_command = "goimports"

"""""
" CtrlP
"""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/](tsbuild|node_modules|\.(git|hg|svn))$',
			\ 'file': '\v(\.d|\.o|\.swp|\~)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }

"""""
" Deoplete
"""""

let g:deoplete#enable_at_startup = 1

" Use deoplete.
let g:tern_request_timeout = 1
"let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]

"""""
" NerdTree
"""""

" use NT instead of vim tree when vim is started without file
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Autoclose vim if nerdtree is the last window opened
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Hide help message
let g:NERDTreeMinimalUI = 1

" Hide NT when opening file
let g:NERDTreeQuitOnOpen = 1

" Hide useless files
let g:NERDTreeIgnore = ['\.[od]$', '\~$']

" Open dir in cascade if only one dir is opened
let g:NERDTreeCascadeOpenSingleChildDir = 1

" Enable mouse
let g:NERDTreeMouseMode = 1

" Close opened file if deleted
let g:NERDTreeAutoDeleteBuffer = 1

" Highlight cursor line
let g:NERDTreeHighlightCursorLine = 1

" Colors by filetype
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#141e23')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#141e23')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#141e23')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#141e23')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#141e23')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#141e23')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#141e23')
call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', '#141e23')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#141e23')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#141e23')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#141e23')

"""""
" NerdTreeTabs
"""""

map <C-e> :NERDTreeTabsToggle<CR>

"""""
" NerdTree-git
"""""

let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "═",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ "Unknown"   : "?"
			\ }

"""""
" Airline
"""""

" Activate Airline everytime
set laststatus=2

" Use airline font
let g:airline_powerline_fonts = 1

" Show tabs
let g:airline#extensions#tabline#enabled = 1

" Disable trailing space
let g:airline#extensions#whitespace#enabled = 0

" Theme
autocmd VimEnter * AirlineTheme wombat

"""""
" YouCompleteMe
"""""

" Use tab for semantic completion
let g:ycm_key_invoke_completion = '<TAB>'

" Close description window after completion
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_extra_conf_globlist = [ '~/Documents/Epitech/*' ]

" Identifier completion start with 1 char
let g:ycm_min_num_of_chars_for_completion = 1

" Adds langage keyword to identifier completer
let g:ycm_seed_identifiers_with_syntax = 1

" Use working directory of vim for path completion
"let g:ycm_filepath_completion_use_working_dir = 1

" Better error highlight
highlight YcmErrorSign ctermfg=red
highlight YcmErrorSection cterm=underline ctermfg=red

" Same for warnings
highlight YcmWarningSign ctermfg=darkyellow
highlight YcmWarningSection cterm=underline ctermfg=darkyellow

autocmd BufWritePre /usr/**.h** :ruby CppAutoInclude::process

map <F8> :YcmCompleter FixIt<CR>

"""""
" delimitMate
"""""

" Expand when hiting enter after a delimiter
let g:delimitMate_expand_cr = 1

"""""
" Easymotion
"""""

nmap s <Plug>(easymotion-s2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"""""
" Magit
"""""

nnoremap  :Magit<CR>

"""""
" GitGutter
"""""
set updatetime=100

"""""
" Javascript
"""""

" Enable html/css hl in js files
let g:javascript_enable_domhtmlcss = 1

" Automatic fold code
"set foldmethod=syntax

"""""
" Syntastic
"""""

" Automatic check on open
"let g:syntastic_check_on_open = 1

" Do not check on exit
let g:syntastic_check_on_wq = 0

" Display errors in a window
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" Better error highlight
highlight SyntasticErrorSign ctermfg=red
highlight SyntasticError cterm=underline ctermfg=red

" Same forSyntasticrnings
highlight SyntasticWarningSign ctermfg=darkyellow
highlight SyntasticWarning cterm=underline ctermfg=darkyellow

"""""
" UltiSnips
"""""

let g:UltiSnipsExpandTrigger = "<C-T>"

"""""
" DevIcons
"""""

let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
