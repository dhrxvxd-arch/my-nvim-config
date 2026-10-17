# Neovim Plugins — Complete Reference

A practical reference for my Neovim configuration using `lazy.nvim`.

## Table of Contents

1. [Plugin Overview](#plugin-overview)
2. [Autopairs](#autopairs)
3. [Bufferline](#bufferline)
4. [Compile Mode](#compile-mode)
5. [Dashboard](#dashboard)
6. [Indent Scope](#indent-scope)
7. [LSP](#lsp)
8. [Lualine](#lualine)
9. [Neo-tree](#neo-tree)
10. [Noice](#noice)
11. [Oil](#oil)
12. [Rosé Pine](#rosé-pine)
13. [Telescope](#telescope)
14. [Which-key](#which-key)
15. [Plugin Management](#plugin-management)

---

## Plugin Overview

| Plugin | Main purpose | How I use it |
|---|---|---|
| `nvim-autopairs` | Automatically closes brackets and quotes | Faster, cleaner editing |
| `bufferline.nvim` | Tab-like buffer display | Switch between open files |
| `compile-mode.nvim` | Run compilation commands inside Neovim | Compile and recompile projects |
| `dashboard-nvim` | Startup dashboard | Quick access when opening Neovim |
| `indent-blankline.nvim` / indent scope | Indentation guides and scope highlighting | Understand nested code |
| `nvim-lspconfig` + native LSP | Language-server integration | Navigation, diagnostics, refactoring |
| `lualine.nvim` | Statusline | Show mode, file, diagnostics and other status |
| `neo-tree.nvim` | File explorer sidebar | Browse and manage project files |
| `noice.nvim` | Enhanced messages, command line and notifications | Improve Neovim's UI |
| `oil.nvim` | Edit directories like a buffer | Fast filesystem operations |
| `rose-pine` | Colorscheme | Rosé Pine visual theme |
| `telescope.nvim` | Fuzzy finder | Find files, text and other project information |
| `which-key.nvim` | Keybinding discovery | See available mappings |

---

## Autopairs

**Purpose:** Automatically insert matching closing characters while typing.

| Input | Result |
|---|---|
| `(` | `()` |
| `[` | `[]` |
| `{` | `{}` |
| `"` | `""` |
| `'` | `''` |

### Usage

- Type an opening bracket or quote to insert its closing pair.
- Continue typing inside the pair.
- Move past an existing closing character when supported by the plugin's configuration.
- Pair behavior for `<` and `>` depends on the configured rules.

### Configuration

Usually configured in `plugins/autopairs.lua`.

Common options include:

- Enable or disable pairing for specific characters.
- Configure rules for `<` and `>`.
- Integrate with the completion plugin so completed function names and brackets work together.

**Note:** Exact behavior depends on the rules enabled in my configuration.

---

## Bufferline

**Purpose:** Display open buffers in a tab-like bar.

A buffer is an open editing object in Neovim. It is not necessarily a separate window or a terminal tab.

### Keybindings

| Keybinding | Action |
|---|---|
| `Tab` | Next buffer |
| `Shift-Tab` | Previous buffer |
| `Ctrl-Tab` | Next buffer |
| `Ctrl-Shift-Tab` | Previous buffer |
| `Ctrl-W` | Close the current buffer |
| `<leader>1`–`<leader>9` | Jump to the corresponding Bufferline position |

### Commands

| Command | Purpose |
|---|---|
| `:BufferLineGoToBuffer 1` | Jump to buffer position 1 |
| `:BufferLineCycleNext` | Move to the next buffer |
| `:BufferLineCyclePrev` | Move to the previous buffer |

### Important distinction

| Concept | Meaning |
|---|---|
| Buffer | An open file or editing object |
| Window | A viewport displaying a buffer |
| Tabpage | A workspace containing a layout of windows |

Bufferline displays buffers; it does not turn each file into a separate Neovim tabpage.

---

## Compile Mode

**Purpose:** Run build commands and inspect compiler output inside Neovim.

Useful for C, C++, and other compiled languages.

### Keybindings

| Keybinding | Action |
|---|---|
| `<leader>c` | Compile |
| `<leader>co` | Compile project |
| `<leader>ro` | Recompile |

The exact command associated with a mapping depends on the configured mapping and Compile Mode command behavior.

### Commands

| Command | Purpose |
|---|---|
| `:Compile` | Start a compilation |
| `:Recompile` | Repeat the previous compilation |
| `:NextError` | Navigate to the next error, if provided by the installed version |
| `:PrevError` | Navigate to the previous error, if provided by the installed version |

### Typical workflow

1. Open a source file or project.
2. Run the configured compile command.
3. Read the compiler output.
4. Jump between errors and warnings.
5. Fix the source code and recompile.

### Configuration notes

- Configure a sensible default build command for the project.
- Ensure compiler output is parsed correctly.
- ANSI-colored output is supported through the plugin's color-rendering integration.

For newer Compile Mode versions, use the current `ansi_color` configuration rather than the deprecated top-level `baleia_setup` option.

---

## Dashboard

**Purpose:** Show a startup screen when Neovim opens.

### Typical features

| Feature | Purpose |
|---|---|
| Header | Display a logo or custom text |
| Find files | Open a file-search workflow |
| Recent files | Return to recently edited files |
| New file | Start a new file |
| Quit | Exit Neovim |

### Usage

The dashboard is generally shown when opening Neovim without a file or when the configured startup conditions are met.

The exact shortcuts depend on the buttons defined in `plugins/dashboard.lua`.

### Configuration ideas

- Use a custom header.
- Keep frequently used actions accessible.
- Avoid displaying the dashboard unnecessarily when opening a project file.
- Configure the dashboard to match the active colorscheme.

---

## Indent Scope

**Purpose:** Make indentation levels and the current code scope easier to understand.

### Features

| Feature | Purpose |
|---|---|
| Indentation guides | Show nested indentation |
| Scope highlighting | Emphasize the current indentation scope |
| Current-scope indicator | Make nested blocks easier to follow |

### Example

```cpp
int main() {
    if (true) {
        for (int i = 0; i < 10; ++i) {
            // Current scope is nested here.
        }
    }
}
```

### Usage

No keybinding is necessarily required. The plugin provides visual guidance while moving through code.

**Configuration note:** Indentation guides and scope highlighting may come from separate plugins or modules. The exact plugin name and behavior depend on the implementation in `plugins/indentscope.lua`.

---

## LSP

**Purpose:** Connect Neovim to language servers for diagnostics, code navigation, refactoring and language intelligence.

My setup uses Neovim's native LSP API alongside `nvim-lspconfig`.

### Navigation

| Keybinding | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Show hover documentation |
| `<leader>D` | Go to type definition |

### Editing and refactoring

| Keybinding | Action |
|---|---|
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Show code actions |
| `<leader>f` | Format the current buffer |

### Diagnostics

| Keybinding | Action |
|---|---|
| `<leader>ds` | Show diagnostic float |
| `<leader>e` | Show diagnostic under the cursor, if configured |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>q` | Populate/open diagnostic location list, if configured |

### Signature help and inlay hints

| Keybinding | Action |
|---|---|
| `Ctrl-K` in Insert mode | Show signature help, if configured |
| `<leader>ih` | Toggle inlay hints, if configured |

### Workspace management

| Keybinding | Action |
|---|---|
| `<leader>wa` | Add workspace folder, if configured |
| `<leader>wr` | Remove workspace folder, if configured |
| `<leader>wl` | List workspace folders, if configured |

### Call hierarchy

| Keybinding | Action |
|---|---|
| `<leader>ci` | Incoming calls, if configured |
| `<leader>cO` | Outgoing calls, if configured |

Call hierarchy support depends on the language server and its capabilities.

### Typical workflow

1. Open a supported source file.
2. Ensure the appropriate language server is running.
3. Use `gd` to inspect a symbol's definition.
4. Use `gr` to find its references.
5. Use `<leader>rn` to rename a symbol.
6. Use diagnostics to locate errors.
7. Format with `<leader>f` when needed.

### Language-server support

The configured servers may include:

| Language | Server |
|---|---|
| C / C++ | `clangd` |
| Lua | `lua_ls` |
| Rust | `rust_analyzer` |
| Zig | `zls` |

Actual availability depends on which servers are installed and enabled.

### Useful commands

| Command | Purpose |
|---|---|
| `:LspInfo` | Inspect active language servers, if available |
| `:checkhealth vim.lsp` | Check native LSP health |
| `:lua vim.lsp.buf.hover()` | Open hover documentation |
| `:lua vim.diagnostic.open_float()` | Display diagnostic information |

---

## Lualine

**Purpose:** Provide a customizable statusline.

### Common statusline information

| Component | Information |
|---|---|
| Mode | Current editing mode |
| Branch | Current Git branch, if configured |
| Filename | Current file |
| Diagnostics | Errors, warnings and other diagnostics |
| Diff | Git changes, if configured |
| Filetype | Current filetype |
| Progress | Position within the file |
| Location | Current line and column |

### Usage

Lualine updates automatically as the editor state changes.

### Configuration ideas

- Match the statusline to Rosé Pine.
- Keep the filename and mode easy to identify.
- Display diagnostics when an LSP is active.
- Use a transparent background only if that is intentional for the current UI.

---

## Neo-tree

**Purpose:** Browse files and directories from a sidebar.

### Typical actions

| Action | Purpose |
|---|---|
| Open a file | Load it into a buffer |
| Expand/collapse a directory | Navigate the project tree |
| Create a file | Add a project file |
| Create a directory | Add a project directory |
| Rename | Rename a filesystem entry |
| Delete | Remove a filesystem entry |
| Refresh | Update the displayed tree |

### Usage

Neo-tree's built-in mappings depend on the configured source and version. Its file-tree mappings are typically active while the cursor is inside the Neo-tree window.

### Commands

| Command | Purpose |
|---|---|
| `:Neotree` | Open Neo-tree |
| `:Neotree toggle` | Toggle the tree |
| `:Neotree filesystem reveal` | Show the current file in the filesystem tree |
| `:Neotree close` | Close Neo-tree |
| `:Neotree show` | Show Neo-tree |

### Typical workflow

1. Open Neo-tree.
2. Navigate to a project directory.
3. Expand the required directory.
4. Open or create files.
5. Close the tree when it is no longer needed.

### Configuration notes

- Configure whether the tree follows the current file.
- Set the window width and position.
- Customize cursorline behavior if the tree's default highlighting is distracting.
- Keep the tree's visual style consistent with the rest of the editor.

---

## Noice

**Purpose:** Improve Neovim's command line, messages, notifications and LSP progress display.

### Common features

| Feature | Purpose |
|---|---|
| Command-line UI | Display command input in a custom interface |
| Notifications | Show messages in a notification interface |
| Message history | Review previous messages |
| LSP progress | Display language-server activity |
| Search UI | Improve the search prompt, if configured |

### Commands

Available commands depend on the installed Noice version and configuration. Commonly used commands include:

| Command | Purpose |
|---|---|
| `:Noice` | Open Noice's interface, if supported |
| `:Noice history` | View message history, if supported |
| `:Noice dismiss` | Dismiss visible notifications, if supported |

### Usage

Noice generally operates automatically. It changes how selected Neovim messages and prompts are displayed.

### Configuration notes

- Configure which message types are routed into Noice.
- Avoid hiding important errors.
- Set notification duration and display position.
- Check for conflicts with other notification plugins.

---

## Oil

**Purpose:** Edit directories as if they were ordinary buffers.

Oil is useful when I want direct filesystem operations rather than a traditional tree sidebar.

### Keybindings

| Keybinding | Action |
|---|---|
| `-` | Open the parent directory using `:Oil` |

### Commands

| Command | Purpose |
|---|---|
| `:Oil` | Open the current directory |
| `:Oil <directory>` | Open a specified directory |

### Typical workflow

1. Press `-` to open the directory buffer.
2. Edit filenames or directory entries as supported by Oil.
3. Save the buffer to apply the filesystem changes.
4. Use normal navigation to enter directories or open files.

### Why use Oil?

| Neo-tree | Oil |
|---|---|
| Tree-oriented navigation | Directory-as-buffer workflow |
| Persistent sidebar | Editable directory listing |
| Useful for browsing | Useful for filesystem edits |

Both can coexist because they solve slightly different problems.

---

## Rosé Pine

**Purpose:** Provide the editor's color palette and colorscheme.

### Variants

| Variant | Appearance |
|---|---|
| Rosé Pine | Standard palette |
| Rosé Pine Moon | Darker, muted palette |
| Rosé Pine Dawn | Light palette |

My configuration uses `rose-pine-moon`.

### Usage

The colorscheme is generally applied through:

```lua
vim.cmd.colorscheme("rose-pine-moon")
```

### Theme consistency

The colorscheme can be extended to other UI elements, including:

- Lualine
- Bufferline
- Neo-tree
- Telescope
- Floating windows
- Diagnostic signs
- Indentation and scope indicators

### Transparency

If transparency is configured, ensure it is intentional for each UI. For example, a Neovide configuration may use an opaque background even when terminal Neovim uses transparency.

---

## Harpoon

**Repository:** [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)  
**Branch:** `harpoon2`  
**Purpose:** Quickly bookmark and switch between frequently used files without repeatedly searching through the project.

### Keybindings

| Keybind | Action |
|---|---|
| `<leader>ha` | Add current file to Harpoon |
| `<leader>hh` | Toggle Harpoon quick menu |
| `<leader>1` | Jump to bookmarked file 1 |
| `<leader>2` | Jump to bookmarked file 2 |
| `<leader>3` | Jump to bookmarked file 3 |
| `<leader>4` | Jump to bookmarked file 4 |

### Usage

1. Open a file you frequently use and press `<leader>ha` to bookmark it.
2. Repeat for other important files.
3. Use `<leader>1` through `<leader>4` to jump directly between your bookmarked files.
4. Use `<leader>hh` to view and manage your bookmarks.

### Notes

- Bookmarks are maintained in a Harpoon list associated with the current working directory.
- Harpoon complements Telescope: use Telescope to discover files and Harpoon to navigate between frequently accessed files.
- Requires `nvim-lua/plenary.nvim`.
- Configured in `lua/plugins/harpoon.lua`; keybindings are defined in `lua/core/keymap.lua`.

---

## Telescope

**Purpose:** Fuzzy finding for files, text and other editor information.

### Keybindings

| Keybinding | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Search text using live grep |

### Commands

| Command | Purpose |
|---|---|
| `:Telescope find_files` | Search for files |
| `:Telescope live_grep` | Search text throughout the searchable project |
| `:Telescope buffers` | Search open buffers |
| `:Telescope help_tags` | Search Neovim help |
| `:Telescope oldfiles` | Search recently opened files |

### Typical workflow

1. Press `<leader>ff`.
2. Type part of a filename.
3. Navigate the results.
4. Select a result to open it.

For text search, use `<leader>fg`, enter a phrase and inspect the matching lines.

### Requirements

- `live_grep` generally requires `ripgrep` (`rg`).
- File visibility depends on ignore rules and the selected Telescope picker.
- Git-ignored files may not appear in default searches.

### Telescope versus Harpoon

| Telescope | Harpoon |
|---|---|
| Search for files or text | Quickly revisit a small set of chosen files |
| Good for discovering files | Good for navigating a known workflow |
| Search-driven | Bookmark-driven |

They are complementary, not direct replacements.

---

## Which-key

**Purpose:** Show available keybindings after pressing a mapping prefix.

### Usage

Press a prefix such as `<leader>` and pause. Which-key can display the available mappings under that prefix.

### Examples

| Prefix | Typical purpose |
|---|---|
| `<leader>` | General custom mappings |
| `<leader>f` | File and search actions |
| `<leader>c` | Compilation or code-related actions |
| `<leader>r` | Recompile or rename actions |
| `<leader>w` | Workspace actions |

The displayed groups and descriptions depend on the mappings defined in my configuration.

### Best practice

Give custom mappings descriptive `desc` fields so Which-key can show useful names instead of unexplained key sequences.

---

## Plugin Management

My configuration uses `lazy.nvim`.

### Commands

| Command | Purpose |
|---|---|
| `:Lazy` | Open the plugin manager |
| `:Lazy sync` | Install missing plugins and update/synchronize plugins |
| `:Lazy update` | Update plugins |
| `:Lazy clean` | Remove plugins no longer configured |
| `:Lazy check` | Check for available updates |
| `:Lazy profile` | Inspect plugin-loading performance, if supported |

### Disable a plugin

To disable a plugin, edit its specification in the relevant plugin file. For example:

```lua
return {
    "author/plugin-name",
    enabled = false,
}
```

The exact specification depends on how that plugin is declared in the configuration.

### Reload after changes

For plugin specification changes, restart Neovim when necessary. Some plugin settings can be reloaded without restarting, but not every plugin supports a complete live reload.

---

## Important Keybinding Notes

Some mappings in my configuration overlap:

| Mapping | Potential issue |
|---|---|
| `<C-s>` | If mapped twice, the later mapping replaces the earlier mapping for the same mode and buffer scope |
| `<leader>c` and `<leader>co` | Both start with the same prefix, but they are different mappings |
| `<leader>co` and `<leader>cO` | Lowercase `o` and uppercase `O` are distinct |
| `Tab` / `Shift-Tab` and `Ctrl-Tab` / `Ctrl-Shift-Tab` | Multiple ways to switch buffers |
| `<C-S-v>` | Duplicate mappings are unnecessary unless they intentionally differ by mode |

Always check the active mapping if behavior does not match this document:

```vim
:verbose nmap <C-s>
:verbose nmap <leader>co
:verbose nmap <leader>ff
:verbose nmap -
```

` :verbose nmap ` shows the active normal-mode mapping and, when available, where it was last defined.

---

*This document describes the intended behavior of the listed plugins and the known mappings. Plugin-specific defaults and optional mappings should be verified against the actual Lua files whenever the configuration changes.*

