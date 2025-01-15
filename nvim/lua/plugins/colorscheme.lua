function SetColorscheme(color)
  color = color or "onedark"
  vim.cmd.colorscheme(color)
end

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      disable_background = true,
      styles = {
        italic = false,
        transparency = true,
      },
    },
  },
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'dark',
      transparent = true,
      term_colors = true,
      lualine = { transparent = true },
      telescope = { transparent = true },
    },
    config = function(_, opts)
      require('onedark').setup(opts)
      SetColorscheme('onedark')
    end,
  },
}
