return {
    'wfxr/minimap.vim',
    lazy = false,
    cmd = {'Minimap', 'MinimapToggle'},
    init = function()
        vim.g.minimap_auto_start = 0
        vim.g.minimap_auto_start_win_enter = 0
        vim.g.minimap_width = 20
        vim.g.minimap_git_colors = 1
        vim.g.minimap_highlight_search = 1
        vim.g.minimap_background_processing = 1
    end,
}
