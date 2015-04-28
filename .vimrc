"   vim > vi mode
set nocompatible

"   Change <leader> from \ to ,
let mapleader = ','
let g:mapleader = ','

" =============================
" Colorscheme
" =============================
"   Solarized colorscheme (http://ethanschoonover.com/solarized/vim-colors-solarized)
syntax enable
silent! colorscheme solarized  " Suppress error messages if colorscheme not on machine
set background=dark            " Tell vim what background color looks like
let g:solarized_termcolors=16 

" =============================
" General Settings
" =============================
set fileformats=unix,mac,dos   " End-of-line formats for new buffer or file in existing buffer
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store " File patterns to ignore on complete
set wildmenu                   " Enhance command-line completion
set encoding=utf-8             " Sets character encoding:
set history=1000               " Number of command lines to remember
set hidden                     " Allow buffer switch w/out saving
set autoread                   " Automatically read file that was changed outside vim
set autochdir                  " Change directory to the current buffer when opening files.
set modeline                   " Enables modelines
set modelines=4                " Gives number of lines that is checked for set commands
set visualbell t_vb=           " No beep or flash is wanted
set noerrorbells               " Do not ring bell or beep for errors
set novisualbell               " Do not use visual bell
set noswapfile                 " Do not use a swapfile for buffer
set suffixesadd+=.js,.jsx      " Suffixes used when searching for a file for gf (gotofile)
set exrc                       " Enables use of local dotfiles in current directory
set secure                     " Shell and write commands are not allowed in .vimrc and .exrc

" =============================
" Indent, Tabs, Space Settings
" =============================
set autoindent                 " Copy indent from current line when starting a new line
set smartindent                " Smart indenting when starting a new line
set expandtab                  " Expand tabs to spaces
set smarttab                   " Tab in front of line inserts blanks
set tabstop=2                  " Number of spaces that a tab counts for
set softtabstop=2              " Number of spaces inserted for tab
set shiftwidth=2               " Number of spaces to use for each step of (auto)indent

" =============================
" Copy, Paste, Select Settings
" =============================
set selection=exclusive        " Exclude first character after selection
set clipboard=unnamed          " Use OS clipboard by default

" =============================
" Search Settings
" =============================
set incsearch                  " Show best match while typing a search
set ignorecase                 " Case insensitive search
set smartcase                  " Unless uppercase used in search expr.
set gdefault                   " Default to /g global replace
set hlsearch                   " Highlight searches and search results

" =============================
" Window Settings
" =============================
set splitbelow                 " new window below current one
set splitright                 " new window on right of current one

" =============================
" Mouse Settings
" =============================
set mouse=a                    " Enable mouse
set mousehide                  " Hide when characters are typed

" =============================
" UI
" =============================
set title                      " Show
set showmode                   " Put message on last line in insert, replace, or visual mode
set esckeys                    " Allow cursor keys in insert mode
set virtualedit=block          " Allow virtual editing in visual block mode
set formatoptions-=cro         " Disable continuation of comments on line break
set timeoutlen=200             " Milliseconds wait for key code or sequence to complete
set ttimeoutlen=200            " Milliseconds wait for key code or sequence to complete
set lazyredraw                 " No screen redraw for macros/registers/typed commands
set nostartofline              " Avoid moving cursor to BOL when moving
set scrolloff=1                " Keep 1 lines (top/bottom) for scope
set backspace=indent,eol,start " Allow backspace over items
set showmatch                  " Show matched paren when balanced
set matchtime=2                " for .2 seconds
set linebreak                  " Don't wrap text in the middle of a word
set ttyfast                    " Improve smoothness of redraw w/ multiple windows
set showcmd                    " Show (parital) command in last line screen
set t_Co=16                    " Max number of colors used by terminal
set laststatus=2               " Always display status line
set number                     " Display line numbers
set nowrap                     " Line wrapping off
set cursorline                 " Highlight line cursor
set ruler                      " Show the cursor position
"   Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

"   Change cursor shape for different modes in iTerm2 OS X
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"   Change cursor shape for different modes in tmux OS X
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

if has('gui_running')
  set guioptions+=t
  set guioptions-=T
  set transparency=2
else
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" =============================
" Ctrl-P Settings
" =============================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" =============================
" Filetype Settings
" =============================
au BufRead *.spark set filetype=html

" =============================
" Mappings
" =============================
"   Clear highlighted search using the space bar
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"   Windowing
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
imap <C-W> <C-O><C-W>

"   Center screen after moving
nnoremap n nzz
nnoremap } }zz

"   Find all occurences of word under cursor
nnoremap K :grep! "\b<cfile>\b"<CR>:cw<CR>

"  ,v brings up .vimrc
map <leader>v :sp ~/.vimrc<CR><C-W>
"  ,V reloads saved .vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
