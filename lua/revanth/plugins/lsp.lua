return {
	"neovim/nvim-lspconfig",
	name = "lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspUninstall"},
	event = { "BufReadPost", "BufNewFile" },
	config = function () 
		local config = require "lspconfig"

    local on_attach = function(client, bufnr)
      -- Enable inlay hints
      if client.server_capabilities.inlayHintProvider then
        -- The correct syntax: enable(buffer, enabled)
        vim.lsp.inlay_hint.enable(true, { bufnr })
      end
      -- Optional: Add keymaps for inlay hints
      vim.keymap.set("n", "<leader>ih", function()
        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr })
        vim.lsp.inlay_hint.enable(enabled, { bufnr })
      end, { desc = "Toggle Inlay Hints" })
    end

		config.rust_analyzer.setup({
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
          diagnostics = {
            enable = true,
          },
          inlayHints = {
            enable = true,
            typeHints = true,
            chainingHints = true,
          },
				},
			},
    })
	end,
}
