return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim' },
  config = function()
    -- Use native fzf extension for performance.
    require('telescope').load_extension('fzf')

    local actions = require("telescope.actions")
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<C-[>"] = actions.close,
            ["<C-q>"] = actions.close,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          }
        }
      }
    })

    -- Set mappings to open telescope.
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<c-p>', builtin.find_files, {})
    vim.keymap.set('n', '<c-g>', builtin.live_grep, {})

  end,
}
