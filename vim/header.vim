" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    header.vim                                         :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: yguaye <yguaye@student.42.fr>              +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/11/26 17:40:26 by yguaye            #+#    #+#              "
"    Updated: 2018/01/28 11:16:35 by yguaye           ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" total length of the header:
let s:length	= 80
" number of spaces between the comments and the text in the middle
let s:margin	= 5

" File type to comment type mapping
let s:mapping		= {
			\'\.c$\|\.cl$\|\.h$\|\.cc$\|\.hh$\|\.cpp$\|\.hpp$\|\.php':
			\['/*', '*/', '*'],
			\'\.htm$\|\.html$\|\.xml$':
			\['<!--', '-->', '*'],
			\'\.js$':
			\['//', '//', '*'],
			\'\.tex$':
			\['%', '%', '*'],
			\'\.ml$\|\.mli$\|\.mll$\|\.mly$':
			\['(*', '*)', '*'],
			\'\.vim$\|\vimrc$':
			\['"', '"', '*'],
			\'\.el$\|\emacs$':
			\[';', ';', '*'],
			\'\.f90$\|\.f95$\|\.f03$\|\.f$\|\.for$':
			\['!', '!', '/']
			\}

" Loads comments for the current file type.
function! s:getfilecomments()
	let l:f = s:filename()
	" default comments, if the file type is not mapped
	let s:start	= '#'
	let s:end	= '#'
	let s:middle	= '*'

	for type in keys(s:mapping)
		if l:f =~ type
			let s:start = s:mapping[type][0]
			let s:end = s:mapping[type][1]
			let s:middle = s:mapping[type][2]
		endif
	endfor
endfunction

function! s:textline(left, right)
	let l:left = strpart(a:left, 0, s:length - s:margin * 3 - strlen(a:right) + 1)
	return s:start . repeat(' ', s:margin - strlen(s:start)) . l:left . repeat(' ', s:length - s:margin * 2 - strlen(l:left) - strlen(a:right)) . a:right . repeat(' ', s:margin - strlen(s:end)) . s:end
endfunction

" Retreives the user's name
function! s:getusername()
	let l:user = $USER
	if strlen(l:user) == 0
		let l:user = "norminet"
	endif
	return l:user
endfunction

" Retrieves the user's email
function! s:getusermail()
	let l:mail = $MAIL
	if strlen(l:mail) == 0
		let l:mail = "norminet@staff.42.fr"
	endif
	return l:mail
endfunction

" Retrieves the file name to display from the buffer's name
function! s:filename()
	let l:filename = expand("%:t")
	if strlen(l:filename) == 0
		let l:filename = "< new >"
	endif
	return l:filename
endfunction

" Retrieves the date
function! s:date()
	return strftime("%Y/%m/%d %H:%M:%S")
endfunction

" The 42 Logo.
let s:ftlogo = [
			\"        :::      ::::::::",
			\"      :+:      :+:    :+:",
			\"    +:+ +:+         +:+  ",
			\"  +#+  +:+       +#+     ",
			\"+#+#+#+#+#+   +#+        ",
			\"     #+#    #+#          ",
			\"    ###   ########.fr    "
			\]

" Retrieves the corresponding 42 logo line for the current line
function! s:getlogoline(n)
	return s:ftlogo[a:n - 3]
endfunction

" Handles witch line should be written using the line number
function! s:line(n)
	if a:n == 1 || a:n == 11 " top and bottom line
		return s:start . ' ' . repeat(s:middle, s:length - strlen(s:start) - strlen(s:end) - 2) . ' ' . s:end
	elseif a:n == 2 || a:n == 10 " blank line
		return s:textline('', '')
	elseif a:n == 3 || a:n == 5 || a:n == 7 " mostly empty + 42 logo
		return s:textline('', s:getlogoline(a:n))
	elseif a:n == 4 " filename
		return s:textline(s:filename(), s:getlogoline(a:n))
	elseif a:n == 6 " 'author' line
		return s:textline("By: " . s:getusername() . " <" . s:getusermail() . ">", s:getlogoline(a:n))
	elseif a:n == 8 " 'created' line
		return s:textline("Created: " . s:date() . " by " . s:getusername(), s:getlogoline(a:n))
	elseif a:n == 9 " 'updated' line
		return s:textline("Updated: " . s:date() . " by " . s:getusername(), s:getlogoline(a:n))
	endif
endfunction

" Creates the header
function! s:makeheader()
	let l:line = 11

	" empty line after header
	call append(0, "")

	" loop over lines in the reverse order
	while l:line > 0
		call append(0, s:line(l:line))
		let l:line = l:line - 1
	endwhile
endfunction

function! s:tryupdate()
	call s:getfilecomments()
	if getline(9) =~ s:start . repeat(' ', s:margin - strlen(s:start)) . "Updated: "
		if &mod
			call setline(9, s:line(9))
		endif
		call setline(4, s:line(4))
		return 0
	endif
	return 1
endfunction

function! s:mexicanheader()
	if s:tryupdate()
		call s:makeheader()
	endif
endfunction

" Bind command and shortcut
command! MexicanHeader call s:mexicanheader()
nnoremap <c-c>h :MexicanHeader <cr>
nnoremap <F1> :MexicanHeader <cr>

augroup mexheader
	autocmd!
	autocmd BufWritePre * call s:tryupdate ()
augroup END
