return {
  "AgusDOLARD/backout.nvim",
  opts = { chars = "(){}[]`'\"<>" }, -- default chars
  keys = {
    -- Define your keybinds
    { "<leader>b", "<cmd>lua require('backout').back()<cr>", mode = { "i" } },
    { "<leader>f", "<cmd>lua require('backout').out()<cr>",  mode = { "i" } },
  },
}
