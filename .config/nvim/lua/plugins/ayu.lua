return {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,

    config = function()
        require("ayu").setup({
            mirage = false,

            overrides = {
                -- Normal = { bg = "None" },
                LineNR = { fg = "#c7c7c7", bold = true }
           },
        })

        -- vim.cmd.colorscheme("ayu-dark")
    end,
}

