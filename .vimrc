"Neovim general settings

syntax enable 
set hidden
set nowrap
set encoding=utf-8
set pumheight=10
set fileencoding=utf-8
set ruler
set cmdheight=2
set iskeyword+=-
set mouse=a
set splitbelow
set splitright
set t_Co=256
set conceallevel=0
set tabstop=4
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set autoindent
set laststatus=2
set number
set relativenumber
set cursorline
set background=dark
set showtabline=2
set noshowmode
set nobackup
set nowritebackup
set updatetime=300
set timeoutlen=100
set clipboard=unnamed
set showmatch
set showcmd
let mapleader=" " " Set leaderkey
filetype plugin indent on

"Pluggins

call plug#begin('~/.vim/plugged')

" Themes
Plug 'dikiaap/minimalist'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'prettier/vim-prettier', { 'do': 'yarn install'}
Plug 'yaegassy/coc-htmldjango', {'do': 'yarn install --frozen-lockfile'}
Plug 'rust-lang/rust.vim'
Plug 'voldikss/vim-floaterm'
Plug 'vim-syntastic/syntastic'

 "CoC
Plug 'neoclide/coc.nvim',{'branch':'release'}
let g:coc_global_extensions = ['coc-actions',
							  \'coc-highlight',
							  \'coc-emmet',
							  \'coc-css',
							  \'coc-json',
							  \'coc-html',
							  \'coc-perl',
							  \'coc-python',
							  \'coc-tsserver',
							  \'coc-sh',
							  \'coc-tslint',
							  \'coc-prettier',
							  \'coc-jedi',
							  \'coc-snippets',
							  \'coc-rust-analyzer',
							  \'coc-yaml',]

call plug#end()

colorscheme onehalfdark

let g:airline_theme='onehalfdark'
" lightline
let g:lightline = { 'colorscheme': 'onehalfdark' }

" Shortcuts

nmap <Leader>l :FloatermNew<CR>

 "Save and quit
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
 "Buffer navigation
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
 "Copy & Paste
vnoremap <C-c> +y
map <C-p> +P
" Better tabbing
vnoremap > >gv
vnoremap < <gv
" Rename
nmap <Leader>rn <Plug>(coc-rename)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Commenter 
vmap <Leader>c <Plug>NERDCommenterToggle
nmap <Leader>c <Plug>NERDCommenterToggle
" Pluggins shortcuts

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader><TAB> :NERDTree %:p:h<CR>
nnoremap <Leader>b :FZF<CR>

"Preferences
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeShowHidden=1
let g:NERDTreeColorMapCustom = {
	\ "Staged"    : "#0ee375",  
	\ "Modified"  : "#d9bf91",  
	\ "Renamed"   : "#51C9FC",  
	\ "Untracked" : "#FCE77C",  
	\ "Unmerged"  : "#FC51E6",  
	\ "Dirty"     : "#FFBD61",  
	\ "Clean"     : "#87939A",   
	\ "Ignored"   : "#808080"   
	\ }

 "prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" File finder shortcuts
let g:fzf_action = {
	    \ 'ctrl-t': 'tab split',
	    \ 'ctrl-s': 'split',
	    \ 'ctrl-v': 'vsplit'
	    \}

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use K to show documentation in preview window.
nnoremap <silent>` :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
	call CocActionAsync('doHover')
    else
execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Hover
nmap <silent> t :<C-U>call CocAction('doHover')<CR>

let g:prettier#config#print_width = 144

" number of spaces per indentation level: a number or 'auto' (use
" softtabstop)
" default: 'auto'
let g:prettier#config#tab_width = 2
let g:coc_filetype_map = {
  \ 'htmldjango': 'html',
  \ }

hi CocFloating ctermbg=237
hi PmenuSbar ctermbg=250

" Linting Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:rustfmt_autosave = 1
let g:syntastic_check_on_wq = 0
