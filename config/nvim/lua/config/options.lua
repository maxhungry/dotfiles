-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_set_hl(0, "NeotestPassed", { fg = "#66800B" })
vim.api.nvim_set_hl(0, "NeotestFailed", { fg = "#D14D41" })
vim.api.nvim_set_hl(0, "NeotestRunning", { fg = "#3AA99F" })
vim.api.nvim_set_hl(0, "NeotestSkipped", { fg = "#DA702C" })
vim.api.nvim_set_hl(0, "NeotestFile", { fg = "#4385BE" })
vim.api.nvim_set_hl(0, "NeotestDir", { fg = "#3AA99F" })
vim.api.nvim_set_hl(0, "NeotestNamespace", { fg = "#5E409D" })
vim.api.nvim_set_hl(0, "NeotestFocused", { bold = true, underline = true })
vim.api.nvim_set_hl(0, "NeotestIndent", { fg = "#CECDC3" })
vim.api.nvim_set_hl(0, "NeotestExpandMarker", { fg = "#9F9D96" })
vim.api.nvim_set_hl(0, "NeotestAdapterName", { fg = "#CE5D97" })
vim.api.nvim_set_hl(0, "NeotestWinSelect", { fg = "#3AA99F", bold = true })
vim.api.nvim_set_hl(0, "NeotestMarked", { fg = "#DA702C", bold = true })
vim.api.nvim_set_hl(0, "NeotestTarget", { fg = "#CE5D97" })
vim.api.nvim_set_hl(0, "NeotestTest", { fg = "#9F9D96" })
