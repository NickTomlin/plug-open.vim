if v:version < 704
  echo "PlugOpen; Unsupported Vim Version. Please use vim 7.4+"
  finish
end

function! GetPlugin(name)
  let plugins = get(g:, 'plugs', {})
  if has_key(plugins, a:name)
    let details = plugins[a:name]
    return details
  else
    echomsg 'PlugOpen error: ' . a:name . ' Is not a registered plugin'
    return {}
  end
endfunction

function! OpenRemote(path)
  " vim 7.4+
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
  if has_key(details, 'uri')
    call OpenRemote(details.uri)
  endif
endfunction

function! plugopen#home()
  execute 'edit' . g:plug_home
endfunction

function! DefineCommands()
  command! -nargs=1 -complete=custom,PlugFileComplete PlugOpen call plugopen#local(<f-args>)
  command! -nargs=1 -complete=custom,PlugFileComplete PlugOpenRemote call plugopen#remote(<f-args>)
  command! -nargs=0 PlugHome call plugopen#home()
endfunction

function! PlugFileComplete(A, L, P)
  let names = split(globpath(g:plug_home, '*'), "\n")
  " splitting and joing seems silly but it allows us to capitalize
  " on -complete=custom's wildmenu tab completion functionality
  " without having to write our own
  return join(map(names , "fnamemodify(v:val, ':t')"), "\n")
endfunction

call DefineCommands()
