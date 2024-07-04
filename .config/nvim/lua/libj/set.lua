vim.opt.nu = true
vim.opt.rnu = true

vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.sw = 4
vim.opt.et = true

vim.opt.si = true

vim.opt.wrap = false

vim.opt.swf = false
vim.opt.backup = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hls = true
vim.opt.is = true

vim.opt.so = 8
vim.opt.scl = "yes"

vim.opt.isfname:append("@-@")

vim.opt.cc = "80"
vim.opt.cul = true
vim.termguicolors = true
