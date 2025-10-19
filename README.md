# My Neovim Configuration

My personal Neovim setup using Lazy.nvim for plugin management.

## Structure

- `init.lua` - Entry point
- `lua/don/core/` - Core settings and keymaps
- `lua/don/plugins/` - Plugin configurations
- `after/` - Filetype-specific settings

## Key Bindings

Leader key: `<space>`

### File Navigation (Telescope)
- `<leader>ff` - Fuzzy find files by name
- `<leader>fg` - Search text across files (live grep)
- `<leader>fc` - Search word under cursor across files

### LSP
- `gd` - Go to definition
- `gr` - Show references
- `ca` - Code actions
- `rn` - Rename symbol

See `lua/don/plugins/lsp/lspconfig.lua` for full LSP keymaps.

## Plugin Management

Using [Lazy.nvim](https://github.com/folke/lazy.nvim):
- `:Lazy` - Open plugin manager UI
- `:Lazy sync` - Install/update plugins

## LSP & Formatting

LSP servers and formatters are auto-installed via Mason:
- **Languages**: Lua, TypeScript/JavaScript, Python, Go, C#
- **Formatters**: stylua, prettier, black, gofumpt, csharpier

Format on save is enabled via conform.nvim.

## Notes

- Default indentation: 2 spaces (Python and C# use 4)
- Clipboard syncs with system clipboard
- Swapfiles disabled
