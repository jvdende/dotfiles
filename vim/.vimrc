" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

let g:ale_disable_lsp = 1

" Plugins
call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-vinegar'
  Plug 'yggdroot/indentline'
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'daviesjamie/vim-base16-lightline'
  Plug 'dense-analysis/ale'
  Plug 'maximbaz/lightline-ale'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'preservim/nerdtree'

  " Languages
  Plug 'hashivim/vim-terraform'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'mattn/emmet-vim'
  Plug 'psliwka/vim-smoothie'
  Plug 'karb94/neoscroll.nvim'

  " Github co-pilot
  " Plug 'github/copilot.vim'

  " Color schemes
  Plug 'base16-project/base16-vim'

  " Devicons (always last)
  Plug 'ryanoasis/vim-devicons'
call plug#end()

" General settings
let mapleader = ","           " Set map leader
syntax on                     " Syntax highlighting
filetype plugin indent on     " Load plugins correctly
set wildmenu
set mouse=a                   " Enable mouse interaction
set number                    " Show line number
set relativenumber            " Show relative line number
set ruler                     " Show file stats
set encoding=utf-8            " Encoding
set wrap                      " Wrap text
set hidden                    " Allow hidden buffers
set ttyfast                   " Rendering
set laststatus=2              " Status bar
set splitright                " Create vertical splits to the right
" Searching
set autoindent                " Copy indent from current line
set hlsearch
set incsearch                 " Show matches incrementally
set ignorecase                " Search is case sensitive
set smartcase
set showmatch
" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab                 " Pressing tab creates spaces
" Color scheme
set background=dark
set termguicolors
highlight ALEWarning ctermbg=DarkYellow
hi Normal guibg=NONE ctermbg=NONE 
colorscheme base16-default-dark

" Disable ttymouse if nvim
if !has('nvim')
    set ttymouse=xterm2
endif

" netrw
let g:netrw_banner = 0        " disable banner
let g:netrw_liststyle = 3     " tree view

" indentline
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

" yanking to windows clipboard
" if system('uname -r') =~ "microsoft"
"   augroup Yank
"   autocmd!
"   autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
"   augroup END
" endif

" Plugin settings
" NERDTree
nnoremap <leader><S-t> :NERDTreeToggle<CR>
nnoremap <leader><S-f> :NERDTreeFind<CR>
let g:plug_window = 'noautocmd vertical topleft new'
let NERDTreeShowHidden=1
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree| if argc() > 0 || exists("s:std_in") | wincmd p | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" fzf
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
" Match colors with color scheme
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }
" Hide statusline
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" Add :RG. Will rely on Ripgrep and use FZF as file selector instead
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" Shortcuts
nnoremap <C-p> :Files<Cr>
nnoremap <C-f> :RG<Cr>
nnoremap <Leader>f :BLines<Cr>
nnoremap <Leader>b :Buffers<Cr>
nnoremap <Leader>t :Tags<Cr>

" coc.nvim
" Use tab and <cr> to confirm completion
inoremap <expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Emmet.vim
" Enable for html/css only
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" ack.vim
" Don't jump to first match
cnoreabbrev Ack Ack!
let g:ack_autoclose = 1 " Auto close quickfix list after pressing enter on a list item
let g:ack_use_cword_for_empty_search = 1 " Empty ack will search the word the cursor is on
if executable('ag')
  let g:ackprg = 'rg --vimgrep --type-not sql --smartcase' " Use ripgrep
endif

" vim-gitgutter
set updatetime=300

" indentline
let g:indentLine_char = '▏'
let g:vim_json_conceal = 0
let g:markdown_syntax_conceal = 0

" lightline.vim
set noshowmode " disable -- INSERT --
set showtabline=2 " always show tabline

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [[]]}
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
let g:lightline.active = {
      \ 'right': [
      \   [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
      \   [ 'lineinfo' ],
      \   [ 'percent' ],
      \   [ 'fileformat', 'fileencoding', 'filetype']
      \ ] }
let g:lightline.colorscheme = 'base16'

" lightline-bufferline
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1

" ale
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ }

" Language specific
" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
