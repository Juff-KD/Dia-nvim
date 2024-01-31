<<<<<<< HEAD
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins ={
-- {
--   'polirritmico/monokai-nightasty.nvim', lazy=false, priority=1000
-- },
{
  'Yazeed1s/oh-lucy.nvim', lazy=false, priority=1000
},
{ "zootedb0t/citruszest.nvim",
  lazy = false,
  priority = 1000,
},
{
  'norcalli/nvim-colorizer.lua',
   lazy = false,
    config = function()
      require "colorizer".setup({ '*' ; }) end,
    enabled = true
},
{
  "kevinhwang91/nvim-hlslens", lazy=false,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('config.hlslens')
  end,
},
{'rcarriga/nvim-notify', lazy=false,
    config = function()
      require('config/notify')
    end,
},
{
  'Exafunction/codeium.vim',
      event = 'BufEnter',
      config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  end
},
{
  "folke/trouble.nvim",
		event = "VimEnter",
		config = function()
      require('config/trouble')
    end,
},
{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
{
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = { -- Adds pretty icons to your documents
            config = {
              icon_preset = "diamond",
							icons = {
								todo = {
                  cancelled = {
                    icon = "",
                  },
									done = {
										icon = "",
									},
									pending = {
										icon = "",
									},
                  on_hold = {
                    icon = "",
                  },
                  urgent = {
                    icon = "⚠",
                  },
                  recurring = {
                    icon = "↺",
                  },
								},
							},
						},
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
                work = "~/notes/work",
								home = "~/notes/home",
              },
              default_workspace = "home",
            },
          },
        },
       ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
			 ["core.itero"] = {},
			 ["core.ui.calendar"] = {},
      }
    end,
},
{
  "ngtuonghy/live-server-nvim",
  event = "VeryLazy",
  build = ":LiveServerInstall",
  config = function()
      require("config/live-server-nvim")
  end,
},
{
  'kosayoda/nvim-lightbulb', lazy = false,
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true } })
    end
},
{
  'stevearc/overseer.nvim',
  opts = {},
  config = function()
    require('config/overseer')
  end,
},
{
  'toppair/peek.nvim',
    config= function()
      require('config/peek')
    end,
},
{
 "nmac427/guess-indent.nvim", -- guess indent
   config = function()
     require("guess-indent").setup({})
   end,
},
{
  "folke/zen-mode.nvim",
  config = function()
    require('config/zen')
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
    config = function()
      require('config/whichkey')
    end,
},
{
    "VonHeikemen/lsp-zero.nvim", 
      branch = 'v3.x',
      lazy = false,
      --config = false,
      dependencies = {
      {"neovim/nvim-lspconfig",
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
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/nvim-cmp",
      "nvim-lspconfig",
    },
    event = "VeryLazy",
    config = function()
      require("config.lspzero")
    end
},
{
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "VeryLazy",
    config = function()
      require('config.lspsaga')
    end
},
{
  "windwp/nvim-autopairs",   config = true,     event = "VeryLazy"
},
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
   config = function()
    require("config.nvim-tree")
  end,
},
{
  'nvim-lualine/lualine.nvim',
  version ="*",
  lazy =false,
  event = 'BufEnter',
  dependencies = { 
     'nvim-tree/nvim-web-devicons', --opt = true }
   },
  config = function()
    require("config.lualineK")
  end,
},
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('config/neo_tree')
    end,
},
{
  'stevearc/oil.nvim', lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
    keymaps = {
      ['<C-v>'] = 'actions.select_vsplit',
      o = 'actions.select',
      q = 'actions.close',
      Q = 'actions.close',
    },
  },
  cmd = {'Oil'},
 -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    vim.keymap.set('n', '-', '<CMD>Oil<CR>')
  end,
  config = function()
    require('config/oil')
  end,
},
{
  "stevearc/aerial.nvim", lazy=false,  opts = {},
    dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"},
  config = function()
     require('config.aerial')
  end,
  cmd = "AerialToggle",
},
{
  "iamcco/markdown-preview.nvim",
    ft = "markdown" , lazy = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
},
{
  "johmsalas/text-case.nvim",
  event = "VeryLazy",lazy = false,
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  keys = {
    "ga", -- Default invocation prefix
    { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope" },
  },
},
{
  "folke/flash.nvim",
  event = "VeryLazy",
  --@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
},
--{
--"epwalsh/obsidian.nvim",
--  lazy = false,
--   event = {
--     -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
--     -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
--     "BufReadPre path/to/my-vault/**.md",
--     "BufNewFile path/to/my-vault/**.md",
--   },
--   dependencies = {
--     -- Required.
--     "nvim-lua/plenary.nvim",
--
--     -- see below for full list of optional dependencies 👇
--   },
--   opts = {
--     detect_cwd = true,
--     log_level = vim.log.levels.DEBUG,
--     finder = "telescope.nvim",
--     sort_by = "modified",
--     sort_reversed = true,
    -- Optional, if you keep notes in a specific subdirectory of your vault.
    -- notes_subdir = "notes",
    -- Accepted values are "current", "hsplit" and "vsplit"
    -- open_notes_in = "current",
    -- disable_frontmatter = false,
    -- completion ={
    --   nvim_cmp = true,
    --   min_chars = 2,
    --   new_notes_location = "current_dir",
    --   -- prepend_note_id = true,
    -- },
    --   -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
    --   open_app_foreground = false,
    --   mappings = {
    -- -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    -- ["gf"] = {
    --   action = function()
    --     return require("obsidian").util.gf_passthrough()
    --   end,
    --   opts = { noremap = false, expr = true, buffer = true },
    --     },
    -- },
    -- workspaces = {
    --   {
--         name = "personal",
--         path = "~/vaults/personal",
--       },
--       {
--         name = "work",
--         path = "~/vaults/work",
--       },
--     },
--
--     -- see below for full list of options 👇
--   },
-- },
{
  "karb94/neoscroll.nvim",
    event = "BufRead",
    lazy = false,
    enabled = true,
},
{
		"lukas-reineke/indent-blankline.nvim",
		-- event = "VimEnter",
	    main = "ibl", event = "UIEnter",
    config = function()
			require("config/indbl")
		end,
},
{
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {'nvim-tree/nvim-web-devicons',
                "echasnovski/mini.bufremove",
    },
    config = function()
      require('config.buffline')
    --   local ok, bufferline = pcall(require, 'bufferline')
    --   if not ok then return end
    --
    --   bufferline.setup {
    --     options = {
    --       offsets = {
    --         { filetype = "NvimTree", text = "", padding = 0 },
    --         { filetype = "neo-tree", text = "", padding = 0 },
    --         { filetype = "Outline",  text = "", padding = 0 },
    --       },
    --       max_name_length = 13,
    --       max_prefix_length = 12,
    --       tab_size = 19,
    --       separator_style = { " » ", ' » ' },
    --       indicator = {
    --         style = 'none'
    --       },
    --       style_preset = bufferline.style_preset.no_italic
    --     },
    --   }
    end,
    event = "VeryLazy",
},
{
  'kevinhwang91/nvim-ufo',
  lazy = false,
  dependencies = {
    'kevinhwang91/promise-async'
  },
  -- exclude = 'neo-tree',
  -- event = "BufEnter",
  keys = {
    { "ua", function() require('ufo').openAllFolds() end, desc = "Open all folds" },
    { "uc", function() require('ufo').closeAllFolds() end, desc = "Close all folds" },
    { "uf", function() require('ufo').peekFoldedLinesUnderCursor() end, desc = "Peek folded lines under cursor" },
  },
  opts = {
    open_fold_hl_timeout = 0,
    fold_virt_text_handler = function(text, lnum, endLnum, width)
      local suffix = "  "
      local lines  = ('[%d lines] '):format(endLnum - lnum)

      local cur_width = 0
      for _, section in ipairs(text) do
        cur_width = cur_width + vim.fn.strdisplaywidth(section[1])
      end

      suffix = suffix .. (' '):rep(width - cur_width - vim.fn.strdisplaywidth(lines) - 3)

      table.insert(text, { suffix, 'Comment' })
      table.insert(text, { lines, 'Todo' })
      return text
    end,
    preview = {
      win_config = {
        border = {"┏", "━", "┓", "┃", "┛", "━", "┗", "┃"},
        winblend     = 0,
        winhighlight = "Normal:LazyNormal",
      }
    }
  },
},
{
  'mrjones2014/smart-splits.nvim',
  event = 'VeryLazy', lazy = false,
  config = function()
    local ss = require ('smart-splits')

    ss.setup()
    vim.keymap.set('n', '<leader>r',':SmartResizeMode<cr>', {noremap=true, silent=true})
    vim.keymap.set('n', '<c-h>', ss.move_cursor_left)
    vim.keymap.set('n', '<c-j>', ss.move_cursor_down)
    vim.keymap.set('n', '<c-k>', ss.move_cursor_up)
    vim.keymap.set('n', '<c-l>', ss.move_cursor_right)
  end,
},
-- {
--   "folke/noice.nvim",
--   lazy = false,
--   config = function()
--     require("noice").setup({
--       lsp = {
--         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--         override = {
--           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--           ["vim.lsp.util.stylize_markdown"] = true,
--           ["cmp.entry.get_documentation"] = true,
--         },
--       },
--       -- you can enable a preset for easier configuration
--       presets = {
--         bottom_search = false, -- use a classic bottom cmdline for search
--         command_palette = false, -- position the cmdline and popupmenu together
--         long_message_to_split = true, -- long messages will be sent to a split
--         inc_rename = false, -- enables an input dialog for inc-rename.nvim
--         lsp_doc_border = false, -- add a border to hover docs and signature help
--       },
--       routes = {
--         {
--           view = "notify",
--           filter = { event = "msg_showmode" },
--         },
--       },
--       cmdline = {
--         view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
--         format = {
--           cmdline = { pattern = "^:", icon = "O|>", 
--                     lang = "vim", title = "" },
--         }
--       },
--       views = {
--         cmdline_popup = {
--           size = {
--             height = "auto",
--             width = "90%",
--           },
--           position = {
--             row = "92%",
--             col = "50%",
--           },
--           border = {
--             style = "single"
--           },
--         },
--       },
--     })
--   end,
-- },
{
   "kylechui/nvim-surround",
    version = "*",
    config = function()
      require('nvim-surround').setup()
    end,
    event = "VeryLazy"
},
{
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-refactor' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'yioneko/nvim-yati' },
    { 'yioneko/vim-tmindent'},
  },
  event = 'VeryLazy',
  config = function()
    require('config.treesitter')
  end,
},
{
  "nvim-telescope/telescope.nvim", branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' ,
      'sharkdp/fd',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('config.tele')
    end
},
{ 'akinsho/toggleterm.nvim', version = "*",     config = true },
{
  "goolord/alpha-nvim",
  config = function()
    require ("config.alpha")
  end
},
{
    require ('config.projection'),
    --require ('config.git'),
    require ('config.mini'),
    require ('config.restHTTP'),
    require ('config.barbecue'),
},

}


local opts = {}
require ('lazy').setup({plugins, opts})

=======
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins ={
{
  'polirritmico/monokai-nightasty.nvim', lazy=false, priority=1000
},
{
  "zootedb0t/citruszest.nvim",
  lazy = false,
  priority = 1000,
},
{
  'norcalli/nvim-colorizer.lua',
   lazy = false,
    config = function() 
      require "colorizer".setup({ '*' ; }) end,
    enabled = true
},
{
  "kevinhwang91/nvim-hlslens", lazy=false,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('config.hlslens')
  end,
},
{'rcarriga/nvim-notify', lazy=false,
    config = function()
      require('config/notify')
    end,
},
{
  "utilyre/barbecue.nvim",
    lazy = false, enabled = true,
    version = "*",
    name = "barbecue",
    dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
    "neovim/nvim-lspconfig",
  },
  --@type barbecue.Config
  opts = {
    theme = "auto",
   
  },
},
{
  'echasnovski/mini.nvim', version = '*',
      event ="BufEnter",
      branch = "stable",
      dependencies = {'nvim-tree/nvim-web-devicons',
                      'lewis6991/gitsigns.nvim',  
       }, 
      config = function()
      --require('mini.map').setup()
      -- require('mini.tabline').setup()
      require('mini.indentscope').setup()
      require('mini.cursorword').setup()
      require('mini.bracketed').setup()
      require('mini.align').setup()
      require('mini.jump').setup()
      require('mini.comment').setup()
      --require('mini.move').setup()
      require('config/mini')
      -- require('mini.files').setup()
    end,
},
{
  'Exafunction/codeium.vim',
      event = 'BufEnter',
      config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  end
},
{
  "folke/trouble.nvim",
		event = "VimEnter",
		config = function()
      require('config/trouble')
    end,
},
{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
{
  "ngtuonghy/live-server-nvim",
  event = "VeryLazy",
  build = ":LiveServerInstall",
  config = function()
      require("config/live-server-nvim")
  end,
},
{
  'kosayoda/nvim-lightbulb', lazy = false,
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true } })
    end
},
{
  'stevearc/overseer.nvim',
  opts = {},
  config = function()
    require('config/overseer')
  end,
},
{
  'toppair/peek.nvim', 
    config= function()
      require('config/peek')
    end,
},
{
 "nmac427/guess-indent.nvim", -- guess indent
   config = function() 
     require("guess-indent").setup({}) 
   end,
},
{
  "folke/zen-mode.nvim",
  config = function()
    require('config/zen')
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
    config = function()
      require('config/whichkey')
    end,
},
{
    "VonHeikemen/lsp-zero.nvim", 
      branch = 'v3.x',
      lazy = false,
      --config = false,
      dependencies = {
      {"neovim/nvim-lspconfig",
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
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/nvim-cmp",
    },
    event = "VeryLazy",
    config = function()
      require("config.lsp")
    end
},
{
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "VeryLazy",
    config = function()
      require('config.lspsaga')
    end
},
{
  "windwp/nvim-autopairs",   config = true,     event = "VeryLazy" 
},
{
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
   config = function()
    require("config.nvim-tree")
  end,
},
{
  'nvim-lualine/lualine.nvim',
  version ="*",
  lazy =false,
  event = 'BufEnter',
  dependencies = { 
     'nvim-tree/nvim-web-devicons', --opt = true }
   },
  config = function()
    require("config.lualine")
  end,
},
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('config/neo_tree')
    end,
},
-- {
--   'stevearc/oil.nvim',
--     opts = {
--     keymaps = {
--       ['<C-v>'] = 'actions.select_vsplit',
--       o = 'actions.select',
--       q = 'actions.close',
--       Q = 'actions.close',
--     },
--   },
--   cmd = {'Oil'},
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   init = function()
--     vim.keymap.set('n', '-', '<CMD>Oil<CR>')
--   end,
--   config = function()
--     require('config/oil')
--   end,
-- },
{
  "stevearc/aerial.nvim", lazy=false,  opts = {},
    dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"},
  config = function()
     require('config.aerial')
  end,
  cmd = "AerialToggle",
},
{ 
  "lewis6991/gitsigns.nvim", 
   -- config = true,
    event = "VeryLazy",
     config = function()
      require("config/gitsigns")
     end,
},
{
  'dinhhuy258/git.nvim',
    config = function()
      require('git').setup()
    end,
},
{
  "iamcco/markdown-preview.nvim",
    ft = "markdown" , lazy = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
},
{
  "johmsalas/text-case.nvim",
  event = "VeryLazy",lazy = false,
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  keys = {
    "ga", -- Default invocation prefix
    { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope" },
  },
},
{
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
},
{
  "epwalsh/obsidian.nvim",
  lazy = false,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre path/to/my-vault/**.md",
    "BufNewFile path/to/my-vault/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    detect_cwd = true,
    log_level = vim.log.levels.DEBUG,
    finder = "telescope.nvim",
    sort_by = "modified",
    sort_reversed = true,
    -- Optional, if you keep notes in a specific subdirectory of your vault.
    -- notes_subdir = "notes",
    -- Accepted values are "current", "hsplit" and "vsplit"
    open_notes_in = "current",
    disable_frontmatter = false,
    completion ={
      nvim_cmp = true,
      min_chars = 2,
      new_notes_location = "current_dir",
      -- prepend_note_id = true,
    },
      -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
      open_app_foreground = false,
      mappings = {
    -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
        },
    },
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },

    -- see below for full list of options 👇
  },
},
{
  "karb94/neoscroll.nvim",
    event = "BufRead",
    lazy = false,
    enabled = true,
},
{
		"lukas-reineke/indent-blankline.nvim",
		-- event = "VimEnter",
	    main = "ibl", event = UIEnter, 
    config = function()
			require("config/indbl")
		end,
},
{
  'akinsho/bufferline.nvim',
    config = function()
      local ok, bufferline = pcall(require, 'bufferline')
      if not ok then return end

      bufferline.setup {
        options = {
          offsets = {
            { filetype = "NvimTree", text = "", padding = 1 },
            { filetype = "neo-tree", text = "", padding = 1 },
            { filetype = "Outline",  text = "", padding = 1 },
          },
          max_name_length = 14,
          max_prefix_length = 13,
          tab_size = 20,
          separator_style = { " » ", ' » ' },
          indicator = {
            style = 'none'
          },
          style_preset = bufferline.style_preset.no_italic
        },
      }
    end,
    event = "BufEnter",
},
{
  'kevinhwang91/nvim-ufo',
  lazy = false,
  dependencies = {
    'kevinhwang91/promise-async'
  },
  -- exclude = 'neo-tree',
  -- event = "BufEnter",
  keys = {
    { "zR", function() require('ufo').openAllFolds() end, desc = "Open all folds" },
    { "zM", function() require('ufo').closeAllFolds() end, desc = "Close all folds" },
    { "zZ", function() require('ufo').peekFoldedLinesUnderCursor() end, desc = "Peek folded lines under cursor" },
  },
  opts = {
    open_fold_hl_timeout = 0,
    fold_virt_text_handler = function(text, lnum, endLnum, width)
      local suffix = "  "
      local lines  = ('[%d lines] '):format(endLnum - lnum)

      local cur_width = 0
      for _, section in ipairs(text) do
        cur_width = cur_width + vim.fn.strdisplaywidth(section[1])
      end

      suffix = suffix .. (' '):rep(width - cur_width - vim.fn.strdisplaywidth(lines) - 3)

      table.insert(text, { suffix, 'Comment' })
      table.insert(text, { lines, 'Todo' })
      return text
    end,
    preview = {
      win_config = {
        border = {"┏", "━", "┓", "┃", "┛", "━", "┗", "┃"},
        winblend     = 0,
        winhighlight = "Normal:LazyNormal",
      }
    }
  },
},
{
  'mrjones2014/smart-splits.nvim',
  event = 'VeryLazy', lazy = false,
  config = function()
    local ss = require ('smart-splits')

    ss.setup()
    vim.keymap.set('n', '<leader>r',':SmartResizeMode<cr>', {noremap=true, silent=true})
    vim.keymap.set('n', '<c-h>', ss.move_cursor_left)
    vim.keymap.set('n', '<c-j>', ss.move_cursor_down)
    vim.keymap.set('n', '<c-k>', ss.move_cursor_up)
    vim.keymap.set('n', '<c-l>', ss.move_cursor_right)
  end,
},
-- {
--   "folke/noice.nvim",
--   lazy = false,
--   config = function()
--     require("noice").setup({
--       lsp = {
--         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--         override = {
--           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--           ["vim.lsp.util.stylize_markdown"] = true,
--           ["cmp.entry.get_documentation"] = true,
--         },
--       },
--       -- you can enable a preset for easier configuration
--       presets = {
--         bottom_search = false, -- use a classic bottom cmdline for search
--         command_palette = false, -- position the cmdline and popupmenu together
--         long_message_to_split = true, -- long messages will be sent to a split
--         inc_rename = false, -- enables an input dialog for inc-rename.nvim
--         lsp_doc_border = false, -- add a border to hover docs and signature help
--       },
--       routes = {
--         {
--           view = "notify",
--           filter = { event = "msg_showmode" },
--         },
--       },
--       cmdline = {
--         view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
--         format = {
--           cmdline = { pattern = "^:", icon = "O|>", 
--                     lang = "vim", title = "" },
--         }
--       },
--       views = {
--         cmdline_popup = {
--           size = {
--             height = "auto",
--             width = "90%",
--           },
--           position = {
--             row = "92%",
--             col = "50%",
--           },
--           border = {
--             style = "single"
--           },
--         },
--       },
--     })
--   end,
-- },
{
   "kylechui/nvim-surround",
    version = "*",
    config = function()
      require('nvim-surround').setup()
    end,
    event = "VeryLazy"
},
{
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-refactor' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'yioneko/nvim-yati' },
    { 'yioneko/vim-tmindent'},
  },
  event = 'VeryLazy',
  config = function()
    require('config.treesitter')
  end,
},
{
  "nvim-telescope/telescope.nvim", branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' ,
      'sharkdp/fd',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('config.telescope')
    end
},
{ 'akinsho/toggleterm.nvim', version = "*",     config = true },
{
  "goolord/alpha-nvim",
  config = function()
    require ("config.alpha")
  end
},

}


local opts = {}
require ('lazy').setup({plugins, opts})



>>>>>>> 71418ecfb8b1f19643bd18cbb754497c7171cfdb
