return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
      -- See ~/.local/share/nvim/lazy/nvim-treesitter/parser for a list of installed parsers.
      -- To install a new parser:
      --
      --   :TSInstall {parser}
      --
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }
    end,
}
