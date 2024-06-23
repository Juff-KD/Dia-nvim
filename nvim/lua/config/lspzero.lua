return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  lazy = false,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        {
          "SmiteshP/nvim-navbuddy",
          dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
          },
          opts = { lsp = { auto_attach = true } }
        }
      },
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "luckasRanarison/tailwind-tools.nvim",
        "onsails/lspkind-nvim",
      },
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "onsails/lspkind.nvim",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "neovim/nvim-lspconfig",
  },
  event = "VeryLazy",
  config = function()
    local lsp_zero = require('lsp-zero')
    --local lspconfig = require('lspconfig')

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
      -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      local bufopt = { noremap = true, silent = true, buffer = bufnr }
      local bind = vim.keymap.set

      bind('n', 'gd', "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", bufopt)

      bind('n', 'K', '<cmd>Lspsaga hover_doc<cr>', bufopt)

      bind('n', '<leader>ca', vim.lsp.buf.code_action, bufopt)
      bind('n', '<leader>lf', function() vim.lsp.buf.format({ async = true }) end, bufopt)

      -- Lspsaga Diagnostic
      bind('n', '<leader>dl', '<cmd>Lspsaga diagnostic_jump_next<cr>', bufopt)
      bind('n', '<leader>dh', '<cmd>Lspsaga diagnostic_jump_prev<cr>', bufopt)
    end)

    lsp_zero.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })

    require("neoconf").setup({
      -- override any of the default settings here
    })

    require("neodev").setup({
      -- add any options here, or leave empty to use the default settings
    })

    --- if you want to know more about lsp-zero and mason.nvim
    --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
    require('mason').setup({})
    require('mason-lspconfig').setup({
      handlers = {
        lsp_zero.default_setup,
        -- (Optional) configure lua language servers
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,
      },
      Settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = {
            disable = { "missing-fields" },
          }
        }
      },
    })


    -- Autocompletion config
    ---
    local cmp = require('cmp')
    local cmp_action = lsp_zero.cmp_action()
    local luasnip = require("luasnip")

    local cmp_mappings = lsp_zero.defaults.cmp_mappings({
      -- `Enter` key to confirm completion
      --   ['<Enter>'] = cmp.mapping.confirm({select = true}),
      -- Ctrl+Space to trigger completion menu
      ['<C-Space>'] = cmp.mapping.complete(),
      -- Navigate between snippet placeholder
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      -- Scroll up and down in the completion documentation
      ['<C-u>'] = cmp.mapping.scroll_docs(-5),
      ['<C-d>'] = cmp.mapping.scroll_docs(3),

      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-2) then
          luasnip.jump(-2)
        else
          fallback()
        end
      end, { "i", "s" }),
      ['<Enter>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      })
    })


    cmp.setup({

      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',           keyword_length = 3 },
        { name = "codeium" },
        { name = 'friendly-snippets' },
        { name = 'otter' },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = cmp_mappings,

      formattingConfig = {
        format = require("lspkind").cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          symbol_map = { Codeium = "", },
          before = require("tailwind-tools.cmp").lspkind_format,
        })
      },
    })
    cmp.config.formatting = {
      format = require("tailwindcss-colorizer-cmp").formatter
    }
  end
}
