" pathogen
execute pathogen#infect()
filetype plugin indent on


" NERDTree
autocmd vimenter * NERDTree
"let NERDTreeShowHidden=1
"" let NERDTreeIgnore=['\.pyc$', '\.egg-info$']

"python-mode

"solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
