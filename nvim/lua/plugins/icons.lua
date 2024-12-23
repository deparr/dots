if true then
  return {}
end
return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      override_by_extension = {
        ["toml"] = {
          icon = "",
        },
      },
    },
  },
}
