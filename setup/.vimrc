" pathogen
execute pathogen#infect()
filetype plugin indent on


" NERDTree
"autocmd vimenter * NERDTree
"let NERDTreeShowHidden=1
"" let NERDTreeIgnore=['\.pyc$', '\.egg-info$']

"python-mode

"solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


"new
colorscheme molokai
set clipboard=unnamed
set t_Co=256
set colorcolumn=80
"set number
""#set nowrap
"#set list
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set shiftround
set expandtab
"#set hlsearch
""#set incsearch
set ignorecase

autocmd BufWritePre * :%s/\s\+$//e
