return{
  "utilyre/barbecue.nvim",
    lazy = false, enabled = true,
    version = "*",
    name = "barbecue",
    dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
    "neovim/nvim-lspconfig",
  },
  --@type barbecue.Config
  opts = {
    theme = "auto",

  },
}

