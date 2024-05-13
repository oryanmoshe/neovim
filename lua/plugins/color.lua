return {
  -- 'folke/tokyonight.nvim',
  -- 'catppuccin/nvim',
  -- 'glepnir/zephyr-nvim',
  'ellisonleao/gruvbox.nvim',
  -- 'alexwu/nvim-snazzy',
  -- 'ray-x/aurora',
  -- name = "catppuccin",
  priority = 1000,
  config = function ()
    -- vim.g.aurora_transparent = 1
    -- vim.g.aurora_bold = 1
    -- vim.g.aurora_italic = 1
    -- vim.g.aurora_darker = 1

    -- vim.cmd.colorscheme('aurora')
    -- vim.cmd.colorscheme('catppuccin-mocha')
    vim.o.background = 'dark'
    vim.cmd.colorscheme('gruvbox')

    -- require('catppuccin').setup({
    --   integrations = {
    --     cmp = true,
    --     treesitter = true,
    --     treesitter_context = true,
    --   }
    -- })
    -- vim.cmd.colorscheme('tokyonight-night')
  end
}
