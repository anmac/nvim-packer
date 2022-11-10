local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  -- colorcolumn = "120", -- 80               --
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  mousemoveevent = true,                   -- mouse move events are delivered to the input queue and are available for mapping
  pumheight = 12,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  cursorcolumn = false,                    -- highlight the current column
  number = true,                           -- set numbered lines
  laststatus = 3,                          -- when the last window will have a status line
  showcmd = true,
  ruler = false,
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 5,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 5,                           -- is one of my fav
  sidescrolloff = 5,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  foldenable = true,
  foldmethod = "manual",
  foldcolumn = "1",                        -- When and how to draw the foldcolumn.
  foldlevel = 99,
  foldlevelstart = 99,
  list = true,                             -- enable to show tabs, spaces, eol, etc.
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l") -- vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.opt.iskeyword:append("-") -- vim.cmd([[set iskeyword+=-]])
-- vim.opt.formatoptions:remove("cro") -- vim.cmd([[set formatoptions-=cro]])
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.listchars = [[eol:↲,tab:··,lead:·,leadmultispace:∙,space: ,multispace: ,trail:·]]
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
