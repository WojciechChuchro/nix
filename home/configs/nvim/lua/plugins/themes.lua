return {
	{
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            contrast = "soft", -- hard soft medium 
            transparent_mode = false,
        })
        vim.cmd("colorscheme gruvbox")
    end,
},

}
