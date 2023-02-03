-- Comments plugin for neovim 

-- prettier formating for new javascript files
local aucommands = vim.api.nvim_create_augroup('aucommands', {clear = false})
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'*.js', '*.jsx', '*.ts','*.tsx'},
    group = aucommands,
    command = 'setlocal formatprg=prettier',
})

local commenting_blocks_of_code = vim.api.nvim_create_augroup('commenting_blocks_of_code', {clear = true})

local comment_leader_table = {
    py = '# ', sh = '# ', md = '[//]: # ', r = '# ',
    js = '// ', jsx = '// ' , ts = '// ', tsx = '// ',
    c = '// ', cpp = '// ', h = '// ', hpp= '// ', cc = '// ',
    asm = '; ', el = ';; ', lisp = ';; ', lua = '-- ',
    m = '## ', jl = '# ', vim = '" ',
}

--- Joining the file type with comment leader to add or remove comment in a visual section
--- or in the current line if the cursor is in normal mode...
--- 
--- To append more comment leaders you must write them in comment_leader_table
vim.api.nvim_create_autocmd('FileType', {
    group = commenting_blocks_of_code,
    callback = function (arg)
        local file_extension = string.match(vim.api.nvim_buf_get_name(arg.buf),'%.([a-zA-Z0-9]+)$')
        vim.b.comment_leader = comment_leader_table[file_extension]
    end
})

