local opts = { noremap = true, silent = true }

--[[ local term_opts = { silent = true } ]]

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Nvimtree
-- To see the default mappings, type :help nvim-tree-default-mappings
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Hop/Motions
keymap("n", "<leader><leader>l", ":HopLineStart<CR>", opts)
keymap("n", "<leader><leader>s", ":HopPattern<CR>", opts)
keymap("n", "<leader><leader>o", ":HopChar2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<A-w>", ":Bdelete!<CR>", opts)
--[[ keymap("n", "<A-w>", ":BufferClose<CR>", opts) ]]

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Hold on to what was pasted
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- Other keymaps are in toggleterm.lua
keymap("n", "<leader>tf", '<cmd>ToggleTerm direction="float"<CR>', opts) -- Make the first terminal's direction float
keymap("n", "<leader>th", '<cmd>ToggleTerm direction="horizontal"<CR>', opts) -- Make the first terminal's direction horizontal 
keymap("n", "<leader>ts", '<cmd>2ToggleTerm direction="horizontal"<CR>', opts) -- "Splits" the terminal -> opens up a second terminal side by side IF the first terminal is opened in horizontal/vertical direction
keymap("n", "<leader>tt", '<cmd>ToggleTerm direction="horizontal"<CR><cmd>2ToggleTerm direction="horizontal"<CR>', opts) -- opens two terminals side by side

-- GIT
keymap("v", "<leader>hg", "<cmd>Gitsigns stage_hunk<CR>", opts) -- Stage a hunk through git_signs plugin
keymap("n", "<leader>fgs", "<cmd>Telescope git_status<CR>", opts) -- Open git status through Telescope plugin
keymap("n", "<leader>fgb", "<cmd>Telescope git_branches<CR>", opts) -- Open git branches through Telescope plugin
keymap("n", "<leader>g", "<cmd>tab G<CR>", opts) -- Open fugitive fullscreen
keymap("n", "<leader>gh", "<cmd>Gllog -- %<CR>", opts) -- Open commit logs that are related to the current file

-- Telescope --
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts)
keymap("n", "<leader><S-f>", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>p", "<cmd>Telescope projects<CR>", opts)

-- Styling/Linting --
keymap("n", "<leader>sl", "<cmd>Format<cr>", opts) -- format code

-- Open a new file
keymap("n", "<C-n>", "<cmd>:enew<cr>", opts)

-- Spectre Seach/Replace
keymap("n", "<leader><S-s>", "<cmd>lua require('spectre').open()<CR>", opts)
keymap("v", "<leader>s", "<esc>:lua require('spectre').open_visual()<CR>", opts)

-- Legendary
keymap("n", "<leader>?", "<cmd>Legendary keymaps<CR>", opts)
