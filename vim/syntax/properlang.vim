" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    properlang.vim                                     :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: yguaye <yguaye@student.42.fr>              +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2018/02/19 17:20:37 by yguaye            #+#    #+#              "
"    Updated: 2018/02/19 17:31:07 by yguaye           ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" Vim syntax file
" Language: ProperLang
" Maintainer: Yanis Guaye <yguaye@student.42.fr>
" Latest Revision: 19 Febuary 2018

if exists("b:current_syntax")
	finish
endif

let main_syntax="properlang"
let b:current_syntax = "properlang"

" A Useful Prolang keywords
syn keyword prlExternal			native namespace
syn keyword prlUseKeyword		use nextgroup=prlUseNamespace skipwhite
syn match	prlUseNamespace		"\S\+" contained
syn keyword	prlStatement		break return continue
syn keyword	prlLabel			case default
syn keyword	prlConditional		if else switch label
syn keyword	prlRepeat			while for do gen in with
syn keyword	prlBoolean			true false
syn keyword	prlConstant			null
syn keyword	prlTypedef			self owner super
syn keyword	prlOperator			new instanceof
syn keyword	prlType				bool char byte short int long float double void
syn keyword	prlStatement		return
syn keyword	prlStorageClass		static synchronized volatile const final event inner on
syn keyword	prlExceptions		throw try catch finally
syn keyword	prlAssert			assert
syn keyword	prlMethodDecl		synchronized throws
syn keyword	prlBranch			break continue nextgroup=prlUserLabelRef skipwhite
syn match	prlUserLabelRef		"\k\+" contained
syn match	prlVarArg			"\.\.\."
syn keyword prlScopeDecl		public protected private abstract

" Comments
syn keyword	prlTodo				contained TODO FIXME XXX
syn region	prlComment			start="/\*" end="\*/" contains=prlTodo,@Spell
syn match	prlCommentStar		contained "^\s*\*[^/]"me=e-1
syn match	prlCommentStar		contained "^\s*\*$"
syn match	prlLineComment		 "//.*" contains=prlTodo,@Spell

" Strings and constants
syn match	prlSpecialError		contained "\\."
syn match	prlSpecialCharError contained "[^']"
syn match	prlSpecialChar		contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn region	prlString			start=+"+ end=+"+ end=+$+ contains=prlSpecialChar,prlSpecialError,@Spell
syn match	prlCharacter		"'[^']*'" contains=prlSpecialChar,prlSpecialCharError
syn match	prlCharacter		"'\\''" contains=prlSpecialChar
syn match	prlCharacter		"'[^\\]'"
syn match	prlNumber			"\<\(0[bB][0-1]\+\|0[0-7]*\|0[xX]\x\+\|\d\(\d\|_\d\)*\)[lL]\=\>"
syn match	prlNumber			"\(\<\d\(\d\|_\d\)*\.\(\d\(\d\|_\d\)*\)\=\|\.\d\(\d\|_\d\)*\)\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\="
syn match	prlNumber			"\<\d\(\d\|_\d\)*[eE][-+]\=\d\(\d\|_\d\)*[fFdD]\=\>"
syn match	prlNumber			"\<\d\(\d\|_\d\)*\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\>"

hi def link prlExternal			Include
hi def link prlUseKeyword		Include
hi def link prlUseNamespace		Constant
hi def link cSpecialCharacter	prlSpecial
hi def link prlRepeat			Repeat
hi def link prlLabel			Label
hi def link prlConditional		Conditional
hi def link prlStatement		Statement
hi def link prlTodo				Todo
hi def link prlBoolean			Boolean
hi def link prlConstant			Constant
hi def link prlTypedef			Typedef
hi def link prlType				Type
hi def link prlStorageClass		StorageClass
hi def link prlMethodDecl		prlStorageClass
"hi def link prlClassDecl		prlStorageClass
hi def link prlScopeDecl		prlStorageClass
hi def link prlOperator			Operator
hi def link prlExceptions		Exception
hi def link prlAssert			Statement
hi def link prlType				Type
hi def link prlBranch			Conditional
hi def link prlUserLabelRef		prlUserLabel
hi def link prlUserLabel		Label
hi def link prlVarArg			Function

hi def link prlComment			Comment
hi def link prlCommentStar		prlComment
hi def link prlLineComment		prlComment

hi def link prlSpecialError		Error
hi def link prlSpecialCharError	Error
hi def link prlSpecialChar		SpecialChar
hi def link prlString			String
hi def link prlCharacter		Character
hi def link prlNumber			Number
