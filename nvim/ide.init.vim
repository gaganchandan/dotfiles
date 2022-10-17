call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" General Plugins
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/grep.vim'
Plug 'Yggdroot/indentLine'
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'liuchengxu/vim-clap'
Plug 'famiu/nvim-reload'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'
Plug 'andersevenrud/nordic.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'navarasu/onedark.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'preservim/tagbar'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'glepnir/dashboard-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-rhubarb' 
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/popup.nvim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/limelight.vim'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
Plug 'nvim-lua/plenary.nvim'
Plug 'xolox/vim-misc'


"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

" haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'

" python
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'
Plug 'honza/vim-snippets'

" Coq
Plug 'whonore/Coqtail'
Plug 'vim-scripts/coq-syntax'

" Isabelle
"Plug 'ThreeFx/isabelle.vim'
"Plug 'ThreeFx/coc-isabelle', {'do': 'yarn install --frozen-lockfile'}

"*****************************************************************************
"*****************************************************************************
call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
set termguicolors
syntax on
set number
let no_buffers_menu=1
set colorcolumn=0
set noruler
set fillchars=eob:\ 

" Nord
let g:nord_contrast=v:true
let g:nord_borders=v:true
let g:nord_cursorline_transparent=v:true
colorscheme nord

" Better command line completion 
set wildmenu

" mouse support
set mouse=a

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = ''
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1

  
endif



"" Disable the blinking cursor.
set gcr=a:blinkon0

au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=3


"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" Status line

"if exists("g:neovide")
"   set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ \|\ %{strftime('%c')}\ \|
"else
"    set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
"endif

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"cnoreabbrev W! w!
"cnoreabbrev Q! q!
"cnoreabbrev Qall! qall!
"cnoreabbrev Wq wq
"cnoreabbrev Wa wa
"cnoreabbrev wQ wq
"cnoreabbrev WQ wq
"cnoreabbrev W w
"cnoreabbrev Q q
"cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
set clipboard=unnamedplus
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
nnoremap <C-v> a<C-r>+<Esc>
inoremap <C-v> <C-r>+
cnoremap <C-v> <C-r>+

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


" haskell
let g:haskell_conceal_wide = 1
let g:haskell_multiline_strings = 1
let g:haskellmode_completion_ghc = 0


" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=0
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" Syntax highlight
let python_highlight_all = 1

"vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1  
let g:vim_markdown_toml_frontmatter = 1  
let g:vim_markdown_json_frontmatter = 1

"coq
let g:coqtail_coq_path = "/usr/bin/"
let g:coqtail_coq_prog = "coqidetop.opt"
"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

"*****************************************************************************
""User defined
"*****************************************************************************
nnoremap ; :
vnoremap ; :
autocmd FileType haskell setlocal shiftwidth=2 softtabstop=2 expandtab
"set guifont=monospace:h8.5
" hi Normal ctermbg=NONE guibg=NONE
    
" NERDTree
let g:NERDTreeWinSize=30
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['hs'] = "a074c4"
augroup DIRCHANGE
au!
autocmd DirChanged global :NERDTreeCWD
augroup END

" Keymaps
nnoremap <silent>    <C-n> <Cmd>enew<CR>

" BufferLine
nnoremap <silent>    <C-A-Left> <Cmd>BufferLineCyclePrev<CR>
nnoremap <silent>    <C-A-Right> <Cmd>BufferLineCycleNext<CR>
nnoremap <silent>    <C-S-A-Left> <Cmd>BufferLineMovePrev<CR>
nnoremap <silent>    <C-S-A-Right> <Cmd>BufferLineMoveNext<CR>
nnoremap <silent>    <C-x> <Cmd>:call Quit()<CR>

lua require("bufferline-config")

" coc.nvim
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1) :
\ CheckBackspace() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() :
\ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap  <2-LeftMouse> <LeftMouse>i

" dashboard-nvim
command NewFile :enew | NERDTree | set showtabline=2 | set laststatus=2  | execute "normal \<C-W>\<C-W>" 
command FileBrowser :enew | NERDTree | set showtabline=2 | set laststatus=2  | execute "normal \<C-W>\<C-W>" | Telescope file_browser
let g:indentLine_fileTypeExclude = ['dashboard']
lua require('dashboard-config')
hi DashboardHeader guifg=#5e81ac
hi DashboardCenter guifg=#d8dee9 
hi DashboardFooter guifg=#8fbcbb 

" telescope
lua require('telescope-config')
lua require("telescope").load_extension "file_browser"
nnoremap <silent>    <C-b> <Cmd>Telescope file_browser<CR>

" Use escape to leave terminal
tnoremap <Esc> <C-\><C-n>

set splitbelow

"Terminal
function! TerminalSettings()
    setlocal nonumber
    normal a
endfunction
augroup terminal
    autocmd!
    autocmd TermOpen * call TerminalSettings()
augroup END
command! -nargs=* T 12sp | terminal <args>
nnoremap <silent>    <C-t> <Cmd>T<CR>
nnoremap <silent>    <C-s> <Cmd>12sp<CR>
tnoremap <expr> <C-v> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" lualine
lua require('lualine-config')
let g:haskell_classic_highlighting = 1

" Disable lualine in NERDTree
augroup filetype_nerdtree
    au!
    au FileType nerdtree call s:disable_lightline_on_nerdtree()
    au WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_nerdtree()
augroup END

fu s:disable_lightline_on_nerdtree() abort
    let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu

" Move to and from windows
nnoremap <C-Up> <C-W><Up>
nnoremap <C-Down> <C-W><Down>
nnoremap <C-Left> <C-W><Left>
nnoremap <C-Right> <C-W><Right>

" Making life easier
inoremap <C-z> <Esc>
tnoremap <C-z> <C-\><C-n>
vnoremap <C-z> <Esc>
cnoremap <C-z> <C-C>
nnoremap <C-z> <Esc>
snoremap <C-z> <Esc>

function Quit()
    if winnr('$') == 2
        bp | sp | bn | bd!
    else
        quit!
    endif
endfunction
command Q :call Quit()

function Close()
    if winnr('$') == 2
        echo ""
    else
        close
    endif
endfunction
nnoremap <C-c> <Cmd>call Close()<CR>

cnoreabbrev W! w!
cnoreabbrev Qall! qall!
cnoreabbrev Wq w \| Q
cnoreabbrev Wa wa
cnoreabbrev wQ w \| Q
cnoreabbrev WQ w \| Q
cnoreabbrev wq w \| Q
cnoreabbrev W w
cnoreabbrev Qall qall
cnoreabbrev q Q
cnoreabbrev Q! Q

autocmd FileType nerdtree nnoremap <buffer> ; <Esc>
autocmd FileType nerdtree nnoremap <buffer> : <Esc>
autocmd FileType nerdtree nnoremap <buffer> <C-c> <Esc>
autocmd FileType nerdtree nnoremap <buffer> <C-t> <C-w><Right><Cmd>T<CR>
autocmd FileType nerdtree nnoremap <buffer> <C-n> <C-w><Right><Cmd>enew<CR>
autocmd FileType nerdtree nnoremap <buffer> <C-s> <C-w><Right><Cmd>12sp<CR>
autocmd FileType nerdtree nnoremap <buffer> <C-x> <Esc>
autocmd FileType nerdtree nnoremap <buffer> <C-d> <Esc>
autocmd FileType nerdtree nnoremap <buffer> <C-m> <Esc>
autocmd FileType nerdtree nnoremap <buffer> e <Esc>

command! BufClose :bn|:bd!#
nnoremap <silent> <C-d> <Cmd>BufClose<CR>

nnoremap <silent> <C-m> <Cmd>vsp<CR>

set guifont=JetBrains\ Mono\ Nerd\ Font:h8.5

" Isabelle
au BufRead,BufNewFile *.thy setfiletype isabelle
au BufRead,BufNewFile *.thy set conceallevel=2

set completeopt=menu,noselect
