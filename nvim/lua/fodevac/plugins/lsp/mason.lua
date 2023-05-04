local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig= pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end


mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "clangd",
    "cssls",
    "dotls",
    "dockerls",
    "html",
    "jsonls",
    "tsserver",
    "ltex",
    "lua_ls",
    "marksman",
    "rust_analyzer",
    "sqlls",
    "jedi_language_server",
    "taplo",
  }
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "prettier", -- ts/js formatter
    "stylua", -- lua formatter
    "eslint_d", -- ts/js linter
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
