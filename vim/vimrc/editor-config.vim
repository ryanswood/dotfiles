" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,space:·
set list
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Set the tag file search order
set tags=./tags;
set laststatus=2
set shell=bash
set nocompatible      " Use vim, no vi defaults
set relativenumber
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
"set expandtab                     " use spaces, not tabs
set noexpandtab                   " use tabs, not spaces
set backspace=indent,eol,start    " backspace through everything in insert mode
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem " Disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz " Disable archive files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/* " Ignore bundler and sass cache
set wildignore+=*.swp,*~,._* " Disable temp and backup files
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.
set nocursorline
"set cursorline
set scrolloff=3
set autoindent
"set completeopt-=preview
filetype plugin indent on
autocmd FileType ruby,haml,eruby,yaml set ai sw=2 sts=2 et

set noerrorbells visualbell t_vb=

autocmd FileType help wincmd L
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

noremap <leader>y :!printf % \| pbcopy<cr><cr>
noremap ,,a :!atom %<cr>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-t> <c-w>T
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-_> <c-w>s
nnoremap <c-\> <c-w>v

nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>

nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" paste mode
noremap <Leader>p :set paste<CR>
noremap <Leader>P :set nopaste<CR>

" upcase word in insert mode
inoremap <c-u> <esc>gUiw ea

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

nmap <leader>hs :set hlsearch! hlsearch?<CR> " Toggle hlsearch with <leader>hs

function! SyntaxItem()
	return synIDattr(synID(line("."),col("."),1),"name")
endfunction

nmap <leader>si :echo SyntaxItem()<CR>

function! SyntaxItemColor()
	return synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")
endfunction

nmap <leader>sc :echo SyntaxItemColor()<CR>

