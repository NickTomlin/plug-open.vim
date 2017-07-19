if v:version < 704
  echomsg "PlugOpen: Unsupported Vim Version. Please use vim 7.4+ or Neovim"
  finish
end

if !exists(':Plug')
  echomsg "PlugOpen: could not find vim-plug. Please install It or disable this plugin"
  finish
end

function! GetPlugin(name)
  let plugins = get(g:, 'plugs', {})
  if has_key(plugins, a:name)
    return plugins[a:name]
  else
    echomsg 'PlugOpen error: ' . a:name . ' Is not a registered plugin'
    return {}
  end
endfunction

function! OpenRemote(path)
  " help netrw-gx
  call netrw#BrowseX(a:path, netrw#CheckIfRemote())
endfunction

function! plugopen#local(name)
  let details = GetPlugin(a:name)
  if has_key(details, 'dir')
    execute 'edit' . details.dir
  endif
endfunction

function! plugopen#remote(name)
  let details = GetPlugin(a:name)
  if has_key(details, 'uri') call OpenRemote(details.uri)
  endif
endfunction

function! plugopen#home()
  execute 'edit' . g:plug_home
endfunction

function! DefineCommands()
  command! -bang -nargs=1 -complete=custom,PlugFileComplete PlugOpen call plugopen#local(<f-args>)
  command! -bang -nargs=1 -complete=custom,PlugFileComplete PlugOpenRemote call plugopen#remote(<f-args>)
  command! -bang -nargs=0 PlugHome call plugopen#home()
endfunction

function! PlugFileComplete(A, L, P)
  let names = split(globpath(g:plug_home, '*'), "\n")
  " splitting and joining seems silly but it allows us to capitalize
  " on -complete=custom's wildmenu tab completion functionality
  " without having to write our own (more info :help :command-complete)
  return join(map(names , "fnamemodify(v:val, ':t')"), "\n")
endfunction

call DefineCommands()
