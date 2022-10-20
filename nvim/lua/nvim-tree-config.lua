require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  open_on_setup = false, 
  open_on_setup_file = false, 
  open_on_tab = false,
  filters = {
    dotfiles = true,
  },
})
