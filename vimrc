" ==============================================================================
" VIM-PLUG {{{
" ==============================================================================

call plug#begin('~/.vim/plugged')

" Editing
Plug 'Raimondi/delimitMate'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'andrewradev/splitjoin.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'ecomba/vim-ruby-refactoring'
Plug 'editorconfig/editorconfig-vim'
Plug 'eugen0329/vim-esearch'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-textobj-user'
Plug 'mattn/emmet-vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wesQ3/vim-windowswap'
" Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'epilande/vim-react-snippets'
Plug 'epilande/vim-es2015-snippets'
" Plug 'Quramy/vim-js-pretty-template'

" Interface/Display
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'osyo-manga/vim-over'
Plug 'radenling/vim-dispatch-neovim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'

" Integration
Plug 'janko-m/vim-test'
Plug 'jgdavey/tslime.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-github-dashboard'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv'
" Plug 'junkblocker/patchreview-vim'
" Plug 'codegram/vim-codereview'

" Lang/Syntax/Lint
Plug 'sheerun/vim-polyglot'
Plug 'hail2u/vim-css3-syntax'
Plug 'jparise/vim-Graphql'
Plug 'styled-components/vim-styled-components'
Plug 'cfdrake/vim-pbxproj'
Plug 'chrisbra/csv.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'junegunn/vim-emoji'
Plug 'ngmy/vim-rubocop'
Plug 'slashmili/alchemist.vim'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/SyntaxRange'
Plug 'w0rp/ale'

" Colors/Others
Plug 'altercation/vim-colors-solarized'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'rhysd/vim-grammarous'
Plug 'vim-scripts/ingo-library'

if !exists('g:gui_oni')
  Plug 'christoomey/vim-tmux-navigator'
endif

call plug#end()

" }}}
" ==============================================================================
" DEFAULTS {{{
" ==============================================================================
let mapleader = ' '
let maplocalleader = ' '

set textwidth=80
set expandtab    " Always expand tabs to spaces
set tabstop=2    " A tab expand to 2 spaces
set shiftwidth=2 " Indent is 2 spaces

set cursorline
set number
set relativenumber

set scrolloff=3
set sidescrolloff=3

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

set mouse=a

set incsearch  " Search as chars entered
set ignorecase
set smartcase  " Unless they contain at least one capital letter
set hlsearch

" }}}

" ==============================================================================
" GENERAL SETTINGS {{{
" ==============================================================================
filetype plugin indent on
syntax enable

imap fd <Esc>

colorscheme gruvbox
let g:gruvbox_invert_selection=0

set background=dark
set termguicolors

set laststatus=0
set showcmd
set wildmenu
set lazyredraw " No redrawing during macros
set showmatch
set regexpengine=1
set completeopt=menuone,preview,longest
set autoread
set clipboard=unnamed
set noerrorbells visualbell t_vb= " No bells
set nowrap
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  "
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
set foldlevelstart=99
" set foldmethod=indent

set nostartofline
set history=10000

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Spell check
set spell spelllang=en_nz

" File types
" Fastlane
au BufRead,BufNewFile Fastfile,Appfile,Matchfile,Pluginfile set filetype=ruby

" }}}
" ==============================================================================
" MAPPINGS {{{
" ==============================================================================
" Movement
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
nnoremap Y y$

" qq to record, Q to replay (ref: junegunn)
nnoremap Q @q

" Shortcuts
nnoremap <leader>s :update<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa!<cr>
noremap  <leader>R :source $MYVIMRC<cr>
nnoremap <CR> o<Esc>

" Go to last file
nnoremap <leader><leader> <c-^>

" Deletes
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" Convert hash rockets
nnoremap <Leader>fh :s/:\([^=,'"]*\) =>/\1:/g<CR>
xnoremap <Leader>fh :s/:\([^=,'"]*\) =>/\1:/g<CR>

nnoremap <Leader>T :tabedit %<CR>

" Zoom (junegunn)
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" buffers
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>

" }}}
" ==============================================================================
" PLUGINS {{{
" ==============================================================================

" ------------------------------------------------------------------------------
" vim-fugitive
" ------------------------------------------------------------------------------
" nnoremap <Leader>gs  :Gstatus<CR><C-w>T
nnoremap <Leader>gs  :tabedit %<CR>:Gstatus<CR>
nnoremap <Leader>gdd :Git diff<CR>
nnoremap <Leader>gdc :Gdiff<CR>
nnoremap <Leader>gb  :Gblame<CR>
nnoremap <Leader>ge  :Gedit<CR>
nnoremap <Leader>gps :Dispatch! :Gpush<CR>
nnoremap <Leader>gco :Git checkout

" ------------------------------------------------------------------------------
" GV.vim
" ------------------------------------------------------------------------------
nmap <Leader>gv :GV<CR>

" ------------------------------------------------------------------------------
" NERDtree
" ------------------------------------------------------------------------------
if !exists('g:gui_oni')
  nnoremap <leader>n :NERDTreeToggle<cr>
endif

" ------------------------------------------------------------------------------
" EasyAlign
" ------------------------------------------------------------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap gaa ga_

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
" vim-emoji
" ------------------------------------------------------------------------------
set completefunc=emoji#complete

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
nnoremap <silent> <Leader>/ :Ag<CR>

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

if exists('g:gui_oni')
  au FileType fzf tnoremap <nowait><buffer> <esc> <c-g> "Close FZF in neovim with esc
endif

" ----------------------------------------------------------------------------
" SuperTab
" ----------------------------------------------------------------------------
" let g:SuperTabDefaultCompletionType = "<c-n>"
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ----------------------------------------------------------------------------
" nvim-completion-manager
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" vim-commentary
" ----------------------------------------------------------------------------
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" ----------------------------------------------------------------------------
" vim-table-mode
" ----------------------------------------------------------------------------
let g:table_mode_corner_corner = '+'

" ----------------------------------------------------------------------------
" ale
" ----------------------------------------------------------------------------
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'ruby': ['rubocop']
\}
let g:ale_fixers = {
\   'javascript': [
\       'eslint',
\       'prettier'
\   ],
\   'vue': [
\       'prettier'
\   ]
\}
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ----------------------------------------------------------------------------
" Emmet
" ----------------------------------------------------------------------------
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" ----------------------------------------------------------------------------
" tern
" ----------------------------------------------------------------------------
let g:tern_map_keys = 1

" ----------------------------------------------------------------------------
" vim-javascript
" ----------------------------------------------------------------------------
let g:javascript_plugin_flow = 1

"if has('autocmd')
    "call jspretmpl#register_tag('gql', 'graphql')
    " Use sass highlighting for `styled.span` / `styled.div` / etc
    "call jspretmpl#register_tag('\v(styled\.\w+)', 'css')
    "autocmd FileType javascript JsPreTmpl html
"endif

" ----------------------------------------------------------------------------
" vim-jsx
" ----------------------------------------------------------------------------
let g:jsx_ext_required = 0
" let g:xml_syntax_folding=1

" ----------------------------------------------------------------------------
" vim-startify
" ----------------------------------------------------------------------------
let g:startify_change_to_dir = 1
let g:startify_bookmarks = [
      \ {'v': '~/.dotfiles/vimrc'},
      \ {'wg': '~/work/goodnest'},
      \ {'wc': '~/work/GoodnestConsumer'},
      \ {'ww': '~/work/GoodnestWorker'},
      \ ]

" ----------------------------------------------------------------------------
" vim-vue
" ----------------------------------------------------------------------------
let g:vue_disable_pre_processors=1

" }}}
