Dotfiles
========

Managed by [rcm](https://github.com/thoughtbot/rcm). Shared files live at the
repo root (and under `config/` for `~/.config/`). OS and identity are tags.

| Tag | When to enable |
| --- | --- |
| `linux` | Linux (Hyprland under `tag-linux/config/hypr`) |
| `macos` | macOS (`xvimrc`, Oni, …) |
| `hgws` | Personal git identity |
| `work` | Work git identity, Brewfile, laptop.local |

Each machine needs its own `~/.rcrc` so rcm knows which tags to apply. This
Linux box is stored as `host-hgws/rcrc` (hostname `hgws`, so rcm picks it up
automatically):

```
TAGS="linux hgws"
EXCLUDES="README.md"
HOSTNAME="hgws"
```

On a Mac, create `~/.rcrc` then optionally freeze it as a host file:

```
TAGS="macos hgws"    # or: TAGS="macos work"
EXCLUDES="README.md"
```

```
rcup -v
mkrc -o ~/.rcrc      # writes host-$HOSTNAME/rcrc
```

`uname` branches in `zshrc`, `sh.d/envs`, and `tmux.conf` stay in the shared
files for small PATH / clipboard differences.

```
lsrc
rcup -v
```
