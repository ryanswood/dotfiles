function! OpenTestAlternate()
  let new_file = expand("%")
  if IsGolangApp() == 1
    let new_file = GolangAlternateForCurrentFile()
    exec ':e ' . new_file
  elseif IsRailsApp() == 1
    let new_file = RailsAlternateForCurrentFile()
    exec ':e ' . new_file
  elseif IsPhoenixApp() == 1
    let new_file = PhoenixAlternateForCurrentFile()
    exec ':e ' . new_file
    set syntax=elixir
  else
    echom "Not a recognized application type"
  end
endfunction

function! IsGolangApp()
  return &ft == 'go'
endfunction

function! GolangAlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let current_file_is_test = match(current_file, '_test\.go') != -1

  if current_file_is_test
    let new_file = substitute(new_file, '_test\.go$', '.go', '')
  else
    let new_file = substitute(new_file, '\.go$', '_test.go', '')
  endif

  return new_file
endfunction

function! IsPhoenixApp()
  let file = findfile('web/web.ex', '.;')
  return empty(file) ? 0 : 1
endfunction

function! PhoenixAlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let current_file_is_test = match(current_file, 'test\/') != -1

  " TODO: deal with lib directory
  if current_file_is_test
    let new_file = substitute(new_file, '_test\.exs$', '.ex', '')
    let new_file = substitute(new_file, 'test\/', 'web\/', '')

  else
    let new_file = substitute(new_file, 'web\/', 'test\/', '')
    let new_file = substitute(new_file, '\.ex$', '_test.exs', '')
  endif

  return new_file
endfunction

function! IsRailsApp()
  let file = findfile('config/environment.rb', '.;')
  return empty(file) ? 0 : 1
endfunction

function! RailsAlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let current_file_is_spec = match(current_file, 'spec\/') != -1

  if current_file_is_spec
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, 'spec\/', '', '')

    let file = findfile(new_file, '.;')

    if empty(file)
      let new_file = 'app/' . new_file
    end

  else
    let new_file = substitute(new_file, 'app\/', '', '')
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  endif

  return new_file
endfunction

nnoremap <leader>. :call OpenTestAlternate()<cr>

