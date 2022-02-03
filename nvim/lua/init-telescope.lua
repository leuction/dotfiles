local opt = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>ff", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)

