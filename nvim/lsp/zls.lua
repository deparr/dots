return {
  cmd = { "zls" },
  filetypes = { "zig", "zir" },
  root_markers = { "build.zig", "zls.json" },
  settings = {
    zls = {
      semantic_tokens = "none",
    }
  }
}
