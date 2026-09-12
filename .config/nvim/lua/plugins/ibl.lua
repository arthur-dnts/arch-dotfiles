return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},

    config = function(_, opts)
        require("ibl").setup(opts)

        vim.api.nvim_set_hl(0, "IblIndent", {
            fg = "#a7c080",
        })
    end,
}
