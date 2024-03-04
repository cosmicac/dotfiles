-- convenience functions
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

-- Set default clipboard to system clipboard.
vim.opt.clipboard="unnamed"

-- Tab stuff.
vim.opt.tabstop = 8
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true

-- Set line numbers
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ruler = true

-- Set text width.
vim.opt.textwidth = 100

-- Block Cursor
vim.opt.guicursor = "n-v-c-i:block"

-- Splits stuff.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Easier split navigation.
nmap('<c-k>', ':wincmd k<CR>', { silent = true })
nmap('<c-j>', ':wincmd j<CR>', { silent = true })
nmap('<c-h>', ':wincmd h<CR>', { silent = true })
nmap('<c-l>', ':wincmd l<CR>', { silent = true })

-- Highlight search.
vim.opt.hlsearch = true

-- Press Space to turn off highlighting and clear any message already displayed.
map('n', '<Space>', ':nohlsearch<Bar>:echo<CR>')

-- vim-plug
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Dracula theme
Plug('Mofiqul/dracula.nvim')

-- Unix utilities.
Plug('tpope/vim-eunuch')

-- Surround bindings.
Plug('tpope/vim-surround')

-- Git wrapper.
Plug('tpope/vim-fugitive')

-- Comment stuff out easily.
Plug('tpope/vim-commentary')

-- Fzf.
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
Plug('junegunn/fzf.vim')

-- Lualine for the status bar
Plug('nvim-lualine/lualine.nvim')
-- Icons for Lualine
Plug('kyazdani42/nvim-web-devicons')

-- Javascript syntax highlighting
Plug('pangloss/vim-javascript')

-- Mason - neovim package manager for LSPs
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')

-- LSP formatting wrapper, mainly used to format on save
Plug('lukas-reineke/lsp-format.nvim')

vim.call('plug#end')

-- Mason setup.
require("mason").setup()
require("mason-lspconfig").setup()

-- Ruff LSP
require('ruff-config')

-- Lualine config
require('lualine-config')

-- Map FZF to <c-p> 
vim.api.nvim_set_keymap('n', '<c-p>', ':FZF<cr>', { noremap = true })

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Color scheme
vim.cmd('colorscheme dracula')
