local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(_, bufnr)
    local function map(mode, lhs, rhs, description)
        vim.keymap.set(mode, lhs, rhs, {
            buffer = bufnr,
            silent = true,
            desc = description,
        })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gr", vim.lsp.buf.references, "Find references")
    map("n", "K", vim.lsp.buf.hover, "Show documentation")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")

    map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, "Format code")
end

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
    },

    filetypes = {
        "c",
        "cpp",
        "objc",
        "objcpp",
    },

    root_markers = {
        "compile_commands.json",
        "compile_flags.txt",
        "CMakeLists.txt",
        ".git",
    },

    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.enable("clangd")

