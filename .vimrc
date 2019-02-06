" CONFIG FOR VUNDLE
" simply run :PluginInstall in vim after adding new desired plugin for Vundle
" to work its magic
filetype off		"required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all plugins below 

"...
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1	"see docstrings of folded code

Plugin 'jnurmine/Zenburn'	" Color theme that's easy on the eyes
colorscheme zenburn "Need to go into Zenburn folder and move zenburn.vim to .vim/colors
colors zenburn
set t_Co=256

Plugin 'scrooloose/nerdtree'	" Files, folder structure

" Two lines below shows NERDTree when vim starts with no file arguments. i.e: vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Two lines below show NERDTree when vim starts with directory argument, not specific file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close vim if NERDTree is the only window left and :q is executed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plugin 'ctrlpvim/ctrlp.vim'	" Fuzzy file, buffer, mru, tag, etc finder

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}	"displays state/mode info
set laststatus=2 "always show the state/mode/status info

"Plugin 'ervandew/supertab'    "use tab completion in insert mode. Renable
"late when figure out how to map tab space to another key combination.  

" All Plugins must be added before the following line
call vundle#end()		"required
filetype plugin indent on	"required


" CONFIG FOR PATHOGEN

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
let python_highlight_all=1	"want pretty code
syntax on

let g:pymode_python = 'python3'
set nu 
set rnu

" VIM CONFIGS
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding 
set foldmethod=indent
set foldlevel=99

"Enable folding with the spacebar
noremap <space> za

"python with virtualenv support
py3 << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Disable stupid backup and swap files because they trigger too many events
" for file system watchers
"set nobackup
"set nowritebackup
"set noswapfile

" Make search case insensitive
set hlsearch    " highlight search results
set incsearch   " search as i type. so match partial.
set ignorecase  "ignore case
set smartcase

"Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

"easier moving of code blocks
vnoremap < <gv  " better  indentation
vnoremap > >gv  " better indentation
