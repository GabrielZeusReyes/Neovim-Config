-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup(
  {
    update_focused_file = {
      enable = true,
      update_root = false,
      ignore_list = {},
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    git = {
      enable = false,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      hide_root_folder = false,
      side = "left",
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
          { key = "h", action = "close_node" },
          { key = { "l", "<CR>", "o" }, action = "edit" },
        },
      },
      number = false,
      relativenumber = false,
      float = {
        open_win_config = {
          height = 30
        }
      }
    },
    actions = {
      open_file = {
        window_picker = { enable = true },
        resize_window = true,
        quit_on_open = true
      }
    },
    renderer = {
      highlight_git = true,
      root_folder_modifier = ":t",
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = "",
          symlink = "",
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            deleted = "",
            untracked = "U",
            ignored = "◌",
          },
          folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
          },
        }
      }
    }
  }
)

