return {
    {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            "nvim-lua/plenary.nvim",

            {
                "nvim-telescope/telescope-file-browser.nvim",
                dependencies = {
                    "nvim-telescope/telescope.nvim",
                    "nvim-lua/plenary.nvim",
                },
            },
        },

        cmd = "Telescope",

        keys = {
            {
                "<leader>ff",
                "<cmd>Telescope find_files<CR>",
                desc = "Find files",
            },

            {
                "<leader>fg",
                "<cmd>Telescope live_grep<CR>",
                desc = "Search project text",
            },

            {
                "<leader>fb",
                "<cmd>Telescope buffers<CR>",
                desc = "Find buffers",
            },

            {
                "<leader>fr",
                "<cmd>Telescope oldfiles<CR>",
                desc = "Recent files",
            },

            {
                "<leader>fh",
                "<cmd>Telescope help_tags<CR>",
                desc = "Search help",
            },

            {
                "<leader>fo",
                function()
                    require("telescope").extensions.file_browser.file_browser({
                        path = vim.fn.expand("%:p:h"),
                        select_buffer = true,
                    })
                end,
                desc = "Browse folders",
            },
        },

        opts = {
            defaults = {
                sorting_strategy = "ascending",

                layout_strategy = "horizontal",

                layout_config = {
                    prompt_position = "top",
                    preview_width = 0.55,
                },

                file_ignore_patterns = {
                    "%.git/",
                    "node_modules/",
                    "__pycache__/",
                    "%.pyc$",
                    "target/",
                    "build/",
                },

                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-q>"] = "send_selected_to_qflist",
                        ["<Esc>"] = "close",
                    },

                    n = {
                        ["q"] = "close",
                    },
                },
            },

            extensions = {
                file_browser = {
                    theme = "ivy",
                    hijack_netrw = false,

                    grouped = true,

                    hidden = {
                        file_browser = true,
                        folder_browser = true,
                    },

                    respect_gitignore = true,
                },
            },
        },

        config = function(_, opts)
            local telescope = require("telescope")

            telescope.setup(opts)
            telescope.load_extension("file_browser")
        end,
    },
}

