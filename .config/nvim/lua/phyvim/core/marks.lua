local M = {}

M.setup = function()
  local opts = { -- whether to map keybinds or not. default true
    default_mappings = false,
    -- which builtin marks to show. default {}
    builtin_marks = {},
    -- whether movements cycle back to the beginning/end of buffer. default true
    cyclic = true,
    -- whether the shada file is updated after modifying uppercase marks. default false
    force_write_shada = true,
    -- how often (in ms) to redraw signs/recompute mark positions.
    -- higher values will have better performance but may cause visual lag,
    -- while lower values may cause performance penalties. default 150.
    refresh_interval = 250,
    -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
    -- marks, and bookmarks.
    -- can be either a table with all/none of the keys, or a single number, in which case
    -- the priority applies to all marks.
    -- default 10.
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    -- disables mark tracking for specific filetypes. default {}
    excluded_filetypes = {},
    -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
    -- sign/virttext. Bookmarks can be used to group together positions and quickly move
    -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
    -- default virt_text is "".
    bookmark_0 = {
      sign = "",
      virt_text = "Important",
    },
    bookmark_1 = {
      sign = "",
      virt_text = "Bug",
    },
    bookmark_2 = {
      sign = "",
      virt_text = "TODO",
    },
    mappings = {
      set_next = "mm",
      next = "mn",
      prev = "mp",
      preview = "mP",
      delete = "md",
			delete_line = "md-",
			delete_buf = "mD",
			delete_bookmark = "md-",
			set_bookmark0 = "m0",
			set_bookmark1 = "m1",
			set_bookmark2 = "m2",
			next_bookmark0 = "mn0",
			next_bookmark1 = "mn1",
			next_bookmark2 = "mn2",
    },
  }

  local marks_status_ok, marks = pcall(require, "marks")

  if not marks_status_ok then
    return
  end

  marks.setup(opts)
end

return M
