return {
    'rmagatti/auto-session',
    dependencies = { 'rmagatti/session-lens' },
    config = function()
        require("auto-session").setup {
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        }

        require('session-lens').setup({})
    end
}
