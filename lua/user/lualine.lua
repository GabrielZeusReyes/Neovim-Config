local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

-- colors *from tokyonight
local colors = {
  darkgray = "#16161d", -- font color of the github name
  gray = "#cfc9c2", -- font color of other texts
  transparent = nil, -- make the bg transparent
  lightgrey = "#414868", -- bg color of the container for MODE and LOCATION
  normal = "#73daca",
  insert = "#bb9af7",
  visual = "#ffa066",
  replace = "#e46876",
  command = "#9ece6a",
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
  "mode",
  --[[ fmt = function(str) ]]
  --[[ 	return "-- " .. str .. " --" ]]
  --[[ end, ]]
  fmt = function(str)
    local firstLetter = str:sub(1, 1)
    local modeEmojis = {
      I = "🖋️",
      N = "🤖",
      C = "🖥️",
      V = "🤿",
      R = "🛠️"
    }
    local modeIcons = {
      I = "",
      N = "",
      C = "",
      V = "",
      R = ""
    }
    return modeEmojis[firstLetter]
  end,
  separator = { left = "", right = "" },
}
-- '' '' '' '' '' '' '' ''

local filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
  separator = { left = "", right = "" },
  padding = { left = 2, right = 1 }
}

local location = {
  "location",
  padding = { left = 0, right = 2 },
  separator = { left = "" }
}

local sessions = {
  require('auto-session-library').current_session_name,
  icons_enabled = true,
  icon = "💾",
  separator = {
    left = "",
    right = ""
  }
}

local buffers = {
  "buffers",
  separator = { left = "", right = "" },
  right_padding = 2,
  symbols = { alternate_file = "" },
  filetype_names = {
    fugitive = "Fugitive",
    DiffviewFileHistory = "File History"
  },
  buffers_color = {
    active = { fg = colors.darkgray, bg = colors.transparent, gui = "bold" },     -- Color for active buffer.
    inactive = { fg = colors.gray, bg = colors.lightgrey, gui = "bold" }, -- Color for inactive buffer.
  },
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = {
      inactive = {
        a = { fg = colors.gray, bg = colors.lightgrey, gui = "bold" },
        b = { fg = colors.gray, bg = colors.lightgrey },
        c = { fg = colors.gray, bg = colors.transparent },
      },
      visual = {
        a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
        b = { fg = colors.gray, bg = colors.lightgrey },
        c = { fg = colors.gray, bg = colors.transparent },
      },
      replace = {
        a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
        b = { fg = colors.gray, bg = colors.lightgrey },
        c = { fg = colors.gray, bg = colors.transparent },
      },
      normal = {
        a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
        b = { fg = colors.gray, bg = colors.lightgrey },
        c = { fg = colors.gray, bg = colors.transparent },
      },
      insert = {
        a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
        b = { fg = colors.gray, bg = colors.lightgrey },
        c = { fg = colors.gray, bg = colors.transparent },
      },
      command = {
        a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
        b = { fg = colors.gray, bg = colors.lightgrey },
        c = { fg = colors.gray, bg = colors.transparent },
      },
    },
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "fugitive", "toggleterm", "dashboard", "NvimTree", "Outline", "spectre_panel", "DiffviewFiles"},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch },
    lualine_c = { diagnostics },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = { diff, spaces, "encoding", filetype },
    lualine_y = { location },
    lualine_z = {
      {
        progress,
        color = {
          fg = colors.lightgrey
        },
        separator = {
          left = "",
          right = ""
        }
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { buffers },
    lualine_z = { sessions },
  },
})
