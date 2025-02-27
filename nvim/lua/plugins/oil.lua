return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        -- for godot
        local m = name:match("%.uid$")
        return m ~= nil
      end
    },
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
    columns = {},
    keymaps = {
      ["<C-k>"] = false,
      ["<C-j>"] = false,
    },
  },
}
