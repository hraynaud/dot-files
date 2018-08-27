set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"COLOR SCHEMES
"=========================================================
Plugin 'altercation/vim-colors-solarized'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Rails
Plugin 'tpope/vim-rails'
" Rspec
"Plugin 'thoughtbot/vim-rspec'
Plugin 'janko-m/vim-test'
" file tree
Plugin 'scrooloose/nerdtree'
" file tree and tabs interaction
Plugin 'jistr/vim-nerdtree-tabs'
" commenting
Plugin 'scrooloose/nerdcommenter'
" fuzzy file open
Plugin 'kien/ctrlp.vim'
" popup completion menu
Plugin 'AutoComplPop'
" tags list navigation
Plugin 'taglist.vim'
" git integration
Plugin 'tpope/vim-fugitive'
" syntax checking on save
Plugin 'scrooloose/syntastic'
" TextMate-style snippets
Plugin 'msanders/snipmate.vim'
" manipulation of surraunding parens, quotes, etc.
Plugin 'tpope/vim-surround'
" vertical alignment tool
Plugin 'tsaleh/vim-align'
" 'ag' searching integration
Plugin 'rking/ag.vim'
" buffers
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'Rename.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ctags.vim.git'
Plugin 'leafgarland/typescript-vim'
Plugin 'bendavis78/vim-polymer'
Plugin 'azakus/vim-webcomponents'
Plugin 'tpope/vim-dispatch'
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"Color Scheme Config
"---------------------------------------------------------
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
set guifont=Monaco:h13

filetype plugin indent on    " required

:au FocusLost * silent! wa

:set autowrite
" Leader
let mapleader = ","

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Comment/uncomment lines
map <leader>/   <plug>NERDCommenterToggle
map <D-/>       <plug>NERDCommenterToggle
imap <D-/>      <Esc><plug>NERDCommenterToggle i

" kj - The intuitive way to get out of insert mode
imap kj         <Esc>
 
" Make Y consistent with D and C
map Y           y$
 
" Search
nmap <leader>s  :%s/
vmap <leader>s  :s/

" Split screen
map <leader>v   :vsp<CR>
map <leader>h   :sp<CR>

" Open .vimrc file in new tab. Think Command + , [Preferences...] but with Shift.
map <D-<>       :tabedit ~/.vimrc<CR>
 
" Reload .vimrc
map <leader>rv  :source ~/.vimrc<CR>

" Auto-indent whole file
nmap <leader>=  gg=G``
map <silent> <F7> gg=G``:echo "Reformatted."<CR>
 
" Jump to a new line in insert mode
imap <D-CR>     <Esc>o
 
" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>
 
" File tree browser
map \           :NERDTreeToggle<CR>
 
" File tree browser showing current file - pipe (shift-backslash)
map \|          :NERDTreeFind<CR>
 
" Previous/next quickfix file listings (e.g. search results)
map <M-D-Down>  :cn<CR>
map <M-D-Up>    :cp<CR>
 
" Previous/next buffers
map <M-D-Left>  :bp<CR>
map <M-D-Right> :bn<CR>
 
"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

map <Leader>f :CtrlP<cr>


augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell
kj
  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" CTRLP
"-------------------------------------------------
map <leader>f   :CtrlP<CR>
imap <leader>f   <ESC>:CtrlP<CR>
let g:ctrlp_custom_ignore = '\v/vendor|/bin|/node_modules|/public/assets|/log'

let g:ctrlp_cmd= 'CtrlP'
let g:ctrlp_show_hidden = 0
noremap <D-r> :CtrlPTag<CR>

"JSX Syntax"
let g:jsx_ext_required = 0

"Silver Searcher
"-------------------------------------------------
ca Ag Ag!
"if executable('ag')
  "" Use Ag over Grep
  ""===================
  "set grepprg=ag\ --nogroup\ --nocolor

  "" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  ""---------------------------------------------------------------------
  "let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  "" ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 1
"endif




" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
"nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
"nnoremap <Leader>n :call RunNearestSpec()<CR>
"nnoremap <Leader>l :call RunLastSpec()<CR>

" vim-test mappings
nmap <silent> <leader>n :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Run rspec through zeus pre-loader
let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"

" Run specs using iTerm
let g:rspec_runner = "os_x_iterm"

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_javascript_checkers=['eslint']
" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

"CUSTOM FUNCTIONS
"======================================================================
"Autosave on lost focus
"-----------------------
function! FocusLost_SaveFiles()
	exe ":au FocusLost" expand("%") ":wa"
endfunction
:call FocusLost_SaveFiles()


