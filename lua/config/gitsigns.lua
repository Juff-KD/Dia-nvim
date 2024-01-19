  require('gitsigns').setup({
            signcolumn = false,
                status_formatter = function(status)
                    local added, changed, removed = status.added, status.changed, status.removed
                    local status_txt = {}
                    if added and added > 0 then
                        table.insert(status_txt, "+" .. added)
                    end
                    if changed and changed > 0 then
                        table.insert(status_txt, "~" .. changed)
                    end
                    if removed and removed > 0 then
                        table.insert(status_txt, "-" .. removed)
                    end

                    -- format the table with commas if there are multiple changes
                    if #status_txt > 1 then
                        for i = 2, #status_txt do
                            status_txt[i] = "," .. status_txt[i]
                        end
                    end

                    -- check if there are any changes
                    if #status_txt > 2 then
                        return string.format("[%s]", table.concat(status_txt))
                    else
                        return ""
                    end
                end,

    on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
       if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<leader>hs', gs.stage_hunk)
    map('n', '<leader>hr', gs.reset_hunk)
    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end

})
