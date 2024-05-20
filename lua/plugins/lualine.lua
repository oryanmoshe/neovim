return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require('lualine').setup({
      options = {
        theme = 'auto'
        -- theme = 'catppuccin'
        -- theme = 'aurora'
      },
      tabline = {
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {{'filename', path = 1}},
        lualine_y = {require('auto-session.lib').current_session_name},
        lualine_z = {'tabs'}
      },

    })
  end
}
