require("bufferline").setup({
    options = {
        mode = "buffers",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = true,
        indicator = { style = "none" },
        show_buffer_icons = false,
        offsets = {
            {
                filetype = "neo-tree",
                highlight = "Directory",
                text_align = "left",
                text = "Explorer"
            }
        },
        sort_by = "insert_after_current",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end
    },
    highlights = {
        background = {
            fg = "#808080",
        },
        buffer_selected = {
            fg = "#ffffff",
            bold = true,
            italic = true,
        },
        indicator_selected = {
            bg = "#569CD6",
            bold = true
        },
        diagnostic = {
            fg = "#d4d4d4",
        },
        diagnostic_selected = {
            fg = "#569CD6",
            bold = true
        }
    }
})
