local M = {}

M.setup = function()
  local status_ok, neoscroll = pcall(require, "neoscroll")

  if not status_ok then
    return
  end

  local opts = {
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" },
    hide_cursor = true,
    stop_eof = true,
    use_local_scrolloff = false,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    easing_function = nil,
    pre_hook = nil,
    post_hook = nil,
  }
  neoscroll.setup(opts)
end

return M
