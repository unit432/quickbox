return {
  "ggandor/leap.nvim",
  config = function()
    local leap = require("leap")

    -- Basic setup
    leap.add_default_mappings()

    -- Enable highlighting of all visible targets
    leap.opts.highlight_unlabeled_phase_one_targets = true
  end,
}
