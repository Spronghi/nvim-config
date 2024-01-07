local module = {}

function module.is_windows()
  return package.config:sub(1, 1) == "\\"
end

function module.is_linux()
  return vim.loop.os_uname().sysname == "Linux"
end

function module.is_nvim_config()
  return string.find(vim.api.nvim_buf_get_name(0), ".config/nvim")
end

return module
