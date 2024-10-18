local M = {}

-- Default configuration
local default_opts = {
  enable = true,
  autosave = true,
  autoapply = true,
  fallback = "habamax",
  path = vim.fn.stdpath("data") .. "/SchemeKeeper"
}

-- Write the current colorscheme to a file
local function write_colorscheme(path)
  local file = io.open(path, "w")
  if file then
    file:write(vim.g.colors_name)
    file:close()
  else
    vim.notify("Failed to write colorscheme to file: " .. path, vim.log.levels.ERROR)
  end
end

-- Apply the colorscheme from a file, or use a fallback if file is unavailable
local function apply_colorscheme(path, fallback)
  local file = io.open(path, "r")
  if file then
    local colorscheme = file:read("*all")
    file:close()

    if colorscheme and colorscheme ~= "" then
      vim.cmd.colorscheme(colorscheme)
      return
    end
  end
  vim.cmd.colorscheme(fallback)
end

-- Main setup function
M.setup = function(options)

  options = vim.tbl_deep_extend("force", default_opts, options or {})

  if not options.enable then
    return
  end

  -- Automatically save the colorscheme on ColorScheme event
  if options.autosave then
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        write_colorscheme(options.path)
      end
    })
  end

  -- Automatically apply the colorscheme on setup
  if options.autoapply then
    apply_colorscheme(options.path, options.fallback)
  end

  -- Define user command to manually write or apply the colorscheme
  vim.api.nvim_create_user_command("SchemeKeeper", function(cmd_opts)
    if cmd_opts.args == "save" then
      write_colorscheme(options.path)
    elseif cmd_opts.args == "apply" then
      apply_colorscheme(options.path, options.fallback)
    else
      vim.notify("Invalid argument for SchemeKeeper: " .. cmd_opts.args, vim.log.levels.ERROR)
    end
  end, { nargs = 1 })
end

M.setup({});

-- Return the module
return M

