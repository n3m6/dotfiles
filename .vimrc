set nocompatible

" shows what you are typing as a command
set showcmd

" write settings
set confirm
set fileencoding=utf-8

" backup file settings
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" edit settings
set expandtab
set smarttab
set nojoinspaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set ts=2
set showmode
set autoindent

" search settings
set hlsearch
set ignorecase
set incsearch
set smartcase

" file type
filetype on
filetype plugin on
filetype indent on

" syntax highlighting
syntax enable

" show numbers
set number

" status line
" set laststatus=2
" set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
" set ruler

" set view
set scrolloff=5
set sidescrolloff=5

" wild menu
set wildmode=longest:full
set wildmenu

" automatic commands
if has('autocmd')
        " file type specific automatic commands

        " tuning textwidth for Java code
        autocmd FileType java setlocal textwidth=132
        if has('gui_running')
                autocmd FileType java setlocal columns=136
        endif

        " don't replace Tabs with spaces when editing makefiles
        autocmd Filetype makefile setlocal noexpandtab

        " disable automatic code indentation when editing TeX and XML files
        autocmd FileType tex,xml setlocal indentexpr=

        " clean-up commands that run automatically on write; use with caution

        " delete empty or whitespaces-only lines at the end of file
        autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

        " replace groups of empty or whitespaces-only lines with one empty line
        autocmd BufWritePre * :%s/\(\s*\n\)\{3,}/\r\r/ge

        " delete any trailing whitespaces
        autocmd BufWritePre * :%s/\s\+$//ge
endif
