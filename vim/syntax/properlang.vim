" Vim syntax file
" Language: ProperLang
" Maintainer: Yanis Guaye <yguaye@student.42.fr>
" Latest Revision: 21 June 2018

if exists("b:current_syntax")
	finish
endif

let main_syntax="properlang"
let b:current_syntax = "properlang"

" A Useful Prolang keywords
syn keyword prlgExternal			native namespace
syn keyword prlgUseKeyword			use nextgroup=prlgUseNamespace skipwhite
syn match	prlgUseNamespace		"\S\+" contained
syn keyword	prlgStatement			break return continue
syn keyword	prlgLabel				case default
syn keyword	prlgConditional			if else switch label
syn keyword	prlgRepeat				while for do gen in with
syn keyword	prlgBoolean				true false
syn keyword	prlgConstant			null
syn keyword	prlgTypedef				self owner super
syn keyword	prlgOperator			new instanceof
syn keyword	prlgType				bool char byte short int long float double void auto
syn keyword	prlgStatement			return
syn keyword	prlgStorageClass		static synchronized volatile const final event inner on
syn keyword	prlgExceptions			throw try catch finally
syn keyword	prlgAssert				assert
syn keyword	prlgMethodDecl			synchronized throws
syn keyword	prlgBranch				break continue nextgroup=prlgUserLabelRef skipwhite
syn match	prlgUserLabelRef		"\k\+" contained
syn match	prlgVarArg				"\.\.\."
syn keyword prlgScopeDecl			public protected private abstract

" Comments
syn keyword	prlgTodo				contained TODO FIXME XXX
syn region	prlgComment				start="/\*" end="\*/" contains=prlgTodo,@Spell
syn match	prlgCommentStar			contained "^\s*\*[^/]"me=e-1
syn match	prlgCommentStar			contained "^\s*\*$"
syn match	prlgLineComment			 "//.*" contains=prlgTodo,@Spell

" Strings and constants
syn match	prlgSpecialError		contained "\\."
syn match	prlgSpecialCharError	contained "[^']"
syn match	prlgSpecialChar			contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn region	prlgString				start=+"+ end=+"+ end=+$+ contains=prlgSpecialChar,prlgSpecialError,@Spell
syn region	prlgString				start=+`+ end=+`+ end=+$+ contains=@Spell
syn match	prlgCharacter			"'[^']*'" contains=prlgSpecialChar,prlgSpecialCharError
syn match	prlgCharacter			"'\\''" contains=prlgSpecialChar
syn match	prlgCharacter			"'[^\\]'"
syn match	prlgNumber				"\<\(0[bB][0-1]\+\|0[0-7]*\|0[xX]\x\+\|\d\(\d\|_\d\)*\)[lL]\=\>"
syn match	prlgNumber				"\(\<\d\(\d\|_\d\)*\.\(\d\(\d\|_\d\)*\)\=\|\.\d\(\d\|_\d\)*\)\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\="
syn match	prlgNumber				"\<\d\(\d\|_\d\)*[eE][-+]\=\d\(\d\|_\d\)*[fFdD]\=\>"
syn match	prlgNumber				"\<\d\(\d\|_\d\)*\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\>"
syn match	prlgTupleError			"\(<\[\]>\)\|\(<\[.*<\[.*\]>.*\]>\)" contained
syn region	prlgTuple				start=+<\[+ end=+\]>+ end=+$+ contains=prlgType,prlgTupleError,@Spell

hi def link prlgExternal			Include
hi def link prlgUseKeyword			Include
hi def link prlgUseNamespace		Constant
hi def link prlgRepeat				Repeat
hi def link prlgLabel				Label
hi def link prlgConditional			Conditional
hi def link prlgStatement			Statement
hi def link prlgTodo				Todo
hi def link prlgBoolean				Boolean
hi def link prlgConstant			Constant
hi def link prlgTypedef				Typedef
hi def link prlgType				Type
hi def link prlgTuple				Type
hi def link prlgStorageClass		StorageClass
hi def link prlgMethodDecl			prlgStorageClass
hi def link prlgScopeDecl			prlgStorageClass
hi def link prlgOperator			Operator
hi def link prlgExceptions			Exception
hi def link prlgAssert				Statement
hi def link prlgType				Type
hi def link prlgBranch				Conditional
hi def link prlgUserLabelRef		prlgUserLabel
hi def link prlgUserLabel			Label
hi def link prlgVarArg				Function

hi def link prlgComment				Comment
hi def link prlgCommentStar			prlgComment
hi def link prlgLineComment			prlgComment

hi def link prlgSpecialError		Error
hi def link prlgSpecialCharError	Error
hi def link prlgTupleError			Error
hi def link prlgSpecialChar			SpecialChar
hi def link prlgString				String
hi def link prlgCharacter			Character
hi def link prlgNumber				Number
