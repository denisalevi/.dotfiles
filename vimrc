set nocompatible              " be iMproved, required
filetype off                  " required

"profile start syntastic.log
"profile! file */syntastic/*

" ----- Vundle Plugins {{{
  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " ----- Making Vim look good ------------------------------------------
  Plugin 'altercation/vim-colors-solarized'
  "Plugin 'tomasr/molokai'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  "Plugin 'blinb/vim-bufferline'
  " TODO whats this doing?
  "Powerline with good infos (virtenv, branch etc)
  "Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

  " ----- Vim as a programmer's text editor -----------------------------
  Plugin 'scrooloose/nerdtree'
  Plugin 'jistr/vim-nerdtree-tabs'
  " Toggle line commenting
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-easytags'
  Plugin 'majutsushi/tagbar'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'vim-scripts/a.vim'
  " MY STUFF
  " mappings for next / previous mappings
  Plugin 'tpope/vim-unimpaired'
  " show changes to saved file using vimdiff
  Plugin 'jmcantrell/vim-diffchanges'
  Plugin 'sjl/gundo.vim'

  " ----- Working with Git ----------------------------------------------
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'

  " ---- Other stuff without own section --------------------------------
  Plugin 'Raimondi/delimitMate'
  "Plugin 'tomtom/tinykeymap_vim'

  " ----- man pages, tmux -----------------------------------------------
  Plugin 'jez/vim-superman'
  Plugin 'christoomey/vim-tmux-navigator'

  " ----- Syntax plugins ------------------------------------------------
  " TODO do I need the indent vim?
  Plugin 'vim-scripts/indentpython.vim'
  "Plugin 'Vimjas/vim-python-pep8-indent'
  Plugin 'denisalevi/vim-pydocstring'
  " Use either syntastic + flake8 isntalled or vim-flake8
  Plugin 'vim-syntastic/syntastic'
  " TODO: check out w0rp/ale for asynchronous checking
  "Plugin 'nvie/vim-flake8'
  Plugin 'sheerun/vim-polyglot'
  "Plugin 'file:///home/denisalevi/git/Vim-Jinja2-Syntax-fork'
  Plugin 'denisalevi/Vim-Jinja2-Syntax'
  " Plugin 'niftylettuce/Vim-Jinja2-Syntax'
  Plugin 'rhysd/vim-clang-format'
  " Markers at indent levels
  "Plugin 'nathanaelkane/vim-indent-guides'

  " ----- Notes plugins -------------------------------------------------
  Plugin 'xolox/vim-notes'

  " ---- Extras/Advanced plugins ----------------------------------------
  " Highlight and strip trailing whitespace
  Plugin 'ntpeters/vim-better-whitespace'
  " Easily surround chunks of text
  Plugin 'tpope/vim-surround'
  " Align CSV files at commas, align Markdown tables, and more
  "Plugin 'godlygeek/tabular'
  " Automaticall insert the closing HTML tag
  "Plugin 'HTML-AutoCloseTag'
  " Make tmux look like vim-airline (read README for extra instructions)
  " either this or just install powerline and source in .tmux.conf
  "Plugin 'edkolev/tmuxline.vim'
  " All the other syntax plugins I use
  "Plugin 'ekalinin/Dockerfile.vim'
  "Plugin 'digitaltoad/vim-jade'
  "Plugin 'tpope/vim-liquid'
  "Plugin 'cakebaker/scss-syntax.vim'

  " ------ My old stuff --------------------------------------------------
  "DirDiff directory diff
  Plugin 'will133/vim-dirdiff'
  " Ack from inside vim
  Plugin 'mileszs/ack.vim'
  " TODO autocompletion!
  "Python autocompletion
  "Plugin 'davidhalter/jedi-vim' "YouCompleteMe incorporates this for Python?
  "Autocompletion
  "Plugin 'Valloric/YouCompleteMe'
  "Python code folding
  "Plugin 'tmhedberg/SimpylFold'
  "Syntax checking
  " TODO conda plugin?
  " plugin for vim and conda env, test it! Only little attention at github
  "Plugin 'cjrh/vim-conda'


  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on
  "
  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  "
  " see :h vundle for more details or wiki for FAQ
  " Put your non-Plugin stuff after this line
" }}} Vundle Plugins

" ----- Vim Options {{{

  runtime macros/matchit.vim

  "let mapleader="\<space>"
  " this way we get showcmd will show the command
  " and space does not move the curser
  map <space> <leader>

  "Use UTF8 encoding
  set encoding=utf-8

  " We need this for plugins like Syntastic and vim-gitgutter which put symbols
  " in the sign column.
  hi clear SignColumn

  "Make code pretty
  " TODO do we need that?
  "let python_highlight_all = 1
  syntax on

  " *** GENERAL OPTS ***
  set modeline                            " last line of file has file specific vim options
  set backspace=indent,eol,start
  set number                              " show line numbering
  set mouse=a                             " Enable mouse in terminal
  set wildmenu                            " fancier completion
  set scrolloff=3                         " move the screen when 3 lines from border
  set splitright
  set splitbelow
  set tildeop                             " use ~ to change letter case
  set wildignore=*.o,*.obj,*~,*.pyc       " ignore while tab completing
  set showcmd                             " show cmd in status line
  set showmatch                           " show matching brackets
  set tabpagemax=30                       " max number of tabs ( -p cmdline option )
  set ruler                               " status line stuff
  set hlsearch                            " highlights search matches
  set incsearch                           " jump to first match while typing
  set ignorecase                          " ignore case in search pattern
  set smartcase                           " ignore ignorecase if search pattern has uppercase
  set showbreak=+                         " line wrapping sign
  set directory=~/.vim/tmp/               " swap directory (*.sw? files)
  set cursorline                          " highlights active cursor line
  "set t_Co=16                             " proper color themes in terminal mode
  set notitle                             " suppress 'Thanks for flying vim' message
  set timeoutlen=250                      " less delay after pressing ESC
  set nojoinspaces                        " avoids to 2 spaces after dots when joining lines
  "set foldmethod=syntax                   " code folding
  set breakindent                         " Indent wrapped lines up to the same level
  set foldnestmax=1                       " only fold up to one level deep

  hi clear SpellBad
  hi SpellBad cterm=bold ctermfg=red
" }}}

" ----- Plugin-Specific Settings {{{

  " ----- altercation/vim-colors-solarized settings -----
  " Set the colorscheme
  colorscheme solarized

  " Toggle this to "light" for light colorscheme
  set background=dark

  " Not needed when terminal uses 16 Solarized colors
  "let g:solarized_termcolors=256


  " ----- bling/vim-airline and vim-bufferline settings -----
  " Always show statusbar
  set laststatus=2
  set showtabline=2
  " dont show INSERT / VISUAL in statusline (shown by powerline already)
  set noshowmode

  " Fancy arrow symbols, requires a patched font
  let g:airline_powerline_fonts = 1

  " Show PASTE if in paste mode
  let g:airline_detect_paste=1

  " Show airline for tabs too
  let g:airline#extensions#tabline#enabled = 1

  " Use the solarized theme for the Airline status bar
  let g:airline_theme='solarized'
  let g:airline#extensions#tabline#show_buffers = 1

  " Show numbers in tabline
  let g:airline#extensions#tabline#tab_nr_type = 1

  " Enable bufferline (not working?)
  "let g:airline#extensions#bufferline#enabled = 1
  "let g:airline#extensions#bufferline#overwrite_variables = 1


  " ----- scrooloose/nerdtree -----
  "hide .pyc files in NERDTree
  let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


  " ----- jistr/vim-nerdtree-tabs -----
  " To have NERDTree always open on startup
  "let g:nerdtree_tabs_open_on_console_startup = 1


  " ----- scrooloose/syntastic settings -----
  let g:syntastic_error_symbol = '✘'
  let g:syntastic_warning_symbol = "▲"
  " Turn of automatic checking at write
  "let g:syntastic_mode = "passive"
  let g:syntastic_check_on_wq = 0
  " make :lnext work after running check (might conflict with loc list plugins)
  let g:syntastic_always_populate_loc_list = 1
  augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
  augroup END
  " Use flake8 for python files
  let g:syntastic_python_checkers = ['flake8']
  " active filtypes are checked automatically at file writing
  "let g:syntastic_mode_map = { 'mode': 'active',
  "            \ 'active_filetypes': ['python'],
  "            \ 'passive_filetypes': [] }


  " ----- xolox/vim-easytags settings -----
  " Where to look for tags files
  set tags=./tags;,~/.vimtags
  "TODO set tags=./tags;$HOME (walk directory tree upto $HOME looking for tags)
  " Sensible defaults
  let g:easytags_events = ['BufReadPost', 'BufWritePost']
  let g:easytags_async = 1
  let g:easytags_dynamic_files = 2
  let g:easytags_resolve_links = 1
  let g:easytags_suppress_ctags_warning = 1


  " ----- majutsushi/tagbar settings -----
  " Uncomment to open tagbar automatically whenever possible
  "autocmd BufEnter * nested :call tagbar#autoopen(0)


  " ----- airblade/vim-gitgutter settings -----
  " In vim-airline, only display "hunks" if the diff is non-zero
  let g:airline#extensions#hunks#non_zero_only = 1


  " ----- Raimondi/delimitMate settings -----
  let delimitMate_expand_cr = 1
  augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    " Uncomment to have matching tripple quotes
    "au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
  augroup END


  " ----- jez/vim-superman settings -----
  " better man page support
  noremap K :SuperMan <cword><CR>


  " ----- nvie/vim-flake8 settings -----
  " Show signs in gutter
  "let g:flake8_show_in_gutter=1


  " ----- SimplyFold -----
  autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
  autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
  "Show docstring of foled code
  let g:SimpylFold_docstring_preview=1

" }}} Plugin-Specific Settings

" ----- Keyboard Mappings {{{
"
  " Syntax checking
  nnoremap <F7> :SyntasticCheck<CR>

  " Toggle undo tree (sjl/gundo)
  nnoremap <leader>u :GundoToggle<CR>

  " Open/close NERDTree tabs
  nmap <leader>t :NERDTreeTabsToggle<CR>

  " Open/close tagbar
  nmap <leader>b :TagbarToggle<CR>

  " Toggle relative line numbers
  nmap <silent> <leader>n :call ToggleNumber()<CR>

  " Toggle paste / nopaste mode
  set pastetoggle=<F2>

  " Update ctags
  augroup keybinding
    au!
    autocmd FileType c,cpp              map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
    autocmd FileType cuda               map <F8> :!/usr/bin/ctags -R --langmap=c++:+.cu --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
  augroup END

  " Switch btwn dark and light theme solarized
  call togglebg#map("<F9>")

  " Enable folding f
  nnoremap <leader>f za

  " Make these commonly mistyped commands still work
  command! WQ wq
  command! Wq wq
  command! Wqa wqa
  command! W w
  command! Q q

  " Force write readonly files using sudo
  command! Sw w !sudo tee %

  " Use :C to clear hlsearch
  nmap <leader>h :nohlsearch<CR>

  " Make navigating long, wrapped lines behave like normal lines
  noremap <silent> k gk
  noremap <silent> j gj
  noremap <silent> 0 g0
  noremap <silent> $ g$
  noremap <silent> ^ g^
  noremap <silent> _ g_

" }}} Keyboard mappings

" ----- Custom Functions {{{

  " Remember last curser position in file
  function RememberLastPosition()
    if &ft =~ 'gitcommit'
      return
    endif
    if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endfunction

  " Toggle between number and relativenumber
  function! ToggleNumber()
      if(&relativenumber == 1)
          set norelativenumber
          set number
      else
          set relativenumber
      endif
  endfunc

  " Different syntax highlighting within regions of a file
  " http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
  " Important changes:
  " * Add keepend, otherwise nested C++/Jinja doesn't work!
  " * Add containedin=ALL, so also highlighted in C comments and strings.
  " * Remove the textSnipHl section (since want to include the delimiters
  "   for Jinja).
  "
  " ...and using syntax from:
  " http://www.vim.org/scripts/script.php?script_id=1856
""  function! TextEnableCodeSnip(filetype,start,end) abort
""    echo "DEBUG: calling TextEnableCodeSnip"
""    let ft=toupper(a:filetype)
""    let group='textGroup'.ft
""    if exists('b:current_syntax')
""      let s:current_syntax=b:current_syntax
""      " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
""      " do nothing if b:current_syntax is defined.
""      unlet b:current_syntax
""    endif
""    execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
""    try
""      execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
""    catch
""    endtry
""    if exists('s:current_syntax')
""      let b:current_syntax=s:current_syntax
""    else
""      unlet b:current_syntax
""    endif
""    execute 'syntax region textSnip'.ft.'
""    \ start="'.a:start.'" end="'.a:end.'"
""    \ keepend
""    \ containedin=ALL
""    \ contains=@'.group
""  endfunction

" }}} Custom Functions

" ----- Autocommands (indentation settings) {{{
  " Indention stuff
  augroup indention
    au!
    autocmd FileType lua                set tabstop=4 shiftwidth=4 expandtab smarttab smartindent
    "PEP8 standards
    " vim-scripts/indenpython Plugin takes care of it
    "autocmd FileType python             set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 smarttab expandtab autoindent fileformat=unix smartindent shiftround
    autocmd FileType make               set tabstop=8 shiftwidth=8 noexpandtab list
    autocmd FileType man                set tabstop=8 shiftwidth=8 noexpandtab
    autocmd FileType c,cpp,cuda         set tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 expandtab
    autocmd FileType tex                set tabstop=4 shiftwidth=4 textwidth=79 wrap expandtab spell spelllang=en iskeyword+=: tw=0 "linebreak
    "autocmd FileType tex                set makeprg=pdflatex\ \"%\"&&evince\ \"%<.pdf\"
    autocmd FileType vimwiki            set ts=2 sw=2 tw=78 wrap lbr et
    autocmd FileType vim,tmux           set ts=2 sw=2 expandtab
    autocmd FileType mail               set tw=72
    autocmd FileType gitcommit          set tw=72 sw=2 tabstop=2 et
    autocmd FileType sh                 set tw=79 ts=2 softtabstop=2 shiftwidth=2 expandtab
  augroup misc
    au!
    autocmd BufNewFile,BufRead wscript* set filetype=python
    "autocmd FileType notmuch*           set foldmethod=manual
    autocmd BufReadPost *               call RememberLastPosition()
    autocmd BufEnter *                  let &titlestring = "vim(" . expand("%:t") . ")" " set window title
  augroup jinja
    " Jinja template highlighting
    " Assuming files inside a folder called 'templates' are Jinja templates.
    " Default delimiters are {{ }}, {% %}, and {# #}, per:
    " http://jinja.pocoo.org/docs/templates/
    au!
    "au BufNewFile,BufRead */templates/* call TextEnableCodeSnip('jinja', '{{', '}}')
""    au FileType jinja call TextEnableCodeSnip('jinja', '{{', '}}')
""    au FileType jinja call TextEnableCodeSnip('jinja', '{%', '%}')
""    au FileType jinja call TextEnableCodeSnip('jinja', '{#', '#}')
""    au FileType jinja.* :echo "DEBUG: detected jinja.* for " . expand("<amatch>")
""    au FileType *.jinja.* :echo "DEBUG: detected *.jinja.* for " . expand("<amatch>")
""    au FileType jinja :echo "DEBUG: detected jinja for " . expand("<amatch>")
""    au FileType *.jinja :echo "DEBUG: detected *.jinja for " . expand("<amatch>")
"    au FileType jinja :echo "DEBUG: detected jinja"
"    au FileType cuda :echo "DEBUG: detected cuda"
"    au FileType jinja.cuda :echo "DEBUG: detected jinja.cuda"
"    au FileType cuda.jinja :echo "DEBUG: detected cuda.jinja"
  augroup END
" }}} Autocommands

" TODO: YouCompleteMe {{{
"TODO
"Ensure autocomplete window goes away when done with it
"let g:ycm_autoclose_preview_window_after_completion=1
" For YouCompleteMe to find the correct python interpreter
"let g:ycm_path_to_python_interpreter='~/anaconda2/bin/python'

"Shortcut for GoTo definition
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"TODO
""Python with VIRTUALENV support: sets up system path for YCM and goto
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
" }}}

" ----- Unused snippets {{{
  " mark lines with more then 80 chars at 81 chars in magenta
  "highlight ColorColumn ctermbg=magenta
  "call matchadd('ColorColumn', '\%81v', 100)
  " create a colorcolumn at char 81
  "set colorcolumn=81
" }}}

" vim:foldmethod=marker:foldlevel=0
