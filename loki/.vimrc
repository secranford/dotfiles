" ====================================================================
"                          Vim Configuration
"  - Plugin-optional (works even on hosts without plugins)
"  - Clear comments + sensible defaults
"  - Language-aware (Bash, Python, Fortran/f77, Make, Markdown)
" ====================================================================

" ===================== Core behavior & UI (explained) =================
set nocompatible                       " Use Vim features (not old vi)
set number                             " Absolute line numbers
set norelativenumber                   " No relative renumbering by default
set cursorline                         " Highlight current line
set hidden                             " Allow unsaved buffers to stay open
set updatetime=300                     " Faster UI updates (lint/signs)

" Always show sign column (prevents text shift when ALE/lint signs appear)
if has("patch-8.1.1564")
  set signcolumn=yes
endif

" Enable 24-bit truecolor support if available
if has("termguicolors")
  set termguicolors
endif

set laststatus=2                       " Always show statusline
set showmode                           " Show -- INSERT -- etc.

" Clipboard: unnamedplus requires +clipboard feature; guard it.
if has('clipboard')
  set clipboard=unnamedplus            " Use system clipboard when available
endif

"set clipboard=unnamedplus              " Use system clipboard when available
set history=500                        " Command/search history depth

" Leader for custom mappings (toggles, navigation, etc.)
let mapleader = ","
" to run commands defined with leader key, type <leader> followed by the cmd
" for example, typing ,n would turn relative numbering on as defined
" ===================== Filetype & autoread helpers ====================
filetype plugin on
filetype indent on

" Auto-read files changed outside Vim (e.g., git checkout)
set autoread
augroup AutoReadOnFocus
  autocmd!
  autocmd FocusGained,BufEnter * silent! checktime
augroup END

" ===================== Undo / backup / swap policy ====================
" Persistent undo on; backups off (we use Git); keep swap for crash safety.
set undofile
set nobackup
set nowritebackup
" set noswapfile                    " (Optional) disable swap entirely

" Create support dirs if missing so persistence never fails
for d in ['~/.vim/undo', '~/.vim/backup', '~/.vim/swap']
  if !isdirectory(expand(d))
    call mkdir(expand(d), 'p')
  endif
endfor
set undodir=~/.vim/undo,.
set backupdir=~/.vim/backup,.
set directory=~/.vim/swap,.
set undolevels=10000
set undoreload=10000

" ============================= Searching ==============================
set incsearch                          " Live incremental search
set hlsearch                           " Highlight matches
set ignorecase
set smartcase                          " Case-insensitive unless pattern has caps
set lazyredraw                         " Faster macros (less redraw)
set magic                              " Modern regex engine (default)
set showmatch                          " Briefly jump to matching bracket
set mat=2                              " Match blink time (tenths of a sec)

" Builtin file finding & grep (plugin-free fallbacks)
set path+=**                           " :find searches recursively
set wildmenu
set wildmode=longest:full,full
if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
else
  set grepprg=grep\ -nH\ $*
  set grepformat=%f:%l:%m
endif

" Ignore common junk in wildmenu completion
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" ========================== Indent & wrapping =========================
set expandtab                          " Tabs → spaces (defaults; per-FT overrides below)
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set textwidth=0                        " Don’t auto-wrap globally
set colorcolumn=80                     " Column guide at 80 (toggle below)
set wrap                               " Wrap long lines visually in general prose
set foldcolumn=1                       " Slim gutter; not enabling folds globally

" ========================= Encoding & file formats ====================
set encoding=utf8
set ffs=unix,dos,mac

" ============================= Rulers/UI ==============================
set ruler                              " Show cursor position
set cmdheight=1                        " Compact cmdline height
set backspace=eol,start,indent         " Backspace through everything
set whichwrap+=<,>,h,l                 " Wrap left/right at line ends
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" ========================= Highlight colors (yours) ===================
augroup MyHighlights
  autocmd!
  " Re-apply on colorscheme changes so these “stick”
  autocmd ColorScheme * highlight CursorLine  guibg=#1f2335 ctermbg=236
  autocmd ColorScheme * highlight ColorColumn guibg=#332a28 ctermbg=237
  autocmd ColorScheme * highlight ExtraWhitespace guibg=#402020 ctermbg=52
augroup END
highlight CursorLine  guibg=#1f2335 ctermbg=236
highlight ColorColumn guibg=#332a28 ctermbg=237
highlight ExtraWhitespace guibg=#402020 ctermbg=52

" ===================== Trailing whitespace (visual) ===================
" Highlight trailing spaces; quieter pattern while inserting; re-apply on enter
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" Optional: strip trailing spaces on save for selected types (see CleanExtraSpaces)

" ============================== Toggles ===============================
" Relative numbers
nnoremap <leader>n :set invrelativenumber<CR>
" Current-line highlight
nnoremap <leader>C :set invcursorline<CR>
" Column guide: :ToggleCC or ,c
command! ToggleCC if &colorcolumn == '' | execute 'set colorcolumn=' . (&textwidth > 0 ? &textwidth : 80) | else | set colorcolumn= | endif
nnoremap <leader>c :ToggleCC<CR>
" Invisibles: show/hide tabs/trailing/etc.
set listchars=tab:»·,trail:·,extends:>,precedes:<,nbsp:+
nnoremap <leader>il :set invlist<CR>
" Turn off Relative numbers (if on) and numbers, mainly for line copying.
" command! ToggleNumbers if &number || &relativenumber | set nonumber norelativenumber | else | set number norelativenumber | endif

" Relative numbers (Vim 7.3+). Define ToggleNumbers differently if missing.
if exists('&relativenumber')
  set norelativenumber
  " ToggleNumbers: hide both if either is on; else restore to number only
  command! ToggleNumbers if &number || &relativenumber | set nonumber norelativenumber | else | set number norelativenumber | endif
else
  " Very old Vim: only toggle 'number'
  command! ToggleNumbers if &number | set nonumber | else | set number | endif
endif

nnoremap <leader>N :ToggleNumbers<CR>

" ====================== Navigation & quality-of-life ==================
" Split navigation (Ctrl + hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Keep search matches centered
nnoremap n nzzzv
nnoremap N Nzzzv
" Yank to end of line (match D/C)
nnoremap Y y$
" Quick escape from insert
inoremap jj <Esc>

" Space → forward search; Ctrl-Space → backward (terminal must send it)
nnoremap <Space> /
nnoremap <C-Space> ?

" Clear highlights with <leader><CR>
nnoremap <silent> <leader><CR> :noh<CR>

" 0 → first non-blank
nnoremap 0 ^

" Move lines with Alt-j/k (and Cmd-j/k on mac)
nnoremap <M-j> mz:m+<CR>`z
nnoremap <M-k> mz:m-2<CR>`z
vnoremap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
  nnoremap <D-j> <M-j>
  nnoremap <D-k> <M-k>
  vnoremap <D-j> <M-j>
  vnoremap <D-k> <M-k>
endif

" Fast save and sudo-save
nnoremap <leader>w :w!<CR>
command! W execute 'w !sudo tee % > /dev/null' | edit!

" ====================== Visual-mode conveniences ======================
" * and # search the visually selected text
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" =================== Buffers / tabs / window management ===============
" Safe buffer close helpers
nnoremap <leader>bd :Bclose<CR>:tabclose<CR>gT
nnoremap <leader>ba :bufdo bd<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove<Space>
nnoremap <leader>t<leader> :tabnext<CR>

" Toggle to last visited tab
let g:lasttab = 1
nnoremap <leader>tl :exe 'tabn '.g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

" New tab at current buffer directory
nnoremap <leader>te :tabedit <C-r>=escape(expand('%:p:h'), ' ')<CR>/

" Change CWD to buffer dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Favor using open windows/tabs for jumps
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" Return to last cursor position on reopen
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" ============================== Statusline ============================
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %{getcwd()}\ \ \ Line:\ %l\ \ Column:\ %c\ \ %p%%

" =============================== Plugins ==============================
" Plugin guard: only use plugins if vim-plug exists AND VIM_NOPLUG is not set
let g:use_plugins = filereadable(expand('~/.vim/autoload/plug.vim')) && !exists('$VIM_NOPLUG')

if g:use_plugins
  call plug#begin('~/.vim/plugged')

  " Navigation & search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Editing
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'wellle/targets.vim'
  Plug 'mg979/vim-visual-multi'

  " Linting / LSP / formatting
  Plug 'dense-analysis/ale'

  " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Markdown
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'preservim/vim-pencil'
  Plug 'dhruvasagar/vim-table-mode'

  " Colorscheme
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'

  " Latex
  "Plug 'lervag/vimtex', { 'tag': 'v2.15' } " this seems to slow down vim, tag
  "is needed for compatitbility

  call plug#end()
endif

" Colorscheme (safe if not installed)
" turns on syntax highlighting
syntax on
try
  colorscheme onedark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme koehler
endtry

" ================= Plugin-aware mappings (safe fallbacks) =============
" FZF file/buffer search with :find fallback
if exists(':Files')
  nnoremap <leader>p :Files<CR>
else
  nnoremap <leader>p :find
endif
if exists(':Buffers')
  nnoremap <leader>b :Buffers<CR>
endif
" Ripgrep via FZF if present; else builtin :grep (quickfix opens)
if exists(':Rg')
  nnoremap <leader>r :Rg<CR>
else
  nnoremap <leader>r :silent grep
  autocmd QuickFixCmdPost grep cwindow
endif

" Git helpers (fugitive) or shell-out fallback
if exists(':G')
  nnoremap <leader>gs :G<CR>
  nnoremap <leader>gd :Gdiffsplit<CR>
  nnoremap <leader>gb :Gblame<CR>
else
  command! -nargs=* Git execute 'silent !git <args>' | redraw!
  nnoremap <leader>gs :Git status<CR>
  nnoremap <leader>gd :Git diff -- <bar> redraw!<CR>
  nnoremap <leader>gb :Git blame -- <bar> redraw!<CR>
endif

" ALE specific vars, needs to be defined before ALE loaded
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:ale_virtualtext_cursor = 1
let g:ale_linters_explicit = 1 " only use explicitlly set linters, no conflicts
let g:ale_fix_on_save = 1

" Only use these linters for ALE
let g:ale_linters = {
\ 'python': ['pyright'],
\ 'sh':     ['bash-language-server', 'shellcheck'],
\ 'fortran':['fortls'],
\ 'markdown':['marksman'],
\ 'tex':['chktex'],
\ }

let g:ale_fixers = {
\ 'python': ['black'],
\ 'sh':     ['shfmt'],
\ 'markdown':['prettier'],
\ '*':      ['trim_whitespace', 'remove_trailing_lines'],
\ }
"\ 'fortran':['fprettify'], " something special needs to be done for this...

" ALE settings (only if loaded)
if exists(':ALEInfo')
  " Define a custom fixer for ALE
"  call ale#fix#registry#Add('fprettify', 'ale#fixers#generic#Run',
"  \ ['fprettify', '--silent', '--case=upper', '--indent=2', '--line-length=80'],
"  \ 'Format Fortran with fprettify')

  nnoremap <silent> <leader>ai :ALEInfo<CR>
endif

" Use the file's directory as the project root for LSPs
augroup ALEProjectRoot
  autocmd!
  autocmd FileType python,sh,fortran,markdown let b:ale_root = expand('%:p:h')
augroup END

" UltiSnips triggers (only if present)
if exists('g:UltiSnipsExpandTrigger') || exists(':UltiSnipsEdit')
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

" ========================== Per-language rules ========================
" Python: Black width, fold by indent
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab textwidth=88 colorcolumn=88 foldmethod=indent

" Shell scripts: 2 spaces
autocmd FileType sh,bash,zsh setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Makefiles: literal tabs REQUIRED
autocmd FileType make setlocal noexpandtab shiftwidth=8 tabstop=8 softtabstop=0

" Markdown: prose-friendly; guard Pencil if plugin missing
autocmd FileType markdown setlocal textwidth=0 wrap linebreak spell conceallevel=2
augroup MarkdownPencil
  autocmd!
  autocmd FileType markdown if exists('g:loaded_pencil') | PencilSoft | endif
augroup END

" Fortran (free-form)
autocmd FileType fortran setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
let fortran_free_source=1
let fortran_more_precise=1
let fortran_do_enddo=1

" Fortran 77 / fixed-form
autocmd BufRead,BufNewFile *.f,*.for setlocal filetype=fortran
autocmd FileType fortran if expand('%:e') =~? '^\%(f\|for\)$' |
      \ setlocal noexpandtab shiftwidth=8 tabstop=8 softtabstop=8 textwidth=72 colorcolumn=73 |
      \ let b:fortran_fixed_source=1 |
      \ endif

" LaTeX: rules and autocmds
let g:tex_flavor = 'latex'        " default to LaTeX, not plain TeX
autocmd FileType tex setlocal spell spelllang=en_us wrap linebreak
autocmd FileType tex setlocal conceallevel=2     " pretty math; toggle with :set cole=0
" If you dislike conceal: use 0 instead of 2.
let g:vimtex_view_method = 'general' " Zathura recommended if available, best SyncTeX. general calls default specified by system with xdg-open.

" =================== Quickfix / Location-list helpers =================
autocmd QuickFixCmdPost [^l]* cwindow
autocmd QuickFixCmdPost    l* lwindow

" ========================= Clipboard (WSL helpers) ====================
if has('wsl')
  if executable('win32yank.exe')
    let g:clipboard = {
      \ 'name': 'win32yank',
      \ 'copy':  {'+': ['win32yank.exe','-i','--crlf'], '*': ['win32yank.exe','-i','--crlf']},
      \ 'paste': {'+': ['win32yank.exe','-o','--lf'],   '*': ['win32yank.exe','-o','--lf']},
      \ 'cache_enabled': 0,
      \ }
  elseif executable('clip.exe')
    set clipboard=
    vnoremap <leader>y :w !clip.exe<CR><CR>
  endif
endif

" ============================ Status helpers ==========================
" run functions by typing :<functionname()> <enter>

" Show 'PASTE MODE' on statusline
function! HasPaste()
  return &paste ? 'PASTE MODE  ' : ''
endfunction

" Safe buffer close without closing the window/tab
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:cur = bufnr('%')
  let l:alt = bufnr('#')
  if buflisted(l:alt)
    buffer #
  else
    bnext
  endif
  if bufnr('%') == l:cur
    enew
  endif
  if buflisted(l:cur)
    execute 'bdelete! ' . l:cur
  endif
endfunction

" Commandline feeder used by VisualSelection()
function! CmdLine(str)
  call feedkeys(':' . a:str)
endfunction

" VisualSelection(): build @/ from visual selection; supports 'gv'/'replace'
function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' ")
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/' . l:pattern . '/')
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" CleanExtraSpaces(): trim trailing spaces from current file.
function! CleanExtraSpaces()
    " Save cursor position and search register
    let save_cursor = getpos(".")
    let old_query   = getreg('/')

    " Remove trailing spaces from all lines, silently
    silent! %s/\s\+$//e

    " Restore cursor and search
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

" uncomment below if you want those filetypes to have their trailing spaces
" auto trimmed.
"if has("autocmd")
"    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee call CleanExtraSpaces()
"endif

" ============================== Utilities =============================
" Quick scratch buffers
nnoremap <leader>q :e ~/buffer<CR>
nnoremap <leader>x :e ~/buffer.md<CR>

" Toggle paste mode
nnoremap <leader>pp :setlocal paste!<CR>

" Remove stray ^M characters
nnoremap <Leader>m mmHmt:%s/<C-v><CR>//ge<CR>'tzt'm
