return {
  {
    "lewis6991/gitsigns.nvim", -- git diagnostics
    config = function ()
      require "plugins.git.config"
    end
  },
  "tpope/vim-fugitive", -- for staging/unstaging and comitting
  {
    "sindrets/diffview.nvim", -- for checking diff and file history
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  }
}
