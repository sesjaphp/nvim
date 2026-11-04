return {
    {
        "lewis6991/gitsigns.nvim",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        opts = {
            signs = {
                add = {
                    text = "│",
                },
                change = {
                    text = "│",
                },
                delete = {
                    text = "_",
                },
                topdelete = {
                    text = "‾",
                },
                changedelete = {
                    text = "~",
                },
                untracked = {
                    text = "┆",
                },
            },

            current_line_blame = false,

            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, lhs, rhs, description)
                    vim.keymap.set(mode, lhs, rhs, {
                        buffer = bufnr,
                        silent = true,
                        desc = description,
                    })
                end

                map("n", "]h", gs.next_hunk, "Next Git hunk")
                map("n", "[h", gs.prev_hunk, "Previous Git hunk")

                map("n", "<leader>hp", gs.preview_hunk, "Preview Git hunk")
                map("n", "<leader>hs", gs.stage_hunk, "Stage Git hunk")
                map("n", "<leader>hu", gs.undo_stage_hunk, "Unstage Git hunk")
                map("n", "<leader>hr", gs.reset_hunk, "Reset Git hunk")

                map("n", "<leader>hb", function()
                    gs.blame_line({
                        full = true,
                    })
                end, "Blame current line")

                map("n", "<leader>hd", gs.diffthis, "Diff current file")
            end,
        },
    },

    {
        "tpope/vim-fugitive",

        cmd = {
            "Git",
            "Gdiffsplit",
            "Gvdiffsplit",
            "Gread",
            "Gwrite",
            "Gclog",
        },

        keys = {
            {
                "<leader>gg",
                "<cmd>Git<CR>",
                desc = "Open Git status",
            },
            {
                "<leader>gc",
                "<cmd>Git commit<CR>",
                desc = "Git commit",
            },
            {
                "<leader>gp",
                "<cmd>Git push<CR>",
                desc = "Git push",
            },
            {
                "<leader>gl",
                "<cmd>Git pull<CR>",
                desc = "Git pull",
            },
            {
                "<leader>gd",
                "<cmd>Gdiffsplit<CR>",
                desc = "Open Git diff",
            },
            {
                "<leader>gb",
                "<cmd>Git blame<CR>",
                desc = "Git blame",
            },
        },
    },
}

