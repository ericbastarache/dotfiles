vim.g.mapleader=' '
vim.g.netrw_winsize=30
vim.g.vscode_transparency=1
vim.g.vscode_style="dark"
vim.opt.number=true
vim.opt.rnu=true
vim.opt.autoindent=true
vim.opt.scrolloff=8
vim.opt.tabstop=4
vim.opt.expandtab=true
vim.opt.smarttab=true
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.ruler=true
vim.opt.ttyfast=true
vim.opt.showcmd=true
vim.opt.belloff="all"
vim.opt.showmatch=true
vim.g.vscode_style="dark"
vim.g.vscode_transparent=1
vim.opt.filetype="on"

local Plug = vim.fn['plug#']
-- Key mappings
local map = vim.api.nvim_set_keymap
map('v', '<Leader>p', '_dP', {noremap = true })
map('n', '<Leader>wq', '<esc>:wq<CR>', {noremap = true})
map('n', '<Leader>ww', '<esc>:w<CR>', {noremap = true})
map('n', '<Leader>q', '<esc>:q<CR>', {noremap = true})
map('v', '<Leader>y', '"+y', {noremap = true})
map('n', '<Leader>Y', 'gg"+yG', {noremap=true})
map('v', 'J', ":m '>+1<CR>gv=gv", {noremap=true})
map('v', 'K', ":m '>-2<CR>gv=gv", {noremap=true})
map('n', '<Leader>v', ':vsp<CR>', {noremap=true})
map('n', '<Leader>h', ':sp<CR>', {noremap=true})
map('n', '<Leader>pv', ':Lex<CR>', {noremap=true})
map('n', '<Leader>wl', '<C-w><C-l>', {noremap=true})
map('n', '<Leader>wj', '<C-w><C-j>', {noremap=true})
map('n', '<Leader>wk', '<C-w><C-k>', {noremap=true})
map('n', '<Leader>wh', '<C-w><C-h>', {noremap=true})
map('n', '<Leader><S-v>', '<C-v>', {noremap=true})
map('v', '<Leader>c', '<esc>', {noremap=true})
map('n', '<Leader>cn', '<esc>:cn<CR>', {noremap=true})
map('n', '<Leader>cp', '<esc>:cp<CR>', {noremap=true})
map('n', '<Leader>e', '$', {noremap=true})
map('n', '<Leader>s', '0', {noremap=true})
map('n', '<Leader>bn', ':bnext<CR>', {noremap=true})
map('n', '<Leader>bp', ':bprev<CR>', {noremap=true})
map('n', '<Leader>t', ':tabe<CR>', {noremap=true})
map('n', '<S-Left>', ':vertical resize -2<CR>', {noremap=true})
map('n', '<S-Right>', ':vertical resize +2<CR>', {noremap=true})
map('v', '<', '<gv', {noremap=true})
map('v', '>', '>gv', {noremap=true})
vim.call('plug#begin', '~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'eslint/eslint'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'mogelbrod/vim-jsonpath'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'Chiel92/vim-autoformat'
Plug 'Mofiqul/vscode.nvim'
Plug 'neovim/nvim-lspconfig'
-- Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'rust-lang/rust.vim'

vim.call('plug#end')

local actions = require("telescope.actions")
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
          "/node_modules"
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
    }
}

map('n', '<Leader>f', ':Telescope find_files<CR>', {noremap=true})

local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

-- if not lspconfig.emmet_ls then
--   configs.emmet_ls = {
--     default_config = {
--       cmd = {'emmet-ls', '--stdio'};
--       filetypes = {'html', 'css', 'blade', 'javascriptreact', 'typescriptreact', 'js'};
--       settings = {};
--     };
--   }
-- end    

-- completion set up
local cmp = require('cmp')
-- local null_ls = require('null-ls')
-- local sources = {
--   null_ls.builtins.formatting.prettier,
--   null_ls.builtins.diagnostics.eslint_d,
--   null_ls.builtins.formatting.eslint_d
-- }

-- null_ls.setup({ sources = sources })

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- ['<Tab>'] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end,
    -- ['<S-Tab>'] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local util = require 'lspconfig/util'

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if status_ok then
  capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup({
  handlers = handlers,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    require("nvim-lsp-ts-utils").setup {
        debug = false,
        disable_commands = false,
        enable_import_on_completion = true,
        import_all_timeout = 5000, -- ms

        -- eslint
        eslint_enable_code_actions = false,
        eslint_enable_disable_comments = false,
        eslint_bin = 'eslint_d',
        eslint_config_fallback = nil,
        eslint_enable_diagnostics = false,
        eslint_opts = {
          -- diagnostics_format = "#{m} [#{c}]",
          condition = function(utils)
              return utils.root_has_file(".eslintrc.js")
          end,
        },

        -- formatting
        enable_formatting = false,
        formatter = 'prettier_d_slim',
        formatter_config_fallback = nil,

        -- parentheses completion
        complete_parens = false,
        signature_help_in_parens = false,

        -- update imports on file move
        update_imports_on_move = true,
        require_confirmation_on_move = true,
        watch_dir = nil,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = { "hint" },
        filter_out_diagnostics_by_code = {},
    }

    require("nvim-lsp-ts-utils").setup_client(client)
  end
})

-- lspconfig.tsserver.setup({
--   cmd = { "typescript-language-server", "--stdio" },
--   capabilities = capabilities,
--   filetypes = { "typescript.tsx", "typescriptreact", "typescript" },
--   settings = {
--     documentFormatting = false
--   },
--   -- handlers = {
--   --     ['textDocument/publishDiagnostics'] = function(...) end
--   -- },
--   on_attach = function (client, bufnr)
--     client.resolved_capabilities.document_formatting = false
--     client.resolved_capabilities.document_range_formatting = false
--     vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true})
--     vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true})
--     vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", '<Cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true})
--     vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>D", '<Cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true})

--     local ts_utils = require("nvim-lsp-ts-utils")
--     -- defaults
--     ts_utils.setup {
--         debug = false,
--         disable_commands = false,
--         enable_import_on_completion = false,

--         -- import all
--         import_all_timeout = 5000, -- ms
--         import_all_priorities = {
--             buffers = 4, -- loaded buffer names
--             buffer_content = 3, -- loaded buffer content
--             local_files = 2, -- git files or files with relative path markers
--             same_file = 1 -- add to existing import statement
--         },
--         import_all_scan_buffers = 100,
--         import_all_select_source = false,

--         -- eslint
--         eslint_enable_code_actions = false,
--         eslint_enable_disable_comments = false,
--         eslint_bin = "eslint_d",
--         eslint_config_fallback = nil,
--         eslint_enable_diagnostics = false,
--         eslint_show_rule_id = true,

--         -- formatting
--         enable_formatting = true,
--         formatter = "prettierd",
--         formatter_config_fallback = nil,

--         -- update imports on file move
--         update_imports_on_move = true,
--         require_confirmation_on_move = true,
--         watch_dir = '.',

--         -- filter diagnostics
--         filter_out_diagnostics_by_severity = {},
--         filter_out_diagnostics_by_code = {}
--     }

--     -- required to enable ESLint code actions and formatting
--     ts_utils.setup_client(client)
--   end
-- })

require'nvim-web-devicons'.setup{}
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'codedark',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- lspconfig.eslint.setup{
--     cmd = { "vscode-eslint-language-server", "--stdio" },
--     filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "javascript.js" },
--     handlers = {
--       ["eslint/confirmESLintExecution"] = '<function 1>',
--       ["eslint/noLibrary"] = '<function 2>',
--       ["eslint/openDoc"] = '<function 3>',
--       ["eslint/probeFailed"] = '<function 4>',
--     },
--     on_new_config = function(config, new_root_dir)
--           -- The "workspaceFolder" is a VSCode concept. It limits how far the
--           -- server will traverse the file system when locating the ESLint config
--           -- file (e.g., .eslintrc).
--           config.settings.workspaceFolder = {
--             uri = new_root_dir,
--             name = vim.fn.fnamemodify(new_root_dir, ':t'),
--           }
--         end,
--     settings = {
--       codeAction = {
--         disableRuleComment = {
--           enable = true,
--           location = "separateLine"
--         },
--         showDocumentation = {
--           enable = true
--         }
--       },
--       codeActionOnSave = {
--         enable = true,
--         mode = "all"
--       },
--       format = true,
--       nodePath = "",
--       onIgnoredFiles = "off",
--       packageManager = "npm",
--       quiet = false,
--       rulesCustomizations = {},
--       run = "onType",
--       useESLintClass = false,
--       validate = "on",
--       workingDirectory = {
--         mode = "location"
--       }
--     }
-- }

-- lspconfig.emmet_ls.setup{ capabilities = capabilities; }
lspconfig.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- vim.api.nvim_command('autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>')
vim.cmd[[colorscheme vscode]]
