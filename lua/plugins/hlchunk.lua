return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        style = {
            { fg = "#b4befe" },
            { fg = "#f38ba8" }, -- this fg is used to highlight wrong chunk
        },
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        },
        use_treesitter = true
      },
      indent = {
        enable = true,
        chars = {
          "│",
          "¦",
          "┆",
          "┊",
        },
        treesitter = true,
      },
      line_num = {
        enable = true,
        use_treesitter = true,
        style = "#b4befe"
      },
      exclude_filetypes = {
        oil = true
      }
    })
  end
}
