require "user.options"

local is_colemak_layout = (layout == 'colemak')
require(is_colemak_layout and 'user.keymaps_colemak' or 'user.keymaps_qwerty')

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins loading
require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "tpope/vim-obsession"}
})

-- plugins configuration
require "user.colorscheme"