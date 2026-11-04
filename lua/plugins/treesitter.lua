return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "python",
                    "go",
                    "gomod",
                    "c",
                    "cpp",
                    "lua",
                },
                callback = function(args)
                    vim.treesitter.start(args.buf)
                end,
            })
        end,
    },
}
