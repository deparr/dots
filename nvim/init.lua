require("parromd")

-- putting this here instead of set.lua
-- because something else is resetting them, no idea what
vim.opt.formatoptions = vim.opt.formatoptions
    - "a" -- Dont autoformat
    - "t" -- Dont autowrap text
    + "c" -- but wrap comments (with respect to text width
    + "q" -- format comments with gq
    - "o" -- O/o don't continue comments
    + "r" -- but do on enter
    + "n" -- auto indent number lists
    + "j" -- remove comment leader on line joins
    - "2" -- why are we doing mla smh
