return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    -- branch = "go-away-python",
    -- dependencies = { "lua-curl" },
    config = true,
    -- opts = {
    --     rocks = { "magick" },
    -- }
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- "v7.0.0" Pin Neorg to the latest stable release
    --config = true,
    config = function()
      require("neorg").setup({
        load                 = {
          ["core.defaults"] = {
            --  config = {
            --     disable = {
            -- -- module list goes here
            -- "core.autocommands",
            -- "core.itero",
            -- },
          },
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
        ["core.presenter"]   = { config = { zen_mode = "zen-mode" } },
        ["core.itero"]       = {},
        ["core.ui.calendar"] = {},
        ["core.completion"]  = { config = { engine = "nvim-cmp" } },
        ["core.export"]      = { config = { export_dir = "<export-dir>/<language>-export" } },
        ["core.manoeuvre"]   = {
          config = {
            moveables = {
              headings = {
                "heading%d"
              },
              todo_items = {
                "todo_item%d"
              },
              unordered_list_elements = {
                "unordered_list%d"
              }
            }
          }
        },
        ["core.summary"]     = { config = { strategy = "default" } },
        ["core.fs"]          = {},
      })
    end,
  }
}
