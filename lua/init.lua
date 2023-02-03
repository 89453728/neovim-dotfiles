local exec_secure = require('utils').exec_secure


-- golang auto format 
vim.api.nvim_create_autocmd("BufWrite",{
    pattern = '*.go',
    callback = function (args)
        os.execute("/usr/bin/gofmt " .. args.buf)
    end}
)

local function imports()
    require('config.vimconf')
    require('maps')
    require('comments')
end
imports()
-- exec_secure((imports,"Imports error in lua/init.lua",{})



