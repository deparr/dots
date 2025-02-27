if true then
  return {
    {
      "vyfor/cord.nvim",
      event = "VeryLazy",
      build = ":Cord update",
      opts = {},
    },
  }
end

