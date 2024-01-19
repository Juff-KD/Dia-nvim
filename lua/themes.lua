if vim.fn.has("termguicolors") then
  vim.opt.termguicolors = true
end

--local ok, neosolarized = pcall(require, 'NeoSolarized') ]]
-- if not ok then return end


require("monokai-nightasty").setup({
    dark_style_background = "transparent", -- default, dark, transparent, #color
    light_style_background = "default", -- default, dark, transparent, #color
    terminal_colors = true, -- Set the colors used when opening a `:terminal`
    color_headers = true, -- Enable header colors for each header level (h1, h2, etc.)
    hl_styles = {
        -- Style to be applied to different syntax groups. See `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles for sidebars (panels) and floating windows:
        floats = "transparent", -- default, dark, transparent
        sidebars = "transparent", -- default, dark, transparent
    },
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_style = "dark",
})

 require("citruszest").setup({
        option = {
            transparent = true, -- Enable/Disable transparency
            italic = true,
            bold = true,
        },
        -- Override default highlight style in this table
        -- E.g If you want to override `Constant` highlight style
        style = {
        -- This will change Constant foreground color and make it bold.
        Constant = { fg = "#FF1A75", bold = true}
        },
})







--vim.cmd[[colorscheme catppuccin-mocha]]
vim.cmd[[colorscheme citruszest]]
-- vim.cmd [[colorscheme monokai-nightasty]]

