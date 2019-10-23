syn clear cPreCondit cPreProc cDefine
syn keyword cPreProc define	undef error if elif else endif include import using ifdef ifndef line pragma contained
syn region cPreProcRegion oneline contains=ALL matchgroup=PreProc keepend start="^\s*#\s*" end="$"
syn match cMacroName "\(^\s*#\s*\<\(ifdef\|ifndef\|define\|undef\)\>\)\@<=\s*\<\I\i*" contained
