require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "go",
        "lua",
        "bash",
        "json",
        "yaml",
        "markdown",
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
})
