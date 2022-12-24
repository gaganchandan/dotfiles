call plug#begin(expand('~/.config/nvim/plugged'))
"*****************************************************************************
"" General Plugins
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'navarasu/onedark.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 's3rvac/vim-syntax-retdecdsm'
"*****************************************************************************
"" Custom bundles - common
"*****************************************************************************
" haskell
Plug 'neovimhaskell/haskell-vim'

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
syntax on
set number
let no_buffers_menu=1
set colorcolumn=0
set termguicolors
set noruler
set fillchars=eob:\ 
hi Normal ctermbg=NONE guibg=NONE

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

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

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
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

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

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

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
let g:asyncomplete_auto_completeopt = 0
set completeopt=menu
autocmd FileType haskell setlocal shiftwidth=2 softtabstop=2 expandtab


vnoremap <S-C-c> "+y
nmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
"use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>

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
lua require('lualine-term-config')

" i3 syntax highlighting
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Making life easier
inoremap <C-z> <Esc>
tnoremap <C-z> <C-\><C-n>
vnoremap <C-z> <Esc>
cnoremap <C-z> <C-C>
nnoremap <C-z> <Esc>
nnoremap a i

" Isabelle
au BufRead,BufNewFile *.thy setfiletype isabelle
au BufRead,BufNewFile *.thy set conceallevel=2

set updatetime=300

"Nvim autopairs
lua require('nvim-autopairs').setup()
