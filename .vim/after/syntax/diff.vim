syn match diffGit "^index [0-9a-f]\+\.\.[0-9a-f]\+\( [0-7]\{6}\)\?"
syn match diffGit "^\(new\|deleted\) file mode [0-7]\{6}"
syn match diffGit "^\(old\|new\) mode [0-7]\{6}"
syn match diffGit "^similarity index [0-9]\+%"
syn match diffGit "^rename \(from\|to\) .*"

hi def link diffGit ModeMsg
" hi def link diffGit SpecialKey
