require("noice").setup({
    lsp = {
        progress = { enabled = true },
        hover = { enabled = true },
        signature = { enabled = true },
    },
    messages = {
        enabled = true,
    },
    notify = {
        enabled = true,
    },
    cmdline = {
        enabled = true,
        view = "cmdline_popup",
    },
    popupmenu = {
        enabled = true,
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
    },
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    callback = function(args)
        local filepath = vim.fn.fnamemodify(args.file, ":~:.")
        vim.notify("💾 Saved: " .. filepath, vim.log.levels.INFO, { title = "Save" })
    end,
})
