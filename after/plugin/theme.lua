require("monokai-pro").setup({
  transparent_background = true,
  terminal_colors = true,
  devicons = true, -- highlight the icons of `nvim-web-devicons`
  filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
  -- Enable this will disable filter option
  day_night = {
    enable = false, -- turn off by default
    day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  },
  inc_search = "background", -- underline | background
  background_clear = {
    -- "float_win",
    "toggleterm",
    "telescope",
    -- "which-key",
    "renamer",
    "notify",
    "nvim-tree",
    -- "neo-tree",
    "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
  },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
    },
    indent_blankline = {
      context_highlight = "default", -- default | pro
      context_start_underline = false,
    },
  },
  ---@param c Colorscheme
  override = function(c) end,
})

vim.cmd([[colorscheme monokai-pro]])
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
