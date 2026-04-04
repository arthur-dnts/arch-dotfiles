return {
    "brenoprata10/nvim-highlight-colors",
    config = function()
        require("nvim-highlight-colors").setup({
            render = "virtual",
            virtual_symbol = "",
	    virtual_symbol_position = "inline",
            enable_hex = true,
            enable_rgb = true,
            enable_hsl = true,
            enable_ansi = true,
        })
    end,
}

