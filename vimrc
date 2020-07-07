" Automatically install plug.vim.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim.plug
call plug#begin() 

" Xterm color table.
Plug 'guns/xterm-color-table.vim'

" Palenight theme.
Plug 'drewtempelmeyer/palenight.vim'

" Prettier.
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Typescript syntax files for vim.
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Stylus syntax files for vim.
Plug 'iloginow/vim-stylus'

" Fzf.
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Linter/fixer.
Plug 'dense-analysis/ale'

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

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Easily transition between multi-line and one line code.
Plug 'AndrewRadev/splitjoin.vim'

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

" Nord color scheme.
set background=dark
colorscheme palenight
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

" Insert space before paste.
nnoremap <leader>p li<space><esc>p

" Highlight search.
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Map FZF to <c-p> 
nnoremap <c-p> :FZF<cr>

" ALE config.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['prettier'],
\   'ruby': ['rubocop'],
\}
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_options = 'Metrics/MethodLength Enabled: false'
let g:ale_completion_enabled = 1

" Workaround for a bug where ALE autocompletes too fast in .js files.
set completeopt=menu,menuone,preview,noselect,noinsert

" Lightline config.
let g:lightline = {
  \ 'colorscheme': 'palenight',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
  \ }
  \ }

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Force Vim to recognize .tsx files as Typescript so syntax highlighting works.
augroup SyntaxSettings
  autocmd!
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
augroup END

" Copy current filename to clipboard.
nmap ,cl :let @*=expand("%:p")<CR>

" Highlight current  column.
set cursorcolumn

" Splitjoin variables
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_trailing_comma = 1
let g:splitjoin_ruby_curly_braces = 0
