return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        end

        require("nvim-tree").setup({
            on_attach = my_on_attach,
            diagnostics = {
                enable = true,
            },
            update_focused_file = {
                enable = true,
            },
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 24,
                side = 'left',
            },
            filters = {
                dotfiles = true,
            },
            git = {
                ignore = false,
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            renderer = {
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = false,
                    },
                    glyphs = {
                        default = '',
                        git = {
                            unstaged = '✗',
                            staged = '✓',
                            unmerged = '',
                            renamed = '➜',
                            untracked = '?',
                            deleted = '',
                            ignored = '◌',
                        },
                    },
                },
                indent_markers = {
                    enable = true,
                },
            },
        })
    end,
}
