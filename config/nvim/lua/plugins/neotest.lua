return {
  {
    "nvim-neotest/neotest",
    commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c",
    optional = true,
    dependencies = {
      "olimorris/neotest-rspec",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      -- "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          rspec_cmd = function()
            return vim.tbl_flatten({
              "docker",
              "compose",
              "exec",
              "-i",
              "-w",
              "/app",
              "-e",
              "RAILS_ENV=test",
              "web",
              "bin/rspec",
            })
          end,

          transform_spec_path = function(path)
            local prefix = require("neotest-rspec").root(path)
            return string.sub(path, string.len(prefix) + 2, -1)
          end,

          results_path = "tmp/rspec.output",
          formatter = "json",
        },
      },
    },
  },
}
