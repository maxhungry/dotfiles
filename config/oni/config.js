const activate = (oni) => {
  // Sidebar (file explorer)
  // oni.input.unbind("<s-c-b>")
  // oni.input.bind("<leader>l", "sidebar.toggle")

  const isNormalMode = () => oni.editors.activeEditor.mode === "normal";
  const isMenuOpen = () => menu.isMenuOpen();

  // if (!isMenuOpen) {
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
  // }
};

module.exports = {
  activate,
  // change configuration values here:
  "oni.useDefaultConfig": true,
  "oni.loadInitVim": "~/.config/oni/oniinit.vim",
  "editor.fontSize": "13px",
  "editor.fontFamily": "Hack",
  "editor.completions.enabled": true,
  "ui.colorscheme": "gruvbox",
  "editor.clipboard.enabled": false,
  "oni.editor.quickOpen.execCommand": "fzf -f ${searchString}"
}
