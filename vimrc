"
" PLUGINS
" NOTE: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
"
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ciaranm/detectindent'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'
Plug 'preservim/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

call plug#end()


"
" GENERAL SETTINGS
"

" Use Vim settings, rather then Vi settings
if &compatible
  set nocompatible
endif

" Language
let $LANG='en'
set langmenu=en

" Faster redrawing (improve slow scrolling)
set ttyfast

" Set to auto read when a file is changed from the outside
au FocusGained,BufEnter * checktime

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
set nowritebackup

" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine. By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" Only xterm can grab the mouse events when using the shift key, for other
" terminals use ":", select text and press Esc.
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

" True color support
if (has("termguicolors"))
  set termguicolors
endif

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

" Copy paste between vim and everything else
set clipboard=unnamed,unnamedplus

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Required to keep multiple buffers open
set hidden

" Display incomplete commands
set showcmd

" Show @@@ in the last line if it is truncated.
set display=truncate

" Automatically wrap left and right
set whichwrap+=<,>,h,l,[,]

" Display long lines as just one line
set nowrap

" Horizontal splits will automatically be below
set splitbelow

" Vertical splits will automatically be to the right
set splitright

" Relative line number
set relativenumber

" Show current line
set number

" Highlight line with cursor
set cursorline

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" Change the number of space characters inserted for indentation
set shiftwidth=4

" Insert 4 spaces for a tab
set tabstop=4

" Auto indent
set autoindent

" Makes indenting smart
set smartindent

" Makes popup menu smaller
set pumheight=10

" Code folding
set foldenable
set foldmethod=indent
set foldlevelstart=10
nnoremap <space> za

" Add a bit extra margin to the left
" set foldcolumn=1

" Always show sign column
set signcolumn=yes

" Always show tabs
set showtabline=2

" Update faster (e.g. track git changes)
set updatetime=100


"
" CUSTOM KEYS
"

" Disable arrow keys, hackers use hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Quit files
noremap <C-q> :q<CR>

" Sane split commands
noremap <leader>sh :<C-u>split<CR>
noremap <leader>sv :<C-u>vsplit<CR>

" Buffers shortcuts
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>c :bd<CR>

" Remap VIM 0 to first non-blank character
map 0 ^

" Double escape to clear search
nnoremap <esc><esc> :noh<return><esc>

" Visual mode pressing // searches for the current selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Opens an edit command with the path of the currently edited file filled in
" Use with 'pbrisbin/vim-mkdir' for extra convenience
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
" noremap <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Toggle and untoggle spell checking
" map <leader><leader>s :setlocal spell!<CR>


"
" PLUGIN SETTINGS
"


" PLUGIN: ciaranm/detectindent
"
" Preferred settings
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

" Run on startup
autocmd BufReadPost * :DetectIndent


" PLUGIN: dense-analysis/ale
"
let g:ale_completion_enabled = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0


" PLUGIN: morhetz/gruvbox
"
" Colorscheme
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_improved_strings=0
let g:gruvbox_sign_column='bg0'
set background=dark
colorscheme gruvbox

" Statusline
let g:currentmode={
  \ 'n'  : 'Normal',
  \ 'no' : 'Normal·Operator Pending',
  \ 'v'  : 'Visual',
  \ 'V'  : 'V·Line',
  \ '^V' : 'V·Block',
  \ 's'  : 'Select',
  \ 'S'  : 'S·Line',
  \ '^S' : 'S·Block',
  \ 'i'  : 'Insert',
  \ 'R'  : 'Replace',
  \ 'Rv' : 'V·Replace',
  \ 'c'  : 'Command',
  \ 'cv' : 'Vim Ex',
  \ 'ce' : 'Ex',
  \ 'r'  : 'Prompt',
  \ 'rm' : 'More',
  \ 'r?' : 'Confirm',
  \ '!'  : 'Shell',
  \ 't'  : 'Terminal'
  \ }

set laststatus=2
set statusline=%2*
set statusline+=\ 
set statusline+=%1*
set statusline+=\ 
set statusline+=%{toupper(g:currentmode[mode()])}
set statusline+=\ 
set statusline+=%2*
set statusline+=\ 
set statusline+=%r
set statusline+=\ 
set statusline+=%F
set statusline+=\ 
set statusline+=%m
set statusline+=%3*
set statusline+=\ 
set statusline+=%{FugitiveStatusline()}
set statusline+=%=
set statusline+=%4*
set statusline+=%y
set statusline+=\ 
set statusline+=\|
set statusline+=\ 
set statusline+=%{&ff}
set statusline+=\ 
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=\ 
set statusline+=\|
set statusline+=%2*
set statusline+=\ ln\ 
set statusline+=%l
set statusline+=:
set statusline+=%c
set statusline+=/
set statusline+=%L
set statusline+=\ 
set statusline+=%P
set statusline+=\ 

hi User1 ctermbg=109 ctermfg=235 guibg=#83a598 guifg=#282828
hi User2 ctermbg=235 ctermfg=246 guibg=#282828 guifg=#a89984
hi User3 ctermbg=235 ctermfg=108 guibg=#282828 guifg=#8ec07c
hi User4 ctermbg=235 ctermfg=239 guibg=#282828 guifg=#504945


" PLUGIN: junegunn/fzf.vim
"
" Respect .gitignore
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden -g "!.git/"'

" Key bindings
nnoremap <leader><leader>f :Files<CR>
nnoremap <leader><leader>g :GFiles<CR>
nnoremap <leader><leader>r :Rg<CR>
nnoremap <leader><leader>b :Buffers<CR>
nnoremap <leader><leader>m :Marks<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" PLUGIN: luochen1990/rainbow
"
let g:rainbow_active = 1


" PLUGIN: preservim/tagbar
"
nmap <F8> :TagbarToggle<CR>
