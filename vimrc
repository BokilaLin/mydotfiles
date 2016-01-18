" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'https://github.com/vim-scripts/ScrollColors' " use arrow key to loop through colorscheme

Plugin 'klen/python-mode' "Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.

Plugin 'tmux-plugins/vim-tmux' " tmux-syntax

Plugin 'ap/vim-css-color' "Preview colours in source code while editing

Plugin 'vim-scripts/Tabmerge' "Merge two tabs

Plugin 'scrooloose/syntastic' " Syntax checking hacks for vim

Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode

Plugin 'jiangmiao/auto-pairs'

Plugin 'bling/vim-airline'

Plugin 'junegunn/fzf.vim' "fzf wrapper for vim

Plugin 'airblade/vim-gitgutter'

Plugin 'mattn/emmet-vim'

Plugin 'mkitt/tabline.vim' "Configure tabs within Terminal Vim

Plugin 'majutsushi/tagbar'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'tpope/vim-surround'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'flazz/vim-colorschemes'

Plugin 'easymotion/vim-easymotion' "Vim motion on speed

Plugin 'tell-k/vim-autopep8'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'pangloss/vim-javascript'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby plugins
" Plugin 'vim-ruby/vim-ruby'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf

set nocompatible              " be iMproved, required

set autoread   " Automatically update a file if it is changed externally

set splitbelow

set splitright

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" use tab_key to switch tabs
nmap <tab> gt
nmap <s-tab> gT

" always show current position
set ruler

" enable mouse mode
set mouse=a

" show a visual line under the cursor's current line
 set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" set a map leader for more key combos
let mapleader = ','

" make clipboard available everywhere
set clipboard=unnamed

" faster redrawing
set ttyfast

" code folding settings
set foldmethod=indent " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=99
nnoremap <space> za " space open/closes folds

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set mat=2 " how many tenths of a second to blink

" switch syntax highlighting on
 syntax enable

colorscheme koehler 

set encoding=utf8

" show the line number 
set number "show line number

"tabs
set smarttab
set expandtab " replace tab by space
set tabstop=4 " set one tab equal 4 space
set shiftwidth=4


"tabs for python
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" tabs for ruby
autocmd FileType ruby set sw=2
autocmd FileType ruby set ts=2
autocmd FileType ruby set sts=2

set autoindent " automatically set indent of new line
set smartindent
" set wrap linebreak nolist


"vim-airline setting
set laststatus=2 " show the status line all the time
set title

" enable paste detection
let g:airline_detect_paste=1
" enable iminsert detection
let g:airline_detect_iminsert=0
" themes are automatically selected based on the matching colorscheme. this can be overrided by defining a value.
  let g:airline_theme='lucius'

" Tabline color setting
hi TabLine ctermfg=black ctermbg=LightGREEN cterm=NONE
hi TabLineFill  ctermfg=RED ctermbg=NONE     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=Red  cterm=NONE

" complete menu color
hi Pmenu ctermfg=lightgreen ctermbg=NONE
hi PmenuSel ctermfg=red ctermbg=lightyellow

" Shift-T open new Tab
nmap T :tabnew<cr>

" Auto completion in vim
autocmd FileType css set omnifunc=csscomplete#CompleteCSS "usage: <Ctrl-x> <Ctrl-o>
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags "usage: <Ctrl-x> <Ctrl-o>
set omnifunc=syntaxcomplete#Complete

" show autocomplete menu
set wildmenu

" show editing mode
set showmode

" Error bells are displayed visually
set visualbell

" keep selection when shifting sidewards
xnoremap < <gv
xnoremap > >gv




"""""""""""""""""""""""""""""""""""""""""""""""""
" Backups, Swap Files
"""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd n
        endif
        exec "wincmd ".a:key
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""
function! Carousel()
  for theme in split(globpath(&runtimepath, 'colors/*.vim'), '\n')
    let t = fnamemodify(theme, ':t:r')
    try
      execute 'colorscheme '.t
      echo t
    catch
    finally
    endtry
    sleep 4
    redraw
  endfor
endfunction

map <silent> <Leader>tc :call Carousel()<cr>

""""""""""""""""" 
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emmet settings
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_leader_key=','
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
nnoremap <F7> :UltiSnipsAddFiletypes htmldjango<CR>
au FILETYPE htmldjango :UltiSnipsAddFiletypes htmldjango<CR>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""
" syntastic setting
let g:syntastic_enable_highlighting = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python', 'pep8', 'pyflakes']
let g:syntastic_html_checkers = ['jshint']

" Toggle Syntastic Between passive and active mode
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <F9> :SyntasticCheck<CR> :SyntasticToggleMode<CR>
""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar setting
nmap <F10> :TagbarToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pymode setting
let g:pymode_rope_complete_on_dot = 0
let g:pymode_options_colorcolumn = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF setting
map <c-p> :FZF<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easymotion settings
map <Leader> <Plug>(easymotion-prefix)
nmap / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
