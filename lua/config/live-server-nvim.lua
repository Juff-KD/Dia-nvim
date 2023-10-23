require('live-server-nvim').setup({
    custom = {
        "--port=8080",
        "--quiet",
        "--no-css-inject",
    },
 serverpath = vim.fn.stdpath("data") .. "/live-server/",
 open = "folder", --folder|cwd
})
