return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  name = "lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspUninstall"},
  event = { "BufReadPost", "BufNewFile" },
  config = function () 
    local cmp = require "cmp"
    local cmp_lsp = require "cmp_nvim_lsp"
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim-lsp_signature_help'},
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'crates' },
      }, {
          { name = 'buffer' },
        })
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    local config = require "lspconfig"

    local on_attach = function(client, bufnr)
      -- Enable inlay hints
      if client.server_capabilities.inlayHintProvider then
        -- The correct syntax: enable(buffer, enabled)
        vim.lsp.inlay_hint.enable(false, { bufnr })
      end
      -- Optional: Add keymaps for inlay hints
      vim.keymap.set("n", "<leader>ih", function()
        local enabled = not vim.lsp.inlay_hint.is_enabled({ bufnr })
        vim.lsp.inlay_hint.enable(enabled, { bufnr })
      end, { desc = "Toggle Inlay Hints" })
    end

    config.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
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
