if &compatible
  set nocompatible
endif

set runtimepath+=/Users/igagen/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/igagen/.cache/dein')
  call dein#begin('/Users/igagen/.cache/dein')
  call dein#add('/Users/igagen/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Plugins

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-speeddating')
  call dein#add('tpope/vim-fugitive')
  call dein#add('/usr/local/opt/fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('itchyny/lightline.vim')
  call dein#add('crusoexia/vim-monokai')
  call dein#add('Shougo/denite.nvim')
  call dein#add('tpope/vim-repeat')
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('qpkorr/vim-bufkill')
  call dein#add('w0rp/ale')
  call dein#add('tpope/vim-rails')
  call dein#add('ElmCast/elm-vim')
  call dein#add('pbogut/deoplete-elm')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('slim-template/vim-slim')
  call dein#add('dag/vim-fish')
  call dein#add('wavded/vim-stylus')
  call dein#add('mxw/vim-jsx')
  call dein#add('peitalin/vim-jsx-typescript')
  call dein#add('msprev/vim-markdown-folding')
  call dein#add('JamshedVesuna/vim-markdown-preview')
  call dein#add('godlygeek/tabular')
  " call dein#add('vimwiki/vimwiki')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" Folding
set foldenable
nnoremap <tab> za
autocmd FileType * exe "normal zR"

" Markdown
let g:markdown_fold_style = 'nested'
let vim_markdown_preview_github=1

" let g:vimwiki_list = [{'path': '~/Dropbox/inkarnate/notes/', 'syntax': 'markdown', 'ext': '.md'}]
" au! BufRead,BufNewFile *.markdown set filetype=mkd
" au! BufRead,BufNewFile *.md       set filetype=mkd
" autocmd FileType markdown match none

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

autocmd VimResized * wincmd =

" set nobackup
" set nowritebackup
set noswapfile
set hidden

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

let mapleader=" "
let maplocalleader=","
set number
set timeoutlen=1000 ttimeoutlen=0

set background=dark
set termguicolors
colorscheme monokai

set nocursorline
set lazyredraw

let g:elm_setup_keybindings = 1

let g:fzf_layout = { 'down': '~90%' }

" highlight clear LineNr
" hi VertSplit ctermbg=NONE guibg=NONE
" set fillchars+=vert:\ 
" hi Normal guibg=NONE ctermbg=NONE
" highlight clear SignColumn

" Key bindings

map <leader>s :w<CR>
map <leader>d :BD<CR>
map <leader>x :q<CR>
map <leader>q :qa<CR>
map <leader><tab> :BA<CR>

map <leader>m :History<CR>
map <leader>r :Buffers<CR>
map <leader>f :Files<CR>
map <leader>p :GitFiles<CR>

map <leader>gc :Commits<CR>
map <leader>gb :BCommits<CR>
map <leader>gs :GFiles?<CR>

map <leader>t :NERDTreeToggle<CR><C-w>=

map <leader>u :source $MYVIMRC<CR>
map <leader>= <C-W>=<CR>

map <leader>wv :vsp<CR>
map <leader>wh :sp<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <leader>h :vert help<space>
map <leader>j :BF<CR>
map <leader>k :BB<CR>

map <leader>/ :Ag<CR>
map <silent> <leader>* :Ag <C-R><C-W><CR>

map <leader>c :noh<CR>
