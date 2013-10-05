" ##############
" ## Settings ##
" ##############

set nocompatible                " Enable new stuff
set incsearch                   " do incremental searching
set showcmd                     " display incomplete commands
set noshowmode                  " vim-powerline takes care of this
set ruler                       " show the cursor position all the time
set history=50                  " keep 50 lines of command line history
set ttyfast                     " Tell vim we're using a fast terminal connection
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set laststatus=2                " vim-powerline needs this to display status when opening first buffer
set number
set expandtab
set tabstop=4
set scrolloff=2
set shiftwidth=4
set background=dark

set nocursorline                " Performance
set nocursorcolumn
syntax sync minlines=256

set foldmethod=indent           " Python
set foldlevel=99

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


" ###############
" ## Shortcuts ##
" ###############
" http //vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)

" Remap 'jk' to the Esc key; http://vim.wikia.com/wiki/Avoid_the_escape_key
:imap jk <Esc>

" Shortcuts for :set list and :set nolist
:nmap ,L :set nolist<Esc>
:nmap ,l :set list listchars=trail:¬,eol:$,tab:››<Esc>

" Shortcuts for :set number and :set nonumber
:nmap ,n :set nonumber<Esc>
:nmap ,N :set number<Esc>

" Set paste-mode with <,p>
nnoremap ,p :set invpaste<CR>

" CDC = Change to Directory of Current file
" http://vim.wikia.com/wiki/Change_to_the_directory_of_the_current_file
command CDC cd %:p:h

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" NERDTreeToggle - Open nicely formatted vsp with NerdTree browser
map T :NERDTreeToggle<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" #############
" ## Autocmd ##
" #############

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection and use the default filetype settings
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " Always trim whitespace when writing a file
    autocmd BufWritePre * :%s/\s\+$//e

  augroup END
else
  set autoindent		" always set autoindenting on
endif


" ###############
" ## Functions ##
" ###############

" Sort lines based on length, used: {range}call SortLines(),
" {range}call SortLines(1) for reversed order
function! SortLines(...) range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    if a:0
        execute a:firstline . "," . a:lastline . 'sort n'
    else
        execute a:firstline . "," . a:lastline . 'sort! n'
    endif
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction


" #######################
" ## Configure Plugins ##
" #######################

" Pathogen (makes it easier to install plugins)
" https://github.com/tpope/vim-pathogen
call pathogen#infect()
call pathogen#incubate()
call pathogen#helptags()

" Syntastic is a sytax checking plugin that can be done on demand or
" automatically. Works with ... Java, ... Python, ...
" https://github.com/scrooloose/syntastic
let g:syntastic_python_checkers=['pylint']

" vim-powerline  - cooler vim status bar
" https://github.com/Lokaltog/vim-powerline
let g:bufferline_echo=0
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1

" NERDTree is a better filebrowsing plugin
" https://github.com/scrooloose/nerdtree
let NERDTreeIgnore = ['\.pyc$']

" Controlp makes finding files in a project super easy.
" https://github.com/kien/ctrlp.vim

" Fugitivie is git integration
" https://github.com/tpope/vim-fugitive
