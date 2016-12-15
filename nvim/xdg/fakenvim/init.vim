"set nocompatible

" Line number
set number

" Syntax highlight
syntax on
colorscheme monokai

" Better backspace handling
set backspace=indent,eol,start

" Highlight current line
set cursorline

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
set shiftwidth=2
set tabstop=2

" Activate mouse
"set mouse=a
"set ttymouse=urxvt

" Faster escape key
set timeoutlen=30 ttimeoutlen=0

" Ctrl+Arrow to switch buffer
nmap <c-h> :bp<CR>
nmap <c-l> :bn<CR>
imap <c-h> :bp<CR>
imap <c-l> :bn<CR>

" Alt+Arrow to switch window
nmap <A-k> :wincmd k<CR>
nmap <A-j> :wincmd j<CR>
nmap <A-h> :wincmd h<CR>
nmap <A-l> :wincmd l<CR>

" Map leader to print key
nmap [29~ <leader>

" Map tab to re-indent
nmap <tab> mZgg=G'Z

" Scroll gaps
set scrolloff=5

" Display tab and insecable space
"set listchars=tab:··,nbsp:#
set listchars=tab:··
set list

" Live display command you are typing
set showcmd

" No character in vertical spliter
set fillchars+=vert:\ 

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

"""""
" Dein
"""""

filetype off

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" call dein#add('Valloric/YouCompleteMe', {'build': './install.py --clang-completer --system-libclang'})
call dein#add('Raimondi/delimitMate')
call dein#add('easymotion/vim-easymotion')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('jreybert/vimagit')
call dein#add('airblade/vim-gitgutter')
" Fugitive is required for Conflicted
call dein#add('tpope/vim-fugitive')
call dein#add('christoomey/vim-conflicted')
call dein#add('scrooloose/nerdcommenter')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('pangloss/vim-javascript')
call dein#add('scrooloose/syntastic')
"Plugin 'helino/vim-json'
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
call dein#add('mxw/vim-jsx')
call dein#add('othree/jsdoc-syntax.vim')
call dein#add('heavenshell/vim-jsdoc')
call dein#add('djoshea/vim-autoread')
call dein#add('severin-lemaignan/vim-minimap')
call dein#add('ryanoasis/vim-devicons')
call dein#add('chilicuil/vim-sprunge')
call dein#add('Quramy/tsuquyomi')
call dein#add('leafgarland/typescript-vim')

call dein#end()
filetype plugin indent on

"""""
" CtrlP
"""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v(\.d|\.o|\.swp|\~)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }

"""""
" NerdTree
"""""

" use NT instead of vim tree when vim is started without file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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

" Close description window after completion
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_extra_conf_globlist = [ '~/Documents/Epitech/*' ]

" Use working directory of vim for path completion
let g:ycm_filepath_completion_use_working_dir = 1

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

nmap  :Magit<CR>

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

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
