set nocompatible        " Must be first line
source ~/.vimrc.bundles

" General {
    let mapleader = ','
    "let maplocalleader = '_'
    set encoding=utf-8
    "set fileencodings=utf-8,gb2312,gbk,gb18030
    set fileencodings=utf-8
    set termencoding=utf-8
    "scriptencoding utf-8
    "" Assume a dark background
    set background=dark
    syntax enable
    "" Syntax highlighting
    syntax on
    "" Automatically enable mouse usage
    "set mouse=a
    "" Hide the mouse cursor while typing
    "set mousehide
    "" can copy data to others' software
    if has('clipboard')
       "" When possible use + register for copy-paste
       if has('unnamedplus')
           set clipboard=unnamed,unnamedplus
       else
            "" On mac and Windows, use * register for copy-paste
           set clipboard=unnamed
       endif
    endif
    "" change file directory to current directory
    set autochdir
    "" Automatically write a file when leaving a modified buffer
    "set autowrite
    "" reload when file changed outside
    set autoread
    "" Abbreviated the messages
    set shortmess+=aoOtT
    "" Allow for cursor beyond last character
    set virtualedit=onemore
    "" Store a ton of history (default is 20)
    set history=1000
    "" Spell checking on
    "set spell
    "" Allow buffer switching without saving
    set hidden
    "" '.' is an end of word designator
    set iskeyword-=.
    "" '#' is an end of word designator
    set iskeyword-=#
    "" '-' is an end of word designator
    set iskeyword-=-

    "" set it to the first line when editing a git commit message
    "au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " Restore cursor to file position in previous editing session
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

    " Setting up the directories {
        set backup
        set backupdir=~/.vim/.backup
        set viewdir=~/.vim/.views
        "if has('persistent_undo')
            "set undofile
            "set undodir=~/.vim/.undo
            "" Maximum number of changes that can be undone
            "set undolevels=1000
            "" Maximum number lines to save for undo on a buffer reload
            "set undoreload=10000
        "endif
    " }
" }

" Vim UI {
    "" Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    set t_Co=256
    "let g:solarized_termcolors=256
    "let g:solarized_termtrans=1
    "let g:solarized_contrast="normal"
    "let g:solarized_visibility="normal"
    "
    "" Load a colorscheme
    "let g:molokai_original=1
    "let g:rehash256 = 1
    color molokai
    "color solarized
    if !exists('g:airline_theme')
            let g:airline_theme = 'molokai'
            "let g:airline_theme = 'solarized'
    endif

    "" Only show 15 tabs
    "set tabpagemax=15
    "" Display the current mode
    set showmode
    "" Highlight current line
    set cursorline
    "set cursorcolumn
    "" SignColumn should match background(sigh is in the left-hand side of the window like breakpoint in IDE)
    highlight clear SignColumn
    "" Current line number row will have same background color in relative mode
    highlight clear LineNr
    "" Remove highlight color from current line number
    "highlight clear CursorLineNr

    if has('cmdline_info')
        "" Show partial commands in status line and Selected characters/lines in visual mode
        set showcmd
    endif

    let g:airline_exist=isdirectory(expand("~/.vim/bundle/vim-airline/"))

    if has('statusline')
        set laststatus=2
        if g:airline_exist==0
            "" Broken down into easily includeable segments Filename
            set statusline=%<%f\
            "" Options
            set statusline+=%w%h%m%r
            "if isdirectory(expand("~/.vim/bundle/vim-fugitive/")) == 0
            "" Git Hotness
            "set statusline+=%{fugitive#statusline()}
            "endif
            "" Filetype
            set statusline+=\ [%{&ff}/%Y]
            "" Current dir
            set statusline+=\ [%{getcwd()}]
            "" Right aligned file nav info
            set statusline+=%=%-14.(%l,%c%V%)\ %p%%
            if has('cmdline_info')
                "" Show the ruler
                set ruler
                "" A ruler on steroids
                set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
            endif
        endif
    endif

    "" (bs) allows backspacing beyond starting point of insert mode, indents and line breaks
    set backspace=indent,eol,start
    "" No extra spaces between rows
    set linespace=0
    "" Line numbers on
    "set number
    set relativenumber
    "" Windows can be 0 line high
    set winminheight=0
    "" Puts new vsplit windows to the right of the current
    set splitright
    "" Puts new split windows to the bottom of the current
    set splitbelow
    "" (ws) allows search to wrap to top of document when the bottom has been hit
    set wrapscan
    "" (ic) ignores case in search patterns
    set ignorecase
    "" (scs) don't ignore case when the search pattern has uppercase
    set smartcase
    "" (is) highlights what you are searching for as you type
    set incsearch
    "" (hls) highlights all instances of the last searched string
    set hlsearch
    nmap <silent> <leader>/ :set invhlsearch<CR>
    "" Show list instead of just completing
    set wildmenu
    "" Command <Tab> completion, list matches, then longest common part, then all.
    set wildmode=list:longest,full
    "" wrap long lines
    set wrap
    "" (lbr) wrap long lines at a space instead of in the middle of a word
    set linebreak
    "" Backspace and cursor keys wrap too
    set whichwrap=b,s,h,l,<,>,[,]
    ""Lines to scroll when cursor leaves screen
    set scrolljump=5
    ""Minimum lines to keep above and below cursor
    set scrolloff=3

    "" Auto fold code
    set nofoldenable
    set foldmethod=indent
    "" Code folding options
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

    "" Highlight problematic whitespace
    "set list
    "set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
    "" In Visual Block Mode, cursor can be positioned where there is no actual character
    set ve=block
    "" Show matching brackets/parenthesis
    set showmatch
" }

" Formatting {
    "" Prevents inserting two spaces after punctuation on a join (J)
    set nojoinspaces
    "" (ts) width (in spaces) that a <tab> is displayed as
    set tabstop=4
    "" (sw) width (in spaces) used in each step of autoindent (as well as << and >>)
    set shiftwidth=4
    "" (sts)when use backspace,it will delete 4 spaces at the same time
    set softtabstop=4
    "" (et) expand tabs to spaces (use :retab to redo entire file)
    set expandtab
    "" (ai)Indent at the same level of the previous line
    set autoindent
    "" enable the smartindenting (si) feature for the following files
    set smartindent
    "" close autoindent when pasting
    set pastetoggle=<F12>
    function! Format()
        ""retab this file with specified tab rules
        retab
        "" Remove trailing whitespaces and ^M chars
        call StripTrailingWhitespace()
    endfunction

    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    "" Workaround broken colour highlighting in Haskell
    autocmd FileType haskell,rust setlocal nospell
    "" Match, to be used with %
    autocmd FileType xhtml,html,htm,php,xml setlocal matchpairs+=<:>
    "" enable the intelligent cindent (cin) feature for the following files
    autocmd FileType c,h setlocal cindent
    "" preceding line best in a plugin but here for now.
    autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
" }

" Key (re)Mappings {
    ""sudo
    cmap w!! w !sudo tee % >/dev/null
    ""format
    nmap <silent> <leader>= :call Format()<CR>
    "" Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk
    "" Rename the command , convert :W to :w(:W can't write)
    "" bang is !
    "" -nargs=* Any number of arguments are allowed,separated by white space
    "" <args> + ...  The command arguments
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
    ""UPPERCASE and lowsercase conversion
    nnoremap g^ gUiW
    nnoremap gv guiW
    "" Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
    "" Allow using the repeat operator with a visual selection (!)
    vnoremap . :normal .<CR>
    "" %  current file name
    "" :h head (last path component removed)
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
    map <leader>ew :edit %%
    map <leader>es :split %%
    map <leader>ev :vsplit %%
    map <leader>et :tabedit %%
    "" display all lines with keyword under cursor and ask which one to jump to
    "nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
    "" Easier formatting
    nnoremap <silent> <leader>q gwip
    nnoremap <silent> [b :bp<CR>
    nnoremap <silent> ]b :bn<CR>
    nnoremap <silent> [t :tabnext<CR>
    nnoremap <silent> ]t :tabprevious<CR>
    nnoremap <Leader>y "ay
    nnoremap <Leader>p "ap

    map <F4> :Ack -i 
" }

" Plugins {
    " TextObj Sentence
       " augroup textobj_sentence
       "     autocmd!
            "autocmd FileType markdown call textobj#sentence#init()
            "autocmd FileType textile call textobj#sentence#init()
            "autocmd FileType text call textobj#sentence#init()
        "augroup END
    " }

    " TextObj Quote {
   "     augroup textobj_quote
   "         autocmd!
            "autocmd FileType markdown call textobj#quote#init()
            "autocmd FileType textile call textobj#quote#init()
            "autocmd FileType text call textobj#quote#init({'educate': 0})
        "augroup END
    " }

    " PIV {
        "let g:DisableAutoPHPFolding = 0
        "let g:PIVAutoClose = 0
    " }

    " Misc {
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " }


    " syntastic{
        "set statusline+=%#warningmsg#
        "set statusline+=%{SyntasticStatuslineFlag()}
        "set statusline+=%*
        ""Enable this option to tell syntastic to always stick any detected errors into the |location-list|
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        ""Use this option to specify the height of the location lists that syntastic opens.
        let g:syntastic_loc_list_height = 5
    " }

    " OmniComplete {
        if has("autocmd") && exists("+omnifunc")
            autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
            hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
            hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
            "" Some convenient mappings
            "inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
            inoremap <expr> <CR>     pumvisible() ? "\<C-y>" : "\<CR>"
            inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
            inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
            inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
            inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
            "" Automatically open and close the popup menu / preview window
            au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
            "set completeopt=menu,preview,longest
            set completeopt=menu,longest
        endif
    " }

    " Ctags {
        set tags=./tags;
        autocmd FileType c set tags+=~/.vim/tags/systags
        "" Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " }

    " xolox/vim-easytags{
        "let g:easytags_dynamic_files = 1
        "Note that the g:easytags_dynamic_files option takes precedence over this option.
        "The easytags plug-in will create separate tags files for each file type in the configured directory
        "let g:easytags_by_filetype = 'tags'
        " Update on saving
        "let g:easytags_events = ['BufWritePost']
        " Don't highlight tags
        "let g:easytags_auto_highlight = 0
        " Include struct members
        "let g:easytags_include_members = 1
        " Don't warn if no ctags installed
        "let g:easytags_suppress_ctags_warning = 1
        " suppress the report displayed on tag updates.
        "let g:easytags_suppress_report = 1
    " }

    " cscope {
    if has("cscope")
        set cscopetag
        "" check cscope for definition of a symbol before checking ctags:set to 1 if you want the reverse search order.
        set csto=1
        ""add the database pointed to by environment variable
        if $CSCOPE_DB !=""
            cs add $CSCOPE_DB
        endif

        "" add any cscope database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
        endif

        "" show msg when any other cscope db added
        set cscopeverbose

        nmap <leader>sa :cs add cscope.out<CR>
        nmap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>

        set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
    endif
    " }

    " NerdTree {
        map <silent> <F2> :NERDTreeMirrorToggle<CR>
        let g:nerdtree_tabs_autofind=1

        let NERDTreeShowBookmarks=1
        let NERDTreeChDirMode=2         " Auto change the root directory
        let NERDTreeShowHidden=1        " show hidden files
        let NERDTreeWinPos="right"
        let NERDTreeMinimalUI=1
        "let g:NERDTreeWinSize = 23
        ""delete the file auto delete the buffer
        let NERDTreeAutoDeleteBuffer=1

        "let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        "augroup nerdtree_group
            "autocmd!
            "" open a NERDTree automatically when vim starts up if no files were specified
            "autocmd StdinReadPre * let s:std_in=1
            "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
            "" close vim if the only window left open is a NERDTree
            "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
        "augroup END
    " }

    " Tabularize {
        if isdirectory(expand("~/.vim/bundle/tabular"))
            map <leader>aa :Tabularize /
            "nmap <Leader>a& :Tabularize /&<CR>
            "vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            "nmap <Leader>a=> :Tabularize /=><CR>
            "vmap <Leader>a=> :Tabularize /=><CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            "nmap <Leader>a:: :Tabularize /:\zs<CR>
            "vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            "nmap <Leader>a,, :Tabularize /,\zs<CR>
            "vmap <Leader>a,, :Tabularize /,\zs<CR>
            "nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            "vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
    " }

    "" Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        "nmap <leader>sl :SessionList<CR>
        "nmap <leader>ss :SessionSave<CR>
        "nmap <leader>sc :SessionClose<CR>
        ""auto save session and viminfo when leaving
        au VimLeave * mksession!
        "au VimLeave * wviminfo!
    "" }

    " JSON {
        let g:vim_json_syntax_conceal = 0
    " }

    " PyMode {
        "" Disable if python support not present
        "if !has('python')
        "    let g:pymode = 0
        "endif

        "if isdirectory(expand("~/.vim/bundle/python-mode"))
        "    let g:pymode_lint_checkers = ['pyflakes']
        "    let g:pymode_trim_whitespaces = 0
        "    let g:pymode_options = 0
        "    let g:pymode_rope = 0
        "endif
    " }

    " ctrlp {
        if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
            if executable('ag')
                let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
            elseif executable('ack-grep')
                let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
            elseif executable('ack')
                let s:ctrlp_fallback = 'ack %s --nocolor -f'
            else
                let s:ctrlp_fallback = 'find %s -type f'
            endif

            if exists("g:ctrlp_user_command")
                unlet g:ctrlp_user_command
            endif

            ""scan for dotfiles and dotdirs,does not apply when a command defined with g:ctrlp_user_command is being used
            let g:ctrlp_show_hidden=1

            let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

            "" Use a version control listing command when inside a repository, this is faster when scanning large projects
            "" listing command lists untracked files (slower)
            let g:ctrlp_user_command = {
                \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
            \ }

            if isdirectory(expand("~/.vim/bundle/ctrlp-funky/"))
                "" CtrlP extensions
                let g:ctrlp_extensions = ['funky']

                ""funky
                nnoremap <Leader>fu :CtrlPFunky<Cr>

                "" narrow the list down with a word under cursor
                nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
            endif
        endif
    "}

    " TagBar {
        if executable('ctags')
            nnoremap <silent> <F3> :TagbarToggle<CR>
            let g:tagbar_width = 30     " Width of the Tagbar window in characters.
            let g:tagbar_left = 1       " Set this option to open it on the left instead
            "autocmd FileType c,cpp,h nested :TagbarOpen        " auto open Tagbar only for specific filetypes
            autocmd BufWinEnter * if &previewwindow | setlocal nonumber | endif
            let g:tagbar_previewwin_pos = "rightbelow"  "The position of the preview window
            let g:tagbar_autopreview = 1
            ""hide help infomation
            let g:tagbar_compact=1
        endif
    "}


    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        " Mnemonic _interactive
        nnoremap <silent> <leader>gi :Git add -p %<CR>
    "}

    " YouCompleteMe {
            "" force YCM to immediately recompile your file and display any new diagnostics it encounters.
            "nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

            ""no warning conf
            "let g:ycm_confirm_extra_conf=0
            "let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

            "" enable completion from tags
            "let g:ycm_collect_identifiers_from_tags_files = 1

           " Enable omni completion.
            autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
            autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
            autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
            autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

            "" remap Ultisnips for compatibility for YCM
            let g:UltiSnipsExpandTrigger = '<C-j>'
            let g:UltiSnipsJumpForwardTrigger = '<C-j>'
            let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

            "nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

            "" Haskell post write lint and check with ghcmod
            "" $ `cabal install ghcmod` if missing and ensure
            "" ~/.cabal/bin is in your $PATH.
            ""if !executable("ghcmod")
                ""autocmd BufWritePost *.hs GhcModCheckAndLintAsync
            ""endif

            "" For snippet_complete marker.
            ""if has('conceal')
                ""set conceallevel=2 concealcursor=i
            ""endif
    " }

    " UndoTree {
        "if isdirectory(expand("~/.vim/bundle/undotree/"))
            "nnoremap <silent> <F4> :UndotreeToggle<CR>
            """ If undotree is opened, it is likely one wants to interact with it.
            "let g:undotree_SetFocusWhenToggle=1
        "endif
    " }

    " Wildfire {
    map <SPACE> <Plug>(wildfire-fuel)
    vmap <S-SPACE> <Plug>(wildfire-water)
    let g:wildfire_objects = {
                \ "*" : ["i'", 'i"', "i)", "i]", "i}","ip"],
                \ "html,xml" : ["at"],
                \ }
    " }

    " vim-airline {
        if g:airline_exist==1
            "if isdirectory(expand("~/.fonts/"))
                "let g:airline_powerline_fonts=2
            "endif
            let g:airline#extensions#tabline#enabled = 1        " enable/disable bufferline integration
            let g:airline#extensions#tabline#left_sep = ' '
            let g:airline#extensions#tabline#left_alt_sep = '|'
            let g:airline#extensions#tabline#buffer_nr_show = 1 " configure whether buffer numbers should be shown
            let g:airline#extensions#tabline#fnamecollapse = 0  " configure collapsing parent directories in buffer name
            let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
            let g:airline#extensions#tabline#fnamemod = ':t'
            " the separator used on the left side
            let g:airline_left_sep='|'
            " the separator used on the right side
            let g:airline_right_sep='|'
            let g:airline_middle_sep='|'
        endif
    " }

    " nerdcommenter {
        "   imap <C-c> <plug>NERDCommenterInsert
    " }

    " vim-easymotion {
        "if isdirectory(expand("~/.vim/bundle/vim-easymotion/"))
            "map <Leader>m <Plug>(easymotion-prefix)
            "" Disable default mappings
            "let g:EasyMotion_do_mapping = 0
            "" This setting makes EasyMotion work similarly to Vim's smartcase option for global searches
            "let g:EasyMotion_smartcase=1
            "" Set this option to 0 to force the cursor to stay in the same column If you want to use both movements as separate mappings
            "let g:EasyMotion_startofline=0 
            "map <leader>ms <Plug>(easymotion-s2)
            "map <Leader>mj <Plug>(easymotion-j)
            "map <Leader>mk <Plug>(easymotion-k)
        "endif
    " }

    "SrcExplToggle {
    "
    "    // The switch of the Source Explorer
    "    nmap <F8> :SrcExplToggle<CR>

    "    " // Set the height of Source Explorer window
    "    let g:SrcExpl_winHeight = 8

    "    " // Set 100 ms for refreshing the Source Explorer
    "    let g:SrcExpl_refreshTime = 100

    "    " // Set "Enter" key to jump into the exact definition context
    "    let g:SrcExpl_jumpKey = "<ENTER>"

    "    " // Set "Space" key for back from the definition context
    "    let g:SrcExpl_gobackKey = "<SPACE>"

    "    " // In order to avoid conflicts, the Source Explorer should know what plugins
    "    " // except itself are using buffers. And you need add their buffer names into
    "    " // below listaccording to the command ":buffers!"
    "    let g:SrcExpl_pluginList = [
    "            \ "__Tagbar__",
    "            \ "_NERD_tree_"
    "        \ ]

    "    " // Enable/Disable the local definition searching, and note that this is not
    "    " // guaranteed to work, the Source Explorer doesn't check the syntax for now.
    "    " // It only searches for a match with the keyword according to command 'gd'
    "    let g:SrcExpl_searchLocalDef = 1

    "    " // Do not let the Source Explorer update the tags file when opening
    "    let g:SrcExpl_isUpdateTags = 0

    "    " // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
    "    " // create/update the tags file
    "    let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

    "    " // Set "<F12>" key for updating the tags file artificially
    "    let g:SrcExpl_updateTagsKey = "<F12>"

    "    " // Set "<F3>" key for displaying the previous definition in the jump list
    "    "let g:SrcExpl_prevDefKey = "<F3>"

    "    " // Set "<F4>" key for displaying the next definition in the jump list
    "    let g:SrcExpl_nextDefKey = "<F4>"
    "}
" }

" signify {
    nnoremap <silent> <leader>gg :SignifyToggle<CR>
    let g:signify_vcs_list = [ 'git', 'svn' ]

" }

" GUI Settings {

    """ GVIM- (here instead of .gvimrc)
    "if has('gui_running')
        """ Remove the toolbar
        "set guioptions-=T
        """ 40 lines of text instead of 24
        "set lines=40
        "if LINUX() && has("gui_running")
            "set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        "elseif OSX() && has("gui_running")
            "set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
        "elseif WINDOWS() && has("gui_running")
            "set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        "endif
    "else
        ""if &term == 'xterm' || &term == 'screen'
        ""endif
    "endif

" }

" Functions {
    " Strip whitespace {
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
    " }
     
    " delete others buffer
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

" }
