local notify = require("notify")
notify.setup({
    stages = "fade_in_slide_out",
    timeout = 3000,
    background_colour = "#000000",
})
vim.notify = notify
