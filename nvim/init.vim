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
Plug 'hrsh7th/cmp-cmdline', { 'branch': 'main' }
Plug 'hrsh7th/cmp-vsnip', { 'branch': 'main' }
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'kana/vim-textobj-user'
Plug 'github/copilot.vim'
Plug 'mfussenegger/nvim-lint'
Plug 'joom/latex-unicoder.vim'
Plug 'mjbrownie/hackertyper.vim'
Plug 'https://github.com/echasnovski/mini.nvim'
Plug 'j-hui/fidget.nvim'
Plug 'samsze0/utils.nvim'
Plug 'samsze0/websocket.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
Plug 'ray-x/lsp_signature.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"*****************************************************************************
"" Custom bundles
"*****************************************************************************
" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'neovimhaskell/nvim-hs.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
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

" Rust 
" Plug 'https://github.com/mrcjkb/rustaceanvim'

" Java 
Plug 'mfussenegger/nvim-jdtls'

" Lean 
Plug 'Julian/lean.nvim'

" Scala 
Plug 'scalameta/nvim-metals'

" F#
Plug 'ionide/Ionide-vim'

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

" highlight! Terminal guibg=#21252e
" au TermEnter * setlocal winhighlight=Normal:Terminal
" au TermEnter * setlocal scrolloff=0
" au TermLeave * setlocal scrolloff=3

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
set belloff=all

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

" Highlighting
hi NormalFloat guibg=NONE

function! s:hi(group, guifg, guibg, attr)
  let cmd = ""
  if a:guifg != ""
    let cmd = cmd . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd = cmd . " guibg=" . a:guibg
  endif
  if a:attr != ""
    let cmd = cmd . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if cmd != ""
    exec "hi " . a:group . cmd
  endif
endfunction


let s:nord0_gui = "#2E3440"
let s:nord1_gui = "#3B4252"
let s:nord2_gui = "#434C5E"
let s:nord3_gui = "#4C566A"
let s:nord3_gui_bright = "#616E88"
let s:nord4_gui = "#D8DEE9"
let s:nord5_gui = "#E5E9F0"
let s:nord6_gui = "#ECEFF4"
let s:nord7_gui = "#8FBCBB"
let s:nord8_gui = "#88C0D0"
let s:nord9_gui = "#81A1C1"
let s:nord10_gui = "#5E81AC"
let s:nord11_gui = "#BF616A"
let s:nord12_gui = "#D08770"
let s:nord13_gui = "#EBCB8B"
let s:nord14_gui = "#A3BE8C"
let s:nord15_gui = "#B48EAD"

let g:nord_underline = get(g:, "nord_underline", 1)
let s:underline = (g:nord_underline == 0) ? "NONE," : "underline,"

call s:hi("@lsp.type.namespace", s:nord7_gui, "", "")
call s:hi("@lsp.type.class.java", s:nord7_gui, "", "")
call s:hi("ocamlConstructor", s:nord7_gui, "", "")
call s:hi("haskellIdentifier", s:nord9_gui, "", "")
call s:hi("coqProofDelim", s:nord8_gui, "", s:underline)
call s:hi("coqGoalNumber", s:nord8_gui, "", s:underline)

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

" Syntax highlight
let python_highlight_all = 1

" html
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab

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
set conceallevel=2
let g:tex_conceal='abdmg'
hi Conceal guibg=NONE guifg=#888f9e

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
" let g:neoformat_enabled_ocaml = ['ocamlformat']
let g:neoformat_enabled_ocaml = []
let g:neoformat_haskell_ormolu = { 'exe': 'ormolu', 'args': [] }
let g:neoformat_haskell_fourmolu = { 'exe': 'fourmolu', 'args': [] }
let g:neoformat_enabled_haskell = ['ormolu']
let g:neoformat_enabled_javascript = []
" let g:neoformat_enabled_haskell = ['fourmolu']
let g:neoformat_java_google = {
            \ 'exe': 'google-java-format',
            \ 'args': [' -'],
            \ 'stdin': 1, 
            \ }

" let g:neoformat_enabled_java = ['google']

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

let $PATH="/home/gagan/.ghcup/bin/:/home/gagan/.cabal/bin/:/home/gagan/.local/share/nvim/mason/bin/:/home/gagan/.opam/default/bin:/home/gagan/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin/:/home/gagan/.local/share/coursier/bin/:/home/gagan/.dotnet/tools/"

autocmd BufRead,BufNewFile * setlocal signcolumn=no

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
let g:coqtail_coq_path = "/home/gagan/.opam/default/bin/"

" nvim-lint
lua require ("nvim-lint")

" Prolog 
let g:filetype_pl="prolog"
autocmd BufNewFile,BufRead *.pl   set syntax=prolog
autocmd BufNewFile,BufRead *.P   set syntax=prolog

" My languages
au BufRead,BufNewFile *.goto setfiletype goto
au BufRead,BufNewFile *.pkt setfiletype pocket

" swarm 
au BufRead,BufNewFile *.sw setfiletype swarm

" Flix
au BufRead,BufNewFile *.flix setfiletype flix

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

" Scala
:lua << EOF
  metals_config = require'metals'.bare_config()
  metals_config.settings = {
     showImplicitArguments = true,
     excludedPackages = {
       "akka.actor.typed.javadsl",
       "com.github.swagger.akka.javadsl"
     }
  }

  --metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  --  vim.lsp.diagnostic.on_publish_diagnostics, {
  --    virtual_text = {
  --      prefix = '',
  --    }
  --  }
  --)
EOF

if has('nvim-0.5')
  augroup lsp
    au!
    au FileType scala,sbt lua require('metals').initialize_or_attach(metals_config)
  augroup end
endif

" Smear cursor 
" lua require('smear_cursor').enabled = true
" lua require('smear')

" Waybar
" au BufNewFile,BufRead,BufReadPost config set syntax=jsonc

" CodeLens 
" autocmd InsertLeave,CursorHold *.ml,*.mli :lua vim.lsp.codelens.refresh()

" Snippets 
lua require ("snippets")

" Switch between relative and absolute line numbers
function! NumberToggle()
    if(&rnu == 1)
        set rnu!
    elseif(&rnu == 0)
        set rnu
    endif
endfunction

nnoremap <leader>n :call NumberToggle()<CR>

" Datalog 
au BufRead,BufNewFile *.dl set filetype=dl

" Jump to next diagnostic 
nnoremap <C-e> :lua vim.diagnostic.goto_next()<CR>
inoremap <C-e> :lua vim.diagnostic.goto_next()<CR>

" Telescope
nnoremap <C-b> <Cmd>Telescope buffers<CR>
nnoremap <C-f> <Cmd>Telescope find_files<CR>
nnoremap <C-s> <Cmd>Telescope live_grep<CR>

" fidget
:lua << EOF
require("fidget").setup {}
EOF

" NvimTree 
lua require("nvim-tree-config")
nno <leader>a :NvimTreeToggle<CR>

" Splits 
hi WinSeparator guifg=#81a1c1

" LSP signature 
" lua require("lsp_signature").on_attach()

" Ionide 
function! s:fsharp()
  let g:fsharp#lsp_auto_setup = 0

  if has('nvim') && exists('*nvim_open_win')
    set updatetime=1000
    augroup FSharpShowTooltip
      autocmd!
      autocmd CursorHold *.fs,*.fsi,*.fsx call fsharp#showTooltip()
    augroup END
  endif

  let g:fsharp#exclude_project_directories = ['paket-files']
endfunction
