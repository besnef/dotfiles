" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
"
" Original Author:	     Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Modified by :          Ben McCormick
" Last change:	         2014 June 8
"
" To use it, copy it to
"  for Unix based systems (including OSX and Linux):  ~/.vimrc
"  for Windows :  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'cosminadrianpopescu/vim-sql-workbench'
Plugin 'tpope/vim-dispatch'
Plugin 'dbext.vim'
"Plugin 'omnisharp/omnisharp-vim'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Enable file type detection and do language-dependent indenting.
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Set font with powerline symbols patched
"set guifont=Sauce_Code_Powerline:h9:cANSI

" Switch syntax highlighting on
syntax on
syntax enable		"What's the difference between 'on' and 'enable'?
if has('gui_running')
	" GUI colors
	set background=dark
	colorscheme solarized
else
	" Terminal colors
endif

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
"if &term == 'xterm-256color' || &term == 'screen-256color'
    "let &t_ti.="\e[1 q"
    "let &t_SI.="\e[5 q"
    "let &t_EI.="\e[1 q"
    "let &t_te.="\e[0 q"
"endif

if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" When searching ignore case unless the search string contains uppercase
" letters
set ignorecase
set smartcase

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" airline configuration
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1

" Hosted 110 Server (Microsoft SQL Server)
let g:dbext_default_profile_hosted110 = 'type=SQLSRV:user=sa:passwd=!L0gICsprinter!30:srvname=74.213.157.110:dbname=Bladenboro_Logics:bin_path=C:\Program Files\Microsoft SQL Server\120\Tools\Binn'
let g:dbext_default_profile_blackheart14 = 'type=SQLSRV:user=sa:passwd=logics:srvname=blackheart\MSSQLServer14:dbname=DorchesterTest_Logics'

" Aliases
"command Bd bp\|bd \#


