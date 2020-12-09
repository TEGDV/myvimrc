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

"Pluggins

call plug#begin('~/.vim/plugged')

" Themes
Plug 'dikiaap/minimalist'

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
							  \'coc-yaml',]

call plug#end()

" Shortcuts

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
nmap <F2> <Plug>(coc-rename)
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
colorscheme minimalist

" Formater
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
 "prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"run prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" File finder shortcuts
let g:fzf_action = {
	    \ 'ctrl-t': 'tab split',
	    \ 'ctrl-s': 'split',
	    \ 'ctrl-v': 'vsplit'
	    \}

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	    \ pumvisible() ? "\<C-n>" :
	    \ <SID>check_back_space() ? "\<TAB>" :
	    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
