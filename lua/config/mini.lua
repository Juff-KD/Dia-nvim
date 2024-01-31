return{
  { 'echasnovski/mini.nvim', version = '*' ,
      config = function ()
        require('mini.pairs').setup()
        require('mini.indentscope').setup()
        require('mini.comment').setup()
      end,
  },
  { 'echasnovski/mini.notify', version = false,
     config = function()
    local win_config = function()
      local has_statusline = vim.o.laststatus > 0
      local bottom_space = vim.o.cmdheight + (has_statusline and 1 or 0)
      return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - bottom_space }
    end

    require("mini.notify").setup({ window = { config = win_config } })
  end,
  },
  {
		"echasnovski/mini.operators", lazy = false,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			replace = {
				prefix = "gR",
			},
			sort = {
				prefix = "gS",
			},
		},
	},
}
