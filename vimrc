" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ddollar/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'sjl/badwolf'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'


call vundle#end()            " required
filetype plugin indent on    " required


map <leader>R :source ~/.vimrc<cr>

"Colours!
syntax enable
set background=dark
colorscheme solarized

" Whitespaces
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an a<utoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

"UI
set number
set showcmd "Suppose to show the last command entered at buttom right?
set cursorline
filetype indent on "~/.vim/indent/ruby.vim
set wildmenu "Somehow my wildmenu is already on?
set lazyredraw "No redrawing during macros
set showmatch
" set visuals for 80 char wide
" set textwidth=80
" set colorcolumn=+1


" Searching
set incsearch "As char are entered
set hlsearch
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
" turn off search highlight
nnoremap <silent> <c-l> :nohlsearch<cr>


" Folding
set nofoldenable
" set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set foldlevel=1

" Movement
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]

" :write before running commands
set autowrite

" Statusline
" if has("statusline") && !&cp
"   set laststatus=2  " always show the status bar

"   " Start the status line
"   set statusline=%f\ %m\ %r
"   set statusline+=Line:%l/%L[%p%%]
"   set statusline+=Col:%v
"   set statusline+=Buf:#%n
"   set statusline+=[%b][0x%B]
" endif

" Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" -------------------- Misc --------------------
set history=10000

" use % to match in ruby blocks, do-end, def-end etc
runtime! macros/matchit.vim

" Run current ruby file
map <leader>r :!ruby %<cr>

" nmap <s-CR> O<Esc>
nmap <CR> o<Esc>
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" -------------------- Plugins --------------------
" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <Esc>h :TmuxNavigateLeft<cr>
nnoremap <silent> <Esc>j :TmuxNavigateDown<cr>
nnoremap <silent> <Esc>k :TmuxNavigateUp<cr>
nnoremap <silent> <Esc>l :TmuxNavigateRight<cr>
nnoremap <silent> <Esc>\ :TmuxNavigatePrevious<cr>

" NERDtree
" set autochdir
" let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTreeToggle<cr>
" set guifont=Inconsolata\ for\ Powerline:h15
set encoding=utf-8
" set t_Co=256
" set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
set termencoding=utf-8
set laststatus=2
let g:Powerline_symbols="fancy"
