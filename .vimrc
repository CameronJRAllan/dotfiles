" Author: Cam Allan
" Forked From Repo: https://github.com/zidhuss/dotfiles
" Original credit to Huss.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:plug_url_format = 'git@github.com:%s.git'
call plug#begin()

""""""""""
" Look  "
""""""""""
Plug 'morhetz/gruvbox'
    let g:gruvbox_improved_warnings = 1
    let g:gruvbox_italic=1
    let g:gruvbox_invert_selection=0
    let g:gruvbox_sign_column='bg0'
	
Plug 'bling/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:airline_theme='gruvbox'
    let g:airline_section=' '
    let g:airline_left_sep = ' '
    let g:airline_right_sep = ' '
    let g:airline_skip_empty_sections = 1
    let g:airline#extensions#tabline#enabled = 1
		let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#ale#error_symbol = ''
    let g:airline#extensions#ale#warning_symbol = ''
    let g:airline#extensions#ale#show_line_numbers = 0
		let g:airline#extensions#tagbar#flags = 's'  " show full tag hierarchy
		
Plug 'vim-airline/vim-airline-themes'

""""""""""""
"  Syntax  "
""""""""""""

Plug 'sheerun/vim-polyglot'

Plug 'w0rp/ale'
		let g:c_syntax_for_h = 1
    let g:ale_linters = {'c' : ['gcc']}
    let g:ale_set_quickfix = 1
    let g:ale_c_gcc_options = '-g2 -DDAI_LINUX -Wno-unused-parameter ' .
                              \ '-Wno-format-zero-length ' .
                              \ '-Wno-sign-compare -std=gnu99 ' .
                              \ '-I' .
                              \ '-Iinclude/CSlim ' .
                              \ '-Iinclude/ExecutorC ' .
                              \ '-Iinclude/ctrim ' .
                              \ '-I/usr/local/include ' .
                              \ '-I/usr/include ' .
                              \ '-I/app/dm0879/work/include ' .
                              \ '-I/app/dm0879/source ' .
                              \ '-I/usr/include/libxml2 '
							  
Plug 'tpope/vim-endwise'

Plug 'tpope/vim-commentary'

Plug 'rstacruz/sparkup'
    let g:sparkupArgs="--no-last-newline"
	
Plug 'junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

    " align struct
    nmap <leader>as gai{ 

Plug 'vim-scripts/keepcase.vim'

Plug 'kien/ctrlp.vim'

Plug 'ycm-core/youcompleteme'
	let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

Plug 'tpope/vim-eunuch'

"""""""""""""""
"  Mercurial  "
"""""""""""""""

Plug 'mhinz/vim-signify'
    let g:signify_vcs_lsit = ['mercurial']

""""""""""""""
"  Snippets  "
""""""""""""""

""""""""""""""""
"  Navigation  "
""""""""""""""""
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
    nmap <f8> :TagbarToggle<cr>
Plug 'christoomey/vim-tmux-navigator'
    let g:tmux_navigator_no_mappings = 1
    " let g:tmux_navigator_save_on_switch = 1
    nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    map <leader>n :NERDTreeToggle<CR>

""""""""""""""""
"  Completion  "
""""""""""""""""
set omnifunc=syntaxcomplete#Complete
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

let g:fzf_action = {
    \ 'ctrl-m': 'e',
    \ 'ctrl-t': 'tabedit',
    \ 'alt-j':  'botright split',
    \ 'alt-k':  'topleft split',
    \ 'alt-h':  'vertical topleft split',
    \ 'alt-l':  'vertical botright split' }
    nnoremap <leader><cr> :FZF ~/source<cr>
	
Plug 'junegunn/fzf.vim'
    nnoremap <silent> <leader>h :Help<CR>
    nnoremap <silent> <leader>b :Buffers<CR>
    nnoremap <silent> <leader>l :Lines<cr>
    nnoremap <silent> <leader>t :Tags<cr>
	
Plug 'jiangmiao/auto-pairs'

"""""""""""
"  Other  "
"""""""""""

Plug 'vim-scripts/restore_view.vim'
    set viewoptions-=options
	
Plug 'tpope/vim-sensible'

Plug 'tpope/vim-unimpaired'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 End Plugins                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F8> :!ut_ctags<CR>
map! <F8> <ESC>:!ut_ctags<CR>
set tags=./tags,./TAGS,tags,TAGS,.tags,~/.tags,~/.TAGS
map <F9> :!ut_lib %<CR>
map! <F9> <ESC>:!ut_lib %<CR>
map <F10> :!ut_build %<CR>
map! <F10> <ESC>:!ut_build %<CR>

" Clipboard yank and paste
map <leader>y "+y
map <leader>p "+p

" Write over read-only files
cnoremap sudow w !sudo tee % >/dev/null<cr>:e!<cr><cr>

" Faster saving
nmap <c-s> :w<cr>
nmap <c-q> :q<cr>
imap <c-s> <esc>:w<cr>

" Insert semi-colon at end of line
inoremap <leader>; <ESC>A;

" Move to end of line while in insert
inoremap <c-f> <esc>A

" Deoplete tab and shift tab
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ "<Tab>"
inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" :
  \ "<S-Tab>"

" Remove search higlight
nmap <silent> <BS>  :nohlsearch<CR>

" Focus on split
noremap <leader>o :only<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                End Mappings                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Look                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep status line visible
set laststatus=2

" Set colorscheme
colorscheme gruvbox
set background=dark
set guioptions=

" Character for vertical split
set fillchars=vert:│,fold:·

" Language indepenent indentation
filetype plugin indent on

" 24bit colour
"set termguicolors

" Show line numbers and length
set number
set textwidth=79

" Disable wrapping
set nowrap
set formatoptions-=t

" Italic comments
highlight Comment gui=italic

" Easily identify which line I'm writing on
set cursorline
set colorcolumn=80

" Show invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" Disable folding
set nofoldenable

autocmd VimResized * execute "normal! \<c-q>="

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  End Look                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Syntax                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" SQL Syntax
au BufNewFile,BufRead sql* set ft=sql

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   General                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set timeout to 0
set notimeout
set nottimeout

" Smarter searching
set ignorecase
set smartcase

" Auto read changed files
set autoread

" Deal with hidden buffers
set hidden

" No backups or swap file
set noswapfile
set nobackup
set nowritebackup

" More natural split opening
set splitbelow
set splitright

" Clear trailing whitespace in selected file types on save
autocmd BufWritePre *.py,*.jsx?,*.hs,*.html,*.css,*.scss :%s/\s\+$//e

" Close preview window after deoplete completion
autocmd CompleteDone * pclose!

" Auto source on write
autocmd! BufWritePost init.vim source %

" Turn off bell sound
set vb t_vb= 
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 End General                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
