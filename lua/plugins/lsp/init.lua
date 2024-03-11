-- return {
--   "neovim/nvim-lspconfig",
--   event = "BufReadPre",
--   dependencies = {
--     {
--       "williamboman/mason.nvim",
--       dependencies = {
--         "nvim-lua/popup.nvim",
--       }
--     },
--     {
--      "williamboman/mason-lspconfig.nvim"
--     },
--     {
--      "jose-elias-alvarez/null-ls.nvim",
--       event = "BufReadPre",
--     },
--     {
--       "hrsh7th/cmp-nvim-lsp"
--     },
--     {
--       "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--       config = function ()
--        require("lsp_lines").setup()
--       end
--     }
--   },
--   config = function()
--     require "plugins.lsp.mason-plg"
--     require("plugins.lsp.handlers").setup()
--     require "plugins.lsp..null-ls"
--   end
-- }
-- return {
--   'VonHeikemen/lsp-zero.nvim',
--   branch = 'v2.x',
--   dependencies = {
--     -- LSP Support
--     {'neovim/nvim-lspconfig'},             -- Required
--     {                                      -- Optional
--       'williamboman/mason.nvim',
--       build = function()
--         pcall(vim.cmd, 'MasonUpdate')
--       end,
--     },
--     {'williamboman/mason-lspconfig.nvim'}, -- Optional
--
--     -- Autocompletion
--     {
--       'hrsh7th/nvim-cmp'
--     },     -- Required
--     {'hrsh7th/cmp-nvim-lsp'}, -- Required
--     {'L3MON4D3/LuaSnip'},     -- Required
--     {'hrsh7th/cmp-path'},
--     {'hrsh7th/cmp-buffer'},
--     {'saadparwaiz1/cmp_luasnip'},
--     {'rafamadriz/friendly-snippets'},
--   },
--   config = function()
--     require "plugins.lsp.lsp-zero"
--   end
-- }
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      lsp_zero.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })
    end,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-buffer'},
      {'saadparwaiz1/cmp_luasnip'},
      {'rafamadriz/friendly-snippets'}
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
        return
      end

      luasnip.filetype_extend("javascript", { "javascriptreact" })
      -- luasnip.filetype_extend("javascript", { "html" }) not really sure if we should use it since javascriptreact already covers most
      luasnip.filetype_extend("typescript", { "typescriptreact" })

      require("luasnip/loaders/from_vscode").lazy_load()


      local check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
      end

      local icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      cmp.setup({
        sources = {
          {name = 'path'},
          {name = 'nvim_lsp'},
          {name = 'buffer', keyword_length = 3},
          {name = 'luasnip', keyword_length = 2},
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        formatting = {
          format = function (_, vim_item)
            vim_item.kind = (icons[vim_item.kind] or "Foo") .. " " .. vim_item.kind
            return vim_item
          end
        },
        mapping = {
          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({select = true}),

          -- Ctrl+Space to trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end, {
              "i",
              "s",
            }),

          -- Navigate between snippet placeholder
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        },
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  }
}
