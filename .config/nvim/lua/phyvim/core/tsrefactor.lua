local M = {}

local opts = {
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "@r",
      },
    },
  },
}

function M.setup()
  local status_ok, ts_refactor = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end
  ts_refactor.setup(opts)
end

return M
