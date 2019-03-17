" Automatically install plug.vim.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim.plug
call plug#begin() 

" Prettier.
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Typescript syntax files for vim.
Plug 'leafgarland/typescript-vim'

" Fzf.
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Linter/fixer.
Plug 'w0rp/ale'

" Navigate between tmux and vim.
Plug 'christoomey/vim-tmux-navigator'

" Unix utilities.
Plug 'tpope/vim-eunuch'

" Surround bindings.
Plug 'tpope/vim-surround'

" Git wrapper.
Plug 'tpope/vim-fugitive'

" Sensible defaults.
Plug 'tpope/vim-sensible'

" Better looking status line.
Plug 'itchyny/lightline.vim'

" Faster commenting out stuff.
Plug 'tomtom/tcomment_vim'

" Git gutter.
Plug 'airblade/vim-gitgutter'

" Colorschemes.
Plug 'flazz/vim-colorschemes'

call plug#end()

" Set mouse scrolling.
set mouse+=a

" Tab stuff.
set tabstop=8 softtabstop=2 shiftwidth=2 smarttab expandtab

" Set line numbers.
set relativenumber
set number
set ruler

" Set regex engine.
set regexpengine=1

" Set text width.
set textwidth=90

" Solarized color scheme.
" syntax enable
" set background=dark
" let g:solarized_termtrans=1 "this is what fixed it for me
" colorscheme solarized

" Ryuuko color scheme.
colorscheme ryuuko
syntax enable

" Splits stuff.
" splitright and splitbelow as default
set splitright
set splitbelow

" Set default clipboard to system clipboard.
set clipboard=unnamed

" Easier split navigation.
nnoremap <C-J> <C-W><C-K>
nnoremap <C-K> <C-W><C-L>
nnoremap <C-L> <C-W><C-H>
nnoremap <C-H> <C-W><C-J>

" Highlight search.
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Map FZF to <c-p> 
nnoremap <c-p> :FZF<cr>

" ALE config.
let g:ale_fixers = {}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['prettier'],
\   'ruby': ['rubocop'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

" Workaround for a bug where ALE autocompletes too fast in .js files.
set completeopt=menu,menuone,preview,noselect,noinsert

" Lightline config.
let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
  \ }
  \ }

