local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
  return
end

local keymaps = {
  {
    "<C-h>",
    description = "Navigate to the left window"
  }, {
    "<C-j>",
    description = "Navigate to the bottom window"
  }, {
    "<C-k>",
    description = "Navigate to the top window"
  }, {
    "<C-l>",
    description = "Navigate to the right window"
  }, {
    "<C-Up>",
    description = "Increase the height of the window"
  }, {
    "<C-Down>",
    description = "Decrease the height of the window"
  }, {
    "<C-Left>",
    description = "Decrease the width of the window"
  }, {
    "<C-Right>",
    description = "Increase the width of the window"
  }, {
    "<C-\\>",
    description = "Toggle the terminal"
  },{
    "<leader>tf",
    description = "Toggle the first terminal as a float"
  }, {
    "<leader>th",
    description = "Toggle the first terminal as horizontal direction"
  },{
    "<leader>ts",
    description = "Toggle the second terminal on the side"
  },{
    "<leader>tt",
    description = "Toggle two terminals side by side"
  },{
    "<C-n>",
    description = "Open a new empty file"
  },{
    "<S-l>",
    description = "Navigate to the next opened file"
  }, {
    "<S-h>",
    description = "Navigate to the previous opened file"
  }, {
    "<A-w>",
    description = "Close the current file"
  }, {
    "<A-j>",
    description = "Move the selected text down a line",
    mode = { "v" }
  }, {
    "<A-k>",
    description = "Move the selected text up a line",
    mode = { "v" }
  }, {
    "<space>",
    description = "Leader Key"
  }, {
    "<leader>e",
    description = "Toggle NvimTree"
  },
  {
    "<leader>l",
    description = "Toggle LSP Lines"
  },
  {
    "<leader><leader>l",
    description = "Hop to any line start"
  },
  {
    "<leader>ss",
    description = "Open Sessions"
  },
  {
    "<leader><leader>s",
    description = "Hop to a pattern"
  }, {
    "<leader><leader>o",
    description = "Hop to any two char"
  }, {
    "<leader>c",
    description = "Close Telescope or Legendary boxes",
    mode = { 'i' }
  }, {
    "<leader>g",
    description = "Open Fugitive"
  }, {
    "<leader>gm",
    description = "Open Merge conflict window"
  },{
    "d2o",
    description = "Pull the change from the left window"
  },{
    "d3o",
    description = "Pull the change from the right window"
  },{
    "<leader>gs",
    description = "Open git status through Telescope"
  },{
    "<leader>gb",
    description = "Open git branch through Telescope"
  },{
    "<leader>gh",
    description = "Open the file history of the current file"
  },{
    "<leader>gd",
    description = "Open the file diff of the current file"
  },{
    "<leader>gc",
    description = "Close the diffview panels"
  },
  {
    "<leader>f",
    description = "Open Telescope Find files panel"
  }, {
    "<leader>F",
    description = "Open Telescope Live Grep"
  }, {
    "<leader>sl",
    description = "Format the current file"
  },
  {
    "<leader>S",
    description = "Open Spectre"
  },
  {
    "<leader>s",
    description = "Open Spectre in Visual mode",
    mode = { 'v' }
  },
  {
    "gD",
    description = "LSP declaration",
  },{
    "gd",
    description = "LSP definition",
  },{
    "K",
    description = "LSP hover",
  },{
    "gi",
    description = "LSP implementation",
  },{
    "<C-k>",
    description = "LSP signature help",
  },{
    "gr",
    description = "LSP references",
  },{
    "[d",
    description = "Move the previous diagnostic",
  },{
    "d]",
    description = "Move the next diagnostic",
  },
  {
    "<C-n>",
    definition = "Start multi select",
  }
}

legendary.setup({
  select_prompt = "What's the shortcut for... 🤔",
  keymaps = keymaps
})
