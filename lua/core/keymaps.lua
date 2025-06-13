local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>e", ":NvimTreeOpen<CR>", opts)
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', opts)
vim.api.nvim_set_keymap('v', '<C-_>', 'gc', opts)


keymap('n', '<leader>q', ':bdelete<CR>', {
    desc = 'Close current buffer',
    silent = true
})

vim.keymap.set('n', '<leader>o', function()
    local current = vim.api.nvim_get_current_buf()

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf)
            and buf ~= current
            and vim.api.nvim_buf_get_option(buf, 'buftype') ~= 'terminal'
            and vim.fn.bufname(buf) ~= 'NvimTree_1' then
            vim.api.nvim_buf_delete(buf, {})
        end
    end
end, { desc = 'Close other buffers', silent = true })

keymap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })
