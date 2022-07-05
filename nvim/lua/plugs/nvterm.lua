local present, nvterm = pcall(require, "nvterm")

if not present then
   return
end

require "base46.term"

local options = {
   terminals = {
      list = {},
      type_opts = {
         float = {
            relative = "editor",
            row = 0.3,
            col = 0.25,
            width = 0.5,
            height = 0.4,
            border = "single",
         },
         horizontal = { location = "rightbelow", split_ratio = 0.3 },
         vertical = { location = "rightbelow", split_ratio = 0.5 },
      },
   },
   behavior = {
      close_on_exit = true,
      auto_insert = true,
   },
   enable_new_mappings = true,
}

local load_override = function(default_table, plugin_name)
    local user_table = M.load_config().plugins.override[plugin_name] or {}
    user_table = type(user_table) == "table" and user_table or user_table()
    return merge_tb("force", default_table, user_table)
end

options = load_override(options, "NvChad/nvterm")

nvterm.setup(options)