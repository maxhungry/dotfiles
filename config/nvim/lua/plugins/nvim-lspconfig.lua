return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          mason = false,
          cmd = { "mise", "x", "--", "ruby-lsp" },
        },
      },
    },
  },
}
