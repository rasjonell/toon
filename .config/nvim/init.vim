" Plugin setup
call plug#begin()
    " Utils
    Plug 'seerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'karb94/neoscroll.nvim'
    Plug 'tpope/vim-surround'
    Plug 'numToStr/Comment.nvim'
    Plug 'unkiwii/vim-nerdtree-sync'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Language Support / Completion / Linters
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'plasticboy/vim-markdown'
    Plug 'evanleck/vim-svelte'
    Plug 'prettier/vim-prettier', {'do': 'npm install'}

    " Git Stuff
    Plug 'airblade/vim-gitgutter'

    " Appearance
    Plug 'morhetz/gruvbox'
    Plug 'elvessousa/sobrio'
    Plug 'vim-airline/vim-airline'
    Plug 'mhartington/oceanic-next'
    Plug 'Yggdroot/indentLine'
    Plug 'ryanoasis/vim-devicons'

call plug#end()

" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set encoding=UTF-8
set nohlsearch
set ignorecase
set smartcase
set scrolloff=999

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

" Syntax
filetype plugin indent on
syntax on
set t_Co=256

" True color if available
let term_program=$TERM_PROGRAM

" Check for confilcts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
    endif
endif

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[2em"

" Appearance
colorscheme OceanicNext

" Plugin Setup

" Indent Line Stuff
let g:indentLine_char = '┆'

" Commenter Stuff
lua require('Comment').setup()

" Smooth Scroll stuff
lua require('neoscroll').setup()

" Dev Icons
let g:webdevicons_enable_nerdtree = 1


" Airline Stuff
let g:airline_theme='sobrio'
let g:airline_powerline_fonts = 1
let g:airline#extension#tabline#enabled = 1

" NERD Tree Stuff
let NERDTreeShowHidden = 1
let g:nerdtree_sync_cursorline = 1

" CTRLP Stuff
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<c-t>'],
  \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
  \ }

" Vim Markdown Stuff
let g:text_conceal = ''
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']

" Prettier Stuff
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
au BufWritePre *.css,*.svelte,*.scss,*.html,*.ts,*.js,*.json,*.jsx,*.tsx PrettierAsync

" Shortcuts

nnoremap <C-q> :q!<CR>
nnoremap <C-w> :wq<Cr>
nnoremap <C-b> :NERDTreeToggle<CR>

nnoremap <C-Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <C-t> :tabnew<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()


nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap <silent> <c-<> :wincmd <<CR>
nmap <silent> <c->> :wincmd ><CR>
nmap <silent> <c-=> :wincmd =<CR>


" Coc Stuff
nmap <silent> gs :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'drop')<CR>
nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> gf <c-^>

nmap <silent> <c-F> :Ag<CR>

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
