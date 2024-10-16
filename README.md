# Nvim SchemeKeeper

This Neovim plugin provides a simple way to save and load your favorite colorscheme. 
It allows you to set a default colorscheme and automatically saves the current one when you change it.

## Features

- **Automatic Colorscheme Saving:** Saves the current colorscheme to a specified file whenever the colorscheme is changed.
- **Load Last Used Colorscheme:** Automatically loads the last used colorscheme when Neovim starts.
- **Fallback Option:** Set a fallback colorscheme if the saved file does not exist.

## Installation

To install the plugin using `lazy.nvim`, add it to your Neovim configuration like this:

```lua
require("lazy").setup({
    { 
        "DhavySantos/SchemeKeeper",
        opts = {
            fallback = "gruvbox" -- the defaut value is 'default'.
            enable = true, -- the default value is true.
            hook = true, -- the default value is true.
        }
    }
})
```

## OPTIONS
 - `fallback`: A string representing the fallback colorscheme to use if the saved file is not found (default: "default").
 - `hook`: A boolean value that determines whether to create an auto command to save the colorscheme on change (default: `true`).
 - `enable`: A boolean value that determines whether to load the saved colorscheme at startup (default: `true`).

# License
This plugin is licensed under the MIT License. Feel free to modify and use it as per your requirements.

# Contributing
If you would like to contribute, please fork the repository and submit a pull request. Any contributions to improve the functionality and usability of the plugin are welcome!

