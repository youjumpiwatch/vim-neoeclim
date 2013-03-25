let s:save_cpo = &cpo
set cpo&vim

let s:source = {
      \ 'name' : 'eclim_complete',
      \ 'kind' : 'complfunc',
      \ 'filetypes': { 'java': 1},
      \}

function! s:source.initialize()"{{{
endfunction"}}}

function! s:source.finalize()"{{{
endfunction"}}}

function! neocomplcache#sources#eclim_complete#define()"{{{
  return s:source
endfunction"}}}

function! s:source.get_keyword_pos(cur_text)"{{{
  return eclim#java#complete#CodeComplete(1, '')
endfunction"}}}

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str)"{{{
  let ret = eclim#java#complete#CodeComplete(0, '')

	if type(ret) != 3 || neocomplcache#util#get_last_status() != 0
		return []
	endif

	return ret
endfunction"}}}

let &cpo = s:save_cpo
unlet s:save_cpo
