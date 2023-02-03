vim.has = require'vimcompletions'.has


for _,e in pairs({'n','v'}) do
    vim.keymap.set(e,'<C-Down>','}',{remap = true, silent = true,desc = "Move down in a buffer jumping paragraphs"})
    vim.keymap.set(e,'<C-Up>','{',{remap = true, silent = true, desc = "Move up in a buffer jumping paragraphs"})
    vim.keymap.set(e,'<C-Left>','b',{remap = true, silent = true, desc = "Move left jumping words"})
    vim.keymap.set(e,'<C-Right>','e',{remap = true, silent = true, desc = "Move right jumping words"})
    vim.keymap.set(e,'<C-a>','^',{remap = true, silent = true, desc = "Go to the end of line"})
    vim.keymap.set(e,'<C-e>','$',{remap = true, silent = true, desc = "Go to beginning of line"})
end

vim.keymap.set('i','<C-Down>','<esc>}i',{remap = true, silent = true, })
vim.keymap.set('i','<C-Up>','<esc>{i',{remap = true, silent = true})
vim.keymap.set('i','<C-Left>','<esc>ba',{remap = true, silent = true})
vim.keymap.set('i','<C-Right>','<esc>ea',{remap = true, silent = true})
vim.keymap.set('i','<C-a>','<esc>^i',{remap = true, silent = true})
vim.keymap.set('i','<C-e>','<esc>$A',{remap = true, silent = true})

-- Control + backspace == remove word back.
vim.opt.backspace={'indent','eol','start'}
vim.keymap.set('i','<C-h>', '<C-w>', {silent = true, remap = true})

vim.g.NERDTreeShowHidden = 1

-- Rotate between buffers using Alt-tab to rotate right and Shift-tab 
-- to rotate left.
vim.keymap.set('n','<A-tab>', function ()
    vim.api.nvim_exec([[
    if &modifiable && !&readonly && &modified
        write
    endif
    bnext]], false)
end, {silent = true})

vim.keymap.set('n','<S-tab>', function ()
    vim.api.nvim_exec([[
    if &modifiable && !&readonly && &modified
        write
    endif
    bprevious]], false)
end, {silent = true})



-- Configuring toggle transparency in vim
vim.t.is_transparent = 1
local function toggle_transparent_background()
    if vim.t.is_transparent == 0 then
        if vim.has(7) then
            vim.api.nvim_set_hl(0,'Normal',{ctermbg = 'black', bg='black'})
        else
            vim.cmd([[highlight Normal guibg=#000000 ctermbg=black]])
        end
        vim.t.is_transparent = 1
    else
        if vim.has(7) then
            vim.api.nvim_set_hl(0,'Normal',{ctermbg = 'NONE', bg='NONE'})
        else
            vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
        end
        vim.t.is_transparent = 0
    end
end

-- change background color to transparent background by default and select the theme
vim.api.nvim_exec('color github_dark',false)
vim.api.nvim_exec('color nightfly',false)
toggle_transparent_background()

vim.keymap.set('n','<C-x><C-t>',toggle_transparent_background, {silent = true})
vim.keymap.set('n','<C-l>', function ()
    vim.api.nvim_exec(':NERDTreeToggle',false)
end)

if false then
    -- Load configuration of vimspector.
    local ok,res = pcall(function ()
        loadfile('config/vimspector.lua','t')()
    end)
    if not ok then
        print("** Error ** loading vimspector configuration in lua\n\n" .. res)
    end
end

vim.api.nvim_exec([[
" move split pages
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <A-left>   <C-w>h
nnoremap <A-down>   <C-w>j
nnoremap <A-up>     <C-w>k
nnoremap <A-right>  <C-w>l
]],false)

vim.g['NERDTreeShowHidden'] = 1

