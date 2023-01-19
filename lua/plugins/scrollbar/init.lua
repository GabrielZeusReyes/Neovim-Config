return {
  "petertriho/nvim-scrollbar",
  event = "BufReadPre",
  dependences = {
    "folke/tokyonight.nvim"
  },
  config = function ()
    local colors = require("tokyonight.colors").setup()
    local scrollbar = require "scrollbar"
    scrollbar.setup({
      handle = {
        color = colors.fg_gutter,
      },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      },
      excluded_filetypes = {
        "fugitive",
        "toggleterm",
        "dashboard",
        "NvimTree",
        "Outline",
        "spectre_panel",
        "DiffviewFiles",
      }
    })
  end
}
