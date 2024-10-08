return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "MunifTanjim/nui.nvim" },
    },
    config = function()
      local ts = require "telescope"
      local TSLayout = require "telescope.pickers.layout"
      local Layout = require "nui.layout"
      local Popup = require "nui.popup"

      local function make_popup(options)
        local popup = Popup(options)
        function popup.border:change_title(title)
          popup.border.set_text(popup.border, "top", title)
        end
        return TSLayout.Window(popup)
      end

      ts.setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
        defaults = {
          layout_strategy = "flex",
          layout_config = {
            horizontal = {
              size = {
                width = "90%",
                height = "80%",
              },
            },
            vertical = {
              size = {
                width = "90%",
                height = "90%",
              },
            },
          },
          create_layout = function(picker)
            local border = {
              results = {
                top_left = "┌",
                top = "─",
                top_right = "┬",
                right = "│",
                bottom_right = "",
                bottom = "",
                bottom_left = "",
                left = "│",
              },
              results_patch = {
                minimal = {
                  top_left = "┌",
                  top_right = "┐",
                },
                horizontal = {
                  top_left = "┌",
                  top_right = "┬",
                },
                vertical = {
                  top_left = "├",
                  top_right = "┤",
                },
              },
              prompt = {
                top_left = "├",
                top = "─",
                top_right = "┤",
                right = "│",
                bottom_right = "┘",
                bottom = "─",
                bottom_left = "└",
                left = "│",
              },
              prompt_patch = {
                minimal = {
                  bottom_right = "┘",
                },
                horizontal = {
                  bottom_right = "┴",
                },
                vertical = {
                  bottom_right = "┘",
                },
              },
              preview = {
                top_left = "┌",
                top = "─",
                top_right = "┐",
                right = "│",
                bottom_right = "┘",
                bottom = "─",
                bottom_left = "└",
                left = "│",
              },
              preview_patch = {
                minimal = {},
                horizontal = {
                  bottom = "─",
                  bottom_left = "",
                  bottom_right = "┘",
                  left = "",
                  top_left = "",
                },
                vertical = {
                  bottom = "",
                  bottom_left = "",
                  bottom_right = "",
                  left = "│",
                  top_left = "┌",
                },
              },
            }

            local results = make_popup {
              focusable = false,
              border = {
                style = border.results,
                text = {
                  top = picker.results_title,
                  top_align = "center",
                },
              },
              win_options = {
                winhighlight = "Normal:Normal",
              },
            }

            local prompt = make_popup {
              enter = true,
              border = {
                style = border.prompt,
                text = {
                  top = picker.prompt_title,
                  top_align = "center",
                },
              },
              win_options = {
                winhighlight = "Normal:Normal",
              },
            }

            local preview = make_popup {
              focusable = false,
              border = {
                style = border.preview,
                text = {
                  top = picker.preview_title,
                  top_align = "center",
                },
              },
            }

            local box_by_kind = {
              vertical = Layout.Box({
                Layout.Box(preview, { grow = 1 }),
                Layout.Box(results, { grow = 1 }),
                Layout.Box(prompt, { size = 3 }),
              }, { dir = "col" }),
              horizontal = Layout.Box({
                Layout.Box({
                  Layout.Box(results, { grow = 1 }),
                  Layout.Box(prompt, { size = 3 }),
                }, { dir = "col", size = "50%" }),
                Layout.Box(preview, { size = "50%" }),
              }, { dir = "row" }),
              minimal = Layout.Box({
                Layout.Box(results, { grow = 1 }),
                Layout.Box(prompt, { size = 3 }),
              }, { dir = "col" }),
            }

            local function get_box()
              local strategy = picker.layout_strategy
              if strategy == "vertical" or strategy == "horizontal" then
                return box_by_kind[strategy], strategy
              end

              local height, width = vim.o.lines, vim.o.columns
              local box_kind = "horizontal"
              if width < 100 then
                box_kind = "vertical"
                if height < 40 then
                  box_kind = "minimal"
                end
              end
              return box_by_kind[box_kind], box_kind
            end

            local function prepare_layout_parts(layout, box_type)
              layout.results = results
              results.border:set_style(border.results_patch[box_type])

              layout.prompt = prompt
              prompt.border:set_style(border.prompt_patch[box_type])

              if box_type == "minimal" then
                layout.preview = nil
              else
                layout.preview = preview
                preview.border:set_style(border.preview_patch[box_type])
              end
            end

            local function get_layout_size(box_kind)
              return picker.layout_config[box_kind == "minimal" and "vertical" or box_kind].size
            end

            local box, box_kind = get_box()
            local layout = Layout({
              relative = "editor",
              position = "50%",
              size = get_layout_size(box_kind),
            }, box)

            layout.picker = picker
            prepare_layout_parts(layout, box_kind)

            local layout_update = layout.update
            function layout:update()
              local box, box_kind = get_box()
              prepare_layout_parts(layout, box_kind)
              layout_update(self, { size = get_layout_size(box_kind) }, box)
            end

            return TSLayout(layout)
          end,
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
          print("bufinfo", vim.inspect(buf))
          if buf and buf.loaded and buf.name:find(name, -#name, true) then
            if #buf.windows > 0 then
              local wininfo = vim.fn.getcursorcharpos(buf.windows[1])
              name.context.row = wininfo[2]
              name.context.col = wininfo[3]
            end
            break
          end
        end
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

      -- getcurpos()
      -- nvim_get_
      for _, i in ipairs(vim.api.nvim_list_bufs()) do
        print(vim.inspect(vim.fn.getbufinfo(i)))
      end
      print(vim.inspect(vim.api.nvim_list_bufs()))

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
          "<leader>fs",
          function()
            print(builtin.grep_string { search = vim.fn.input "grep > " })
          end,
        },
      }
    end,
  },
}
