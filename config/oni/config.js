const LEADER_KEY = "<space>"
const activate = (oni) => {
  oni.input.unbind("<c-g>")

  // Sidebar (file explorer)
  oni.input.unbind("<s-c-b>")
  oni.input.bind(`${LEADER_KEY}n`, "sidebar.toggle")

  const isNormalMode = () => oni.editors.activeEditor.mode === "normal";
  const isMenuOpen = () => menu.isMenuOpen();

  oni.input.bind(["<down>", "<c-j>"], "menu.next")
  oni.input.bind(["<up>", "<c-k>"], "menu.previous")

  oni.input.bind(`${LEADER_KEY}o`, "quickOpen.show", isNormalMode)

  // Pane navigation binding
  // oni.editors.activeEditor.onBufferLeave.subscribe(async () => {
  //   // Workaround for fzf, check if buffer is a type of 'terminal'
  //   const buftype = await oni.editors.activeEditor.neovim.eval('&buftype');

  // if (buftype !== 'terminal') {
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
  //   }
  // })
};

module.exports = {
  activate,
  // change configuration values here:
  "oni.hideMenu": "hidden",
  "oni.useDefaultConfig": true,
  "oni.loadInitVim": true,
  "oni.useDefaultConfig": false,

  "editor.fontSize": "13px",
  "editor.fontFamily": "Hack",
  "editor.completions.enabled": true,
  // "editor.quickOpen.execCommand": "fzf -f ${searchString}",

  "ui.colorscheme": "gruvbox",
  "editor.clipboard.enabled": false,

  "language.ruby.languageServer.command": "solargraph",
  "language.ruby.languageServer.arguments": ["stdio"],
  "language.vue.languageServer.command": "vls",

  "environment.additionalPaths": [
    "/Users/maxhung/.rbenv/shims",
    "/usr/bin",
    "/usr/local/bin",
    "/Users/maxhung/.fzf/bin",
  ],
}
