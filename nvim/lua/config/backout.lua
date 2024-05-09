return {
  "AgusDOLARD/backout.nvim",
  opts = { chars = "(){}[]`'\"<>" },    -- default chars
  keys = {
    -- Define your keybinds
    { "<A-b>", "<cmd>lua require('backout').back()<cr>", mode = { "i" } },
    { "<A-f>", "<cmd>lua require('backout').out()<cr>",  mode = { "i" } },
  },
}