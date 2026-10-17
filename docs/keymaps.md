# Neovim Keybindings Reference

## Conventions

- `<leader>` is the configured leader key (space in the default config).
- `n` = Normal mode, `i` = Insert mode, `v` = Visual mode, `t` = Terminal mode.
- LSP keybindings are available only when a language server attaches to the current buffer.
- Neovide bindings work only when running Neovide.

## General

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `\` | Normal | Clear search highlights | Run `:noh` to remove search highlighting. |
| `<C-S-v>` | Normal / Visual | Paste from clipboard | Paste from the system clipboard. |
| `<C-S-v>` | Insert | Paste from clipboard | Insert clipboard contents. |
| `<C-S-v>` | Terminal | Paste from clipboard | Paste clipboard contents into the terminal. |
| `<C-s>` | Normal | Toggle ScratchPad | Effective mapping because it overrides the earlier save mapping. |

## Files and Search

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `-` | Normal | Open Oil | Browse and edit files in the current directory. |
| `<leader>ff` | Normal | Find files | Open Telescope's file finder. |
| `<leader>fg` | Normal | Live grep | Search text across project files. |

## Compilation

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `<leader>c` | Normal | Compile | Run `:Compile`. |
| `<leader>co` | Normal | Compile project | Also runs `:Compile`; duplicates `<leader>c`. |
| `<leader>ro` | Normal | Recompile | Run `:Recompile` using the previous compilation command. |

## Windows and Buffers

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `<leader>h` | Normal | Focus left window | Move to the window on the left. |
| `<leader>j` | Normal | Focus lower window | Move to the window below. |
| `<leader>k` | Normal | Focus upper window | Move to the window above. |
| `<leader>l` | Normal | Focus right window | Move to the window on the right. |
| `<C-Tab>` | Normal | Next buffer | Switch to the next buffer. |
| `<C-S-Tab>` | Normal | Previous buffer | Switch to the previous buffer. |
| `<Tab>` | Normal | Next buffer | Alternative next-buffer shortcut. |
| `<S-Tab>` | Normal | Previous buffer | Alternative previous-buffer shortcut. |
| `<C-w>` | Normal | Delete buffer | Run `:bdelete` on the current buffer. |
| `<leader>1`–`<leader>9` | Normal | Select buffer | Jump to the corresponding BufferLine buffer position. |

## Terminal

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `<C-t>` | Normal / Terminal | Toggle floating terminal | Run `:FloaTerminal`. |

## Neovide Only

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `<leader>=` | Normal | Increase GUI scale | Increase scale by `0.1`, up to `2.0`. |
| `<leader>-` | Normal | Decrease GUI scale | Decrease scale by `0.1`, down to `0.5`. |
| `<C-=>` | Normal | Increase GUI scale | Alternative increase shortcut. |
| `<C-->` | Normal | Decrease GUI scale | Alternative decrease shortcut. |

## LSP Navigation

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `gd` | Normal | Go to definition | Jump to the symbol's definition. |
| `gD` | Normal | Go to declaration | Jump to its declaration. |
| `gr` | Normal | Find references | Find usages of the symbol. |
| `gi` | Normal | Go to implementation | Jump to an implementation. |
| `K` | Normal | Hover documentation | Display documentation and type information. |
| `<leader>D` | Normal | Go to type definition | Jump to the symbol's type definition. |

## LSP Editing and Refactoring

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `<leader>rn` | Normal | Rename symbol | Rename a variable, function, or other supported symbol. |
| `<leader>ca` | Normal | Code actions | Display available fixes and refactorings. |
| `<leader>f` | Normal | Format buffer | Request formatting from the attached LSP server. |

## LSP Diagnostics

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `<leader>ds` | Normal | Diagnostic float | Display diagnostics near the cursor. |
| `<leader>e` | Normal | Diagnostic under cursor | Open a focus-free diagnostic float without a border. |
| `[d` | Normal | Previous diagnostic | Jump to the previous diagnostic. |
| `]d` | Normal | Next diagnostic | Jump to the next diagnostic. |
| `<leader>q` | Normal | Diagnostics location list | Populate the location list with diagnostics. |

## LSP Inlay Hints and Workspace

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `<leader>ih` | Normal | Toggle inlay hints | Enable or disable hints in the current buffer. |
| `<leader>wa` | Normal | Add workspace folder | Add a workspace folder to the LSP client. |
| `<leader>wr` | Normal | Remove workspace folder | Remove a workspace folder from the LSP client. |
| `<leader>wl` | Normal | List workspace folders | Print the LSP workspace folders. |

## LSP Call Hierarchy and Signature Help

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `<leader>ci` | Normal | Incoming calls | Find functions that call the current symbol. |
| `<leader>cO` | Normal | Outgoing calls | Find functions called by the current symbol. Capital `O` distinguishes this from `<leader>co`. |
| `<C-k>` | Insert | Signature help | Display function signatures and parameter information. |

## Cursor Position

| Keybinding | Mode | Action | Usage |
|---|---|---|---|
| `<C-l>` | Normal | Cycle cursor positioning | First press centres the cursor line, second moves it to the top, third moves it to the bottom. Moving the cursor resets the cycle. |

## Conflicts and Notes

| Mapping | Issue | Recommendation |
|---|---|---|
| `<C-s>` | `:wa` is overwritten by the later ScratchPad mapping. | Keep one action per key. Consider `<leader>sp` for ScratchPad. |
| `<leader>c` and `<leader>co` | Both compile. | Keep both only if you want aliases. |
| `<C-S-v>` | Clipboard mappings are duplicated in the supplied configuration. | Remove the duplicate definitions. |
| `<leader>co` and `<leader>cO` | Compile and outgoing-call mappings differ by case. | Use lowercase `o` for compilation and uppercase `O` for outgoing calls. |
| `<leader>f` | Formatting depends on LSP support. | Check server formatting support if nothing happens. |
| LSP mappings | Require an attached server. | Check `:checkhealth vim.lsp` if mappings have no effect. |

## Inspect Active Mappings

Run these commands inside Neovim:

```vim
:map
:nmap
:imap
:tmap
:verbose nmap <C-s>
:verbose nmap <leader>co
:verbose nmap <leader>cO
```

The `:verbose` commands help identify where a mapping was last defined.

---

*This reference reflects the supplied configuration and the additional LSP bindings discussed. Plugin commands require their respective plugins to be installed and configured.*
