require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    }

    use {
        'williamboman/mason-lspconfig.nvim',
        after = 'mason.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'gopls' },
            })
        end
    }

    use {
        'neovim/nvim-lspconfig',
        after = 'mason-lspconfig.nvim',
        config = function()
            require("configs.lsp")
        end
    }

    use({
        "akinsho/bufferline.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    })

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require("configs.cmp")
        end
    }

    use {
        'L3MON4D3/LuaSnip',
        tag = "v2.*",
        run = "make install_jsregexp",
    }

    use {
        'fatih/vim-go',
        run = ':GoUpdateBinaries'
    }

    use {
        'tommcdo/vim-lion',
        config = function()
            vim.g.lion_squeeze_spaces = 1
        end
    }

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("configs.treesitter")
        end
    }

    use { "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                indent = { char = "▏", highlight = "Whitespace" },
                scope = {
                    enabled = true,
                    show_start = false,
                    show_end = false,
                    highlight = { "Function", "Label" }
                },
                exclude = {
                    filetypes = { "dashboard", "NvimTree", "terminal", "packer" }
                }

            })
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require("configs.lualine")
        end
    }

    use 'folke/which-key.nvim'

    use {
        'nvimdev/dashboard-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('dashboard').setup({
                theme = 'doom',
                config = {
                    header = {
                        '',
                        '   ▄████  ▒█████   ',
                        '  ██▒ ▀█▒▒██▒  ██▒ ',
                        ' ▒██░▄▄▄░▒██░  ██▒ ',
                        ' ░▓█  ██▓▒██   ██░ ',
                        ' ░▒▓███▀▒░ ████▓▒░ ',
                        '  ░▒   ▒ ░ ▒░▒░▒░  ',
                        '   ░   ░   ░ ▒ ▒░  ',
                        ' ░ ░   ░ ░ ░ ░ ▒   ',
                        '       ░     ░ ░   ',
                        '   🦫 Go is fast. Go is fun.',
                        ''
                    },
                    center = {
                        { icon = '󰩈  ', desc = 'Quit Neovim', action = 'qa', key = 'q' },
                    },
                    footer = { '', '🚀 Hack the code. Run with Go.' },
                },
            })
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require("configs.comment")
        end
    }

    use {
        'akinsho/toggleterm.nvim',
        tag = '*',
        config = function()
            require('toggleterm').setup {
                size = 20,
                open_mapping = [[<C-\>]],
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                persist_size = true,
                persist_mode = true,
                direction = "horizontal",
                close_on_exit = true,
                shell = vim.o.shell,
            }
        end
    }

    use 'onsails/lspkind-nvim'

    use {
        'ray-x/lsp_signature.nvim',
        config = function()
            require('lsp_signature').setup({
                bind = true,
                handler_opts = {
                    border = "rounded"
                },
                hint_enable = true,
                floating_window = true,
                floating_window_above_cur_line = true,
                fix_pos = true,
                transparency = 30,
                toggle_key = '<C-k>',
            })
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("configs.gitsigns")
        end
    }
    use {
        'stevearc/dressing.nvim'
    }

    use {
        "RRethy/vim-illuminate",
        config = function()
            require("configs.illuminate")
        end
    }

    use {
        'petertriho/nvim-scrollbar',
        config = function()
            require("configs.scrollbar")
        end
    }

    use {
        "MunifTanjim/nui.nvim"
    }

    use {
        "rcarriga/nvim-notify",
        config = function()
            require("configs.notify")
        end,
    }

    use {
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        },
        config = function()
            require("configs.noice")
        end,
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup({
                '*',
            }, {
                mode = 'background',
                names = false,
            })
        end
    }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            require("configs.neotree")
        end
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'smjonas/inc-rename.nvim',
        config = function()
            require('inc_rename').setup()
        end
    }

    use {
        'simrat39/symbols-outline.nvim',
        config = function()
            require('symbols-outline').setup()
        end
    }

    use {
        'andythigpen/nvim-coverage',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("configs.coverage")
        end
    }

    use {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            require('catppuccin').setup({
                flavour = 'mocha',
                transparent_background = true,
                term_colors = true,
            })
        end
    }

    use { "scottmckendry/cyberdream.nvim",
        require("cyberdream").setup({
            transparent = true
        })
    }

    use { "folke/tokyonight.nvim" }

    use { 'navarasu/onedark.nvim' }

    use { "rebelot/kanagawa.nvim" }

    use { "datsfilipe/vesper.nvim" }
end)
