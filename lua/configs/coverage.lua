require('coverage').setup({
    auto_reload = true,
    lang = {
        go = {
            coverage_file = 'coverage.out',
        },
    },
})
