set t_Co=16

let g:solarized_diffmode="high"
if has("gui_running")
  if has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  else
    set guifont=Monospace\ 14
  endif
endif
execute pathogen#infect()

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/AutoComplPop' "Auto Complete Popup : http://www.vim.org/scripts/script.php?script_id=1879
Plugin 'bling/vim-airline' "Lean & mean status/tabline for vim that's light as air.
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter' "shows a git diff in the gutter (sign column)
Plugin 'wincent/command-t' "https://github.com/wincent/Command-T
Plugin 'tpope/vim-git' "Git format plugins
Plugin 'ngmy/vim-rubocop' "Rubocop integration
" Disable syntastic as it conflicts with ALE
" Plugin 'scrooloose/syntastic' " https://github.com/scrooloose/syntastic
" Plugin 'myint/syntastic-extras' "https://github.com/myint/syntastic-extras
Plugin 'edkolev/tmuxline.vim' "Share airline statusline with Tmux - https://github.com/edkolev/tmuxline.vim
Plugin 'sjl/gundo.vim' "Gundo.vim is Vim plugin to visualize your Vim undo tree.
Plugin 'godlygeek/tabular' "Vim script for text filtering and alignment - https://github.com/godlygeek/tabular
Plugin 'plasticboy/vim-markdown'
Plugin 'KabbAmine/zeavim.vim' " Search Zeal for docs - https://github.com/KabbAmine/zeavim.vim
Plugin 'JamshedVesuna/vim-markdown-preview' "A small Vim plugin for previewing markdown files in a browser. - https://github.com/JamshedVesuna/vim-markdown-preview
Plugin 'xolox/vim-easytags' "Automated tag file generation and syntax highlighting of tags in Vim http://peterodding.com/code/vim/easytags/
Plugin 'xolox/vim-misc' "Miscellaneous auto-load Vim scripts http://peterodding.com/code/vim/misc/ (needed for easytags)
Plugin 'majutsushi/tagbar' "Vim plugin that displays tags in a window, ordered by scope http://majutsushi.github.com/tagbar/
Plugin 'editorconfig/editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides' "https://github.com/nathanaelkane/vim-indent-guides
Plugin 'flazz/vim-colorschemes' "http://vimawesome.com/plugin/vim-colorschemes-sweeter-than-fiction
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ryanoasis/vim-devicons' "Should load last and needs nerdfont
if v:version >= 800
  Plugin 'w0rp/ale' "ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim and Vim 8 while you edit your text files. (https://github.com/w0rp/ale)
endif
call vundle#end()

set background=dark
colorscheme solarized
let g:airline_theme='tomorrow'
set nocompatible

" Disable syntastic as it conflicts with ALE
"Syntastic checks
" let g:syntastic_cfg_checkers = ['cfg']
" let g:syntastic_javascript_checkers = ['json_tool']
" let g:syntastic_gitcommit_checkers = ['language_check']
" let g:syntastic_svn_checkers = ['language_check']
" let g:syntastic_yaml_checkers = ['pyyaml']
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_python_checkers = ['pep8']

" Allow copy/paste to system clipboard
set clipboard=unnamedplus

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable Omnicomplete
set omnifunc=syntaxcomplete#Complete
" Tips from http://vim.wikia.com/wiki/VimTip1386
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Toggle Tagbar
nmap <F8> :TagbarToggle<CR>

" Set to auto read when a file is changed from the outside
set autoread

" set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set foldcolumn=0

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


set nowrap                      " wrap long lines
set autoindent                  " indent at the same level of the previous line
set shiftwidth=2                " use indents of 2 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=2 sw=2 et                   " an indentation every four columns
set softtabstop=2               " let backspace delete indent
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

function! CodingOptions()
  autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
  :set cursorline
  let g:tagbar_zoomwidth = 0
  let g:tagbar_left = 1
  :TagbarToggle
endfunction

autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,puppet call CodingOptions()
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

syntax enable
set si "Smart indent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=2      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
nnoremap <space> za
vnoremap <space> zf

map <F11> :set foldcolumn=1<Enter>

" Tell vim to remember certain things when we exit
"  '20  :  marks will be remembered for up to 20 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :50  :  up to 50 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='20,\"100,:50,%,n~/.viminfo

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

autocmd FileType gitcommit setlocal textwidth=72

" Open file in System Web Browser
nnoremap <F6> :!x-www-browser file://%:p &<CR>

" Show column
:set colorcolumn=+1        " highlight column after 'textwidth'
:set colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
:highlight ColorColumn ctermbg=240 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

" Set wildmode (menu completion)
set wildmenu
set wildmode=list:longest,full

" Enable mouse integration
set mouse=a
set mousemodel=popup

" Set the number format, used for visual increment
" https://github.com/triglav/vim-visual-increment
set nrformats=alpha,octal,hex

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"statusline setup
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*


"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%{ALEGetStatusLine()}

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=[%{&fo}]
set statusline+=%{fugitive#statusline()}

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%74v.*/
augroup END

hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" Taken from http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Git Gutter Config
let g:gitgutter_diff_args = '-w'

" Replace highlighted text with yanked text use 'S'
" Taken from http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
vnoremap S "_dP

" Line numbers on
set nu

" Set Line number colour
:highlight LineNr ctermfg=240

"Set binding to toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" NERDTree Configure
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" Indent guide Config
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Enable Rainbow Parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Configure autoformat
let g:formatter_yapf_style = 'pep8'
noremap <F3> :Autoformat<CR>
