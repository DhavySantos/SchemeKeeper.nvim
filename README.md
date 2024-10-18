# SchemeKeeper.nvim
A simple Neovim plugin to save and restore your colorscheme across sessions.

## Features
 - Autosave Colorscheme: Automatically saves the active colorscheme when it's changed.
 - Autoapply Colorscheme: Automatically applies the saved colorscheme on startup.
 - Fallback Colorscheme: If no saved colorscheme is found, a fallback colorscheme is applied.
 - Manual Commands: Manually save or apply the colorscheme using the :SchemeKeeper command.


## Installation (with Lazy.nvim)
Add the following snippet to your Lazy.nvim configuration:
```lua
{
  "DhavySantos/SchemeKeeper.nvim",
  opts = {
    -- Optional configuration
    enable = true,         -- Enable/disable the plugin
    autosave = true,       -- Automatically save colorscheme on ColorScheme event
    autoapply = true,      -- Automatically apply saved colorscheme on setup
    fallback = "habamax",  -- Fallback colorscheme if no saved scheme is found
    path = vim.fn.stdpath("data") .. "/SchemeKeeper" -- Path to save the colorscheme
  }
  end
}
```
