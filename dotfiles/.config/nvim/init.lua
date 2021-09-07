local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

g.mapleader = ' '

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command 'packadd packer.nvim'
end

vim.cmd('language en_US')

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	use 'szw/vim-maximizer'
	use 'kassio/neoterm'
	use 'tpope/vim-commentary'
	use 'sbdchd/neoformat'
	use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/vim-vsnip'
  use 'vimwiki/vimwiki'
	use { 'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'mfussenegger/nvim-dap'
	use 'nvim-telescope/telescope-dap.nvim'
	use 'theHamsta/nvim-dap-virtual-text'
  use 'folke/tokyonight.nvim'
  use 'hoob3rt/lualine.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
  use 'tpope/vim-fugitive'
	use 'sindrets/diffview.nvim'
	use 'David-Kunz/jester'
	use 'folke/zen-mode.nvim'
  use 'nvim-treesitter/playground'
  use 'folke/which-key.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'dominikduda/vim_current_word'
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-autopairs'
  use 'folke/todo-comments.nvim'
  -- use 'kyazdani42/nvim-tree.lua'
  use 'David-Kunz/treesitter-unit'
  use 'tamago324/lir.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'cespare/vim-toml'
  use 'editorconfig/editorconfig-vim'
end)

-- " default options
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.number = true
-- opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
-- set diffopt+=vertical " starts diff mode in vertical split
opt.hidden = true
opt.cmdheight = 1
-- set shortmess+=c " don't need to press enter so often
opt.signcolumn = 'yes'
opt.updatetime = 520
opt.undofile = true
cmd('filetype plugin indent on')
opt.backup = false
opt.termguicolors = true
opt.smartindent = true
opt.cursorline = false
-- opt.wrap = false
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = { 'javascript', 'js=javascript', 'json=javascript' }

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>ve', ':e $MYVIMRC<CR>')
map('n', '<leader>vr', ':source $MYVIMRC<CR>')

-- folke/which-key.nvim
require('which-key').setup {}

-- folke/tokyonight.nvim
g.tokyonight_style = 'storm'
g.tokyonight_transparent = true
g.tokyonight_transparent_sidebar = true
g.tokyonight_hide_inactive_statusline = false
g.tokyonight_lualine_bold = false
g.tokyonight_colors = { border = '#2f344c' }
cmd('colorscheme tokyonight')

-- lukas-reineke/indent-blankline.nvim
require('indent_blankline').setup {
  enabled = false,
  show_current_context = true,
  use_treesitter = true,
  buftype_exclude = {'terminal', 'nofile'},
  filetype_exclude = {'log', 'gitcommit',
  'packer', 'vimwiki', 'markdown', 'json', 'txt', 'help',
  'todoist', 'NvimTree', 'git', 'TelescopePrompt', 'undotree','' }
}

-- -- kyazdani42/nvim-tree.lua
-- g.nvim_tree_side = 'left'
-- g.nvim_tree_width = 30
-- g.nvim_tree_auto_close = 0
-- g.nvim_tree_auto_resize = 1
-- g.nvim_tree_follow = 1
-- g.nvim_tree_hijack_cursor = 0
-- g.nvim_tree_lsp_diagnostics = 0
-- g.nvim_tree_ignore = { '.git', 'node_modules', '.cache'}
-- g.nvim_tree_special_files = { 'README.md', 'Makefile','MAKEFILE' }
-- g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1, folder_arrows = 1}
-- g.nvim_tree_icons = { default = ''}
-- map('n', '<C-n>', ':NvimTreeToggle<CR>')
-- map('n', '<leader>r', ':NvimTreeRefresh<CR>')
-- map('n', '<leader>nf', ':NvimTreeFindFile<CR>')

-- folke/todo-comments.nvim
require('todo-comments').setup ({})

-- norcalli/nvim-colorizer.lua
require('colorizer').setup({
  filetypes = {
    'html',
    'css',
    'scss',
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'vue',
    'svelte',
    'twig',
    'lua',
  },
  options = {
    css = true
  }
})

-- lewis6991/gitsigns.nvim
require('gitsigns').setup({})

-- hoob3rt/lualine.nvim
local hide_statusline_on_neoterm = {
  sections = {
    lualine_c = {'mode'},
    lualine_x = {'location'}
  },
  theme={},
  inactive_sections = {},
  filetypes = {'neoterm'}
}

-- local function nvimTreeName()
--   return [[File Explorer]]
-- end
-- local hide_statusline_on_nvimtree = {
--   sections = {
--     lualine_c = {
--       nvimTreeName
--     },
--     lualine_x = {'location'}
--   },
--   inactive_sections = {},
--   filetypes = {'NvimTree'}
-- }

require('lualine').setup({
  options = {
    theme = 'tokyonight',
    icons_enabled = true,
    upper = false,
    section_separators = {'', ''},
    component_separators = {'', ''}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', path = 1},
    {
      'diff',
      colored = false,
      -- symbols = {added = ' ', modified = '柳 ', removed = ' '},
    },
    {
      'diagnostics',
      icons_enabled= false,
      colored = true,
      sources = {'nvim_lsp'},
      sections = {'error', 'warn', 'info', 'hint'},
      symbols = {error = ' ', warn = ' ', info = ' ', hint = 'ﯧ '}
    }},
    lualine_x = {
      {'filetype', icons_enabled = false, upper=true, colored = false},
      {'o:encoding', upper = true},
      {'fileformat', upper = true, icons_enabled = false},
      {
        -- Lsp server name
        function()
          local msg = ''
          -- local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then return msg end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ''
      },
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'progress', 'location'},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {hide_statusline_on_neoterm},
})

-- szw/vim-maximizer
map('', '<C-w>m', ':MaximizerToggle!<CR>')

-- kassio/neoterm
g.neoterm_default_mod = 'vertical'
g.neoterm_autoinsert = true
g.neoterm_autoscroll = true
g.neoterm_term_per_tab = true
map('n', '<c-y>', ':Ttoggle<CR>')
map('i', '<c-y>', ':Ttoggle<CR>')
map('t', '<c-y>', '<c-\\><c-n>:Ttoggle<CR>')
map('n', '<leader>x', ':TREPLSendLine<CR>')
map('v', '<leader>x', ':TREPLSendSelection<CR>')
cmd([[
if has('nvim')
   au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif]])

-- sbdchd/neoformat
-- map('n', '<leader>F', ':Neoformat prettier<CR>')

-- nvim-telescope/telescope.nvim
_G.telescope_find_files_in_path = function(path)
 local _path = path or vim.fn.input('Dir: ', '', 'dir')
 require('telescope.builtin').find_files({search_dirs = {_path}})
end
_G.telescope_live_grep_in_path = function(path)
 local _path = path or vim.fn.input('Dir: ', '', 'dir')
 require('telescope.builtin').live_grep({search_dirs = {_path}})
end
_G.telescope_files_or_git_files = function()
  local utils = require('telescope.utils')
  local builtin = require('telescope.builtin')
  local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
  if ret == 0 then
    builtin.git_files()
  else
    builtin.find_files()
  end
 end
 map('n', '<leader><space>', ':lua telescope_files_or_git_files()<CR>')
 map('n', '<leader>fd', ':lua telescope_find_files_in_path()<CR>')
 map('n', '<leader>fD', ':lua telescope_live_grep_in_path()<CR>')
 map('n', '<leader>ft', ':lua telescope_find_files_in_path("./tests")<CR>')
 map('n', '<leader>fT', ':lua telescope_live_grep_in_path("./tests")<CR>')
 map('n', '<leader>ff', ':Telescope live_grep<CR>')
 map('n', '<leader>fo', ':Telescope file_browser<CR>')
 map('n', '<leader>fn', ':Telescope find_files<CR>')
 map('n', '<leader>fg', ':Telescope git_branches<CR>')
 map('n', '<leader>fb', ':Telescope buffers<CR>')
 map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
 map('n', '<leader>ff', ':Telescope live_grep<CR>')
 map('n', '<leader>FF', ':Telescope grep_string<CR>')

-- neovim/nvim-lspconfig
local nvim_lsp = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities(), {
  snippetSupport = true,
})
nvim_lsp.tsserver.setup{ capabilities = capabilities }
nvim_lsp.pyright.setup{}
nvim_lsp.java_language_server.setup{
  cmd = {os.getenv('HOME') .. '/apps/java-language-server/dist/lang_server_mac.sh'}
}
nvim_lsp.rust_analyzer.setup({
    settings = {
        ['rust-analyzer'] = {
            assist = {
                importGranularity = 'module',
                importPrefix = 'by_self',
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    },
    capabilities = capabilities,
})

map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gh', ':lua vim.lsp.buf.hover()<CR>')
map('n', 'ga', ':Telescope lsp_code_actions<CR>')
map('n', 'gA', ':Telescope lsp_range_code_actions<CR>')
map('n', 'gD', ':lua vim.lsp.buf.implementation()<CR>')
map('n', '<leader><C-k>', ':lua vim.lsp.buf.signature_help()<CR>')
map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
map('n', 'gR', ':lua vim.lsp.buf.rename()<CR>')
map('n', 'gf', ':lua vim.lsp.buf.formatting()<CR>')

map('n', '<leader><esc><esc>', ':tabclose<CR>')

-- nvim/treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner"
      }
    }
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
    -- colors = {},
    -- termcolors = {}
  }
}

-- mfussenegger/nvim-dap
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/apps/vscode-node-debug2/out/src/nodeDebug.js'},
}
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})
map('n', '<leader>dh', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map('n', '<c-k>', ':lua require"dap".step_out()<CR>')
map('n', '<c-l>', ':lua require"dap".step_into()<CR>')
map('n', '<c-j>', ':lua require"dap".step_over()<CR>')
map('n', '<c-h>', ':lua require"dap".continue()<CR>')
map('n', '<leader>dk', ':lua require"dap".up()<CR>')
map('n', '<leader>dj', ':lua require"dap".down()<CR>')
map('n', '<leader>dc', ':lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>')
map('n', '<leader>dr', ':lua require"dap".repl.open({}, "vsplit")<CR><C-w>l')
map('n', '<leader>di', ':lua require"dap.ui.variables".hover()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.variables".visual_hover()<CR>')
map('n', '<leader>d?', ':lua require"dap.ui.variables".scopes()<CR>')
map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')
map('n', '<leader>ds', ':Telescope dap frames<CR>')
-- map('n', '<leader>dc', ':Telescope dap commands<CR>')
map('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')

-- theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
g.dap_virtual_text = true

-- 'tpope/vim-fugitive'
map('n', '<leader>gg', ':Git<cr>')
map('n', '<leader>gd', ':DiffviewOpen<cr>')
map('n', '<leader>gD', ':DiffviewOpen main<cr>')
map('n', '<leader>gl', ':Gclog<cr>')
map('n', '<leader>gp', ':Git push<cr>')

-- David-Kunz/jester
map('n', '<leader>tt', ':lua require"jester".run()<cr>')
map('n', '<leader>t_', ':lua require"jester".run_last()<cr>')
map('n', '<leader>tf', ':lua require"jester".run_file()<cr>')
map('n', '<leader>dd', ':lua require"jester".debug({ path_to_jest = "/usr/local/bin/jest" })<cr>')
map('n', '<leader>d_', ':lua require"jester".debug_last({ path_to_jest = "/usr/local/bin/jest" })<cr>')
map('n', '<leader>df', ':lua require"jester".debug_file({ path_to_jest = "/usr/local/bin/jest" })<cr>')

-- lua language server
 local system_name
 if vim.fn.has("mac") == 1 then
   system_name = "macOS"
 elseif vim.fn.has("unix") == 1 then
   system_name = "Linux"
 elseif vim.fn.has('win32') == 1 then
   system_name = "Windows"
 else
   print("Unsupported system for sumneko")
 end

 -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
 local sumneko_root_path = os.getenv('HOME') ..'/apps/lua-language-server'
 local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

 local runtime_path = vim.split(package.path, ';')
 table.insert(runtime_path, "lua/?.lua")
 table.insert(runtime_path, "lua/?/init.lua")

 require'lspconfig'.sumneko_lua.setup {
   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
   settings = {
     Lua = {
       runtime = {
         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
         version = 'LuaJIT',
         -- Setup your lua path
         path = runtime_path,
       },
       diagnostics = {
         -- Get the language server to recognize the `vim` global
         globals = {'vim'},
       },
       workspace = {
         -- Make the server aware of Neovim runtime files
         library = vim.api.nvim_get_runtime_file("", true),
       },
       -- Do not send telemetry data containing a randomized but unique identifier
       telemetry = {
         enable = false,
       },
     },
   },
 }

-- editorconfig
g.EditorConfig_exclude_patterns = {'fugitive://.*', 'scp://.*'}

-- folke/zen-mode.nvim
require('zen-mode').setup {
  window = { width = 0.75, backdrop = 1 },
  plugins = {tmux = { enabled = true }},
}
map('n', '<leader>z', ':ZenMode<CR>')

-- David-Kunz/treesitter-unit
map('x', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>')
map('x', 'u', ':<c-u>lua require"treesitter-unit".select(true)<CR>')
map('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>')
map('o', 'u', ':<c-u>lua require"treesitter-unit".select(true)<CR>')
require"treesitter-unit".enable_highlighting()

-- tamago324/lir.nvim
local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
  show_hidden_files = false,
  devicons_enable = true,
  mappings = {
    ['l']     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['h']     = actions.up,
    ['q']     = actions.quit,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,

    ['J'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,
  },
  float = {
    winblend = 0,

    -- -- You can define a function that returns a table to be passed as the third
    -- -- argument of nvim_open_win().
    -- win_opts = function()
    --   local width = math.floor(vim.o.columns * 0.8)
    --   local height = math.floor(vim.o.lines * 0.8)
    --   return {
    --     border = require("lir.float.helper").make_border_opts({
    --       "╭", "─", "╮", "│", "╯", "─", "╰", "│",
    --     }, "Normal"),
    --     width = width,
    --     height = height,
    --     row = 1,
    --     col = math.floor((vim.o.columns - width) / 2),
    --   }
    -- end,
  },
}

-- custom folder icon
require'nvim-web-devicons'.setup({
  override = {
    lir_folder_icon = {
      icon = "",
      color = "#7ebae4",
      name = "LirFolderNode"
    },
  }
})
-- use visual mode
function _G.LirSettings()
  vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})

  -- echo cwd
  vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end
vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]

-- hrsh7th/nvim-cmp
vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
vim.g.vsnip_extra_mapping = true

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local cmp = require('cmp')
  cmp.setup { 
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
		  ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t('<C-n>'), 'n')
        elseif vim.fn['vsnip#available']() == 1 then
          vim.fn.feedkeys(t('<Plug>(vsnip-expand-or-jump)'))
        elseif check_back_space() then
          vim.fn.feedkeys(t('<Tab>'), 'n')
        else
          fallback()
        end
      end,
      { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t('<C-p>'), 'n')
        elseif vim.fn['vsnip#available']() == 1 then
          vim.fn.feedkeys(t('<Plug>(vsnip-jump-prev)'))
        else
          fallback()
        end
      end,
      { 'i', 's' }),
    },
    sources = {
      { name = 'buffer' },
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'path' },
    },
    sorting = {
      priority_weight = 10
    },
  }


-- windwp/nvim-autopairs
require('nvim-autopairs').setup({
  disable_filetype = { 'TelescopePrompt' , 'vim' },
})

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true -- automatically select the first item
})

-- map('n', '<s-l>', ':bnext<CR>')
-- map('n', '<s-h>', ':bprev<CR>')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('n', 'Y', "y$")

-- local plugins
map('n', '<leader>lc', ':lua require("ls-crates").insert_latest_version()<CR>')

-- global mark I for last edit
vim.cmd [[autocmd InsertLeave * execute 'normal! mI']]

-- highlight on yank
vim.cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])