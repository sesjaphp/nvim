return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        lazy = false,

        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },

        keys = {
            {
                "<leader>e",
                "<cmd>Neotree focus filesystem right<CR>",
                desc = "Focus file tree",
            },
            {
                "<leader>E",
                "<cmd>Neotree filesystem reveal right<CR>",
                desc = "Reveal current file in tree",
            },
        },

        opts = {
            close_if_last_window = false,
            enable_git_status = true,
            enable_diagnostics = true,

            filesystem = {
                bind_to_cwd = true,

                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },

                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {
                        ".git",
                    },
                },
            },

            window = {
                position = "right",
                width = 34,

                mappings = {
                    ["<space>"] = "none",
                    ["<CR>"] = "open",
                    ["o"] = "open",
                    ["s"] = "open_split",
                    ["v"] = "open_vsplit",
                    ["t"] = "open_tabnew",
                    ["a"] = "add",
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["c"] = "copy",
                    ["m"] = "move",
                    ["q"] = "close_window",
                    ["R"] = "refresh",
                    ["H"] = "toggle_hidden",
                    ["?"] = "show_help",
                },
            },
        },

        config = function(_, opts)
            require("neo-tree").setup(opts)

            -- Open the sidebar automatically every time Neovim starts.
            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function()
                    vim.cmd("Neotree filesystem reveal right")
                end,
            })
        end,
    },
}

