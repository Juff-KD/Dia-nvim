local ok, lsp = pcall(require, 'lsp-zero')
if not ok then return end

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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

  -- local lua_opts = lsp_zero.nvim_lua_ls()
  -- require('lspconfig').lua_ls.setup(lua_opts)
  --
  -- require('mason-lspconfig').setup({
  --   handlers = {
  --     lsp_zero.default_setup,
  --     lua_ls = function()
  --       local lua_opts = lsp_zero.nvim_lua_ls()
  --         require('lspconfig').lua_ls.setup(lua_opts)
  --     end,
  --   },
  -- })

--   lsp.set_sign_icons({
--   error = '✘',
--   warn = '▲',
--   hint = '⚑',
--   info = '»'
-- })



local cmp = require('cmp')
--
local luasnip = require("luasnip")
-- local cmp_action = require('lsp-zero').cmp_action()
--
--   cmp.setup({
--     sources = {
--      {name = 'nvim_lsp'},
--      { name = 'path' },
--      { name = 'buffer' },
--      { name = 'luasnip' },
--      { name = 'nvim_lsp_signature_help' },
--     },
--     window = {
--       completion = cmp.config.window.bordered(),
--       documentation = cmp.config.window.b--[[ ordered(), ]]
--     },
--     mapping = cmp.mapping.preset.insert({
--       ['<C-Space>'] = cmp.mapping.complete(),
--       ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--       ['<C-b>'] = cmp_action.luasnip_jump_backward(),
 --      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
 --      ['<C-d>'] = cmp.mapping.scroll_docs(4),
 --    }),
 --     formatting = {
 --    format = require("lspkind").cmp_format({
 --      mode = "symbol_text",
 --      maxwidth = 50,
 --      ellipsis_char = "..."
 --    })
 --  }, 
 -- 
 --  })
 --
 --

  local cmp_mappings = lsp.defaults.cmp_mappings({
   ['<C-Space>'] = cmp.mapping.complete(),
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
     elseif luasnip.jumpable(-1) then
       luasnip.jump(-1)
     else
       fallback()
     end
   end, { "i", "s" }),
   ['<CR>'] = cmp.mapping.confirm({
     behavior = cmp.ConfirmBehavior.Replace,
     select = true
   })
 })

 
  --  sources = {
  --    { name = 'nvim_lsp' },
  --    { name = 'path' },
  --    { name = 'buffer' },
  --    { name = 'luasnip' },
  --    { name = 'nvim_lsp_signature_help' },
  -- },
  --  mapping = cmp_mappings,
  --  formatting = {
  --    format = require("lspkind").cmp_format({
  --      mode = "symbol_text",
 --       maxwidth = 50,
 --       ellipsis_char = "..."
 --     })
 --   },
 -- })
 --
 
 cmp.setup({
   window = {
     completion = cmp.config.window.bordered(),
     documentation = cmp.config.window.bordered(),
   },
    sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua'},
    { name = 'path' },
    { name = 'buffer' },
    { name = 'calc'},
    { name = 'luasnip' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'friendly_snippets'},
  },
   mapping = cmp_mappings,
    formatting = {
    format = require("lspkind").cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "..." ,
        before = function (entry, vim_item)
            return vim_item
      end,
    })
  }, 
 })
 -- 


require("luasnip.loaders.from_vscode").lazy_load()
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  },
})

-- lsp.setup_servers({
--     'gopls', 'html-lsp',
--     'intelephense','golangci-lint-langserver',
--     'json-lsp', 'jsonls',
--     'jsonld-lsp',
--     'marksman',
--     'pyre',
--     'pyright',
--     'python-lsp-server', 'pylsp',
--     'quick-lint-js', 'quick_lint_js',
--     'typescript-language-server',
-- })

lsp.setup()

vim.diagnostic.config({
  virtual_text = {
    prefix = '[',
    suffix = ']',
  },
  signs = false,
})
