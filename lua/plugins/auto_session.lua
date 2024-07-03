return {
    'rmagatti/auto-session',
    dependencies = { 'rmagatti/session-lens' },
    config = function()
        require("auto-session").setup {
            bypass_session_save_file_types = { "minimap", "TelescopePrompt", "Telescope" },
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            pre_save_cmds = { "MinimapClose" },
            -- post_restore_cmds = { "MinimapOpen" },

        }

        require('session-lens').setup({})
    end
}
