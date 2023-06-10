" https://medium.com/@boiser/a-vim-poser-s-guide-to-neovim-ea79e95c31cd

set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath " source ~/.vimrc

set noeb vb t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

inoremap jk <Esc>
syntax on
set expandtab ts=2 sw=2 ai
set number
set relativenumber
set exrc
set secure

set cursorline
set listchars=tab:\|\ 
set list

set encoding=UTF-8

let g:wakatime_PythonBinary = '/usr/bin/python'

call plug#begin('~/.local/share/vim/plugged')
  Plug 'wakatime/vim-wakatime'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'w0rp/ale'
  Plug 'scrooloose/nerdcommenter'
  Plug 'prettier/vim-prettier'
  Plug 'tomasiser/vim-code-dark'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-abolish'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'editorconfig/editorconfig-vim'
call plug#end()

let g:wakatime_PythonBinary = '/usr/bin/python'

nnoremap <C-p> :FZF<CR>
map <C-n> :NERDTreeToggle<CR>

" NERDTree configurations
let NERDTreeShowHidden = 1

"let g:ale_fixers = {
  "\   'javascript': ['prettier'],
  "\   'typescript': ['prettier-eslint', 'eslint'],
  "\   'css': ['prettier'],
  "\   'javascriptreact': ['prettier-eslint', 'eslint'],
  "\   'typescriptreact': ['prettier-eslint', 'eslint']
  "\}
let g:ale_fixers = {
  \   'typescript': ['eslint'],
  \   'javascriptreact': ['eslint'],
  \   'typescriptreact': ['eslint']
  \}

"let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_sign_error = '🆘'

" 1 is true, 0 is false
let g:ale_fix_on_save = 0

set background=dark
"colorscheme codedark
"let g:airline_theme = 'codedark'
colorscheme onedark
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#formatter = 'unique_tail'

imap <c-x><c-l> <plug>(fzf-complete-line)
map <c-l> :BLines<CR>
map <leader><c-l> :Ag! <cword><CR>

let g:lsc_auto_map = v:true

" Movement keys
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

set clipboard^=unnamed
:nnoremap <leader>0 :set nornu nonu<CR>
:nnoremap <leader>1 :set rnu nu<CR>
set noea

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-return>"
inoremap <silent><expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:netrw_liststyle = 3
let g:netrw_banner = 0
"let g:netrw_browse_split = 1
let g:netrw_winsize = 25

" Custom keymaps
nnoremap <silent> <Space>w :w<CR>
nnoremap <silent> <Space>q :q<CR>
nnoremap <silent> <Space>c :nohlsearch<CR>
vnoremap <silent> < <gv
vnoremap <silent> > >gv
xnoremap <silent> J :move '>+1<CR>gv-gv
xnoremap <silent> K :move '<-2<CR>gv-gv
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <Space>f <Plug>(coc-format)
xmap <Space>f <Plug>(coc-format-selected)
nmap <silent> gca <Plug>(coc-codeaction-cursor)
nmap <silent> grf <Plug>(coc-refactor)
nnoremap <silent><nowait> <Space>D :CocDiagnostics<CR>
nmap <silent> gcc <Plug>NERDCommenterToggle
xmap <silent> gcc <Plug>NERDCommenterToggle

let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-pyright',
  \ ]


" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
autocmd FileType gitcommit let b:EditorConfig_disable = 1

let g:charset = 'utf-8'
let g:indent_style = 'tab'
let g:tab_width = 2
let g:indent_size = 2
let g:insert_final_newline = 1
let g:trim_trailing_whitespace = 1
"let g:max_line_length = 120
let g:EditorConfig_max_line_indicator = 'none'

autocmd FileType markdown let g:max_line_length = 'off'
autocmd FileType markdown let g:trim_trailing_whitespace = 0
autocmd FileType python let g:tab_width = 4
