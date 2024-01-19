-- vim.notify = require("notify")
-- vim.keymap.set("n", "<BS>", function()
-- 	for _, win in ipairs(vim.api.nvim_list_wins()) do
-- 		local buf = vim.api.nvim_win_get_buf(win)
-- 		if vim.fn.bufexists(buf) == 1 and vim.api.nvim_get_option_value("filetype", { buf = buf }) == "notify" then
-- 			vim.api.nvim_win_close(win, { force = false })
-- 		end
-- 	end
-- end, { noremap = true, silent = false })
--
--
 require("notify").setup({
    timeout = 3000,
    level = vim.log.levels.INFO,
    fps = 20,
    background_colour = "#000000",--"auto",
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  })
