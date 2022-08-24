syntax on
set number
set cursorline

colorscheme edge 

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab
" Do not save backup files.
set nobackup

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.  set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu


" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'

  Plug 'rust-lang/rust.vim'

  Plug 'vim-airline/vim-airline'
  
  Plug 'lervag/vimtex'
  let g:vimtex_view_method='zathura'
  let g:vimtex_quickfix_mode=0
  set conceallevel=1
  let g:tex_conceal='abdmg'

call plug#end()

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ 

" Show the status on the second to last line.
set laststatus=2

" Yank from cursor to the end of line.
nnoremap Y y$

" Basic Pair Completion
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Skip over the closing character PARENTHESES 
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" Skip over the closing character SQUARE BRACKET 
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" Matching pair for single or double quotes
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
