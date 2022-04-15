local M = {}

local pre_hook = nil
pre_hook = function(_ctx)
  return require("ts_context_commentstring.internal").calculate_commentstring()
end

local opts = {
  ---Add a space b/w comment and the line
  ---@type boolean
  padding = true,

  ---Lines to be ignored while comment/uncomment.
  ---Could be a regex string or a function that returns a regex string.
  ---Example: Use '^$' to ignore empty lines
  ---@type string|function
  ignore = "^$",

  ---Whether to create basic (operator-pending) and extra mappings for NORMAL/VISUAL mode
  ---@type table
  mappings = {
    ---operator-pending mapping
    ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
    basic = true,
    ---extended mapping
    ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
    extra = true,
  },

  extra = {
    ---Add comment on the line above
    above = "gcO",
    ---Add comment on the line below
    below = "gco",
    ---Add comment at the end of line
    eol = "gca",
  },

  ---LHS of line and block comment toggle mapping in NORMAL/VISUAL mode
  ---@type table
  toggler = {
    ---line-comment toggle
    line = "gcc",
    ---block-comment toggle
    block = "gbb",
  },

  ---LHS of line and block comment operator-mode mapping in NORMAL/VISUAL mode
  ---@type table
  opleader = {
    ---line-comment opfunc mapping
    line = "gc",
    ---block-comment opfunc mapping
    block = "gb",
  },

  ---Pre-hook, called before commenting the line
  ---@type function|nil
  pre_hook = pre_hook,

  ---Post-hook, called after commenting is done
  ---@type function|nil
  post_hook = nil,
}

function M.setup()
  local nvim_comment = require "Comment"
  nvim_comment.setup(opts)
end

return M
