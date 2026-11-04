return {
    {
        "hrsh7th/nvim-cmp",

        event = "InsertEnter",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",

            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
            },

            "saadparwaiz1/cmp_luasnip",
        },

        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                completion = {
                    completeopt = "menu,menuone,noinsert",
                },

                preselect = cmp.PreselectMode.None,

                window = {
                    completion = {
                        border = "rounded",
                        scrollbar = false,
                        max_height = 10,
                        max_width = 70,
                    },

                    documentation = {
                        border = "rounded",
                        max_height = 12,
                        max_width = 70,
                    },
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),

                    ["<CR>"] = cmp.mapping.confirm({
                        select = false,
                    }),

                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-e>"] = cmp.mapping.abort(),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                sources = {
                    {
                        name = "nvim_lsp",
                        keyword_length = 2,
                    },
                    {
                        name = "luasnip",
                        keyword_length = 2,
                    },
                    {
                        name = "path",
                        keyword_length = 2,
                    },
                    {
                        name = "buffer",
                        keyword_length = 3,
                        max_item_count = 5,
                    },
                },
            })

            cmp.setup.filetype({ "c", "cpp", "objc", "objcpp" }, {
                sources = cmp.config.sources({
                    {
                        name = "nvim_lsp",
                        keyword_length = 2,
                    },
                    {
                        name = "luasnip",
                        keyword_length = 2,
                    },
                }),
            })
        end,
    },
}

