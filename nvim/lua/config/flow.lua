return {
  'arjunmahishi/flow.nvim',
  config = function()
    require('flow').setup {
      output = {
        buffer = true,
        size = 80, -- possible values: "auto" (default) OR 1-100 (percentage of screen to cover)
        focused = true,
        modifiable = false,

        -- window_override = {
        --   border = 'double',
        --   title = 'Output',
        --   title_pos = 'center',
        --   style = 'minimal',
        --   ...
        -- }
      },

      -- add/override the default command used for a perticular filetype
      -- the "%s" you see in the below example is interpolated by the contents of
      -- the file you are trying to run
      -- Format { <filetype> = <command> }
      filetype_cmd_map = {
        python = "python3 <<-EOF\n%s\nEOF",
      },

      -- optional DB configuration for running .sql files/snippets (experimental)
      --sql_configs = require('flow.util').read_sql_config('/Users/arjunmahishi/.db_config.json'),

      -- configure a directory for storing all the custom commands
      custom_cmd_dir = "/Users/PK/.flow_cmds"
    }

    -- optional custom variables
    require('flow.vars').add_vars({
      str = "test-val-2",
      num = 3,
      bool = true,
      var_with_func = function()
        -- the value of this var is computed by running this function at runtime
        return "test-val"
      end
    })
  end,

  -- paste this in your init.lua

  vim.api.nvim_set_keymap('v', '<leader>fs', ':FlowRunSelected<CR>', {}),
  vim.api.nvim_set_keymap('n', '<leader>fw', ':FlowRunFile<CR>', {}),
  vim.api.nvim_set_keymap('n', '<leader>lf', ':FlowLauncher<CR>', {}),
  vim.api.nvim_set_keymap('n', '<leader>lfl', ':FlowRunLastCmd<CR>', {}),
  vim.api.nvim_set_keymap('n', '<leader>lo', ':FlowLastOutput<CR>', {}),
}
