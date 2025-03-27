require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    width = 29,
  },
  update_focused_file = { enable = true, update_root = true },
  sync_root_with_cwd = true,
  -- open_on_setup = false, 
  -- open_on_setup_file = false, 
  open_on_tab = false,
  filters = {
    dotfiles = true,
    exclude = {".config"},
    custom = {"Books"},
  },
  renderer = {
    group_empty = false,
  },
  actions = {
    change_dir = { enable = true, global = true, }
  },
})
