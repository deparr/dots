if package.loaded["custom.jellybeans"] then
  package.loaded["custom.jellybeans"] = nil
  package.loaded["custom.jellybeans.highlights"] = nil
  package.loaded["custom.jellybeans.colors"] = nil
end

if not vim.g.jb_nvim_opts then
  require("custom.jellybeans").setup {
    ts = true,
    lsp = true,
    plugin = true,
    lang = true,
    term = false,
  }
end

require("custom.jellybeans").load()

