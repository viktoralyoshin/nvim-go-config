require('Comment').setup({
    toggler = {
        line = 'gcc',
        block = 'gbc',
    },
    opleader = {
        line = 'gc',
        block = 'gb',
    },
    mappings = {
        basic = true,
        extra = false,
    },
})

vim.api.nvim_set_keymap('n', '<C-_>', "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-_>',
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { noremap = true, silent = true })
