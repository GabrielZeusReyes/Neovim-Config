local ok_status, tokyonight = pcall(require, "tokyonight")
if not ok_status then
  return
end

tokyonight.setup {
  transparent = true,
  styles = {
     sidebars = "transparent",
     floats = "transparent",
  }
}

local colorscheme = "tokyonight-moon"

local status_ok,_ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
