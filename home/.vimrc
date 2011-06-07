" Section: configuration

  scriptencoding utf-8

  set guifont=Monaco:h16

  let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
  let NERDShutUp = 1 " so it doesn't complain about types it doesn't know

  map cc :w !pbcopy

  colorscheme default
  highlight NonText guibg=#060606
  highlight Folded  guibg=#0A0A0A guifg=#9090D0

  " These two enable syntax highlighting
  set nocompatible          " We're running Vim, not Vi!
  syntax on                 " Enable syntax highlighting

  " Enable filetype-specific indenting and plugins
  filetype plugin indent on

  " show the `best match so far' as search strings are typed
  set incsearch

  " Highlight search results once found:
  set hlsearch

  "sm:    flashes matching brackets or parentheses
  set showmatch

  "sta:   helps with backspacing because of expandtab
  set smarttab

  " Change <Leader>
  let mapleader = ","

  " Set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

  " When scrolling off-screen do so 3 lines at a time, not 1
  set scrolloff=3

  " enable line numbers
  set number
  setlocal numberwidth=5

  " Enable tab complete for commands.
  " first tab shows all matches. next tab starts cycling through the matches
  set wildmenu
  set wildmode=list:longest,list:full

  " Display extra whitespace
  set list listchars=tab:»·,trail:·
  "
  " kill whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e
  " don't make it look like there are line breaks where there aren't:
  set nowrap

  " assume the /g flag on :s substitutions to replace all matches in a line:
  set gdefault

  " Load matchit (% to bounce from do to end, etc.)
  runtime! macros/matchit.vim

  " Nice statusbar
  set laststatus=2
  set statusline=\ "
  set statusline+=%{fugitive#statusline()}
  set statusline+=%f\ " file name
  set statusline+=[
  set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&fileformat}] " file format
  set statusline+=%h%1*%m%r%w%0* " flag
  set statusline+=%= " right align
  set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

  " enable setting title
  set title

  " configure title to look like: Vim /path/to/file
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

  " Make backspace work in insert mode
  set backspace=indent,eol,start

  " Turn off rails bits of statusbar
  let g:rails_statusline=0

  " quit NERDTree after openning a file
  let NERDTreeQuitOnOpen=1
  " colored NERD Tree
  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowHidden = 1
  " map enter to activating a node
  let NERDTreeMapActivateNode='<CR>'
  let NERDTreeIgnore=['\.git','\.DS_Store','\.pdf']

  " limit number of results shown for performance
  let g:fuzzy_matching_limit=60
  " ignore stuff that can't be openned, and generated files
  let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"
  " increate the number of files scanned for very large projects
  let g:fuzzy_ceiling=20000
  " display relative path, instead of abbrevated path (lib/jeweler.rb vs
  " l/jeweler.rb)
  let g:fuzzy_path_display = 'relative_path'

  let g:browser = 'open '

  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType javascript set autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType vim set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType cucumber set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    " markdown goodness
    autocmd BufRead *.mkd  set autoindent formatoptions=tcroqn2 comments=n:>
    au BufRead,BufNewFile *etc/nginx/* set ft=nginx
    " treat rackup files like ruby
    au BufRead,BufNewFile *.ru set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    au BufRead,BufNewFile Capfile set ft=ruby
    au BufRead,BufNewFile *.god set ft=ruby
  augroup END


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endi

  " Turn on language specific omnifuncs
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete


  " have some fun with bufexplorer
  let g:bufExplorerDefaultHelp=0       " Do not show default help.
  let g:bufExplorerShowRelativePath=1  " Show relative paths.

" Section: commands
  " Shell
  command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)

" Section: mappings

  " Tab navigation
  nmap <leader>tn :tabnext<CR>
  nmap <leader>tp :tabprevious<CR>
  nmap <leader>te :tabedit

  " Remap F1 from Help to ESC.  No more accidents.
  nmap <F1> <Esc>
  map! <F1> <Esc>
  imap ii <Esc>

  " insert hashrocket, =>, with control-l
  imap <C-l> <Space>=><Space>
  " align hashrockets with <leader>t control-l
  vmap <leader>t<C-l> :Align =><CR>
  " Toggle NERDTree with <leader>d
  map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
  " TextMate fuzzy finder with <leader>t
  map <silent> <leader>t :FuzzyFinderTextMate<CR>
  " FuzzyFinder tags with <leader>T
  nnoremap <silent> <leader>T :FuzzyFinderTag!<CR>
  " <leader>F to begin searching with ack
  map <leader>F :Ack<space>
  " search next/previous -- center in page
  nmap n nzz
  nmap N Nzz
  nmap * *Nzz
  nmap # #nzz

  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " Hide search highlighting
  map <silent> <leader>nh :nohls <CR>

  " toggle Quickfix window with <leader>q
  map <silent> <leader>q :QFix<CR>

  map <C-c>n :cnext<CR>
  map <C-c>p :cprevious<CR>

  map <leader>C :!cucumber %<CR>
  map <leader>R :!rspec %<CR>
