return{
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
}
