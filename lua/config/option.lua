function is_windows()
    local os_name = os.getenv("OS")
    return os_name and os_name:match("Windows") ~= nil
end

if is_windows() then
  vim.opt.shell = "powershell.exe"
else
  vim.opt.shell = "bash"
end

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.colorcolumn = "80"
-- vim.opt.shell = "powershell.exe"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.timeoutlen = 500


