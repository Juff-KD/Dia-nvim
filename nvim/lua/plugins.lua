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

local plugins = {
  { "zootedb0t/citruszest.nvim",       lazy = false, priority = 1000, },
  { 'Mofiqul/vscode.nvim',             lazy = false, priority = 1000 },
  { "scottmckendry/cyberdream.nvim",   lazy = false, priority = 1000, },
  { 'olivercederborg/poimandres.nvim', lazy = false, priority = 1000 },
  { 'ribru17/bamboo.nvim',             lazy = false, priority = 1000 },
  {
    'norcalli/nvim-colorizer.lua',
    lazy = false,
    config = function()
      require "colorizer".setup({ '*', })
    end,
    enabled = true
  },
  {
    'uga-rosa/ccc.nvim',
    event = 'FileType',
    keys = {
      { '<Leader>cp', '<cmd>CccPick<CR>', desc = 'Color-picker' },
    },
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
        excludes = { 'lazy', 'mason', 'help', 'neo-tree' },
      },
    },
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },
  {
    "gbprod/cutlass.nvim",
    event = "BufReadPost",
    opts = {
      cut_key = "x",
      override_del = true,
      exclude = {},
      registers = {
        select = "_",
        delete = "_",
        change = "_",
      },
    },
  },
  {
    'ckolkey/ts-node-action',
    dependencies = { 'nvim-treesitter' },
    opts = {},
    config = function()
      vim.keymap.set(
        { "n" },
        "KK",
        require("ts-node-action").node_action,
        { desc = "Trigger Node Action" }
      )
    end,
  },
  {
    'kosayoda/nvim-lightbulb',
    lazy = false,
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true } })
    end
  },
  {
    "https://git.sr.ht/~swaits/thethethe.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
  },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  { "folke/neodev.nvim",  opts = {} },
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
    "karb94/neoscroll.nvim",
    event = "BufRead",
    lazy = false,
    enabled = true,
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require("config.alpha")
    end
  },
  {
    require('config.lspzero'),
    require('config.mini'),
    require('config.barbecue'),
    require('config.telescope'),
    require('config.bufferline'),
    -- require('config.idbl'),
    require('config.flash'),
    require('config.smartsplits'),
    require('config.treesitter'),
    require('config.ufo'),
    require('config.textcase'),
    require('config.aerial'),
    require('config.lualine'),
    -- require('config.neotree'),
    require('config.oil'),
    require('config.nvimTree'),
    require('config.zenMode'),
    require('config.overseer'),
    require('config.neorg'),
    require('config.neogit'),
    require('config.trouble'),
    require('config.codeium'),
    require('config.hls'),
    require('config.diffview'),
    require('config.format'),
    require('config.scrollbar'),
    require('config.twilight'),
    require('config.treesj'),
    require('config.numb'),
    require('config.highStr'),
    require('config.rainbow_dilimiters'),
    require('config.ssr'),
    require('config.TreePin'),
    require('config.marks'),
    require('config.persisted'),
    require('config.cdprj'),
    require('config.recall'),
    require('config.EZtables'),
    require('config.flow'),
    require('config.noice'),
    require('config.duck'),
    require('config.venn'),
    require('config.move'),
    require('config.keys'),
    require('config.icon-picker'),
    require('config.gt-preview'),
    require('config.inc-rename'),
    require('config.code-refactor'),
    require('config.search'),
    require('config.webTools'),
    require('config.backout'),
    require('config.scissor'),
    require('config.gomove'),
    require('config.windows'),
    require('config.octo'),
    require('config.builder'),
    require('config.foldsign'),
    require('config.whichKey'),
    require('config.track'),
    require('config.Tele-import'),
    require('config.tailwind-tools'),
    require('config.tailwind-fold'),
    require('config.MdRender'),
    require('config.MdPreview'),
    require('config.harpoon'),
    require('config.template-Str'),
    require('config.typecheck'),
    require('config.ts-outer'),
  }


}

local opts = {}
require("lazy").setup(plugins, opts)
