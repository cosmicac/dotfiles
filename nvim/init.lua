require('mapping-util-functions')

-- Enable syntax highlighting
vim.cmd('syntax enable')

require('misc-settings')
require('split-navigation')
require('misc-mappings')

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins using lazy.nvim
require("lazy").setup("plugins")

-- Ruff LSP configuration
require('ruff-config')
