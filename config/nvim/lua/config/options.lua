-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_set_hl(0, "NeotestPassed", { fg = "#859900" })
vim.api.nvim_set_hl(0, "NeotestFailed", { fg = "#F70067" })
vim.api.nvim_set_hl(0, "NeotestRunning", { fg = "#268bd2" })
vim.api.nvim_set_hl(0, "NeotestSkipped", { fg = "#2aa198" })
vim.api.nvim_set_hl(0, "NeotestFile", { fg = "#859900" })
vim.api.nvim_set_hl(0, "NeotestDir", { fg = "#268bd2" })
vim.api.nvim_set_hl(0, "NeotestNamespace", { fg = "#d33682" })
vim.api.nvim_set_hl(0, "NeotestFocused", { bold = true, underline = true })
vim.api.nvim_set_hl(0, "NeotestIndent", { fg = "#8B8B8B" })
vim.api.nvim_set_hl(0, "NeotestExpandMarker", { fg = "#8094b4" })
vim.api.nvim_set_hl(0, "NeotestAdapterName", { fg = "#F70067" })
vim.api.nvim_set_hl(0, "NeotestWinSelect", { fg = "#00f1f5", bold = true })
vim.api.nvim_set_hl(0, "NeotestMarked", { fg = "#F79000", bold = true })
vim.api.nvim_set_hl(0, "NeotestTarget", { fg = "#F70067" })
vim.api.nvim_set_hl(0, "NeotestTest", { fg = "#657b83" })
