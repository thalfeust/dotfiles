-- :help options

local options = {
    -- General options
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    swapfile = false,                        -- creates a swapfile
    timeoutlen = 400,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 250,                        -- interval for writing swap file to disk, also used by gitsigns
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    
    -- GUI options
    cmdheight = 2,                           -- more space in the neovim command line for displaying messages
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- @todo remove the mode
    showtabline = 2,                         -- always show tabs
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    
    -- Tools
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- No case sentitive search
    smartcase = true,                        -- smart case
    
    -- Editor options
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,                             -- insert 4 spaces for a tab
    smartindent = true,                      -- make indenting smarter again
    cursorline = true,                       -- highlight the current line
    number = true,                           -- set numbered lines
    relativenumber = false,                  -- @todo activate ?
    numberwidth = 4,                         -- minimal number of columns to use for the line number
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = true,                             -- display lines as one long line
    linebreak = true,                        -- don't split words
    scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
    whichwrap = "bs<>[]hl",                  -- go to previous/next line when cursor reaches end/beginning of line
}

for k, v in pairs(options) do
    vim.opt[k] = v
end