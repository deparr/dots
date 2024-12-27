return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local ts = require "telescope"
      ts.setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }
      ts.load_extension "fzf"
    end,
    keys = function()
      local builtin = require "telescope.builtin"
      local actions = require "telescope.actions"
      local action_state = require "telescope.actions.state"
      local harpoon = require "harpoon"

      local lookup_ctx = function(name)
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          local buf = vim.fn.getbufinfo(bufnr)[1]
          if buf and buf.loaded and buf.name:find(name, -#name, true) then
            if #buf.windows > 0 then
              local wininfo = vim.fn.getcursorcharpos(buf.windows[1])
              return { row = wininfo[2], col = wininfo[3] }
            end
            break
          end
        end
        return nil
      end

      local harpoon_add = function(pbufnr, map)
        map({ "i", "n" }, "<C-h>", function()
          local picker = action_state.get_current_picker(pbufnr)
          actions.close(pbufnr)
          local sel = picker:get_selection()
          local context = lookup_ctx(sel[1]) or { row = 1, col = 1 }
          local item = { value = sel[1], context = context }
          harpoon:list():add(item)
        end)

        map({ "i", "n" }, "<M-h>", function()
          local picker = action_state.get_current_picker(pbufnr)
          actions.close(pbufnr)
          local multi_sel = picker:get_multi_selection()
          for _, file in ipairs(multi_sel) do
            local context = lookup_ctx(file[1]) or { row = 1, col = 1 }
            local item = { value = file[1], context = context }
            harpoon:list():add(item)
          end
        end)

        return true
      end

      return {
        { "<leader>fr", builtin.resume },
        {
          "<leader>ff",
          function()
            local opts = { attach_mappings = harpoon_add }
            builtin.find_files(opts)
          end,
        },
        { "<leader>fg", builtin.git_files },
        { "<leader>fl", builtin.live_grep },
        { "<leader>fd", builtin.diagnostics },
        { "<leader>fh", builtin.help_tags },
        { "<leader>fk", builtin.keymaps },
        {
          "<leader>fc",
          function()
            builtin.find_files { cwd = vim.fn.stdpath "config" }
          end,
        },
        {
          "<leader>fs",
          function()
            builtin.grep_string { search = vim.fn.input "grep > " }
          end,
        },
      }
    end,
  },
}
