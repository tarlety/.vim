" Modeline and Metadata
" vim: set shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab textwidth=78 foldmarker={,} foldlevel=0 foldmethod=marker:
" Maintainer:
"           ____  __   _   ____  _  _  ___
"          (_  _)/  ) / ) (_  _)( \( )/ __)
"            )(   )( / _ \ _)(_  )  (( (_-.
"           (__) (__)\___/(____)(_)\_)\___/
"
" Description:
"
"   This is a .vimrc file that integrates personal configurations to create a
"   practical, comfortable, lightweight, and powerful editor environment. This
"   file contains various configurations and plugins that define behaviors in
"   settings, interface, search, movement, formatting, editing, and more.
"

" Skip all configurations and plugins for vim.tiny {
    if !1 | finish | endif
" }

" General {

    " This must be first, because it changes other options as a side effect.
    set nocompatible

    " Sets how many lines of history VIM has to remember
    set history=1000

    " Encoding settings, compatible with Windows files in Chinese
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8,gb18030,utf-16,big5
    set termencoding=utf8

    " Set to auto read when a file is changed from the outside
    set autoread
    au FocusGained,BufEnter * checktime

    " do not keep a backup file
    set nobackup

    " set swap folder to .vim/swap
    set directory^=$HOME/.vim/swap/

    " opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
    set hid

    " Don't redraw while executing macros (good performance config)
    set lazyredraw

    " Show key combinations
    set showcmd

    " With a map leader it's possible to do extra key combinations
    let mapleader = ","

    " Quicker command mode
    noremap ; :

    " Save and Quit (ZZ to save the current file and exit Vim)
    noremap zz :w<CR>
    noremap Q :q<CR>

" }

" User Interface {

    " Settings to customize the appearance and behavior of the Vim editor. {

        " Set the displayed lines to include the 7 lines before and after the
        " current cursor position, creating a contextual view on the screen.
        set so=7

        " Display line numbers at the beginning of each line.
        set nu

        " Do not display line numbers relative to the line with the cursor,
        " syntax highlight performance impacted.
        set nornu

        " Always show the cursor's position in the bottom right corner of the
        " screen.
        set ruler

        " Highlight the text of the line where the cursor is located.
        set cursorline

        " Set the width of the folding column to 0, so that folding symbols
        " are not displayed on the left side of the editor.
        set foldcolumn=0

        " Enable the Wild menu, which provides options for command-line
        " auto-completion.
        set wildmenu

        " Always display two lines for the status bar.
        set laststatus=2

    " }

    " Configuration for search and match patterns {

        " Enable case-insensitive searching to improve flexibility and
        " convenience
        set ignorecase

        " Determine whether to differentiate case sensitivity based on the
        " presence of uppercase letters in the search pattern. This practical
        " feature automatically handles case sensitivity when needed and
        " ignores it when not necessary.
        set smartcase

        " Highlight the last used search pattern to facilitate tracking of
        " search results, especially in long documents.
        set hlsearch

        " Enable incremental searching, which displays matching results in
        " real-time as you input the search pattern. This is helpful for
        " quickly locating desired content.
        set incsearch

        " In magic mode, certain metacharacters in regular expressions are
        " interpreted with special meanings without requiring backslash
        " escaping. Enabling this option makes Vim's regular expressions more
        " concise and intuitive, facilitating search and replace operations.
        " In magic mode, /exp.*ion/ can directly search for "expression".
        " In non-magic mode, /exp\.\*ion/ needs to be escaped with a backslash
        " to search for the literal meaning of "/expression/".
        set magic

        " Show matching brackets when the text cursor is positioned over them.
        " This setting helps identify matching brackets, particularly when
        " working with nested bracket structures in code editing.
        set showmatch

        " Set the duration of bracket flashing to visually indicate the
        " location of matching brackets.
        set mat=2

        " In visual mode, pressing * or # will quickly search for the selected
        " text, making it convenient for finding and locating occurrences.
        vnoremap <silent> * :<C-u>call VisualSelection()<CR>/<C-R>=@/<CR><CR>
        vnoremap <silent> # :<C-u>call VisualSelection()<CR>?<C-R>=@/<CR><CR>

        " helper function for current selection {
        function! VisualSelection() range
            let l:saved_reg = @"
            execute "normal! vgvy"

            let l:pattern = escape(@", "\\/.*'$^~[]")
            let l:pattern = substitute(l:pattern, "\n$", "", "")

            let @/ = l:pattern
            let @" = l:saved_reg
        endfunction " }

        " Use the <leader>/ shortcut to disable the highlight of search
        " results, clearing the screen from the highlighting and creating a
        " cleaner interface.
        map <silent> <leader>/ :noh<cr>

        " Automatically disable the last search highlight when opening Vim
        " editor to maintain a clean interface.
        exec "nohlsearch"

        " When the cursor is moved, highlight the word under the cursor,
        " distinguishing it as a variable and marks the matched word as "Todo"
        " applying a specific style or color to highlight it. This feature
        " helps in easily identifying and handling variables in code.
        autocmd CursorMoved * exe printf('match Todo /\V\<%s\>/', escape(expand('<cword>'), '/\'))

    " }

    " Improve efficiency and convenience when editing files {

        " Allow using the backspace key to delete indentation, end-of-line, and
        " start-of-line characters in insert mode. This setting enhances
        " flexibility for making corrections during the editing process.
        set backspace=indent,eol,start

        " When reaching the beginning (<), end (>), or screen edge (h and l)
        " of a line, the cursor automatically moves to the next or previous
        " line. This setting speeds up navigation within a line.
        set whichwrap+=<,>,h,l

        " Map W and B to facilitate faster movement while quickly browsing
        " through files.
        noremap W 5w
        noremap B 5b

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    " }

    " Movement and management between buffers and windows {

        " Buffer switching.
        nmap gj :bn<cr>
        nmap gk :bp<cr>
        nmap g<tab> :b#<cr>
        nmap <leader>bd :bd<cr>

        " Beautification of window separators.
        set fillchars+=vert:\│

        " Creation and deletion of windows.
        map <c-w>- :set splitbelow<cr>:split<cr>
        map <c-w>\| :set splitright<cr>:vsplit<cr>
        map <c-w>\ :set splitright<cr>:vsplit<cr>

        " Setting showtabline to 2 ensures that the tabline is always
        " displayed, even when only one file is open. This means that
        " regardless of the number of opened files, the tabline will always be
        " visible at the top of the interface, allowing for easy viewing and
        " switching between different file tabs.
        set showtabline=2

    " }

" }

" Formatting {

    " Enable syntax highlighting to make the code more clear.
    syntax on

    " Enable filetype plugins and indentation.
    filetype plugin on
    filetype indent on

    " Enable auto-indentation and smart indenting to maintain consistent
    " indentation style during editing.
    set autoindent
    set smartindent

    " Handle indentation and tab characters by converting Tab characters to
    " spaces and setting corresponding indent and shift widths. These settings
    " help ensure code consistency and portability.
    " The indent rule: 1 tab = 2 spaces. Use space instead of tab.
    set expandtab
    set tabstop=8
    set softtabstop=2
    set shiftwidth=2
    set smarttab

    " Configure folding options to fold based on indent levels, providing a
    " better overview of code structure.
    set foldmethod=indent
    set foldlevel=10

    " Control the width of text. Set the maximum width of text lines to 80
    " characters and display a vertical line at the 80th character to aid in
    " alignment and code adjustment.
    autocmd FileType text setlocal textwidth=80
    set colorcolumn=80

    " Enable text wrapping but not at hyphens. This means that content after a
    " hyphen will remain on the same line without wrapping to the next line.
    set wrap nolinebreak

    " Disable automatic line wrapping. This setting instructs Vim not to
    " automatically wrap text but to display only a portion of long lines
    " within the text width limit.
    set nowrap

    " Toggle word wrap on and off
    map <leader><leader>z :setlocal nowrap!<cr>

    " Used for defining modelines, which only take effect in the first two
    " lines and last two lines of a file. Modelines are special lines that
    " contain specific instructions that can affect Vim's settings.
    set modeline
    set modelines=2

    " Highlight extra whitespace by setting a background color and using a
    " regular expression to match trailing whitespace characters. This helps
    " in checking and removing unnecessary whitespace in code.
    highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

    " Display special characters, such as tabs and trailing whitespace. This
    " makes these characters more visible in the editor and helps in checking
    " formatting issues in the code.
    set list
    set listchars=tab:\|\ ,trail:▫

    " Speed up indentation by providing faster mappings for indenting.
    nnoremap < <<
    nnoremap > >>

    " Replace tab characters with space characters. This is useful for
    " converting between tabs and spaces in the text.
    nnoremap <leader>=t :%s/\t/    /g<cr>
    vnoremap <leader>=t :s/\t/    /g<cr>

" }

" Editing {

    " Toggle paste mode.
    map <leader><leader>p :setlocal paste!<cr>

    " Share clipboard with system.
    set clipboard+=unnamed
    set clipboard+=unnamedplus

    " Persistent undo: Create a directory for storing undo history and configure
    " related undo parameters. This allows for easy undo and redo operations
    " during editing.
    if !isdirectory("~/.vim/undodir")
        silent !mkdir -p ~/.vim/undodir
    endif
    try
        set undodir=~/.vim/undodir
        set undofile
        set undolevels=1000
        set undoreload=10000
    catch
    endtry

    " Disable spell checking.
    set nospell

    " Toggle spell checking.
    noremap <leader><leader>s :setlocal spell!<cr>

    " sn: next typo
    noremap <leader>sn ]s
    " sp: previous typo
    noremap <leader>sp [s
    " sa: add typo to dict
    noremap <leader>sa zg
    " sc: fix typo
    noremap <leader>sc a<c-x>s<esc>
    " s?: list all typo
    noremap <leader>s? z=

" }

" Misc {

    " Open the vimrc file anytime
    noremap <leader>rc :e ~/.vim/vimrc<CR>

    " Reload vimrc
    noremap <leader>rr :source ~/.vim/vimrc<CR>

    " call figlet
    noremap tx :r !figlet -f pagga 

    " sudo write
    command! SudoWrite :w !SUDO_ASKPASS=`which ssh-askpass` sudo -A tee %

" }

" Plugins Manager: vim-plug {

    " Benefits: on-demand loading, parallel installation/update
    " https://github.com/junegunn/vim-plug
    " ~/.vim/autoload/plug.vim

    " install vim-plug automatically {

        if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif

    " }

    call plug#begin('~/.vim/bundle')

    " Plugins - General {

        Plug 't16ing/vim-vandomkeyhint'
          " randomly pick keybindings hint and show in the message bar
        Plug 'mhinz/vim-startify'
          " <leader>S open the fancy start screen for Vim. :SSave to save session.

    " }

    " Plugins - lightline family {

        Plug 'itchyny/lightline.vim'
          " Lean & mean status/tabline for vim that's light as air.
        Plug 'mengelbrecht/lightline-bufferline'
          " gn to next buffer, gp to previous buffer, g[1-9] to buffer n
        Plug 'sinetoami/lightline-hunks'
          " git hunks and git branch for lightline
        Plug 'maximbaz/lightline-ale'
          " ALE indicator for the lightline vim plugin
        Plug 'josa42/vim-lightline-coc'
          " coc diagnostics indicator for the lightline vim plugin

    " }

    " Plugins - Files and Navigation {

        Plug 'scrooloose/nerdtree'
          " <leader>nn open nerdtree window. <leader>nf find current file in nerdtree.'
        Plug 'Xuyuanp/nerdtree-git-plugin'
          " git notation for nerdtree

        if empty(glob('~/.fzf')) " {
            Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        else
            set rtp+=~/.fzf
        endif " }
        Plug 'junegunn/fzf.vim'
          " <leader>fp to open ctrlp window. <leader>ff for cursor word search, and <leader>f/ to open fzf window.

        Plug 'airblade/vim-rooter'
          " changes the working directory to the project root when you open a file or directory

        Plug 'Lokaltog/vim-easymotion'
          " <leader><leader>w forward move <leader><leader>b backward move

        Plug 'kshenoy/vim-signature'
          " Visible mark (m-*)
    " }

    " Plugins - Coding {

        Plug 'tpope/vim-fugitive'
          " <leader>gb git blame <leader>gl git log
        Plug 'airblade/vim-gitgutter'
          " <leader>gt Visible git sign ]c and [c for hunk navigation.

        Plug 'majutsushi/tagbar'
          " <leader>tt to open tag bar; ctags required

        Plug 'dense-analysis/ale'
          " Visible linter ERROR and warning, ]e and [e for error navigation.
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
          " Conquer of Completion, ]g and [g for error navigation.
        Plug 'wellle/tmux-complete.vim'
          " complete words visible in Tmux panes

        Plug 'ap/vim-css-color'
          " A very fast, multi-syntax context-sensitive color name highlighter

    " }

    " Plugins - filetypes {

        " javascript {
        Plug 'nikvdp/ejs-syntax', {'for': 'ejs'}
          " syntax for ejs
        Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
          " syntax for ts
        Plug 'hushicai/tagbar-javascript.vim'
          " tagbar for js; have to load early, otherwise not working
        Plug 'moll/vim-node'
          " gf in node.js require(...)
        " }

        " markdown {
        Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['markdown'] }
          " <leader>tm to start automatic table creator & formatter
        Plug 'mzlogin/vim-markdown-toc', { 'on': 'GenTocGFM', 'for': ['markdown'] }
          " :GenTocGFM to generate markdown TOC for Github markdown
        " }

        " gpg {
        Plug 'jamessan/vim-gnupg'
          " transparent editing of gpg encrypted files: ".gpg", ".pgp" or ".asc" suffix
        " }

    " }

    " Plugins - Formatting {

        Plug 'nathanaelkane/vim-indent-guides'
          " visually displaying indent levels
        Plug 'luochen1990/rainbow'
          " rainbow parentheses {[()]}

        Plug 'maksimr/vim-jsbeautify'
          " <leader>== to format javascript, html and css files

    " }

    " Plugins - Editing {

        Plug 'terryma/vim-expand-region'
          " Press + to expand the visual selection and _ to shrink it.
        Plug 'tpope/vim-surround'
          " All about surround. '+' then 'S' then surround.
        Plug 'gregsexton/MatchTag'
          " Highlights the matching HTML tags
        Plug 'tpope/vim-commentary'
          " gcc to comment out a line, gcap to comment out a paragraph
        Plug 'junegunn/vim-peekaboo'
          " extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers
        Plug 'mbbill/undotree'
          " visualizes undo history, <leader>u to open undo tree
        Plug 'Ron89/thesaurus_query.vim'
          " <leader>cs to lookup synonyms of any word under cursor or phrase covered in visual mode, and replace it with an user chosen synonym
        Plug 'mg979/vim-visual-multi'
          " ctrl+N to select words, n to confirm, q to skip
        Plug 'maxbrunsfeld/vim-yankstack'
          " <a-p> cycle backward through your history of yanks

    " }

    " Plugins - Themes {

        Plug 'flazz/vim-colorschemes'
          " colorscheme gruvbox/PaperColor with dark background
        " TODO: a lag-fixed fork of 'tiagofumo/vim-nerdtree-syntax-highlight', change back to upstream if PR is merged.
        Plug 'tarlety/vim-nerdtree-syntax-highlight'
          " color highlights for nerdtree
        Plug 'ryanoasis/vim-devicons'
          " icons plugin for nerdtree

    " }

    call plug#end()

"}

" Plugins Configs {

    " plugin vim-vandomkeyhint {
    " ~/.vim/bundle/vim-vandomkeyhint/autoload/vandomkeyhint.vim
    " This has to be prior than any VkhAdd command
    " Has to be done here to avoid following "VkhAdd" from leading to error
    let vkh_readme=expand('~/.vim/bundle/vim-vandomkeyhint/README.md')
    if !filereadable(vkh_readme)
        echo "Installing vandomkeyhint.."
        echo ""
        silent !mkdir -p ~/.vim/bundle/vim-vandomkeyhint
        silent !git clone https://github.com/t16ing/vim-vandomkeyhint ~/.vim/bundle/vim-vandomkeyhint
    endif
    set rtp+=~/.vim/bundle/vim-vandomkeyhint/
    call vandomkeyhint#rc()
    " }

    " plugin vim-startify {
    " ~/.vim/bundle/vim-startify/doc/startify.txt

    " Define your own header. {
    let g:ascii = [
        \ '  ____  __   _   ____  _  _  ___',
        \ ' (_  _)/  ) / ) (_  _)( \( )/ __)',
        \ '   )(   )( / _ \ _)(_  )  (( (_-.',
        \ '  (__) (__)\___/(____)(_)\_)\___/',]
    let g:startify_custom_header =
        \ 'startify#pad(g:ascii + startify#fortune#boxed())'
    " }

    " Startify displays lists. Each list consists of a `type` and optionally a `header` and custom `indices`. {
    let g:startify_lists = [
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
    " }

    " hardcoded files or directories that will always be shown {
    let g:startify_bookmarks = [
        \ '~/.vim/vimrc',
        \ '~/.zshrc',
        \ '~/.tmux.conf',
        \ '~/.config/ranger/rc.conf',
        \ '~/README.md',
        \ '~/.vim/README.md',
        \ '~/.config/ranger/README.md' ]
    " }

    " The directory to save/load sessions to/from.
    let g:startify_session_dir = '~/.vim/session'

    " Automatically update sessions
    let g:startify_session_persistence=1

    " updates oldfiles on-the-fly, so that :Startify is always up-to-date.
    let g:startify_update_oldfiles = 0

    " Unicode box-drawing characters will be used instead.
    let g:startify_fortune_use_unicode = 1

    " anytime <leader>S to launch Startify
    map <leader>S :Startify<CR>

    VkhAdd 'vim-startify: <leader>S open the fancy start screen. :SSave to save session.'
    " }

    " plugin nerdtree {
    " ~/.vim/bundle/nerdtree/doc/NERDTree.txt
    " ~/.vim/bundle/nerdtree-git-plugin/README.md

    let g:NERDTreeQuitOnOpen = 1
    let g:NERDTreeGitStatusWithFlags = 1
    let g:NERDTreeIgnore = ['^node_modules$']
    let g:NERDTreeWinSize = 32
    let g:NERDTreeGitStatusUseNerdFonts = 1

    map <leader>nn <ESC>:NERDTreeToggle<CR>
    map <leader>nf <ESC>:NERDTreeFind<CR>

    VkhAdd 'nerdtree: <leader>nn open nerdtree window. <leader>nf find current file in nerdtree.'
    " }

    " plugin fzf.vim {
    " ~/.vim/bundle/fzf/README-VIM.md
    " ~/.vim/bundle/fzf.vim/README.md

    noremap <silent> <expr> <leader>ff ':Rg '.expand('<cword>').'<CR>'
    vnoremap <leader>ff y:Rg <C-R><C-R>"<CR>
    noremap <silent> <leader>fp :Files<CR>
    noremap <silent> <leader>fh :History<CR>
    noremap <silent> <leader>ft :Tags<CR>
    noremap <silent> <leader>fl :Lines<CR>
    noremap <silent> <expr> <leader>f* ':Lines '.expand('<cword>').'<CR>'
    vnoremap <leader>f* y:Lines <C-R><C-R>"<CR>
    noremap <silent> <leader>fb :Buffers<CR>
    noremap <silent> <leader>fg :BCommits<CR>
    noremap <silent> <leader>f; :History:<CR>
    noremap <silent> <leader>f/ :Rg<CR>

    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1
    " [[B]Commits] Customize the options used by 'git log':
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'

    " default option: Preview window on the right with 50% width
    let g:fzf_preview_window = 'right:60%'
    " Default fzf layout { 'window': { 'width': 0.9, 'height': 0.6 } }
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

    VkhAdd 'fzf.vim: <leader>fp to open ctrlp window.'
    VkhAdd 'fzf.vim: <leader>ff for cursor word search'
    VkhAdd 'fzf.vim: <leader>f/ to open fzf window.'
    " }

    " plugin vim-rooter {
    " ~/.vim/bundle/vim-rooter/README.mkd
    let g:rooter_patterns = ['__vim_project_root', '.git/']
    let g:rooter_silent_chdir = 1
    " }

    " plugin vim-easymotion {
    " ~/.vim/bundle/vim-easymotion/README.md
    VkhAdd 'vim-easymotion: <leader><leader>w jump forward <leader><leader>b jump backward.'
    " }

    " plugin vim-signature {
    " ~/.vim/bundle/vim-signature/doc/signature.txt

    " marks key mappings
    let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'ToggleMarkAtLine'   :  "mm",
        \ 'PurgeMarks'         :  "m<Space>",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "mN",
        \ 'GotoPrevMarker'     :  "mP",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListBufferMarks'    :  "ml",
        \ 'ListBufferMarkers'  :  "mL"
        \ }

    " highligh for markers
    let g:SignatureMarkLineHL = "QuickFixLine"

    " When a line has both marks and markers, display the sign for markers
    let g:SignaturePrioritizeMarks = 0

    VkhAdd 'mark: mm toggle a mark, mn/mp motion, ml list, m<space> clear all'
    VkhAdd 'marker: m[0-9] toggle a marker, mN/mP motion, mL list, m<BS> clear all'
    " }

    " plugin vim-fugitive & plugin gitgutter {
    " ~/.vim/bundle/vim-gitgutter/doc/gitgutter.txt
    " ~/.vim/bundle/vim-fugitive/doc/fugitive.txt

    let g:gitgutter_enabled         = 1
    let g:gitgutter_highlight_lines = 0

    let g:my_git_view_type=''

    map <leader>gt <ESC>:GitGutterToggle<CR>
    map <leader>gb <ESC>:Gblame<CR>
    map <leader>gl <ESC>:Gllog<CR>

    VkhAdd "plugin vim-gitgutter: shows a git diff in the 'gutter' (sign column)"
    VkhAdd "<leader>gt A Vim plugin which shows a git diff in the 'gutter' (sign column)."
    VkhAdd '<]c> for next hunk, <[c> for previous hunk.'

    VkhAdd 'plugin vim-fugitive: for Gblame and Glog'
    VkhAdd '<leader>gb brings up an interactive vertical split with git blame output.'
    VkhAdd '<leader>gl brings up commit history.'
    " }

    " plugin tagbar {
    " ~/.vim/bundle/tagbar/doc/tagbar.txt
    " plugin tagbar: requires apt install exuberant-ctags.
    " ~/.vim/bundle/tagbar-javascript.vim/README.md
    " plugin tagbar-javascript.vim: requires npm install -g esctags.

    let g:tagbar_autofocus   = 1
    let g:tagbar_autoclose   = 1
    let g:tagbar_autoshowtag = 1
    let g:tagbar_width = 32

    map <leader>tt <ESC>:TagbarToggle<CR>

    VkhAdd 'tagbar: <leader>tt to open Tagbar window.'
    " }

    " plugin ale {
    " ~/.vim/bundle/ale/README.md

    let g:ale_linters = {
    \ 'javascript': ['jshint'],
    \ 'python': ['pylint', 'python'],
    \ 'go': ['go', 'golint', 'errcheck'],
    \}

    " Disable linting for minify or filetypes managed by other plugins
    let g:ale_pattern_options = {
    \ '\.min.js$': {'ale_enabled': 0},
    \ '\.php$': {'ale_enabled': 0},
    \ '\.py$': {'ale_enabled': 0},
    \ '\.h$': {'ale_enabled': 0},
    \ '\.cpp$': {'ale_enabled': 0},
    \ }

    " navigate between errors quickly
    nmap <silent> [e <Plug>(ale_previous_wrap)
    nmap <silent> ]e <Plug>(ale_next_wrap)

    " specify what text should be used for signs
    let g:ale_sign_error = 'ER'
    let g:ale_sign_warning = 'WA'

    " default is 200 ms, increase to 5s to save battery power
    let g:ale_lint_delay = 5000

    VkhAdd 'ale: ]e [e to navigate errors.'
    " }

    " plugin tmux-complete.vim {
    " ~/.vim/bundle/tmux-complete.vim/README.md
    VkhAdd 'vim-complete.vim: complete words visible in Tmux panes'
    " }

    " plugin vim-css-color {
    " ~/.vim/bundle/vim-css-color/README.md
    VkhAdd 'vim-css-color: A very fast, multi-syntax context-sensitive color name highlighter'
    " }

    " plugin ultisnips and vim-snippets {
    " ~/.vim/bundle/ultisnips/README.md
    let g:UltiSnipsExpandTrigger="<c-o>"
    let g:UltiSnipsJumpForwardTrigger="<c-n>"
    let g:UltiSnipsJumpBackwardTrigger="<c-p>"
    let g:UltiSnipsEditSplit="horizontal"
    " snippets: ~/.vim/bundle/vim-snippets/snippets
    source ~/.vim/snippets/markdown.vim
    VkhAdd 'ultisnips: <c-o> trigger snippets.'
    " }

    " plugin vim-table-mode {
    " ~/.vim/bundle/vim-table-mode/README.md

    " Better general leading key for markdown table mode
    let g:table_mode_map_prefix = '<leader>m'

    VkhAdd 'vim-table-mode: <leader>mm to start automatic table creator & formatter'
    " }

    " plugin vim-markdown-toc {
    " ~/.vim/bundle/vim-markdown-toc/README.md
    VkhAdd 'vim-markdown-toc: :GenTocGFM to generate markdown TOC.'
    " }

    " plugin vim-indent-guides {
    " ~/.vim/bundle/vim-indent-guides/README.markdown

    " have indent guides enabled by default
    let g:indent_guides_enable_on_vim_startup = 1
    " customize the size of the indent guide
    let g:indent_guides_guide_size = 1
    " Use this option to control which indent level to start showing guides from.
    let g:indent_guides_start_level = 2
    " Use this option to specify a list of filetypes to disable the plugin for.
    let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify']

    " }

    " plugin rainbow {
    " ~/.vim/bundle/rainbow/README.md
    let g:rainbow_active = 1
    " }

    " plugin vim-expand-region {
    " ~/.vim/bundle/vim-expand-region/README.md
    let g:expand_region_text_objects = {
                \ 'iw'  :0,
                \ 'iW'  :0,
                \ 'i"'  :1,
                \ 'i''' :1,
                \ 'i]'  :1,
                \ 'ib'  :1,
                \ 'iB'  :1,
                \ 'ip'  :1,
                \ 'if'  :1,
                \ 'ic'  :1,
                \ }
    VkhAdd "vim-expand-region: `+` to expand the visual selection and `_` to shrink it."
    " }

    " plugin vim-surround {
    " ~/.vim/bundle/vim-surround/README.markdown
    VkhAdd "'+' then 'S' then surround."
    " }

    " plugin MatchTag {
    " ~/.vim/bundle/MatchTag/README.mkd
    " no options, and only works on html/xml ft
    " example: ~/.vim/bundle/MatchTag/test.html
    " }

    " plugin vim-commentary {
    " ~/.vim/bundle/vim-commentary/README.markdown
    VkhAdd 'vim-commentary: gcc for single line or gcap for a paragraph.'
    " }

    " plugin vim-peekaboo {
    " ~/.vim/bundle/vim-peekaboo/README.md
    VkhAdd 'vim-peekaboo: (NORMAL)" or @ (INSERT) <CTRL-R> to see registers.'
    " }

    " plugin undotree {
    " ~/.vim/bundle/undotree/README.md

    " change windows layout for bigger diff area
    let g:undotree_WindowLayout = 2

    " get focus after being opened
    let g:undotree_SetFocusWhenToggle = 1

    " Set to 1 to get short timestamps
    let g:undotree_ShortIndicators = 1

    " Set this to 1 to auto open the diff window.
    let g:undotree_DiffAutoOpen = 1

    " The function will be called after the undotree windows is initialized
    function! g:Undotree_CustomMap()
        nmap <buffer> k <plug>UndotreeNextState
        nmap <buffer> j <plug>UndotreePreviousState
    endfunc

    " to toggle the undo-tree panel
    nnoremap <leader>u :UndotreeToggle<cr>

    VkhAdd 'undotree: <leader>u to open undo tree'
    " }

    " plugin thesaurus_query.vim {
    " ~/.vim/bundle/thesaurus_query.vim/README.md
    VkhAdd 'thesaurus_query.vim: <leader>cs to lookup synonyms'
    " }

    " plugin vim-visual-multi {
    " ~/.vim/bundle/vim-visual-multi/README.md
    VkhAdd 'vim-visual-multi: ctrl+N to select words, n to confirm, q to skip, \\a to align'
    " }

    " plugin vim-yankstack {
    " ~/.vim/bundle/vim-yankstack/README.md
    let g:yankstack_yank_keys = ['y', 'd', 'c']
    VkhAdd '<a-p> cycle backward through your history of yanks'
    " }

    " plugin vim-colorschemes {
    " ~/.vim/bundle/vim-colorschemes/README.md
    set t_Co=256
    try
        colorscheme PaperColor
    catch
        colorscheme murphy
    endtry

    set background=dark
    hi Normal ctermbg=none
    hi NonText ctermbg=none

    " }

    " plugin vim-nerdtree-syntax-highlight {
    " ~/.vim/bundle/vim-nerdtree-syntax-highlight/README.md

    " nerdtree with vim-nerdtree-syntax-highlight is slow
    " try https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/issues/17
    " and https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/issues/6

    " To improve syntax highlighting scroll performance, try this
    " https://github.com/vim/vim/issues/1735
    set regexpengine=1
    " }

    " plugin vim-devicons {
    " ~/.vim/bundle/vim-devicons/README.md
    " issue:
    "  https://github.com/ryanoasis/vim-devicons/issues/274
    " screenshot:
    "  https://user-images.githubusercontent.com/24741314/60797287-939f2d80-a1a1-11e9-8e18-a19d3a5b1711.png
    " fix:
    "  https://github.com/ryanoasis/vim-devicons/issues/274#issuecomment-513560707
    let g:rainbow_conf = {
          \    'separately': {
          \       'nerdtree': 0
          \    }
          \}
    " }

    " plugin lightline.vim {
    " ~/.vim/bundle/lightline.vim/README.md
    " plugin lightline-bufferline
    " ~/.vim/bundle/lightline-bufferline/README.md
    " plugin lightline-hunks
    " ~/.vim/bundle/lightline-hunks/README.md
    " plugin lightline-ale
    " ~/.vim/bundle/lightline-ale/README.md
    " plugin vim-lightline-coc
    " ~/.vim/bundle/vim-lightline-coc/README.md

    " lightline {
    let g:lightline = {
        \ 'colorscheme': 'PaperColor',
        \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
        \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
        \ }
    let g:lightline.active = {
        \ 'left': [ [ 'mode', 'paste', 'spell' ],
        \           [ 'modified' ],
        \           [ 'hunks', 'readonly', 'relativepath' ],
        \ ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ],
        \            [ 'filetype', 'fileencoding', 'fileformat' ],
        \            [ 'coc_errors', 'coc_warnings', 'coc_ok', 'coc_status' ],
        \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
        \ ] }
    let g:lightline.component_function = {
        \ 'hunks': 'lightline#hunks#composer',
        \ }
    let g:lightline.tabline = {
        \ 'left': [ [ 'buffers' ] ],
        \ 'right': [ [ 'tabs' ] ] }
    let g:lightline.component_expand = {
        \ 'buffers': 'lightline#bufferline#buffers',
        \ 'linter_checking': 'lightline#ale#checking',
        \ 'linter_infos': 'lightline#ale#infos',
        \ 'linter_warnings': 'lightline#ale#warnings',
        \ 'linter_errors': 'lightline#ale#errors',
        \ 'linter_ok': 'lightline#ale#ok',
        \ }
    let g:lightline.component_type = {
        \ 'buffers': 'tabsel',
        \ 'linter_checking': 'right',
        \ 'linter_infos': 'right',
        \ 'linter_warnings': 'warning',
        \ 'linter_errors': 'error',
        \ 'linter_ok': 'right',
        \ }
    let g:lightline.tab_component_function = {
          \ 'filename': '',
          \ 'modified': '',
          \ 'readonly': '',
          \ 'tabnum': 'lightline#tab#tabnum' }
    " }

    " statusline for |Tagbar| buffers. {
    let g:tagbar_status_func = 'TagbarStatusFunc'
    function! TagbarStatusFunc(current, sort, fname, ...) abort
      return lightline#statusline(0)
    endfunction
    " }

    " lightline-hunks: Symbol visible to the left of the branch. {
    let g:lightline#hunks#branch_symbol = '(c) '
    " }

    " lightlien-ale indicators and configs {

        let g:lightline#ale#indicator_checking = "..."
        let g:lightline#ale#indicator_infos = "(e)\uf129 "
        let g:lightline#ale#indicator_warnings = "(e)\uf071 "
        let g:lightline#ale#indicator_errors = "(e)\uf05e "
        let g:lightline#ale#indicator_ok = ""

    " }

    " vim-lightline-coc indicators and configs {

        let g:lightline#coc#indicator_warnings = "(g)\uf071 "
        let g:lightline#coc#indicator_errors = "(g)\uf05e "
        let g:lightline#coc#indicator_ok = ""

        " register lightline#coc compoments {
        try
            call lightline#coc#register()
        catch
        endtry " }

    " }

    " `-- INSERT --` is unnecessary anymore because the mode information is displayed in the statusline.
    set noshowmode

    " lighline#bufferline {

        " `2`: Ordinal number (buffers are numbered from _1_ to _n_ sequentially)
        let g:lightline#bufferline#show_number = 2

        " to use unicode superscript numerals for ordinal number
        let g:lightline#bufferline#number_map = {
        \ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
        \ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉'}

        " Enables the usage of [vim-devicons](https://github.com/ryanoasis/vim-devicons) to display a filetype icon for the buffer.
        let g:lightline#bufferline#enable_devicons = 1

        " Enables the usage of [nerdfont.vim](https://github.com/lambdalisue/nerdfont.vim) to display a filetype icon for the buffer.
        let g:lightline#bufferline#enable_nerdfont = 1

        " the symbols `+`, `-` and `...` are replaced by `✎`, `` and `…`.
        let g:lightline#bufferline#unicode_symbols = 1

    " }

    " This plugin provides Plug mappings to switch to buffers using their ordinal number in the bufferline {
    nmap g1 <Plug>lightline#bufferline#go(1)
    nmap g2 <Plug>lightline#bufferline#go(2)
    nmap g3 <Plug>lightline#bufferline#go(3)
    nmap g4 <Plug>lightline#bufferline#go(4)
    nmap g5 <Plug>lightline#bufferline#go(5)
    nmap g6 <Plug>lightline#bufferline#go(6)
    nmap g7 <Plug>lightline#bufferline#go(7)
    nmap g8 <Plug>lightline#bufferline#go(8)
    nmap g9 <Plug>lightline#bufferline#go(9)
    " }

    VkhAdd "plugin vim-lightline: Lean & mean status/tabline for vim that's light as air."
    VkhAdd 'gn to next buffer, gp to previous buffer, g[1-9] to move to tab n'
    VkhAdd '<leader>bd to close buffer'
    " }

    " plugin coc.nvim {
    " ~/.vim/bundle/coc.nvim/Readme.md
    " https://github.com/neoclide/coc.nvim#example-vim-configuration

    let g:coc_global_extensions = [
                \ 'coc-json',
                \ 'coc-vimlsp',
                \ 'coc-phpls',
                \ 'coc-html',
                \ 'coc-css',
                \ 'coc-go',
                \ 'coc-tsserver',
                \ 'coc-pyright',
                \ 'coc-omnisharp',
                \ ]

    " CoC Generic {

        " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
        set updatetime=500

        " Don't pass messages to |ins-completion-menu|.
        set shortmess+=c

        " Always show the signcolumn, otherwise it would shift the text each time {
        " diagnostics appear/become resolved.
        try
            set signcolumn=yes
        catch
        endtry
        " }

    " }

    " CoC Key Bindings {

        " Make <tab> and <s-tab> to choose completion item {
        inoremap <silent><expr> <TAB>
                    \ pumvisible() ? "\<C-n>" :
                    \ <SID>check_back_space() ? "\<TAB>" :
                    \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
        function! s:check_back_space() abort
            let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~# '\s'
        endfunction
        " }

        " Use `[g` and `]g` to navigate diagnostics {
        " Use `<space>a` or `:CocDiagnostics` to get all diagnostics of current buffer in location list.
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)
        " }

        " GoTo code navigation. {
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        " }

        " Use K to show documentation in preview window. {
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
          else
            execute '!' . &keywordprg . " " . expand('<cword>')
          endif
        endfunction
        " }

        " Symbol renaming.
        nmap <leader>rn <Plug>(coc-rename)

        " Formatting selected code.
        xmap <leader>=  <Plug>(coc-format-selected)
        nmap <leader>=  <Plug>(coc-format-selected)

        " Applying codeAction to the selected region. {
        " Example: `<leader>aap` for current paragraph
        xmap <leader>a  <Plug>(coc-codeaction-selected)
        nmap <leader>a  <Plug>(coc-codeaction-selected)

        " Remap keys for applying codeAction to the current buffer.
        nmap <leader>ac  <Plug>(coc-codeaction)
        " Apply AutoFix to problem on the current line.
        nmap <leader>qf  <Plug>(coc-fix-current)
        " }

        " Map function (f) and class (c) text objects {
        " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
        xmap if <Plug>(coc-funcobj-i)
        omap if <Plug>(coc-funcobj-i)
        xmap af <Plug>(coc-funcobj-a)
        omap af <Plug>(coc-funcobj-a)
        xmap ic <Plug>(coc-classobj-i)
        omap ic <Plug>(coc-classobj-i)
        xmap ac <Plug>(coc-classobj-a)
        omap ac <Plug>(coc-classobj-a)
        " }

        " Use `,as` for selections ranges. {
        " Requires 'textDocument/selectionRange' support of language server.
        nmap <silent> <leader>as <Plug>(coc-range-select)
        xmap <silent> <leader>as <Plug>(coc-range-select)
        " }

    " }

    " CoCList Mappings {

        " Show all diagnostics.
        nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
        " Manage extensions.
        nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
        " Show commands.
        nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
        " Find symbol of current document.
        nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
        " Search workspace symbols.
        nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
        " Do default action for next item.
        nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
        " Do default action for previous item.
        nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
        " Resume latest coc list.
        nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

    " }

    VkhAdd 'gd for definition, gy for type, gi for implementation, gf for reference'
    VkhAdd 'Code actions: try <leader>ac <leader>aap <leader>= <leader>rn'
    VkhAdd ']g and [g for next diagnostic, and <leader>qf for quick fix'
    VkhAdd 'try cif in funcion, and cic in class.'
    VkhAdd '<leader>as for CoC code selection'
    VkhAdd '<space>a,e,c,o,s,j,k,p for CoCList mappings'
    " }

    " plugin vim-jsbeautify {
    " ~/.vim/bundle/vim-jsbeautify/README.md
    autocmd FileType javascript noremap <buffer> <leader>== :call JsBeautify()<cr>
    autocmd FileType json noremap <buffer> <leader>== :call JsonBeautify()<cr>
    autocmd FileType jsx noremap <buffer> <leader>== :call JsxBeautify()<cr>
    autocmd FileType html noremap <buffer> <leader>== :call HtmlBeautify()<cr>
    autocmd FileType css noremap <buffer> <leader>== :call CSSBeautify()<cr>
    " }
" }

try
    source ~/.vimrc.local
catch
endtry
