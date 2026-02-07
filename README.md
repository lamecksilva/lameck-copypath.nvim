# 📋 lameck-copypath.nvim

A lightweight Neovim plugin to quickly copy file paths to your clipboard.

## ✨ Features

- 📁 Copy absolute file paths
- 📂 Copy relative file paths
- ⚡ Fast and minimal
- ⌨️ Customizable keybindings
- 🎨 Full LSP type annotations

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "lamecksilva/lameck-copypath.nvim",
  config = true, -- uses default config
}
```

### With custom configuration

```lua
{
  "lamecksilva/lameck-copypath.nvim",
  config = function()
    require("copypath").setup({
      register = "+",                    -- clipboard register
      default_path = "relative",         -- "relative" or "absolute"
      keymap_default = "<leader>cpp",     -- default copy keymap
      keymap_absolute = "<leader>cpa",   -- absolute path keymap
      keymap_relative = "<leader>cpr",   -- relative path keymap
    })
  end,
}
```

## 🚀 Usage

### Commands

| Command | Description |
|---------|-------------|
| `:CopyPath` | Copy path using `default_path` setting |
| `:CopyAbsolutePath` | Copy absolute path |
| `:CopyRelativePath` | Copy relative path |

### Default Keybindings

| Keymap | Command | Description |
|--------|---------|-------------|
| `<leader>cpp` | `:CopyPath` | Copy default path |
| `<leader>cpa` | `:CopyAbsolutePath` | Copy absolute path |
| `<leader>cpr` | `:CopyRelativePath` | Copy relative path |

## ⚙️ Configuration

### Default Configuration

```lua
{
  register = "+",                    -- Vim register (+ = system clipboard)
  default_path = "absolute",         -- Default path type
  keymap_default = "<leader>cpp",     -- Keymap for CopyPath
  keymap_absolute = "<leader>cpa",   -- Keymap for absolute path
  keymap_relative = "<leader>cpr",   -- Keymap for relative path
}
```

### Examples

#### Minimal setup (uses all defaults)

```lua
require("copypath").setup()
```

#### Custom keybindings only

```lua
require("copypath").setup({
  keymap_absolute = "<leader>ya",
  keymap_relative = "<leader>yr",
})
```

#### Use relative paths by default

```lua
require("copypath").setup({
  default_path = "relative",
})
```

#### Use unnamed register instead of clipboard

```lua
require("copypath").setup({
  register = '"',  -- unnamed register
})
```

## 📝 Path Types

- **Absolute**: Full path from root

  ```
  /home/user/projects/myapp/src/main.lua
  ```

- **Relative**: Path from current working directory

  ```
  src/main.lua
  ```

## 📄 License

MIT
