local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Colemak Wide mod-DH navigation keys
keymap({"n", "v", "x"}, "m", "h", opts)
keymap({"n", "v", "x"}, "M", "H", opts)
keymap({"n", "v", "x"}, "h", "m", opts)
keymap({"n", "v", "x"}, "H", "M", opts)
keymap({"n", "v", "x"}, "n", "j", opts)
keymap({"n", "v", "x"}, "N", "J", opts)
keymap({"n", "v", "x"}, "j", "n", opts)
keymap({"n", "v", "x"}, "J", "N", opts)
keymap({"n", "v", "x"}, "e", "k", opts)
keymap({"n", "v", "x"}, "E", "K", opts)
keymap({"n", "v", "x"}, "k", "e", opts)
keymap({"n", "v", "x"}, "K", "E", opts)
keymap({"n", "v", "x"}, "i", "l", opts)
keymap({"n", "v", "x"}, "I", "L", opts)
keymap({"n", "v", "x"}, "l", "i", opts)
keymap({"n", "v", "x"}, "L", "I", opts)

-- Better window navigation
keymap("n", "<C-m>", "<C-w>h", opts)
keymap("n", "<C-n>", "<C-w>j", opts)
keymap("n", "<C-e>", "<C-w>k", opts)
keymap("n", "<C-i>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-i>", ":bnext<CR>", opts)
keymap("n", "<S-m>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-n>", ":m .+1<CR>==", opts)
keymap("n", "<A-e>", ":m .-2<CR>==", opts)

-- Insert --
-- Press qq fast to exit insert mode 
keymap("i", "qq", "<ESC>", opts)
-- This bigram has been chosen for its rarity: https://blogs.sas.com/content/iml/2014/09/26/bigrams.html

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-n>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-e>", ":m '<-2<CR>gv=gv", opts)

-- Pasting in visual mode do not change the yanked text
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<S-i>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<S-m>", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-n>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-e>", ":m '<-2<CR>gv=gv", opts)