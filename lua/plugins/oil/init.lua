return {
  'stevearc/oil.nvim',
  opts = {
    win_options = {
      winbar = "%{v:lua.require('oil').get_current_dir()}",
    }
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
