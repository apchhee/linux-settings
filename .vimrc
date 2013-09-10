" this .vimrc says thanks to rizar
"
set nocompatible                         " Выключаем совместимость с vi

" Set leader to comma
let mapleader = ","

""" Mappings section 
map <F2> :w<CR>
" Ctrl+PageUp-Down to change buffer
map <C-PageUp> :bp<CR>
map <C-PageDown> :bn<CR>
nmap <ESC>[5;5~ <C-PageUp>        " i love you, screen
nmap <ESC>[6;5~ <C-PageDown>      " 
map <C-m> <C-x><C-u>

" ;; to exit edit mode, type ; to : in normal mode
imap ;; <Esc>                       
nmap ; :
map <leader>x :!chmod +x %<CR>            " Make executable

""" Mappings for olympiads
map <leader>r :!./%:r<CR>
map <leader>b :!g++ -Wall -Wextra -g % -o %:r<CR>

let &tags = &tags . " .tags;/ tags;/"
" Completion settings
set completeopt=longest,menuone,menu
set pumheight=15                         " Limit popup menu height
set showmatch                            " Show matching bracket

set hidden                               " many buffers in memory

set autoread                           " Перечитывать открытые файлы если они были изменены извне
filetype on                              " Включаем распознавание типов файлов и типо-специфичные плагины
filetype plugin on
filetype indent plugin on

set encoding=utf-8                       " Кодировка по-умолчанию utf-8
set termencoding=utf-8                   " Кодировка терминала тоже utf-8
set fileencodings=utf-8,cp1251,koi8-r    " Список кодировок, которые vim будет перебирать при открытии файла

set novisualbell                         " Выключаем бибиканье и мигание
set t_vb=

syntax on                                " Включаем подсветку синтаксиса
colorscheme wombat256mod                 " Название используемой темы
set t_Co=256                             " Используемый терминал поддерживает 256 цветов (включить можно, но возможно…)

set number                               " Показывать номера строк
" Show currently typed command
" in lower right corner
set showcmd
set wildmenu
set ruler                                " line and column number, separated by comma

set confirm
" Don't wrap long lines
set nowrap

" Hightlighting
set cursorline

" Tabs mapping 
map <C-A> <ESC>:tabnew<CR>
map <C-X> <ESC>:tabclose<CR>

" Tabulation settings 
set expandtab
set shiftwidth=4
set tabstop=4

" Enable backspace
set bs=2

" autocmd don't like multiple loading
if !exists("auto_cmds_loaded")
    let auto_cmds_loaded=1
    autocmd BufWritePost .vimrc :source ~/.vimrc " always reload .vimrc after saving
    autocmd BufWritePost .vim/colors/wombat256mod.vim :source ~/.vimrc
    autocmd FileType c,cpp,h,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e "remove trailing spaces
endif

set laststatus=2   " always show filename and current mode

set diffopt+=iwhite " ignore whitespaces in diff

" identation
set cindent
set smartindent
set autoindent
" C++ indentation: place scope declarations
" like public: at the beginning of the line [g0]
" Open braces indentation: add only one shiftwidth
" after an unclosed ( in previous line [(1s]
set cinoptions=g0,(1s

" Search
set ignorecase      " Ignore case of search strings
set smartcase       " ...unless they have upper case chars
set hlsearch        " Highlight search results
set incsearch       " Incremental search (as you type)
" Select Perl-compatible regexes by default ("very magic")
nnoremap / /\v
vnoremap / /\v
set gdefault        " Search globally by default, g switches back
nnoremap <leader><space> :noh<CR>       " Clear search highlighting

" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set history=1000
set undolevels=1000
set shiftround

set ttyfast             " Fast terminal connection - smoother redrawing

vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

let g:miniBufExplVSplit=25 " minu buf explorer width

call pathogen#infect()

