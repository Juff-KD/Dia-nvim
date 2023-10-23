local map = vim.keymap.set

map('n', '<leader>vn', '<cmd>Navbuddy<cr>',{noremap=true})

map('n', '<leader>w', '<cmd>w!<cr>')
map('n', '<leader>q', '<cmd>qa!<cr>', silent)

map('v', '<A-j>', '<C-d>')
map('v', '<A-k>', '<C-u>')

map('n', '<A-l>', '<C-w>l')
map('n', '<A-h>', '<C-w>h')

map('n', '<A-k>', '<CMD>bnext<cr>')
map('n', '<A-j>', '<CMD>bprevious<cr>')

map('n', '<leader>n', '<CMD>NvimTreeToggle<CR>')
map('n', '<leader>nn', '<CMD>Neotree float<CR>')

map('n', 'tn', '<CMD>tabnew<cr>')
map('n', 'cc', '<CMD>close<cr>')
map('n', 'ss', ':split<Return><C-w>w')
map('n', 'sv', ':vsplit<Return><C-w>w')


-- Copy to system clipboard
map('v', '<C-c>', '"+y')
-- Paste from system clipboard with Ctrl + v
-- Paste from system clipboard with Ctrl + v
map('i', '<C-v>', '<Esc>"+p')
map('n', '<Leader>p', '"0p')
map('v', '<Leader>p', '"0p')
map('n', '<Leader>h', 'viw"0p', { nowait = false })

map('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords
-- map("n", "]t", function()
--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
-- end, { desc = "Next error/warning todo comment" })


map('n', '<leader>e', function()
  local ft = vim.bo.filetype
  if ft == 'alpha' then
    vim.cmd('bd')
  end
  vim.cmd('Neotreefloat')
end)

map('n', '<leader>o', function()
  local ft = vim.bo.filetype
  if ft == 'alpha' then
    vim.cmd('bd')
  end
  vim.cmd('NvimTreeFocus')
end)

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true})
map('n', '<leader>fl',builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})


map('n', 'H', '<cmd>BufferLineCyclePrev<cr>')
map('n', 'L', '<cmd>BufferLineCycleNext<cr>')
map('n', 'C', '<cmd>bd<cr>')


map('', 'f', '<cmd>HopChar1CurrentLine<cr>', { noremap = true, silent = true })
map('', 'F', '<cmd>HopChar2CurrentLine<cr>', { noremap = true, silent = true })
map('', '<leader>al', '<cmd>HopChar2<cr>', { noremap = true, silent = true })
map('', '<leader>aw', '<cmd>HopWord<cr>', { noremap = true, silent = true })
map('', '<leader>aa', '<cmd>HopChar1<cr>', { noremap = true, silent = true })

map('i', 'jk', '<Esc>')

function _G.set_toggleterm_keybind()
  local opts = { buffer = 0 }
  map('t', '<space>;', [[<C-\><C-n>]], opts)
  map('t', '<A-t>', '<cmd>ToggleTerm<cr>', opts)
end

vim.cmd('autocmd! TermOpen term://*toggleterm* lua set_toggleterm_keybind()')

map('n', '<A-t>', '<cmd>ToggleTerm direction=float<cr>', { noremap = true, silent = true })

map('s', '<Tab>', "<cmd>lua require'luasnip'.jump(1)<cr>")
map('s', '<S-Tab>', "<cmd>lua require'luasnip'.jump(-1)<cr>")


map('n', '<leader>tt', ':TodoTrouble keywords=TODO<CR>', {noremap = true, silent = true})
map('n', '<leader>tf', ':TodoTrouble keywords=FIX,FIXME<CR>', {noremap = true, silent = true})
map('n', '<leader>tn', ':TodoTrouble keywords=NOTE<CR>', {noremap = true, silent = true})
map("n", "<leader>tr", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
map("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>tll", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
map("n", "<leader>tq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
map("n", "<leader>tl", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})


map('n', '*', "*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
map('n', '#', "#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
map('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
map('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
map('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
map('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })


map( 'n', '<leader>u', '<Cmd>UfoEnable<CR>', {noremap = true, silent = true})
map( 'n', '<leader>uu', '<Cmd>UfoDisable<CR>', {noremap = true, silent = true})

map('n', '<leader>md', ':MarkdownPreview<cr>', {noremap=true, silent=true})
map('n', '<leader>mc', ':MarkdownPreviewStop<cr>', {noremap=true, silent=true})


