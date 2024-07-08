require("catppuccin").setup({
    flavour = "frappe" -- latte, frappe, macchiato, mocha
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. "catppuccin")
if not status_ok then
    return
end