" vim: set foldmethod=marker foldlevel=0 :
" ==============================================================================
" VIM-PLUG {{{
" ==============================================================================

call plug#begin('~/.vim/plugged')

" Edit
Plug 'Raimondi/delimitMate'
Plug 'andrewradev/splitjoin.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'eugen0329/vim-esearch'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Navigation/Interface/Display
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'jszakmeister/vim-togglecursor'
Plug 'majutsushi/tagbar'
Plug 'osyo-manga/vim-over'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-projectionist'
Plug 'troydm/zoomwintab.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/TailMinusF'
Plug 'yggdroot/indentline'

" Integration
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --omnisharp-completer' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv'
Plug 'junegunn/gv.vim'
Plug 'janko-m/vim-test'
Plug 'neomake/neomake'
Plug 'jgdavey/tslime.vim'
" Plug 'junkblocker/patchreview-vim'
" Plug 'codegram/vim-codereview'

" Lang/Syntax/Lint
Plug 'chrisbra/csv.vim'
Plug 'c-brenn/phoenix.vim'
Plug 'slashmili/alchemist.vim'
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/SyntaxRange'
Plug 'junegunn/vim-emoji'

" Colors/Others
Plug 'altercation/vim-colors-solarized'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/ingo-library'
" Plug 'rhysd/vim-grammarous'

call plug#end()

" }}}
" ==============================================================================
" GENERAL SETTINGS {{{
" ==============================================================================
filetype plugin indent on
syntax enable

let mapleader = ' '
let maplocalleader = ' '
colorscheme gruvbox
set background=dark
set termguicolors

set laststatus=2
set relativenumber
set showcmd
set cursorline
set wildmenu
set lazyredraw " No redrawing during macros
set showmatch
set textwidth=0
set regexpengine=1
set completeopt=menuone,preview,longest
set scrolloff=5
set autoread
set clipboard=unnamed
set noerrorbells visualbell t_vb= " No bells
set nowrap
set tabstop=2
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  "
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
set foldlevelstart=99
set foldmethod=indent
set mouse=a
set winheight=40
" set winminheight=5

" Searching
set incsearch  " search as char are entered
set hlsearch
set ignorecase
set smartcase  " unless they contain at least one capital letter

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set nostartofline
set history=10000

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

" Refresh
noremap <leader>R :source $MYVIMRC<cr>

nnoremap <CR> o<Esc>

nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" ------------------------------------------------------------------------------
" Convert hash rockets
" ------------------------------------------------------------------------------
nnoremap <Leader>fh :s/:\([^=,'"]*\) =>/\1:/g<CR>
xnoremap <Leader>fh :s/:\([^=,'"]*\) =>/\1:/g<CR>

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
nmap <Leader>gst :Gstatus<CR>gg<c-n>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gb :Gblame<CR>

" ------------------------------------------------------------------------------
" GV.vim
" ------------------------------------------------------------------------------
nmap <Leader>gl :GV<CR>

" ------------------------------------------------------------------------------
" NERDtree
" ------------------------------------------------------------------------------
nnoremap <leader>n :NERDTreeToggle<cr>

" ------------------------------------------------------------------------------
" ZoomWinTab
" ------------------------------------------------------------------------------
nnoremap <leader>z :ZoomWinTabToggle<cr>

" ------------------------------------------------------------------------------
" EasyAlign
" ------------------------------------------------------------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1

" ----------------------------------------------------------------------------
" Tmuxline
" ----------------------------------------------------------------------------
let g:tmuxline_vim_statusline = 1
let g:airline#extensions#tmuxline#enabled = 0 

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
" neomake
" ----------------------------------------------------------------------------
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = './node_modules/.bin/eslint'
let g:neomake_vue_enabled_makers = ['eslint']
let g:neomake_vue_eslint_maker = {
    \ 'args': ['--no-color', '--format', 'compact', '--config', './.eslintrc.js'],
    \ 'errorformat': '%f: line %l\, col %c\, %m',
    \ 'exe': './node_modules/.bin/eslint'
    \ }

" ----------------------------------------------------------------------------
" RuboCop
" ----------------------------------------------------------------------------
nmap <Leader>ru :RuboCop<CR>

" ----------------------------------------------------------------------------
" vim-togglecursor
" ----------------------------------------------------------------------------
let g:togglecursor_default = 'block'
let g:togglecursor_insert = 'line'
let g:togglecursor_replace = 'underline'

" ----------------------------------------------------------------------------
" vim-gitgutter
" ----------------------------------------------------------------------------
nnoremap cog :GitGutterToggle<cr>

" ----------------------------------------------------------------------------
" vim-test
" ----------------------------------------------------------------------------
let test#strategy = 'dispatch'
nmap <silent> <leader>rs :TestNearest<CR>
nmap <silent> <leader>rt :TestFile<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rv :TestVisit<CR>
nmap <silent> <leader>rg :call VimTestStrategyToggle()<CR>
let test#ruby#rspecvoptions = '--format documentation --profile --'

function! VimTestStrategyToggle()
  if g:test#strategy == 'dispatch'
    let g:test#strategy = 'tslime'
    echo 'Switch test strategy to tslime'
  else
    let g:test#strategy = 'dispatch'
    echo 'Switch test strategy to dispatch'
  endif
endfunction

" ----------------------------------------------------------------------------
" Ack & Ag
" ----------------------------------------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ----------------------------------------------------------------------------
" indentline
" ----------------------------------------------------------------------------
let g:indentLine_color_gui = '#504945'
let g:indentLine_enabled = 0
nnoremap <Leader>il :IndentLinesToggle<CR>

" ----------------------------------------------------------------------------
" delimiteMate
" ----------------------------------------------------------------------------
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1

" ----------------------------------------------------------------------------
" FZF
" ----------------------------------------------------------------------------
" Gloable fzf maps
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
let g:fzf_action = {
\  'ctrl-t': 'tab split',
\  'ctrl-s': 'split',
\  'ctrl-v': 'vsplit'
\ }
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_history_dir = '~/.fzf-history'

" Key mappings
nnoremap <silent> <Leader>o :Files<CR>
nnoremap <silent> <Leader>a :Ag<CR>
nnoremap <silent> <Leader><Enter> :Buffers<CR>

let g:fzf_colors =
\ { 'fg':      ['GruvboxFg0', 'Normal'],
  \ 'bg':      ['GruvboxBg0', 'Normal'],
  \ 'hl':      ['hl', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" ----------------------------------------------------------------------------
" YCM YouCompleteMe
" ----------------------------------------------------------------------------
let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
