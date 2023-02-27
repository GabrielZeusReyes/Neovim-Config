return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  version = 'nightly',
  config = function ()
    require "plugins.nvim-tree.config"
  end
}
