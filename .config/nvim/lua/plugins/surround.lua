return {
  {
    "kylechui/nvim-surround",
    enabled = true,
    event = "VeryLazy",
    opts = {
      keymaps = {
        normal = "gsa",
        normal_cur = "gsaa",
        normal_line = "gsA",
        normal_cur_line = "gsAA",
        delete = "gsd",
        change = "gsc",
        change_line = "gsC",
      }
    }
  },
}
