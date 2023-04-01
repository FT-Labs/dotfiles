local M = {}

M.load = function()
  require "impatient"
  require("phyvim.core.cmp").setup()
  require("phyvim.core.telescope").setup()
  require("phyvim.core.treesitter").setup()
  require("phyvim.core.autopairs").setup()
  require("phyvim.core.comment").setup()
  require("phyvim.core.gitsigns").setup()
  require("phyvim.core.nvimtree").setup()
  require("phyvim.core.bufferline").setup()
  require("phyvim.core.project").setup()
  require("phyvim.core.lualine").setup()
  require("phyvim.core.symbols-outline").setup()
  require("phyvim.core.indent-line").setup()
  require("phyvim.core.terminal").setup()
  require("phyvim.core.notify").setup()
  require("phyvim.core.neoscroll").setup()
  require("phyvim.core.marks").setup()
  require("colorizer").setup()
  require("pasta")
  require("phyvim.core.tsrefactor").setup()
end

local NS = { noremap = true, silent = true }

vim.keymap.set('x', 'aa', function() require'align'.align_to_char(1, true)             end, NS) -- Aligns to 1 character, looking left
vim.keymap.set('x', 'as', function() require'align'.align_to_char(2, true, true)       end, NS) -- Aligns to 2 characters, looking left and with previews
vim.keymap.set('x', 'aw', function() require'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
vim.keymap.set('x', 'ar', function() require'align'.align_to_string(true, true, true)  end, NS) -- Aligns to a Lua pattern, looking left and with previews

-- Example gawip to align a paragraph to a string, looking left and with previews
vim.keymap.set(
    'n',
    'gaw',
    function()
        local a = require'align'
        a.operator(
            a.align_to_string,
            { is_pattern = false, reverse = true, preview = true }
        )
    end,
    NS
)

-- Example gaaip to aling a paragraph to 1 character, looking left
vim.keymap.set(
    'n',
    'gaa',
    function()
        local a = require'align'
        a.operator(
            a.align_to_char,
            { length = 1, reverse = true }
        )
    end,
    NS
)

return M
