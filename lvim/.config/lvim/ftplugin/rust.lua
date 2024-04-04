local opts = {
  autostart = false
}

require("lvim.lsp.manager").setup("rust_analyzer", opts)
