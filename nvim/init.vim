call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" General Plugins
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'preservim/tagbar'
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
Plug 'kana/vim-textobj-user'
Plug 'github/copilot.vim'
Plug 'mfussenegger/nvim-lint'
Plug 'joom/latex-unicoder.vim'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************
" haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'neovimhaskell/nvim-hs.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'

" Coq
Plug 'whonore/Coqtail'
Plug 'vim-scripts/coq-syntax'

" Racket 
Plug 'benknoble/vim-racket'

" Agda
Plug 'derekelkins/agda-vim'
Plug 'isovector/cornelis', { 'do': 'stack build' }

" IPython
Plug 'bfredl/nvim-ipy'

" Prolog 
Plug 'adimit/prolog.vim'

" Verilog
Plug 'vhda/verilog_systemverilog.vim'

" LaTeX
Plug 'lervag/vimtex'

" jsonc
Plug 'neoclide/jsonc.vim'

"*****************************************************************************
"" Additional colorschemes
"*****************************************************************************
Plug 'sainnhe/sonokai'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'folke/tokyonight.nvim'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'tomasiser/vim-code-dark'

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

set splitbelow
set termguicolors
syntax on
set number
let no_buffers_menu=1
set colorcolumn=0
set noruler
set fillchars=eob:\ 
set cursorline
hi CursorLine guibg=#373e4d
" hi CursorLineNR guibg=#373e4d

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

highlight! Terminal guibg=#21252e
au TermEnter * setlocal winhighlight=Normal:Terminal
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
autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 expandtab


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

" html
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab

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

" verilog 
autocmd FileType verilog_systemverilog setlocal tabstop=2 shiftwidth=2 expandtab

" LaTeX 
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Jupyter
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }

"*****************************************************************************
""User defined
"*****************************************************************************
nnoremap ; :
vnoremap ; :
autocmd FileType haskell setlocal shiftwidth=2 softtabstop=2 expandtab

" Keymaps
nnoremap <silent>    <C-n> <Cmd>enew<CR>

" lualine
lua require('lualine-term-config')

" Making life easier
inoremap <C-z> <Esc>
tnoremap <C-z> <C-\><C-n>
vnoremap <C-z> <Esc>
cnoremap <C-z> <C-C>
nnoremap <C-z> <Esc>
snoremap <C-z> <Esc>
nnoremap <silent>    <C-x> <Cmd>:q!<CR>
nnoremap a i
cnoreabbrev W! w!
cnoreabbrev Qall! qall!
cnoreabbrev Qa! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Qall qall
cnoreabbrev Qa qa
cnoreabbrev q q
cnoreabbrev Q! q!
" Move to and from windows
nnoremap <C-Up> <C-W><Up>
nnoremap <C-Down> <C-W><Down>

" Isabelle
au BufRead,BufNewFile *.thy setfiletype isabelle
au BufRead,BufNewFile *.thy set conceallevel=2

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
let g:neoformat_haskell_ormolu = { 'exe': 'ormolu', 'args': [] }
let g:neoformat_haskell_fourmolu = { 'exe': 'fourmolu', 'args': [] }
let g:neoformat_enabled_haskell = ['ormolu']
let g:neoformat_enabled_javascript = []
" let g:neoformat_enabled_haskell = ['fourmolu']

""**********************************************************************
" LSP and related config
"***********************************************************************
hi Border guifg=#81a1c1 guibg=#2e3440
hi Pmenu guibg=#2e3440

lua require('lsp')

set updatetime=100
autocmd InsertEnter * set updatetime=4000
autocmd InsertLeave * set updatetime=100

hi FloatBorder guifg=#81a1c1
highlight! CmpItemAbbrMatch guibg=NONE guifg=#a1c7ed
"***********************************************************************
"***********************************************************************

let $PATH="/home/gagan/.ghcup/bin/:/home/gagan/.cabal/bin/:/home/gagan/.local/share/nvim/mason/bin/:/home/gagan/.opam/default/bin:/home/gagan/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin/"

autocmd BufRead,BufNewFile * setlocal signcolumn=yes

" nvim-autopairs
lua require('nvim-autopairs-config')

" Coqtail
hi def CoqtailChecked guibg=#4c566a
hi def CoqtailSent guibg=#4c566a
autocmd FileType coq nnoremap <C-n> <Cmd>CoqNext<CR>
autocmd FileType coq nnoremap <C-u> <Cmd>CoqUndo<CR>
autocmd FileType coq nnoremap <C-l> <Cmd>CoqToLine<CR>
autocmd FileType coq nnoremap <C-t> <Cmd>CoqToTop<CR>
autocmd BufReadPost *.v CoqStart

" nvim-lint
lua require ("nvim-lint")

" Prolog 
let g:filetype_pl="prolog"
autocmd BufNewFile,BufRead *.pl   set syntax=prolog

" My languages
au BufRead,BufNewFile *.goto setfiletype goto
au BufRead,BufNewFile *.pkt setfiletype pocket

" swarm 
au BufRead,BufNewFile *.sw setfiletype swarm

" Cornelis and Agda
au BufWritePost *.agda execute "normal! :CornelisLoad\<CR>"
autocmd FileType agda setlocal shiftwidth=2 softtabstop=2 expandtab

" Magma 
let g:magma_automatically_open_output = v:false
let g:magma_image_provider = "ueberzug"

function MagmaInitPython()
    vim.cmd[[
    :MagmaInit python3
    :MagmaEvaluateArgument a=5
    ]]
endfunction

" Waybar
" au BufNewFile,BufRead,BufReadPost config set syntax=jsonc

" CodeLens 
" autocmd InsertLeave,CursorHold *.ml,*.mli :lua vim.lsp.codelens.refresh()
