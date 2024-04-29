require("bufferline").setup({
  options = {
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon',
    },
    offsets = {
      { filetype = "NvimTree", text = "Navigation" },
      { filetype = "NeoTree", text = "Navigation" },
    },
  }
})
