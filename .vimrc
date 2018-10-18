set nocompatible              "  be iMproved, required
filetype off                  "  required

"  set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"  alternatively, pass a path where Vundle should install plugins
" call vundle#begin(  '~/some/path/here')

"  let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"  The following are examples of different formats supported.
"  Keep Plugin commands between vundle#begin/end.
"  plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"  plugin from http://vim-scripts.org/vim/scripts.html
"  Plugin 'L9'
"  Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
"  git repos on your local machine (  i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"  The sparkup vim script is in a subdirectory of this repo called vim.
"  Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', { 'rtp': 'vim/'}
"  Install L9 and avoid a Naming conflict if you've already installed a
"  different version somewhere else.
"  Plugin 'ascenator/L9', { 'name': 'newL9'}
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Bundle 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'surround.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'jnurmine/Zenburn'


Plugin 'altercation/vim-colors-solarized'
"  All of your Plugins must be added before the following line
call vundle#end(  )            "  required
filetype plugin indent on    "  required
"  To ignore plugin indent changes, instead use:
" filetype plugin on
" 
"  Brief help
"  :PluginList       - lists configured plugins
"  :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"  :PluginSearch foo - searches for foo; append `!` to refresh local cache
"  :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" 
"  see :h vundle for more details or wiki for FAQ
"  Put your non-Plugin stuff after this line""""""""""""")"}"""}"")"""""""")"")"""

" Enable folding
set foldmethod=indent
set foldlevel=99

au BufNewFile,BufRead *.py
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set textwidth=79
set expandtab
set autoindent
set fileformat=unix

set t_Co=256


inoremap ( ()<ESC>i

inoremap [ []<ESC>i

inoremap { {}<ESC>i

inoremap < <><ESC>i

inoremap " ""<ESC>i

" Ctrl-a: Go to begin of line
inoremap <C-a> <esc>I

" Ctrl-e: Go to end of line
inoremap <C-e> <esc>A

" Ctrl-[bf]: Move cursor left/right
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" Ctrl-[hl]: Move left/right by word
"inoremap <C-h> <C-o>b
inoremap <C-l> <C-o>w

" Ctrl-[kj]: Move cursor up/down
""inoremap <C-k> <C-o>gk
inoremap <C-j> <C-o>gj
colorscheme zenburn
map <F10> :NERDTreeToggle<CR>
set incsearch
set hlsearch
"fcitx控制
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
autocmd InsertEnter * call Fcitx2zh()
