return {
    {
        "ggandor/leap.nvim",
         event = "VeryLazy",
         config = true,
         keys = {
             { "s", "<Plug>(leap-forward-to)", "Leap: Forward" },
             { "S", "<Plug>(leap-backward-to)", "Leap: Backward" },
	 },
    },
    {
        "ggandor/flit.nvim",
        event = "VeryLazy",
        config = true,
    },
}
