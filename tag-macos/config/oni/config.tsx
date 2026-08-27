
import * as React from "react"
import * as Oni from "oni-api"

const LEADER_KEY = "<space>"
export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")

    // Input
    //
    // Add input bindings here:
    //
    oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

    //
    // Or remove the default bindings here by uncommenting the below line:
    //
    // oni.input.unbind("<c-p>")

    oni.input.unbind("<c-g>")

    // Sidebar (file explorer)
    oni.input.unbind("<s-c-b>")
    oni.input.bind(`${LEADER_KEY}n`, "sidebar.toggle")

    oni.input.bind(["<down>", "<c-j>"], "menu.next")
    oni.input.bind(["<up>", "<c-k>"], "menu.previous")
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    // "debug.neovimPath": "/usr/local/bin/nvim",
    "debug.neovimPath": "/usr/local/Cellar/neovim/0.3.1/bin/nvim",
    "oni.hideMenu": "hidden",
    "oni.loadInitVim": true,
    "oni.useDefaultConfig": false,

    "editor.fontSize": "15px",
    // "editor.fontFamily": "FiraCode-Regular",
    "editor.completions.enabled": true,

    "ui.colorscheme"  : "gruvbox",

    "language.ruby.languageServer.command": "solargraph",
    "language.ruby.languageServer.arguments": ["stdio"],
    "language.vue.languageServer.command": "vls",

    "environment.additionalPaths": [
        "/Users/maxhung/.rbenv/shims",
        "/usr/bin",
        "/usr/local/bin",
        "/Users/maxhung/.fzf/bin",
    ],

    "sidebar.enabled": false,
    "sidebar.default.open"     : false, // the side bar collapse 

    "autoClosingPairs.enabled" : false, // disable autoclosing pairs
    "commandline.mode"         : false, // Do not override commandline UI
    // "wildmenu.mode"            : false, // Do not override wildmenu UI,
    // "tabs.mode"                : "native", // Use vim's tabline, need completely quit Oni and restart a few times
    "statusbar.enabled"        : false, // use vim's default statusline
    "learning.enabled"         : false, // Turn off learning pane
    "achievements.enabled"     : false, // Turn off achievements tracking / UX
    "editor.typingPrediction"  : false, // Wait for vim's confirmed typed characters, avoid edge cases
    "editor.textMateHighlighting.enabled" : false, // Use vim syntax highlighting

    //"oni.useDefaultConfig": true,
    //"oni.bookmarks": ["~/Documents"],
    //"oni.loadInitVim": false,
    //"editor.fontSize": "12px",
    //"editor.fontFamily": "Monaco",

    // UI customizations
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "subpixel-antialiased",
    "editor.renderer": "webgl",
}
