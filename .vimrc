:syntax on
python << EOF
import os
import sys
import vim
for p in sys.path:
	if os.path.isdir(p):
		vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
"use ctags
set tags+=$HOME/.vim/tags/python.ctags
"remap tag jumping
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>
"Code Completion for python
autocmd FileType python set omnifunc=pythoncomplete#Complete
"remap code complete to ctrl space
inoremap <Nul> <C-x><C-o>
"tab nav with alt left or right
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
filetype plugin indent on
python << EOL
import vim
def EvaluateCurrentRange():
	eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-h> :py EvaluateCurrentRange()
