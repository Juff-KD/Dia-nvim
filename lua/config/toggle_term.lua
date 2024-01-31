<<<<<<< HEAD
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  close_on_exit = true,
  direction = "float"
})

function _Lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<space>g', "<cmd>lua _lazygit_toggle()<cr>", { noremap = true, silent = true })
=======
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  close_on_exit = true,
  direction = "float"
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<space>g', "<cmd>lua _lazygit_toggle()<cr>", { noremap = true, silent = true })
>>>>>>> 71418ecfb8b1f19643bd18cbb754497c7171cfdb
