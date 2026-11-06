-- ~/.config/nvim/init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 8
vim.opt.updatetime = 250
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.swapfile = false

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

if not uv.fs_stat(lazypath) then
    local result = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { result, "WarningMsg" },
        }, true, {})
        return
    end
end

vim.keymap.set("n", "<C-h>", "<C-w>h", {
    desc = "Move focus to the left window",
})

vim.keymap.set("n", "<C-l>", "<C-w>l", {
    desc = "Move focus to the right window",
})

vim.keymap.set("n", "<C-j>", "<C-w>j", {
    desc = "Move focus to the lower window",
})

vim.keymap.set("n", "<C-k>", "<C-w>k", {
    desc = "Move focus to the upper window",
})

vim.keymap.set("n", "<F6>", function()
    local source = vim.fn.expand("%:p")
    local output = vim.fn.expand("%:p:r")

    vim.cmd("write")

    vim.cmd(
        "botright split | terminal g++ -std=c++20 -Wall -Wextra "
            .. vim.fn.shellescape(source)
            .. " -o "
            .. vim.fn.shellescape(output)
            .. " && "
            .. vim.fn.shellescape(output)
    )
end, {
    desc = "Compile and run current C++ file",
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions:remove({ "r" })
    end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.cpp",
    callback = function()
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            "#include <iostream>",
            "",
            "int main() {",
            "    return 0;",
            "}",
        })
    end,
})

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("lsp")
