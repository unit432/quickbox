return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
      mode = "search", -- This makes it feel more like a smart '/' search
    },
    jump = {
      autojump = true, -- If only one match exists, it jumps automatically (like Leap)
    },
  },
  keys = {
    -- The standard 's' behavior from Leap
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
