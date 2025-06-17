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
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)

        vim.cmd([[silent! %!goimports]])

        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then return end
    local position_encoding = clients[1].offset_encoding or 'utf-16'
    local params = vim.lsp.util.make_position_params(nil, position_encoding)
    vim.lsp.buf_request(0, "textDocument/hover", params, function(err, result, ctx, config)
      if err or not result or not result.contents then return end
      vim.lsp.buf.hover()
    end)
  end
})