vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("n", "x", '"_x"')

keymap.set("n", "<leader>sv", "<C-w>v") --split windows vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontaly
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>rh+", ":resize +5<CR>")
keymap.set("n", "<leader>rh-", ":resize -5<CR>")
keymap.set("n", "<leader>rv+", ":vertical resize +5<CR>")
keymap.set("n", "<leader>rv-", ":vertical resize -5<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- terminal
keymap.set("n", "<C-t>", "<C-w>s:ter<CR>:resize 7<CR>")
vim.api.nvim_set_keymap("t", "<C-n>", [[<C-\><C-n>]], { noremap = true })

-- vertical movement
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

-- line block movement
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- search
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- copy to clipboard
keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

-- blank lines spaces and select all
keymap.set("n", "<A-Enter>", "O<Esc>")
keymap.set("n", "<Enter>", "o<Esc>")
keymap.set("n", "<A-s>", "i<Space><Esc>")
keymap.set("n", "<leader>sa", "ggVG")

-- normal mode
keymap.set("n", "<C-c>", "<Esc>")

-- vim hard mode
keymap.set("n", "<up>", "<nop>")
keymap.set("n", "<down>", "<nop>")
keymap.set("n", "<left>", "<nop>")
keymap.set("n", "<right>", "<nop>")

keymap.set("i", "<up>", "<nop>")
keymap.set("i", "<down>", "<nop>")
keymap.set("i", "<right>", "<nop>")
keymap.set("i", "<left>", "<nop>")

keymap.set("v", "<up>", "<nop>")
keymap.set("v", "<down>", "<nop>")
keymap.set("v", "<right>", "<nop>")
keymap.set("v", "<left>", "<nop>")

-- dd wont yank empty lines into default register
keymap.set("n", "dd", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end, { expr = true })

-- Start insert mode at correnct indent
keymap.set("n", "i", function()
	if #vim.fn.getline(".") == 0 then
		return [["_cc]]
	else
		return "i"
	end
end, { expr = true })

-- easy ; and {} at the end of lines
keymap.set("n", ";", "A;<Esc>")
keymap.set("n", ",", ";") -- ; fix for f
keymap.set("n", "<leader>{", "A<Space>{<CR><CR>}<Esc>kcc")

-- treesj
keymap.set("n", "<leader>m", require("treesj").toggle)
keymap.set("n", "<leader>M", function()
	require("treesj").toggle({ split = { recursive = true } })
end)

-- undo tree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- git
keymap.set("n", "<leader>gs", vim.cmd.Git)

-- prevent losing paste register
keymap.set("x", "<leader>p", "\"_dP")
