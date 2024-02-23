vim.opt.nu = true
vim.opt.rnu = true

vim.opt.cc = "80"
vim.opt.cul = true

vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.sw = 4
vim.opt.et = true
vim.opt.si = true

vim.opt.wrap = false

--vim.opt.swf = false
--vim.opt.bk = false
--vim.opt.udir = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.udf = true

vim.opt.hls = true
vim.opt.is = true

--vim.opt.tgc = true

vim.opt.so = 8
vim.opt.scl = "yes"
--vim.opt.isfname:append("@-@")

--vim.opt.ut = 50

vim.cmd([[colorscheme shine]])

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
--vim.g.netrw_liststyle=3
--vim.g.netrw_showhide = 1
vim.g.netrw_winsize=20
