return {
    {
        "nvim-lualine/lualine.nvim",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        event = "VeryLazy",

        opts = {
            options = {
                theme = "tokyonight",
                globalstatus = true,
                icons_enabled = true,

                component_separators = {
                    left = "│",
                    right = "│",
                },

                section_separators = {
                    left = "",
                    right = "",
                },

                disabled_filetypes = {
                    statusline = {
                        "neo-tree",
                        "neo-tree-popup",
                    },
                    winbar = {
                        "neo-tree",
                        "neo-tree-popup",
                    },
                },

                extensions = {
                    "neo-tree",
                    "telescope",
                },
            },

            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(mode)
                            return mode:sub(1, 1)
                        end,
                    },
                },

                lualine_b = {
                    "branch",
                    "diff",
                    "diagnostics",
                },

                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        symbols = {
                            modified = " ●",
                            readonly = " 󰌾",
                            unnamed = "[No Name]",
                        },
                    },
                },

                lualine_x = {
                    "lsp_status",
                    "encoding",
                    "filetype",
                },

                lualine_y = {
                    "progress",
                },

                lualine_z = {
                    "location",
                },
            },

            inactive_sections = {
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                    },
                },

                lualine_x = {
                    "location",
                },
            },
        },
    },
}

