noremap <Leader>f :call RunCurrentTestFile()<CR>
noremap <Leader>s :call RunNearestTest()<CR>
noremap <Leader>l :call RunLastTest()<CR>
"noremap <Leader>a :call RunAllSpecs()<CR>

let g:last_elixir_test_file = expand("%")
let g:last_golang_test_file = expand("%")

let g:golang_test_command = "go test -v"

function! RunCurrentTestFile()
  if &filetype == "ruby"
    call SetRspecCommand()
    call RunCurrentSpecFile()
  elseif &filetype == "elixir"
    call RunCurrentElixirTest()
  elseif &filetype == "go"
    call RunCurrentGolangTest()
  endif
endfunction

function! RunCurrentGolangTest()
  let current_file = expand("%")
  let current_file_is_test = match(current_file, '_test.go') != -1
  if current_file_is_test
    let implementation_file = substitute(current_file, '_test\.go$', '.go', '')
    let g:last_golang_test_file = current_file . " " . implementation_file
    exec "!" . g:golang_test_command . " " . g:last_golang_test_file . " | color-gt"
  else
    call RunLastTest()
  endif
endfunction

function! RunNearestGolangTest()
  let line_num = line('.')
  let nearest_test_func_line = ""
  while line_num > 0
    if matchstr(getline(line_num), 'func Test') != "" && nearest_test_func_line == ""
      let nearest_test_func_line = getline(line_num)
      break
    end
    let line_num = line_num - 1
  endwhile

  if nearest_test_func_line != ""
    let start_test_name_num = matchend(nearest_test_func_line, 'func Test')
    let end_test_name_num = match(nearest_test_func_line, '(')
    let test_name_characters_num = end_test_name_num - start_test_name_num
    let test_name = strpart(nearest_test_func_line, start_test_name_num, test_name_characters_num)

    let current_file = expand("%")
    let implementation_file = substitute(current_file, '_test\.go$', '.go', '')
    let run_test_name_opts = "-run '" . test_name . "$'"
    let g:last_golang_test_file = current_file . " " . implementation_file . " " .  run_test_name_opts
    exec '!' . g:golang_test_command . ' ' . g:last_golang_test_file . " | color-gt"

  else
    echom "Could not find test method"
  endif
endfunction

function! RunCurrentElixirTest()
  let current_file = expand("%")
  let g:last_elixir_test_file = current_file
  let current_file_is_test = match(current_file, 'test\/') != -1
  if current_file_is_test
    exec "!mix test %"
  else
    call RunLastTest()
  endif
endfunction

function! RunNearestTest()
  if &filetype == "ruby"
    call SetRspecCommand()
    call RunNearestSpec()
  elseif &filetype == "elixir"
    echom "Not implemented yet"
  elseif &filetype == "go"
    call RunNearestGolangTest()
  endif
endfunction

function! RunLastTest()
  if &filetype == "ruby"
    call SetRspecCommand()
    call RunLastSpec()
  elseif &filetype == "elixir"
    exec "!mix test " . g:last_elixir_test_file
  elseif &filetype == "go"
    exec "!" . g:golang_test_command . " " . g:last_golang_test_file 
  endif
endfunction

function! SetRspecCommand()
  let file = findfile('.zeus.sock', '.;')
  if empty(file)
    let g:rspec_command = "!bundle exec rspec {spec}"
  else
    let g:rspec_command = "!zeus rspec {spec}"
  endif
endfunction

