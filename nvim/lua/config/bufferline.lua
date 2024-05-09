return{
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        local bufferline = require('bufferline')
       require('bufferline').setup{
           options = {
               mode = 'buffers',
               style_preset = bufferline.style_preset.no_italic,
               themable = true,
               numbers = 'none',
               close_command = 'bdelete! %d',
               buffer_close_icon = '󰅖',
               modified_icon = '●',
               left_trunc_marker = '',
               right_trunc_marker = '',
               max_name_length = 15,
               --max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
               truncate_names = true,
               tab_size = 14,
               diagnostics = 'nvim_lsp',
               diagnostics_update_in_insert = false,
               offsets = {
                   {
                       filetype = 'NvimTree',
                       text = 'File Explorer',
                       highlight = 'Directory',
                       text_align = 'left',
                       separator = true,
                   },
                   { filetype = "neo-tree", text = "", padding = 0 },
                   { filetype = "Outline",  text = "", padding = 0 },
                   { filetype = "Oil", text= "", padding = 0},
               },
               color_icons = true,
                get_element_icon = function(element)
                    local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
              return icon, hl
                end,
               show_buffer_icons = true,
               show_buffer_close_icons = true,
               show_tab_indicators = true,
               persist_buffer_sort = true,
               separator_style = { "|", "|" },
               enforce_regular_tabs = false,
               always_show_bufferline = true,
               hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
               sort_by = 'id',
           }
       }

    end
}
