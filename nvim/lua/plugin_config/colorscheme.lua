return {
    {
        "catppuccin/nvim", 

        name = "catppuccin", priority = 1000,
        config = function()

            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                custom_highlights = function(colors)
                    return {
                        Comment = {fg = "#55c3b7"},
                        LineNr = {fg = "#D69898"}
                    }
                end,
            })


            vim.cmd.colorscheme("catppuccin")  
        end,

    },
}
