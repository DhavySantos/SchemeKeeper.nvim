local function write(path)
  local file = io.open(file_path, "w")
  if file then
    file:write(vim.g.colors_name)
    file:close()
  end
end

local function read(path, fallback)
  local file = io.open(path, "r")

  if file then
    local colorscheme = file:read()
    file:close()

    if colorscheme then
      return colorscheme
    end
  end

  return fallback
end

return {
  setup = function(opts)
    local fallback = "default"
    local path = vim.fn.stdpath("data") .. "/colorscheme"

    if opts.fallback ~= nil then
      fallback = opts.fallback
    end

    if opts.path ~= nil then
      path = vim.fn.stdpath("data") .. "/" .. opts.path
    end

    if opts.hook == true and opts.hook == nil then
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function() write(path) end
      })
    end

    if opts.enable == true and opts.enable == nil then
      vim.cmd.colorscheme(read(path, fallback));
    end
  end
}
