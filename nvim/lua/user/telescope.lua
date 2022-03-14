local opt = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>f", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)

