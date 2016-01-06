set nocompatible        " Must be first line
let mapleader = ','
"let maplocalleader = '_'
set encoding=utf-8
"set fileencodings=utf-8,gb2312,gbk,gb18030
set fileencodings=utf-8
set termencoding=utf-8
"scriptencoding utf-8
set background=dark
syntax enable
syntax on
"set mouse=a
"set mousehide
if has('clipboard')
   if has('unnamedplus')
       set clipboard=unnamed,unnamedplus
   else
       set clipboard=unnamed
   endif
endif
set autochdir
"set autowrite
set autoread
set shortmess+=aoOtT
set virtualedit=onemore
set history=1000
"set spell
set hidden
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-

"au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

function! ResCur()
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

set backup
set backupdir=~/.vim/.backup
set viewdir=~/.vim/.views

"set tabpagemax=15
set showmode
set cursorline
"set cursorcolumn
highlight clear SignColumn
highlight clear LineNr
"highlight clear CursorLineNr

if has('cmdline_info')
    set showcmd
endif

if has('statusline')
    set laststatus=2
endif

set backspace=indent,eol,start
set linespace=0
set number
if version >= 703
    set relativenumber
endif
set winminheight=0
set splitright
set splitbelow
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap <silent> <leader>/ :set invhlsearch<CR>
set wildmenu
set wildmode=list:longest,full
set wrap
set linebreak
set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set scrolloff=3

set nofoldenable
set foldmethod=indent
nmap <leader>f1 :set foldlevel=0<CR>
nmap <leader>f2 :set foldlevel=1<CR>
nmap <leader>f3 :set foldlevel=2<CR>
nmap <leader>f4 :set foldlevel=3<CR>
nmap <leader>f5 :set foldlevel=4<CR>
nmap <leader>f6 :set foldlevel=5<CR>
nmap <leader>f7 :set foldlevel=6<CR>
nmap <leader>f8 :set foldlevel=7<CR>
nmap <leader>f9 :set foldlevel=8<CR>
nmap <leader>f0 :set foldlevel=9<CR>

"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set ve=block
set showmatch

set nojoinspaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set pastetoggle=<F12>
function! Format()
    retab
    call StripTrailingWhitespace()
endfunction

autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd FileType haskell,rust setlocal nospell
autocmd FileType xhtml,html,htm,php,xml setlocal matchpairs+=<:>
autocmd FileType c,h setlocal cindent
autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2

cmap w!! w !sudo tee % >/dev/null
nmap <silent> <leader>= :call Format()<CR>
noremap j gj
noremap k gk
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif
"cmap Tabe tabe  " tabedit
nnoremap Y y$
nnoremap g^ gUiW
nnoremap gv guiW
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
vnoremap . :normal .<CR>
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :edit %%
map <leader>es :split %%
map <leader>ev :vsplit %%
map <leader>et :tabedit %%
"nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
nnoremap <silent> <leader>q gwip
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]b :bn<CR>
nnoremap <silent> [t :tabnext<CR>
nnoremap <silent> ]t :tabprevious<CR>
nnoremap <Leader>y "ay
nnoremap <Leader>p "ap

if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
    hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
    hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

    inoremap <expr> <CR>     pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
    inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menu,longest
endif

function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! BufCloseOthers()
    let l:currentBufNum   = bufnr("%")
    let l:alternateBufNum = bufnr("#")
    for i in range(1,bufnr("$"))
        if buflisted(i)
            if i!=l:currentBufNum
                execute("bdelete ".i)
            endif
        endif
    endfor
endfunction
map <silent> <leader>bo :call BufCloseOthers()<CR>
