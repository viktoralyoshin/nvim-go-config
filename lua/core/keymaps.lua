local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>e", ":Neotree focus<CR>", opts)
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

keymap('n', '<leader>gt', ':GoAddTags json<CR>', { desc = 'Go add json tags', silent = true })
keymap('v', '<leader>gt', ':GoAddTags json<CR>', { desc = 'Go add json tags', silent = true })

keymap('n', '<leader>q', ':bdelete<CR>', {
    desc = 'Close current buffer',
    silent = true
})

keymap('n', '<leader>r', ':IncRename ', { desc = 'Rename' })

keymap('n', '<leader>o', function()
    local current = vim.api.nvim_get_current_buf()
    local skipped = 0

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and buf ~= current then
            local bufname = vim.fn.bufname(buf)
            if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal'
                or string.match(bufname, 'neo%-tree') then
                skipped = skipped + 1
            else
                vim.api.nvim_buf_delete(buf, {})
            end
        end
    end

    if skipped > 0 then
        vim.notify(string.format("Skipped %d buffers (terminal/NeoTree)", skipped), vim.log.levels.INFO)
    end
end, { desc = 'Close other buffers (except terminal/NeoTree)', silent = true })

keymap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })
