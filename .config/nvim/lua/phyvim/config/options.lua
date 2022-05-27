local M = {}

M.load_options = function()
  local options = {
    encoding = "utf-8",
    mouse = "a",
		foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
		foldlevelstart = 20,
    hidden = true,
    number = true,
    hlsearch = false,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
		expandtab = true,
    smartindent = true,
    completeopt = { "menuone", "noselect" },
    wildignorecase = true,
		viminfo="'1000,f1",
    --wildmode = { "longest", "list", "full" },
    ignorecase = true,
    conceallevel = 0,
    concealcursor = "vin",
    cursorline = true,
    cursorlineopt = "number",
    pumheight = 15,
    scrolloff = 8,
    sidescrolloff = 8,
    updatetime = 200,
    undofile = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    signcolumn = "yes",
    showmode = false,
  }

  vim.opt.shortmess:append "c"
  vim.opt.whichwrap:append "<,>,[,],h,l"

  -- Make compatible with st, truecolors
  vim["&t_8f"] = "\\<Esc>[38;2;%lu;%lu;%lum"
  vim["&t_8b"] = "\\<Esc>[48;2;%lu;%lu;%lum"
  vim.opt.termguicolors = true

  vim.cmd [[set formatoptions-=cro]]

  for k, v in pairs(options) do
    vim.opt[k] = v
  end
end

return M
