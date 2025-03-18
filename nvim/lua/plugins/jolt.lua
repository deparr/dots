return {
  {
    dir = require("util").dev "deparr/jolt.nvim",
    name = "jolt",
    opts = {
      default_title = "David Parrott",
      -- code_style = function(style, groups)
      --   local style_groups = require("palettes.blog-" .. style)
      --   local ret = {}
      --   for _, name in ipairs(groups) do
      --     ret[name] = style_groups[name]
      --   end
      --   return ret
      -- end,
      code_style = {
        light = "wildcharm",
        dark = "habamax",
        restore = "tairiki",
      }
    },
  },
}
