local persisted = require("persisted")

persisted.setup({
    save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
    autosave = true,
    autoload = true,
    follow_cwd = false,
})

-- Creates BufEnter session save autocommand after session loaded
-- This autocommand is called after persisted.nvim one
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    group = group,
    nested = true,
    callback = function()
          vim.api.nvim_create_autocmd({ "BufEnter" }, {
                  group = group,
                  nested = true,
                  callback = function()
                          persisted.save()
                          vim.cmd('sleep 10m')
                  end
          })
    end
  })