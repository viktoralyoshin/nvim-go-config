require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,

    default_component_configs = {
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "󰈚",
        },
        modified = { symbol = " " },
        git_status = {
            symbols = {
                added = "",
                modified = "",
                deleted = "",
                renamed = "➜",
                untracked = "",
                ignored = "",
                unstaged = "󰧟",
                staged = "",
                conflict = ""
            }
        }
    },

    window = {
        width = 30,
        mappings = {
            ["<CR>"] = "open",
            ["l"] = "open",
            ["h"] = "close_node",
            ["a"] = "add",
            ["d"] = "delete",
            ["r"] = "rename",
            ["R"] = "refresh"
        }
    },

    filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
        },
        follow_current_file = {
            enabled = true
        },
    },
})
