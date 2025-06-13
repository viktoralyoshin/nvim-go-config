vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        -- Сохраняем позицию курсора
        local cursor_pos = vim.api.nvim_win_get_cursor(0)

        -- Запускаем goimports (форматирование + импорты)
        vim.cmd([[silent! %!goimports]])

        -- Восстанавливаем позицию курсора
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end
})

vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", {
  fg = "#FF0000",  -- Красный (для теста)
  bg = "NONE",
  underline = true,
  sp = "#FF0000",  -- Должен переопределить цвет линии
  bold = true,
})
