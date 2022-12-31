local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local setHighlight = vim.api.nvim_set_hl

local status_ok_cat, palettes = pcall(require, "catppuccin.palettes")
if not status_ok_cat then
  return
end

local mocha = palettes.get_palette "mocha"

local opts = {
  red = { default = true, fg = mocha.red },
  flamingo = { default = true, fg = mocha.flamingo },
  sky = { default = true, fg = mocha.sky },
  green = { default = true, fg = mocha.green },
  lavender = { default = true, fg = mocha.green },
  yellow = { default = true, fg = mocha.yellow },
}

setHighlight(0, "NavicSeparator", opts.red);
setHighlight(0, "NavicText", opts.flamingo);
-- brackets and arrays
setHighlight(0, "NavicIconsObject", opts.sky);
setHighlight(0, "NavicIconsModule", opts.sky);
setHighlight(0, "NavicIconsNamespace", opts.sky);
setHighlight(0, "NavicIconsArray", opts.sky);
-- boxes
setHighlight(0, "NavicIconsPackage", opts.green);
setHighlight(0, "NavicIconsMethod", opts.green);
setHighlight(0, "NavicIconsField", opts.green);
setHighlight(0, "NavicIconsConstructor", opts.green);
setHighlight(0, "NavicIconsFunction", opts.green);
-- variable, string, key, number, boolean, null, constant
setHighlight(0, "NavicIconsVariable", opts.lavender);
setHighlight(0, "NavicIconsString", opts.lavender);
setHighlight(0, "NavicIconsKey", opts.lavender);
setHighlight(0, "NavicIconsNumber", opts.lavender);
setHighlight(0, "NavicIconsNull", opts.lavender);
setHighlight(0, "NavicIconsConstant", opts.lavender);
setHighlight(0, "NavicIconsBoolean", opts.lavender);
-- remaining icons
setHighlight(0, "NavicIconsFile", opts.yellow);
setHighlight(0, "NavicIconsClass", opts.yellow);
setHighlight(0, "NavicIconsProperty", opts.yellow);
setHighlight(0, "NavicIconsEnum", opts.yellow);
setHighlight(0, "NavicIconsInterface", opts.yellow);
setHighlight(0, "NavicIconsEnumMember", opts.yellow);
setHighlight(0, "NavicIconsStruct", opts.yellow);
setHighlight(0, "NavicIconsOperator", opts.yellow);
setHighlight(0, "NavicIconsTypeParameter", opts.yellow);

navic.setup {
    icons = {
      File = ' ',
      Module = ' ',
      Namespace = ' ',
      Package = ' ',
      Class = ' ',
      Method = ' ',
      Property = ' ',
      Field = ' ',
      Constructor = ' ',
      Enum = ' ',
      Interface = ' ',
      Function = ' ',
      Variable = ' ',
      Constant = ' ',
      String = ' ',
      Number = ' ',
      Boolean = ' ',
      Array = ' ',
      Object = ' ',
      Key = ' ',
      Null = ' ',
      EnumMember = ' ',
      Struct = ' ',
      Event = ' ',
      Operator = ' ',
      TypeParameter = ' '
    },
    highlight = true,
    separator = "  ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true
}
