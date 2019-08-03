"
" DIFF folding script
" put in ~/.vim/after/ftplugin/diff.vim
"
" NOTES:
"  * works only with unified diffs
"  * a line that starts from # is considered a comment and does not break a
"    fold, one can later do grep -v ^# and restore original patch.
"

if !exists("*Diff_fold_level")

function Diff_fold_level()
  let line = getline(v:lnum)
  if line =~ '^------------------------------------------------------------$'
    let b:is_bzr_show= 1;
    return '>1'
  elseif line =~ '^\(diff\|===\) '
    return '>' . (1 + b:is_bzr_show)
  elseif line =~ '^\(new\|deleted\) file mode [0-7]\+'
    return '='
  elseif line =~ '^\(old\|new\) mode [0-7]\+'
    return '='
  elseif line =~ '^similarity index [0-9]\+%'
    return '='
  elseif line =~ '^rename \(from\|to\) '
    return '='
  elseif line =~ '^index [0-9a-f]\+\.\.[0-9a-f]\+'
    return '='
  elseif line =~ '^--- '
    return (getline(v:lnum+1) =~ '+++ ' ? 1 : 2) + b:is_bzr_show
  elseif line =~ '^+++ '
    return 1 + b:is_bzr_show
  elseif line =~ '^@@ -'
    return '>' . (2 + b:is_bzr_show)
  elseif line =~ '^[-#+ ]'
    return 2 + b:is_bzr_show
  elseif line =~ '^$'
    return '='
  else
    return b:is_bzr_show
  endif
endfunction

function Diff_fold_text()
  let line = getline(v:foldstart)
  if line =~ '^------------------------------------------------------------$'
    let revno = strpart(getline(v:foldstart + 1), 7)
    let committer = strpart(getline(v:foldstart + 2), 11)
    let message = strpart(getline(v:foldstart + 6), 2)
    return '+-- ' . (v:foldend-v:foldstart) . ' lines: ' .message
  elseif line =~ '^diff --git a/'
    let what = getline(v:foldstart + 1)
    if what =~ '^new '
      let w = 'added'
    elseif what =~ '^deleted'
      let w = 'deleted'
    elseif what =~ '^similarity index 100%'
      let w = 'renamed'
    elseif what =~ '^similarity index '
      let w = 'renamed, modified'
    else
      let w = 'modified'
    endif
    let idx = stridx(line, ' b/') + 3
    return '[' . w . '] ' . (v:foldend-v:foldstart) . ' lines: ' . strpart(line, idx)
  else
    return foldtext()
  endif
endfunction

function Reviewed_diff_to_mail_reply()
  setlocal foldmethod=expr
  setlocal foldexpr=Diff_fold_level()
  %foldclose!           " close all folds
  %g/^#/foldopen        " open folds with review comments
  folddoclosed d        " and delete the rest
  %foldopen!
  setlocal foldmethod=manual
  setf mail
  file %.mail
  %s/^/> /
  %s/^> # \?//
endfunction
command DiffToMail call Reviewed_diff_to_mail_reply()

endif

if !exists("*b:is_bzr_show")
  setlocal foldmethod=expr
  setlocal foldexpr=Diff_fold_level()
  setlocal foldtext=Diff_fold_text()
  let b:is_bzr_show= getline(1) =~ '^------------------------------------------------------------$'
  %foldopen!
endif

