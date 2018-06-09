const activate = (oni) => {
  oni.input.bind("<c-h>", () =>
    oni.editors.activeEditor.neovim.command(`call OniNextWindow('h')<CR>`)
  )
  oni.input.bind("<c-j>", () =>
    oni.editors.activeEditor.neovim.command(`call OniNextWindow('j')<CR>`)
  )
  oni.input.bind("<c-k>", () =>
    oni.editors.activeEditor.neovim.command(`call OniNextWindow('k')<CR>`)
  )
  oni.input.bind("<c-l>", () =>
    oni.editors.activeEditor.neovim.command(`call OniNextWindow('l')<CR>`)
  )
};

module.exports = {
  activate,
  // change configuration values here:
  "oni.useDefaultConfig": true,
  "oni.loadInitVim": true,
  "editor.fontSize": "13px",
  "editor.fontFamily": "Hack",
  "editor.completions.enabled": true,
  "ui.colorscheme": "gruvbox",
}
