set nocompatible

filetype off    " required to load plugins

call plug#begin()
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" file type
filetype on
filetype plugin on
filetype indent on

let mapleader = " "

" Look and Feel
set background=dark
set ttyfast
set lazyredraw
set updatetime=300

" shows what you are typing as a command
set showcmd

" write settings
set confirm
set fileencoding=utf-8

" backup file settings
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Tab settings
set expandtab
set smarttab
set nojoinspaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set ts=2

" Paste
set showmode

" Indentation
set autoindent
set cindent
set smartindent

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" search settings
set hlsearch
set ignorecase
set incsearch
set smartcase

" syntax highlighting
syntax enable

" Numbers
set number
set numberwidth=4
set ruler

" status line
" set laststatus=2
" set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" set view
set scrolloff=5
set sidescrolloff=5

" wild menu
set wildmode=longest:full
set wildmenu

" Faster saving and exiting
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>x :x<CR>
" Open Vim configuration file for editing
nnoremap <silent><leader>2 :e ~/.vimrc<CR>
" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" Toggle relative line numbers
nnoremap <leader>rn :set relativenumber!<cr>

" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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
