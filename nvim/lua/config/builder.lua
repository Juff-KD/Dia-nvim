return {
  "trimclain/builder.nvim",
  cmd = "Build",
  -- stylua: ignore
  keys = {
    { "<C-b>", function() require("builder").build() end, desc = "Build" }
  },
  opts = {
    commands = {
      -- add your commands
      c = "gcc % -o $basename.out && ./$basename.out",
      cpp = "g++ % -o $basename.out && ./$basename.out",
      go = {
        cmd = "go run %",
        alt = "go build % && ./$basename",
      },
      java = {
        cmd = "java %",
        alt = "javac % && java $basename",
      },
      javascript = "node %",
      -- lua = "lua %", -- this will override the default `:source %` for lua files
      markdown = "glow %",
      python = "python %",
      rust = "cargo run",
      sh = "sh %",
      typescript = "ts-node %",
      zsh = "zsh %",
    },
  },
  config = function()
    require("builder").setup(
      {
        -- location of Builder buffer; opts: "bot", "top", "vert" or float
        type = "bot",
        -- percentage of width/height for type = "vert"/"bot" between 0 and 1
        size = 0.25,
        -- size of the floating window for type = "float"
        float_size = {
          height = 0.8,
          width = 0.8,
        },
        -- which border to use for the floating window (see `:help nvim_open_win`)
        float_border = "none",
        -- number or table { above, right, below, left }, similar to CSS padding
        padding = 0,
        -- show/hide line numbers in the Builder buffer
        line_number = false,
        -- automatically save before building
        autosave = true,
        -- keymaps to close the Builder buffer, same format as for vim.keymap.set
        close_keymaps = { "q", "<Esc>" },
        -- measure the time it took to build
        measure_time = true,
        -- empty lines between the measured time message and the output data
        time_to_data_padding = 0,
        -- support colorful output by using to `:terminal` instead of a normal nvim buffer;
        -- for `color = true` the `type = "float"` isn't allowed
        color = false,
        -- commands for building each filetype, can be a string or a table { cmd = "cmd", alt = "cmd" }; see below
        -- for lua and vim filetypes `:source %` will be used by default
        commands = {},
      }


    )
  end
}
