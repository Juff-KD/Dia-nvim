<<<<<<< HEAD
local api = vim.api

local exclude_ft = { "help", "git", "markdown", "snippets", "text", "gitconfig", "alpha", "dashboard" }

require("ibl").setup {
  indent = {
    -- -- U+2502 may also be a good choice, it will be on the middle of cursor.
    -- -- U+250A is also a good choice
    char = "▏",
  },
  scope = {
    show_start = false,
    show_end = false,
  --   highlight = {
  --         'RainbowDelimiterRed',
  --         'RainbowDelimiterYellow',
  --         'RainbowDelimiterBlue',
  --         'RainbowDelimiterOrange',
  --         'RainbowDelimiterGreen',
  --         'RainbowDelimiterViolet',
  --         'RainbowDelimiterCyan',
  --       },
  --
  },
  exclude = {
    filetypes = exclude_ft,
    buftypes = { "terminal" },
  },
    -- config = function(_, opts)
    --   require('ibl').setup(opts)
    --   local hooks = require('ibl.hooks')
    --   hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    --   hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    -- end,

}

local gid = api.nvim_create_augroup("indent_blankline", { clear = true })
api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = gid,
  command = "IBLDisable",
})

api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  group = gid,
  callback = function()
    if not vim.tbl_contains(exclude_ft, vim.bo.filetype) then
      vim.cmd([[IBLEnable]])
    end
  end,
})
=======
local api = vim.api

local exclude_ft = { "help", "git", "markdown", "snippets", "text", "gitconfig", "alpha", "dashboard" }

require("ibl").setup {
  indent = {
    -- -- U+2502 may also be a good choice, it will be on the middle of cursor.
    -- -- U+250A is also a good choice
    char = "▏",
  },
  scope = {
    show_start = false,
    show_end = false,
  --   highlight = {
  --         'RainbowDelimiterRed',
  --         'RainbowDelimiterYellow',
  --         'RainbowDelimiterBlue',
  --         'RainbowDelimiterOrange',
  --         'RainbowDelimiterGreen',
  --         'RainbowDelimiterViolet',
  --         'RainbowDelimiterCyan',
  --       },
  --
  },
  exclude = {
    filetypes = exclude_ft,
    buftypes = { "terminal" },
  },
    -- config = function(_, opts)
    --   require('ibl').setup(opts)
    --   local hooks = require('ibl.hooks')
    --   hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    --   hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    -- end,
 
}

local gid = api.nvim_create_augroup("indent_blankline", { clear = true })
api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = gid,
  command = "IBLDisable",
})

api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  group = gid,
  callback = function()
    if not vim.tbl_contains(exclude_ft, vim.bo.filetype) then
      vim.cmd([[IBLEnable]])
    end
  end,
})
>>>>>>> 71418ecfb8b1f19643bd18cbb754497c7171cfdb
