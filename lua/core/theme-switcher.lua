local themes = { "cyberdream", "catppuccin", "tokyonight", "onedark", "kanagawa",
"vesper"}
local state_file = vim.fn.stdpath('data') .. '/theme_state'

local function load_theme()
    local ok, saved = pcall(function()
        return tonumber(vim.fn.readfile(state_file)[1])
    end)
    return ok and (saved <= #themes and saved or 1) or 1
end

local function save_theme(index)
    vim.fn.mkdir(vim.fn.stdpath('data'), 'p')
    vim.fn.writefile({ tostring(index) }, state_file)
end

local current_theme = load_theme()
local last_applied_theme = themes[current_theme]

local function apply_theme(name)
    if name ~= last_applied_theme then
        vim.cmd("hi clear")
        vim.cmd.colorscheme(name)
        last_applied_theme = name
        if package.loaded["lualine"] then
            require("lualine").setup({ options = { theme = "auto" } })
        end
    end
end

function SelectTheme()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    pickers.new({}, {
        prompt_title = "Select Theme (Preview)",
        finder = finders.new_table({
            results = themes,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry,
                    ordinal = entry,
                }
            end
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            local previewed = nil
            -- Автопревью при перемещении
            map("i", "<Down>", function()
                actions.move_selection_next(prompt_bufnr)
                local entry = action_state.get_selected_entry()
                if entry and entry.value ~= previewed then
                    apply_theme(entry.value)
                    previewed = entry.value
                end
            end)
            map("i", "<Up>", function()
                actions.move_selection_previous(prompt_bufnr)
                local entry = action_state.get_selected_entry()
                if entry and entry.value ~= previewed then
                    apply_theme(entry.value)
                    previewed = entry.value
                end
            end)

            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    for i, name in ipairs(themes) do
                        if name == selection.value then
                            current_theme = i
                            break
                        end
                    end
                    apply_theme(selection.value)
                    save_theme(current_theme)
                    print("Theme switched to " .. selection.value)
                end
            end)
            return true
        end,
    }):find()
end

function ToggleTheme()
    current_theme = (current_theme % #themes) + 1
    apply_theme(themes[current_theme])
    save_theme(current_theme)
    print("Theme switched to " .. themes[current_theme])
end

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.cmd("hi clear")
    vim.cmd.colorscheme(themes[current_theme])
    require("configs.bufferline")
  end
})

vim.keymap.set("n", "<leader>tt", ToggleTheme, { desc = "Toggle themes cycle" })
vim.keymap.set("n", "<leader>st", SelectTheme, { desc = "Select theme from list" })
