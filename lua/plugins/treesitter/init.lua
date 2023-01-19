return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
  end,
  dependencies = {
    "p00f/nvim-ts-rainbow",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag"
  },
  config = function()
    require "plugins.treesitter.config"
  end
}
