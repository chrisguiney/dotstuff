"clone vundle, then open vim and run :BundleInstall to get all the magic
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 TEST AREA                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" items get to graduate from here into the big bad vimrc :-)
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

inoremap <leader>; <C-R>=Semicolonfun()<CR>     
fun! Semicolonfun() "{{{
  call setline(line('.'), substitute(getline('.'), '\s*$', ';', ''))
  return "\<End>"
endfunction "}}}

function! Editvimrc()
    :e $MYVIMRC
endfunction
command! Editvimrc call Editvimrc()


"""""""""""""""""""""""""""""""" EOF TEST AREA """""""""""""""""""""""""""""""

"This must be first, because it changes other options as a side effect.

filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tomtom/tcomment_vim'
Bundle 'wesleyche/SrcExpl'
Bundle 'zhaocai/linepower.vim'
Bundle 'Shougo/unite.vim'
Bundle 't9md/vim-unite-ack'
Bundle 'h1mesuke/unite-outline'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'ujihisa/unite-font'
Bundle 'tacroe/unite-mark'
Bundle 'tsukkee/unite-tag'
Bundle 'sgur/unite-qf'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/powerline'
Bundle 'Shougo/vimproc.vim'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'kshenoy/vim-signature'
Bundle 'lukaszb/vim-web-indent'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'fugitive.vim'
Bundle 'tpope/vim-rails'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'tpope/vim-surround'
Bundle 'bufexplorer.zip'
Bundle 'SuperTab-continued.'
Bundle 'less-syntax'
Bundle 'airblade/vim-gitgutter'
Bundle 'gitv'
Bundle 'vim-less'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'
Bundle 'mattn/zencoding-vim'
Bundle 'SirVer/ultisnips'
Bundle 'mileszs/ack.vim'
Bundle 'stephpy/vim-phpdoc'
Bundle 'Solarized'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'shemerey/vim-peepopen'
Bundle 'airblade/vim-rooter'
Bundle 'Shougo/vimshell.vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'xuhdev/SingleCompile'
Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'

"load ftplugins and indent files
filetype off
filetype plugin indent off
set runtimepath+=/usr/local/opt/go/misc/vim
filetype plugin indent on
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   THEMES                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"============== Tomorrow-Night Theme ==============

set background=dark
set guifont=SauceCodePowerline-Light:h18
colorscheme Tomorrow\-Night

"============= Soloraized theme light =============
    "set background=light
    "set guifont=Source\ Code\ Pro:h18
    "colors Solorized

"=============  Solarized Theme Dark  =============
    "set background=dark
    "set guifont=Source\ Code\ Pro\ Light:h18
    "colors Solorized


set ofu=syntaxcomplete#Complete " Set omni-completion method.
set omnifunc=syntaxcomplete#Complete

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Always show the statusline
set laststatus=2

"store lots of :cmdline history
set history=1000
set undolevels=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase  "searches are case insensitive...
set smartcase   "...unless they contain one capital letter

"no backups please
set nobackup
set noswapfile
set viminfo=

"indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"folding settings
set nofoldenable

" Set line numbers
set number

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildignore+=*/tmp/*,*.so,*.swp,*.zip "ignore these files
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅,extends:#

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=6
set sidescrolloff=7
set sidescroll=1

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"tell the term has 256 colors
set t_Co=256

" Color scheme
 let g:Powerline_symbols = 'fancy'


" \ is the leader character
let mapleader = "\\"

" Hide search highlighting
map <Leader>h :nohl <CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" NERDTree
nnoremap <Leader>r :NERDTreeToggle<CR>

" Toggle Gundo
inoremap <silent> <F1> <ESC>:GundoToggle<CR>
nnoremap <silent> <F1> :GundoToggle<CR>
vnoremap <silent> <F1> <ESC>:GundoToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_split_window = 1 " <CR> = New Tab" Function key mappings

" Highlight the current line
set cursorline

" Set the tag file search order
set tags=tags;

" User ack not grep
set grepprg=ack

" Set region to British English
set spelllang=en_gb

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Map ENTER to save
nmap <CR> :write<CR>

" EasyMotion mappings
let g:EasyMotion_leader_key = ';'
nmap s ;w
nmap S ;b
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment


" Relative numbers when not in insert mode
au BufEnter * :set rnu
au BufLeave * :set nu
au WinEnter * :set rnu
au WinLeave * :set nu
au InsertEnter * :set nu
au InsertLeave * :set rnu
au FocusLost * :set nu
au FocusGained * :set rnu

map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

"fuzzyFinder maping
map <leader>f :FufFile <CR>
map f :FufFileWithCurrentBufferDir<CR>
inoremap <C-f> :FufFileWithFullCwd<CR>

"get the system clipboard to work with vim
set clipboard=unnamed

" Working with tabs
set switchbuf+=usetab,newtab

"Whitespace remover
nmap <C-w> :%s/\s\+$//<CR>

" some custom macvim stuff
if has("gui_macvim")
    set macmeta
    set antialias
endif


" code checking
let g:syntastic_error_symbol='☹'
let g:syntastic_warning_symbol='›'
let g:syntastic_enable_balloons = 1
highlight SyntasticErrorSign guifg=red guibg=black
highlight SyntasticWarningSign guifg=red guibg=black





" ------------------------[ CUSTOM KEY MAPPINGS :-) ]-------------------------

" Bubble single lines
map <C-M-Up> ddkP
" Bubble multiple lines
vmap <C-M-Down> xp`[V`]
vmap <C-M-Up> xkPv`[V`]


" F1 - Unused
" F2 - Unused
" F3 - Unused
" F4 - Toggle paste
nnoremap <F4> :set paste!<Bar>set paste?<CR>

" F5 - Toggle wrapping
set linebreak "wrap lines at convenient points
set nowrap " Set no wrap and bind.
nnoremap <F5> :set nowrap! <CR>

" F6 - Replace whitespace.
nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" F7 - Unused
"
" F8 - Toggle tagbar
nmap <F8> :TagbarToggle<CR>

" F9 - Ruby Hash syntax change
map <F9> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" F10 - Findhighlighting
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" F11 - Unused
" F12 - Unused

" Normal key mappings

" Ctrl-J/K deletes blank line below/above, and Ctrl-j/k inserts.
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Bufexplorer
nnoremap <C-B> :BufExplorer<cr>

"better commenting
map <C-/> <plug>NERDCommenterToggle<CR>
vmap <C-/> <plug>NERDCommenterToggle<CR>gv

"save and quit becuase I'm stupid
map <C-s> :w<CR>

"sublime style surround
nmap <C-"> viwS"

let g:user_zen_expandabbr_key='<C-e>'
let g:use_zen_complete_tag = 1

let g:UltiSnipsUsePythonVersion = 2

inoremap <Leader>8 <ESC>:call PhpDocSingle()<CR>i
nnoremap <Leader>8 :call PhpDocSingle()<CR>
vnoremap <Leader>8 :call PhpDocRange()<CR>
let g:pdv_cfg_Author = "Shiem Edelbrock <shiem.edelbrock@thecontrolgroup.com>"

" // The switch of the Source Explorer 
nmap <F8> :SrcExplToggle<CR> 

" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to Avoid conflicts, the Source Explorer should know what plugins 
" // are using buffers. And you need add their bufname into the list below 
" // according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_", 
        \ "Source_Explorer" 
    \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F12>" 

" // Set "<F3>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<F3>" 

" // Set "<F5>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<F4>" 

