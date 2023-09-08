return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
  end,
  dependencies = {
    "HiPhish/nvim-ts-rainbow2",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
    {
      "m-demare/hlargs.nvim",
      config = function ()
        require('hlargs').setup()
      end
    }
  },
  config = function()
    require "plugins.treesitter.config"
  end
}
