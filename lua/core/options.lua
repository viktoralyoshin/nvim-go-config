vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.autoread = true

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)

        vim.cmd([[silent! %!goimports]])

        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end
})
