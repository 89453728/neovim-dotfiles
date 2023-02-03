
if 10 == 11 
    augroup commenting_blocks_of_code
        autocmd!
        autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
        autocmd FileType rust,javascriptreact,typescriptreact,javascript,typescript let b:comment_leader = '/// '
        autocmd FileType sh,ruby,python,octave let b:comment_leader = '## '
        autocmd FileType r,conf,fstab,sh let b:comment_leader = '# '
        autocmd FileType tex let b:comment_leader = '% '
        autocmd FileType vim let b:comment_leader = '" '
        autocmd FileType lua let b:comment_leader = '-- '
        autocmd FileType elisp,clisp let b:comment_leader = ';; '
    augroup END
    noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
    noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
endif

luafile ~/.config/nvim/lua/init.lua
