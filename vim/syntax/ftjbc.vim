" Vim syntax file
" Language: ProperLang
" Maintainer: Yanis Guaye <yguaye@student.42.fr>
" Latest Revision: 20 May 2018

if exists("b:current_syntax")
	finish
endif

let main_syntax="ftjbc"
let b:current_syntax = "ftjbc"

set iskeyword+=.

syn keyword ftjbcDefinition		.constant
								\ .class
								\ nextgroup=ftjbcConstantType,ftjbcConstantId skipwhite

syn keyword ftjbcConstantType	Utf8
								\ Integer
								\ Float
								\ Long
								\ Double
								\ Class
								\ String
								\ FieldRef
								\ MethodRef
								\ InterfaceMethodRef
								\ NameAndType
								\ MethodHandle
								\ MethodType
								\ MethodDynamic
								\ Module
								\ Package contained nextgroup=ftjbcConstantId

" Only alow below that are between 0 and 65536 excluded.
syn match ftjbcConstantId		"#\d\{1,4}" contained nextgroup=ftjbcSeparator,ftjbcConstantId skipwhite
syn match ftjbcConstantId		"\(#6553[0-5]\)\|\(#655[0-2]\d\)\|\(#65[0-4]\d\d\)\|\(#6[0-4]\d\d\d\)\|\(#[0-5]\d\d\d\d\)" contained nextgroup=ftjbcSeparator,ftjbcConstantId skipwhite

" Comments
syn region ftjbcComment			start="/\*" end="\*/" contains=prlTodo,@Spell
syn match ftjbcCommentStar		contained "^\s*\*[^/]"me=e-1
syn match ftjbcCommentStar		contained "^\s*\*$"
syn match ftjbcComment			"//.*"

syn keyword ftjbcClassFlags		public
								\ final
								\ super
								\ interface
								\ abstract
								\ sythetic
								\ annotation
								\ enum
								\ module contained nextgroup=ftjbcClassFlags skipwhite

syn match ftjbcSpecialChar	contained "\(\\\"\)\|\(\\\\\)"
syn region ftjbcString		start='"' end='"' end='$' contains=ftjbcSpecialChar,@Spell nextgroup=ftjbcConstantId

syn cluster ftjbcConstant	contains=ftjbcConstantId,ftjbcClassFlags

syn match ftjbcSeparator ":" contained nextgroup=@ftjbcConstant,ftjbcSeparator skipwhite

" metadatas
syn region ftjbcMeta		start='\[' end=']' end='$'

hi def link ftjbcDefType		Statement
hi def link ftjbcDefinition		Statement
hi def link ftjbcConstantType	Type
hi def link ftjbcConstantId		Constant
hi def link ftjbcCommentStar	Comment
hi def link ftjbcComment		Comment
hi def link ftjbcClassFlags		StorageClass
hi def link ftjbcSpecialChar	SpecialChar
hi def link ftjbcString			String
hi def link ftjbcMeta			PreProc
