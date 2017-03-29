" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)<CR>

nmap <Leader><Leader>t :TagbarToggle<CR>
nmap <Leader><Leader>tp :TagbarTogglePause<CR>
