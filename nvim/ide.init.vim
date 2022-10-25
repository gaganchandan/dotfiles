call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" General Plugins
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'Raimondi/delimitMate'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'navarasu/onedark.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'preservim/tagbar'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'goolord/alpha-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'junegunn/limelight.vim'
Plug 'sbdchd/neoformat'
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'onsails/lspkind.nvim'
"*****************************************************************************
"" Custom bundles
"*****************************************************************************
" haskell
Plug 'neovimhaskell/haskell-vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'

" Coq
Plug 'whonore/Coqtail'
Plug 'vim-scripts/coq-syntax'

" C
Plug 'vim-scripts/c.vim'

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
colorscheme nord

set termguicolors
syntax on
set number
let no_buffers_menu=1
set colorcolumn=0
set noruler
set fillchars=eob:\ 
set cursorline
hi CursorLine guibg=#373e4d
hi CursorLineNR guibg=#373e4d

" Better command line completion 
set wildmenu

" mouse support
set mouse=a

set mousemodel=popup
set t_Co=256

let g:CSApprox_loaded = 1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = ''
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

"" Disable the blinking cursor.
set gcr=a:blinkon0

au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

nnoremap n nzzzv
nnoremap N Nzzzv

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

set autoread

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
""User defined
"*****************************************************************************
nnoremap ; :
vnoremap ; :
autocmd FileType haskell setlocal shiftwidth=2 softtabstop=2 expandtab

" Keymaps
nnoremap <silent>    <C-n> <Cmd>enew<CR>

" BufferLine
nnoremap <silent>    <C-A-Left> <Cmd>BufferLineCyclePrev<CR>
nnoremap <silent>    <C-A-Right> <Cmd>BufferLineCycleNext<CR>
nnoremap <silent>    <C-S-A-Left> <Cmd>BufferLineMovePrev<CR>
nnoremap <silent>    <C-S-A-Right> <Cmd>BufferLineMoveNext<CR>
nnoremap <silent>    <C-x> <Cmd>:call Quit()<CR>

lua require("bufferline-config")

" alpha-nvim
command NewFile :enew | set showtabline=2 | set laststatus=2 | NvimTreeFocus | execute "normal \<C-W>\<C-W>"
command FileBrowser :enew | NvimTreeFocus | execute "normal \<C-W>\<C-W>" |  set showtabline=2 | set laststatus=2 | Telescope file_browser 
lua  require('alpha').setup(require'dashboard-config'.config)
autocmd User AlphaReady set laststatus=0 
autocmd User AlphaReady set showtabline=0 

" let g:indentLine_fileTypeExclude = ['dashboard']
" lua require('dashboard-config')
" hi DashboardHeader guifg=#5e81ac
" hi DashboardCenter guifg=#d8dee9 
" hi DashboardFooter guifg=#8fbcbb 

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

autocmd FileType NvimTree nnoremap <buffer> ; <Esc>
autocmd FileType NvimTree nnoremap <buffer> : <Esc>
autocmd FileType NvimTree nnoremap <buffer> <C-c> <Esc>
autocmd FileType NvimTree nnoremap <buffer> <C-t> <C-w><Right><Cmd>T<CR>
autocmd FileType NvimTree nnoremap <buffer> <C-n> <C-w><Right><Cmd>enew<CR>
autocmd FileType NvimTree nnoremap <buffer> <C-s> <C-w><Right><Cmd>12sp<CR>
autocmd FileType NvimTree nnoremap <buffer> <C-x> <Esc>
autocmd FileType NvimTree nnoremap <buffer> <C-d> <Esc>
autocmd FileType NvimTree nnoremap <buffer> <C-f> <Esc>

command! BufClose :bn|:bd!#
nnoremap <silent> <C-d> <Cmd>BufClose<CR>

nnoremap <silent> <C-f> <Cmd>vsp<CR>

set guifont=JetBrains\ Mono\ Nerd\ Font:h8.5

" Isabelle
au BufRead,BufNewFile *.thy setfiletype isabelle
au BufRead,BufNewFile *.thy set conceallevel=2

" NvimTree
lua require('nvim-tree-config')
hi NvimTreeWinSeparator guifg=#2e3440
hi NvimTreeNormal guibg=#282e38
hi NvimTreeRootFolder guifg=#81a1c1
hi NvimTreeWindowPicker guibg=#3b4252
au FileType NvimTree lua vim.api.nvim_buf_set_keymap(0, 'n', '<C-d>', ':cd', {})

" Neoformat
augroup fmt
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat
augroup END
let g:neoformat_ocaml_ocamlformat = {
                \ 'exe': 'ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--enable-outside-detected-project', '--name', '"%:p"', '-']
            \ }
let g:neoformat_enabled_ocaml = ['ocamlformat']

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

""**********************************************************************
" LSP and related config
"***********************************************************************
hi Border guifg=#81a1c1 guibg=#2e3440
hi Pmenu guibg=#2e3440

lua require('lsp')

set updatetime=300
autocmd InsertEnter * set updatetime=20000
autocmd InsertLeave * set updatetime=300

hi FloatBorder guifg=#81a1c1
highlight! CmpItemAbbrMatch guibg=NONE guifg=#a1c7ed
"***********************************************************************
"***********************************************************************

let $PATH="/home/gagan/.local/share/nvim/mason/bin/:/home/gagan/.opam/default/bin:/home/gagan/.local/bin:/home/gagan/.ghcup/ghc/9.4.2/bin/:/home/gagan/.ghcup/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/home/gagan/.cabal/bin/"

autocmd BufRead,BufNewFile * setlocal signcolumn=yes
