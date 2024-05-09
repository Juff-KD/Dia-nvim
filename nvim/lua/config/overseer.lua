return {
  'stevearc/overseer.nvim',
  opts = {},
  config = function()
    require("overseer").setup({
      strategy = "terminal",
      templates = { "builtin", "user.cpp_build", "user.run_script" },
      auto_detect_success_color = true,
      -- Patch nvim-dap to support preLaunchTask and postDebugTask
      dap = true,

      actions = {
        ["My custom action"] = {
          desc = "This is an optional description. It may be omitted.",
          -- Optional function that will determine when this action is available
          condition = function(task)
            if task.name == "foobar" then
              return true
            else
              return false
            end
          end,
          run = function(task)
            -- Your custom logic here
          end,
        },

        -- Disable built-in actions by setting them to 'false'
        watch = false,
      },
      -- You can optionally add keymaps to run your action in the task list
      -- It will always be available in the "RunAction" menu, but it may be
      -- worth mapping it directly if you use it often.
      task_list = {
        bindings = {
          ['P'] = '<CMD>OverseerQuickAction My custom action<CR>',
        }
      },

      form = {
        border = "rounded",
        zindex = 40,
        -- Dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_X and max_X can be a single value or a list of mixed integer/float types.
        min_width = 80,
        max_width = 0.9,
        width = nil,
        min_height = 10,
        max_height = 0.9,
        height = nil,
        -- Set any window options here (e.g. winhighlight)
        win_opts = {
          winblend = 10,
        },
      },
      task_launcher = {
        -- Set keymap to false to remove default behavior
        -- You can add custom keymaps here as well (anything vim.keymap.set accepts)
        bindings = {
          i = {
            ["<C-s>"] = "Submit",
            ["<C-c>"] = "Cancel",
          },
          n = {
            ["<CR>"] = "Submit",
            ["<C-s>"] = "Submit",
            ["q"] = "Cancel",
            ["?"] = "ShowHelp",
          },
        },
      },
      task_editor = {
        -- Set keymap to false to remove default behavior
        -- You can add custom keymaps here as well (anything vim.keymap.set accepts)
        bindings = {
          i = {
            ["<CR>"] = "NextOrSubmit",
            ["<C-s>"] = "Submit",
            ["<Tab>"] = "Next",
            ["<S-Tab>"] = "Prev",
            ["<C-c>"] = "Cancel",
          },
          n = {
            ["<CR>"] = "NextOrSubmit",
            ["<C-s>"] = "Submit",
            ["<Tab>"] = "Next",
            ["<S-Tab>"] = "Prev",
            ["q"] = "Cancel",
            ["?"] = "ShowHelp",
          },
        },
      },
      -- Configure the floating window used for confirmation prompts
      confirm = {
        border = "rounded",
        zindex = 40,
        -- Dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_X and max_X can be a single value or a list of mixed integer/float types.
        min_width = 20,
        max_width = 0.5,
        width = nil,
        min_height = 6,
        max_height = 0.9,
        height = nil,
        -- Set any window options here (e.g. winhighlight)
        win_opts = {
          winblend = 10,
        },
      },
      -- Configuration for task floating windows
      task_win = {
        -- How much space to leave around the floating window
        padding = 2,
        border = "rounded",
        -- Set any window options here (e.g. winhighlight)
        win_opts = {
          winblend = 10,
        },
      },
      -- Configuration for mapping help floating windows
      help_win = {
        border = "rounded",
        win_opts = {},
      },
      -- Aliases for bundles of components. Redefine the builtins, or create your own.
      component_aliases = {
        -- Most tasks are initialized with the default components
        default = {
          { "display_duration", detail_level = 2 },
          "on_output_summarize",
          "on_exit_set_status",
          "on_complete_notify",
          "on_complete_dispose",
        },
        -- Tasks from tasks.json use these components
        default_vscode = {
          "default",
          "on_result_diagnostics",
          "on_result_diagnostics_quickfix",
        },
      },
      bundles = {
        -- When saving a bundle with OverseerSaveBundle or save_task_bundle(), filter the tasks with
        -- these options (passed to list_tasks())
        save_task_opts = {
          bundleable = true,
        },
        -- Autostart tasks when they are loaded from a bundle
        autostart_on_load = true,
      },
      -- A list of components to preload on setup.
      -- Only matters if you want them to show up in the task editor.
      preload_components = {},
      -- Controls when the parameter prompt is shown when running a template
      --   always    Show when template has any params
      --   missing   Show when template has any params not explicitly passed in
      --   allow     Only show when a required param is missing
      --   avoid     Only show when a required param with no default value is missing
      --   never     Never show prompt (error if required param missing)
      default_template_prompt = "allow",
      -- For template providers, how long to wait (in ms) before timing out.
      -- Set to 0 to disable timeouts.
      template_timeout = 3000,
      -- Cache template provider results if the provider takes longer than this to run.
      -- Time is in ms. Set to 0 to disable caching.
      template_cache_threshold = 100,
      -- Configure where the logs go and what level to use
      -- Types are "echo", "notify", and "file"
      log = {
        {
          type = "echo",
          level = vim.log.levels.WARN,
        },
        {
          type = "file",
          filename = "overseer.log",
          level = vim.log.levels.WARN,
        },
      },
    })
  end,
}
