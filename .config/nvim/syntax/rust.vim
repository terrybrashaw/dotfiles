" Vim syntax file
" Language:     Rust
" Cloned from https://github.com/rust-lang/rust.vim and heavily modified

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Default width defined by the Rust syle guide
" set colorcolumn=100

" Control flow keywords
syn keyword     rustControl             match if else break continue return yield for in loop while

" Keywords
syn keyword     rustKeyword             as impl let macro where unsafe super const static
syn keyword     rustKeyword             box nextgroup=rustBoxPlacement skipwhite skipempty
syn keyword     rustKeyword             extern nextgroup=rustExternCrate skipwhite skipempty
syn keyword     rustKeyword             fn nextgroup=rustFuncName skipwhite skipempty
syn keyword     rustKeyword             pub nextgroup=rustPubScope skipwhite skipempty
syn keyword     rustKeyword             use nextgroup=rustModPath skipwhite skipempty
syn keyword     rustKeyword             mod trait nextgroup=rustIdentifier skipwhite skipempty
syn keyword     rustStorage             move mut ref
syn keyword     rustTypedef             type nextgroup=rustIdentifier skipwhite skipempty
syn keyword     rustStructure           struct enum nextgroup=rustIdentifier skipwhite skipempty
syn keyword     rustUnion               union nextgroup=rustIdentifier skipwhite skipempty contained
syn match       rustSigil               display /&\s\+[&~@*][^)= \t\r\n]/he=e-1,me=e-1
syn match       rustSigil               display /[&~@*][^)= \t\r\n]/he=e-1,me=e-1

" Function name
syn match       rustFuncName            "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

" Reserved keywords
syn keyword     rustReservedKeyword     alignof become do offsetof priv pure sizeof typeof unsized abstract virtual final override

" `self`. I like having this uniquely highlighted.
syn keyword     rustSelf                self

" Literals
syn keyword     rustBoolean             true false
syn match       rustDecNumber           display "\<[0-9][0-9_]*\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match       rustHexNumber           display "\<0x[a-fA-F0-9_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match       rustOctNumber           display "\<0o[0-7_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match       rustBinNumber           display "\<0b[01_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
" Special case for numbers of the form "1." which are float literals, unless followed by
" an identifier, which makes them integer literals with a method call or field access,
" or by another ".", which makes them integer literals followed by the ".." token.
" (This must go first so the others take precedence.)
syn match       rustFloat               display "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
" To mark a number as a normal float, it must have at least one of the three things integral values don't have:
" a decimal point and more numbers; an exponent; and a type suffix.
syn match       rustFloat               display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match       rustFloat               display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match       rustFloat               display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"
syn match       rustEscapeError         display contained /\\./
syn match       rustEscape              display contained /\\\([nrt0\\'"]\|x\x\{2}\)/
syn match       rustEscapeUnicode       display contained /\\u{\%(\x_*\)\{1,6}}/
syn match       rustStringContinuation  display contained /\\\n\s*/
syn region      rustString              start=+b"+ skip=+\\\\\|\\"+ end=+"+ contains=rustEscape,rustEscapeError,rustStringContinuation
syn region      rustString              start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=rustEscape,rustEscapeUnicode,rustEscapeError,rustStringContinuation,@Spell
syn region      rustString              start='b\?r\z(#*\)"' end='"\z1' contains=@Spell
"rustLifetime must appear before rustCharacter, or chars will get the lifetime highlighting
syn match       rustLifetime            display "\'\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*"
syn match       rustLabel               display "\'\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*:"
syn match       rustCharacterInvalid    display contained /b\?'\zs[\n\r\t']\ze'/
syn match       rustCharacterInvalidUnicode display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syn match       rustCharacter           /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=rustEscape,rustEscapeError,rustCharacterInvalid,rustCharacterInvalidUnicode
syn match       rustCharacter           /'\([^\\]\|\\\(.\|x\x\{2}\|u{\%(\x_*\)\{1,6}}\)\)'/ contains=rustEscape,rustEscapeUnicode,rustEscapeError,rustCharacterInvalid


" Comments
syn region rustCommentLine                                                  start="//"                      end="$"   contains=rustTodo,@Spell
syn region rustCommentLineDoc                                               start="//\%(//\@!\|!\)"         end="$"   contains=rustTodo,@Spell
syn region rustCommentLineDocError                                          start="//\%(//\@!\|!\)"         end="$"   contains=rustTodo,@Spell contained
syn region rustCommentBlock             matchgroup=rustCommentBlock         start="/\*\%(!\|\*[*/]\@!\)\@!" end="\*/" contains=rustTodo,rustCommentBlockNest,@Spell
syn region rustCommentBlockDoc          matchgroup=rustCommentBlockDoc      start="/\*\%(!\|\*[*/]\@!\)"    end="\*/" contains=rustTodo,rustCommentBlockDocNest,@Spell
syn region rustCommentBlockDocError     matchgroup=rustCommentBlockDocError start="/\*\%(!\|\*[*/]\@!\)"    end="\*/" contains=rustTodo,rustCommentBlockDocNestError,@Spell contained
syn region rustCommentBlockNest         matchgroup=rustCommentBlock         start="/\*"                     end="\*/" contains=rustTodo,rustCommentBlockNest,@Spell contained transparent
syn region rustCommentBlockDocNest      matchgroup=rustCommentBlockDoc      start="/\*"                     end="\*/" contains=rustTodo,rustCommentBlockDocNest,@Spell contained transparent
syn region rustCommentBlockDocNestError matchgroup=rustCommentBlockDocError start="/\*"                     end="\*/" contains=rustTodo,rustCommentBlockDocNestError,@Spell contained transparent
" FIXME: this is a really ugly and not fully correct implementation. Most
" importantly, a case like ``/* */*`` should have the final ``*`` not being in
" a comment, but in practice at present it leaves comments open two levels
" deep. But as long as you stay away from that particular case, I *believe*
" the highlighting is correct. Due to the way Vim's syntax engine works
" (greedy for start matches, unlike Rust's tokeniser which is searching for
" the earliest-starting match, start or end), I believe this cannot be solved.
" Oh you who would fix it, don't bother with things like duplicating the Block
" rules and putting ``\*\@<!`` at the start of them; it makes it worse, as
" then you must deal with cases like ``/*/**/*/``. And don't try making it
" worse with ``\%(/\@<!\*\)\@<!``, either...

" Folding
syn region rustFoldBraces start="{" end="}" transparent fold

" Identifier
syn match     rustIdentifier  contains=rustIdentifierPrime "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

" Misc
syn match     rustArrowCharacter display "->"
syn match     rustQuestionMark display "?\([a-zA-Z]\+\)\@!"

" Mappings to vim syntax
hi def link rustControl                 Conditional
hi def link rustKeyword                 Keyword
hi def link rustTypedef                 Keyword
hi def link rustStructure               Keyword
hi def link rustUnion                   Keyword
hi def link rustCommentLine             Comment
hi def link rustCommentBlock            Comment
hi def link rustCommentLineDoc          SpecialComment
hi def link rustCommentBlockDoc         SpecialComment
hi def link rustFloat                   Float
hi def link rustDecNumber               Number
hi def link rustHexNumber               Number
hi def link rustOctNumber               Number
hi def link rustBinNumber               Number
hi def link rustBoolean                 Boolean
hi def link rustEscape                  Special
hi def link rustEscapeError             Error
hi def link rustStringContinuation      Special
hi def link rustString                  String
hi def link rustCharacterInvalid        Error
hi def link rustCharacterInvalidUnicode Error
hi def link rustCharacter               Character
hi def link rustConstant                Constant
hi def link rustFuncName                Function
hi def link rustIdentifier              Identifier
hi def link rustSigil                   StorageClass
hi def link rustLifetime                StorageClass
hi def link rustStorage                 StorageClass

" Plugin settings
let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}

" Misc
syn sync minlines=200
syn sync maxlines=500
let b:current_syntax = "rust"




" Unused stuff. It's kept here to see what's been disabled.

" syn keyword     rustType                isize usize char bool u8 u16 u32 u64 u128 f32
" syn keyword     rustType                f64 i8 i16 i32 i64 i128 str Self
" syn keyword rustPubScopeCrate crate contained
" syn match rustPubScopeDelim /[()]/ contained
" syn match rustPubScope /([^()]*)/ contained contains=rustPubScopeDelim,rustPubScopeCrate,rustSuper,rustModPath,rustModPathSep,rustSelf transparent
" syn keyword rustExternCrate crate contained nextgroup=rustIdentifier,rustExternCrateString skipwhite skipempty
" This is to get the `bar` part of `extern crate "foo" as bar;` highlighting.
" syn match rustExternCrateString /".*"\_s*as/ contained nextgroup=rustIdentifier skipwhite transparent skipempty contains=rustString,rustOperator
" syn keyword rustObsoleteExternMod mod contained nextgroup=rustIdentifier skipwhite skipempty
" syn region rustBoxPlacement matchgroup=rustBoxPlacementParens start="(" end=")" contains=TOP contained
" syn region rustBoxPlacementBalance start="(" end=")" containedin=rustBoxPlacement transparent
" syn region rustBoxPlacementBalance start="\[" end="\]" containedin=rustBoxPlacement transparent
" syn region rustMacroRepeat matchgroup=rustMacroRepeatDelimiters start="$(" end=")" contains=TOP nextgroup=rustMacroRepeatCount
" syn match rustMacroRepeatCount ".\?[*+]" contained
" syn match rustMacroVariable "$\w\+"
" syn match rustModPath     "\w\(\w\)*::[^<]"he=e-3,me=e-3
" syn match rustModPathSep  "::"
" syn match rustFuncCall    "\w\(\w\)*("he=e-1,me=e-1
" syn match rustFuncCall    "\w\(\w\)*::<"he=e-3,me=e-3 " foo::<T>();
" syn match rustCapsIdent    display "[A-Z]\w\(\w\)*"
" syn match rustOperator     display "\%(+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\)=\?"
" syn match rustOperator     display "&&\|||"
" syn match rustMacro       '\w\(\w\)*!' contains=rustAssert,rustPanic
" syn match rustMacro       '#\w\(\w\)*' contains=rustAssert,rustPanic
" syn region rustAttribute   start="#!\?\[" end="\]" contains=rustString,rustDerive,rustCommentLine,rustCommentBlock,rustCommentLineDocError,rustCommentBlockDocError
" syn region rustDerive      start="derive(" end=")" contained contains=rustDeriveTrait

" For the benefit of delimitMate
" syn region rustLifetimeCandidate display start=/&'\%(\([^'\\]\|\\\(['nrt0\\\"]\|x\x\{2}\|u{\%(\x_*\)\{1,6}}\)\)'\)\@!/ end=/[[:cntrl:][:space:][:punct:]]\@=\|$/ contains=rustSigil,rustLifetime
" syn region rustGenericRegion display start=/<\%('\|[^[cntrl:][:space:][:punct:]]\)\@=')\S\@=/ end=/>/ contains=rustGenericLifetimeCandidate
" syn region rustGenericLifetimeCandidate display start=/\%(<\|,\s*\)\@<='/ end=/[[:cntrl:][:space:][:punct:]]\@=\|$/ contains=rustSigil,rustLifetime

" hi def link rustDecNumber       rustNumber
" hi def link rustHexNumber       rustNumber
" hi def link rustOctNumber       rustNumber
" hi def link rustBinNumber       rustNumber
" hi def link rustIdentifierPrime rustIdentifier
" hi def link rustTrait           rustType
" hi def link rustDeriveTrait     rustTrait
" hi def link rustMacroRepeatCount   rustMacroRepeatDelimiters
" hi def link rustMacroRepeatDelimiters   Macro
" hi def link rustMacroVariable Define
" hi def link rustSigil         StorageClass
" hi def link rustEscape        Special
" hi def link rustEscapeUnicode rustEscape
" hi def link rustEscapeError   Error
" hi def link rustStringContinuation Special
" hi def link rustString        String
" hi def link rustCharacterInvalid Error
" hi def link rustCharacterInvalidUnicode rustCharacterInvalid
" hi def link rustCharacter     Character
" hi def link rustNumber        Number
" hi def link rustBoolean       Boolean
" hi def link rustEnum          rustType
" hi def link rustConstant      Constant
" hi def link rustFloat         Float
" hi def link rustArrowCharacter rustOperator
" hi def link rustOperator      Operator
" hi def link rustKeyword       Keyword
" hi def link rustTypedef       Keyword " More precise is Typedef, but it doesn't feel right for Rust
" hi def link rustStructure     Keyword " More precise is Structure
" hi def link rustUnion         rustStructure
" hi def link rustPubScopeDelim Delimiter
" hi def link rustPubScopeCrate rustKeyword
" hi def link rustSuper         rustKeyword
" hi def link rustUnsafeKeyword Exception
" hi def link rustReservedKeyword Error
" hi def link rustRepeat        Conditional
" hi def link rustConditional   Conditional
" hi def link rustIdentifier    Identifier
" hi def link rustCapsIdent     rustIdentifier
" hi def link rustModPath       Include
" hi def link rustModPathSep    Delimiter
" hi def link rustFunction      Function
" hi def link rustFuncName      Function
" hi def link rustShebang       Comment
" hi def link rustCommentLine   Comment
" hi def link rustCommentLineDoc SpecialComment
" hi def link rustCommentLineDocError Error
" hi def link rustCommentBlock  rustCommentLine
" hi def link rustCommentBlockDoc rustCommentLineDoc
" hi def link rustCommentBlockDocError Error
" hi def link rustAssert        PreCondit
" hi def link rustPanic         PreCondit
" hi def link rustMacro         Macro
" hi def link rustType          Type
" hi def link rustTodo          Todo
" hi def link rustAttribute     PreProc
" hi def link rustDerive        PreProc
" hi def link rustDefault       StorageClass
" hi def link rustStorage       StorageClass
" hi def link rustObsoleteStorage Error
" hi def link rustLifetime      Keyword
" hi def link rustLabel         Label
" hi def link rustExternCrate   rustKeyword
" hi def link rustObsoleteExternMod Error
" hi def link rustBoxPlacementParens Delimiter
