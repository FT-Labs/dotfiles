local M = {}

local opt = {
  active = true,
  ---@usage  modifies the function or method delimiter by filetypes
  map_char = {
    all = "(",
    tex = "{",
  },
  ---@usage check bracket in same line
  enable_check_bracket_line = false,
  ---@usage check treesitter
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
  enable_moveright = true,
  ---@usage disable when recording or executing a macro
  disable_in_macro = false,
  ---@usage add bracket pairs after quote
  enable_afterquote = true,
  ---@usage map the <BS> key
  map_bs = true,
  ---@usage map <c-w> to delete a pair if possible
  map_c_w = false,
  ---@usage disable when insert after visual block mode
  disable_in_visualblock = false,
  ---@usage  change default fast_wrap
  fast_wrap = {
    map = "<leader>w",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey = "Comment",
  },
}

M.setup = function()
  local autopairs = require "nvim-autopairs"
  local Rule = require "nvim-autopairs.rule"

  autopairs.setup {
    check_ts = opt.check_ts,
    enable_check_bracket_line = opt.enable_check_bracket_line,
    ts_config = opt.ts_config,
    disable_filetype = opt.disable_filetype,
    disable_in_macro = opt.disable_in_macro,
    ignored_next_char = opt.ignored_next_char,
    enable_moveright = opt.enable_moveright,
    enable_afterquote = opt.enable_afterquote,
    map_c_w = opt.map_c_w,
    map_bs = opt.map_bs,
    disable_in_visualblock = opt.disable_in_visualblock,
    fast_wrap = opt.fast_wrap,
  }

  require("nvim-treesitter.configs").setup { autopairs = { enable = true } }

  local ts_conds = require "nvim-autopairs.ts-conds"

  autopairs.add_rules {
    Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
    Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
    Rule(" ", " "):with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ "()", "[]", "{}" }, pair)
    end),
    Rule("( ", " )")
      :with_pair(function()
        return false
      end)
      :with_move(function(opts)
        return opts.prev_char:match ".%)" ~= nil
      end)
      :use_key ")",
    Rule("{ ", " }")
      :with_pair(function()
        return false
      end)
      :with_move(function(opts)
        return opts.prev_char:match ".%}" ~= nil
      end)
      :use_key "}",
    Rule("[ ", " ]")
      :with_pair(function()
        return false
      end)
      :with_move(function(opts)
        return opts.prev_char:match ".%]" ~= nil
      end)
      :use_key "]",
  }
end

return M
