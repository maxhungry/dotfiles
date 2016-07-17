" vim: set foldmethod=marker foldlevel=0:
" ==============================================================================
" VIM-PLUG {{{
" ==============================================================================

call plug#begin('~/.vim/plugged')

" Edit
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --omnisharp-completer' }
Plug 'dhruvasagar/vim-table-mode'
Plug 'jiangmiao/auto-pairs'
Plug 'jszakmeister/vim-togglecursor'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-emoji'
Plug 'mattn/emmet-vim'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Naving
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'troydm/zoomwintab.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-projectionist'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Lang
Plug 'chrisbra/csv.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ngmy/vim-rubocop'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'

" Others
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/seoul256.vim'
Plug 'rking/ag.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'


call plug#end()

" }}}
" ==============================================================================
" GENERAL SETTINGS {{{
" ==============================================================================
filetype plugin indent on
syntax enable

let mapleader = ' '
let maplocalleader = ' '
let g:seoul256_background = 235
colorscheme seoul256

set encoding=utf-8
set laststatus=2
set number
set relativenumber
set showcmd
set cursorline
set wildmenu
set lazyredraw "No redrawing during macros
set showmatch
set textwidth=0
set regexpengine=1
" if exists('&colorcolumn')
"   set colorcolumn=81
" endif
set completeopt=menuone,preview,longest
set scrolloff=5
set autoread
set clipboard=unnamed
" set t_Co=256
" set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
" set termencoding=utf-8

" bells
set noerrorbells visualbell t_vb=

set nowrap
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an a<utoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  "
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

set incsearch  " as char are entered
set hlsearch
set ignorecase " searches are case insensitive,
set smartcase  " unless they contain at least one capital letter

set nofoldenable
" set foldlevelstart=10
" set foldnestmax=10
" set foldmethod=indent
" set foldlevel=1

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set mouse=a

set nostartofline
set history=10000

if !has('nvim')
  set ttymouse=xterm2
endif

" neovim
if has('nvim')
  nmap <BS> <C-W>h
endif

" }}}
" ==============================================================================
" MAPPINGS {{{
" ==============================================================================
" Movement
nnoremap j gj
nnoremap gV `[v`]
nnoremap k gk

" Make Y behave like other capitals (ref: junegunn)
nnoremap Y y$

" qq to record, Q to replay (ref: junegunn)
nnoremap Q @q

" Save
nnoremap <leader>s :update<cr>

" Quit
nnoremap <leader>q :quit<cr>

" Go to last file
nnoremap <leader><leader> <c-^>

" ------------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation (ref: junegunn)
" ------------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" Toggle reativenumber in insert mode
" :au FocusLost * :set norelativenumber
" :au FocusGained * :set relativenumber
" autocmd InsertEnter * :set norelativenumber
" autocmd InsertLeave * :set relativenumber

" Refresh
noremap <leader>R :source ~/.vimrc<cr>

nnoremap <CR> o<Esc>

nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" from junegunn - github.com/junegunn/dotfiles
" ------------------------------------------------------------------------------
" <F8> | Color scheme selector
" ------------------------------------------------------------------------------
function! s:rotate_colors()
  if !exists('s:colors_list')
    let s:colors_list =
    \ sort(map(
    \   filter(split(globpath(&rtp, "colors/*.vim"), "\n"), 'v:val !~ "^/usr/"'),
    \   "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"))
  endif
  if !exists('s:colors_index')
    let s:colors_index = index(s:colors_list, g:colors_name)
  endif
  let s:colors_index = (s:colors_index + 1) % len(s:colors_list)
  let name = s:colors_list[s:colors_index]
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <F8> :call <SID>rotate_colors()<cr>

" ------------------------------------------------------------------------------
" <tab> / <s-tab> / <c-v><tab> | super-duper-tab
" ------------------------------------------------------------------------------
function! s:can_complete(func, prefix)
if empty(a:func) || call(a:func, [1, '']) < 0
return 0
endif
let result = call(a:func, [0, matchstr(a:prefix, '\k\+$')])
return !empty(type(result) == type([]) ? result : result.words)
endfunction
function! s:super_duper_tab(k, o)
if pumvisible()
return a:k
endif
let line = getline('.')
let col = col('.') - 2
if empty(line) || line[col] !~ '\k\|[/~.]' || line[col + 1] =~ '\k'
return a:o
endif
let prefix = expand(matchstr(line[0:col], '\S*$'))
if prefix =~ '^[~/.]'
return "\<c-x>\<c-f>"
endif
if s:can_complete(&omnifunc, prefix)
return "\<c-x>\<c-o>"
endif
if s:can_complete(&completefunc, prefix)
return "\<c-x>\<c-u>"
endif
return a:k
endfunction
inoremap <expr> <tab>   <SID>super_duper_tab("\<c-n>", "\<tab>")
inoremap <expr> <s-tab> <SID>super_duper_tab("\<c-p>", "\<s-tab>")
" }}}

" ==============================================================================
" PLUGINS {{{
" ==============================================================================

" ------------------------------------------------------------------------------
" vim-fugitive
" ------------------------------------------------------------------------------
nmap <Leader>g :Gstatus<CR>gg<c-n>
nmap <Leader>d :Gdiff<CR>

" ------------------------------------------------------------------------------
" NERDtree
" ------------------------------------------------------------------------------
" set autochdir
" let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTreeToggle<cr>

" ------------------------------------------------------------------------------
" ZoomWinTab
" ------------------------------------------------------------------------------
nnoremap <leader>z :ZoomWinTabToggle<cr>

" ------------------------------------------------------------------------------
" EasyAlign
" ------------------------------------------------------------------------------
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" ------------------------------------------------------------------------------
" CtrlP
" ------------------------------------------------------------------------------
let g:ctrlp_show_hidden = 1

" ------------------------------------------------------------------------------
" handlebars
" ------------------------------------------------------------------------------
let g:mustache_abbreviations = 1

" ------------------------------------------------------------------------------
" gundo
" ------------------------------------------------------------------------------
nnoremap <F5> :GundoToggle<CR>

" ------------------------------------------------------------------------------
" matchit.vim
" ------------------------------------------------------------------------------
runtime! macros/matchit.vim

" ------------------------------------------------------------------------------
" matchit.vim
" ------------------------------------------------------------------------------
set completefunc=emoji#complete

" ----------------------------------------------------------------------------
" Open files
" ----------------------------------------------------------------------------
nnoremap <silent> <Leader>o :FZF -m<CR>

" ----------------------------------------------------------------------------
" Choose color scheme
" ----------------------------------------------------------------------------
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':     'colo',
\   'options':  '+m',
\   'left':     30,
\   'launcher': 'iterm2-launcher 20 30 %s'
\ })<CR>

" ----------------------------------------------------------------------------
" Select buffer
" ----------------------------------------------------------------------------
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'
" let g:airline#extensions#tabline#enabled = 1

" ----------------------------------------------------------------------------
" Vim-over
" ----------------------------------------------------------------------------
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

function! VisualFindAndReplace()
  :OverCommandLine%s/
endfunction

function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/
endfunction

" ----------------------------------------------------------------------------
" Vim-over
" ----------------------------------------------------------------------------
let g:ycm_register_as_syntastic_checker = 0
" }}}

" ----------------------------------------------------------------------------
" Syntastic
" ----------------------------------------------------------------------------
" let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" ----------------------------------------------------------------------------
" RuboCop
" ----------------------------------------------------------------------------
nmap <Leader>ru :RuboCop<CR>
" }}}

" ----------------------------------------------------------------------------
" vim-togglecursor
" ----------------------------------------------------------------------------
let g:togglecursor_default = 'block'
let g:togglecursor_insert = 'line'
let g:togglecursor_replace = 'underline'
" }}}
