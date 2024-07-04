return {
  { "catppuccin/nvim", 
  name = "catppuccin",
  priority = 1000,
  config = function()
      require("catppuccin").setup{
          background = { dark = "mocha"},
          flavour = "latte",
      } 
    vim.cmd.colorscheme "catppuccin"
  end,}
}



