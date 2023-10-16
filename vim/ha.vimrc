"set t_u7=
set runtimepath^=/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath " source ~/.vimrc

set noeb vb t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

if has('termguicolors')
  set termguicolors
endif

" ------------------------------------ SETTING OPTIONS --------------------------------------------
"------------------------------
"         MISCELLANEOUS       "
"------------------------------
set encoding=UTF-8
set fileencoding=UTF-8
"set mouse=a
" set backspace=indent,eol,start  " Allow backspacing over indention, line breaks and insertion start.
set confirm  " Display a confirmation dialog when closing an unsaved file.
set nocompatible  " Disable compatibility with vi which can cause unexpected issues.
set exrc
set secure
"let mapleader = ' '

"------------------------------
"          VISIBILITY         "
"------------------------------
syntax on
set number norelativenumber
set cursorline nocursorcolumn
set wrap linebreak  " Enable line wrapping. Avoid wrapping a line in the middle of a word.
set splitright splitbelow
" set laststatus=3
set noshowmode
set showcmd
" set cmdheight=1
set pumheight=10  " Pop up menu height.
set background=dark
set textwidth=0  " No break if a line is too long.
set signcolumn=yes
let g:vim_json_conceal=0

"------------------------------
"         INDENTATION         "
"------------------------------
set shiftwidth=2 tabstop=2
set expandtab autoindent smarttab
"set listchars=tab:\|\
"set list

"------------------------------
"            SEARCH           "
"------------------------------
set hlsearch  " Use highlighting when doing a search.
set incsearch  " While searching though a file incrementally highlight matching characters as you type.
set ignorecase  " Ignore capital letters during search.
set smartcase  " Override the ignorecase option if searching for capital letters.
set showmatch  " Show matching words during a search.
set wildmenu  " Enable auto completion menu after pressing TAB.
set wildmode=list:full  " List all matches and complete first match.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.swp,node_modules,dist,.git,**/node_modules/*,**/dist/*,**/.git/*

"------------------------------
"          PERFORMANCE        "
"------------------------------
set complete-=i  " Limit the files searched for auto-completes.
set lazyredraw  " Don’t update screen during macro and script execution.
set synmaxcol=250  " Max column for syntax highlight.
set updatetime=300  " ms to wait for trigger an event.
set timeoutlen=700

"------------------------------
"     ENABLE CSS BUILT-IN     "
"------------------------------
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" ------------------------------------------------------------------------------------------------


" -------------------------------------- MAPPINGS -------------------------------------------------
" <nop>: no operation, do nothing (useful in mappings).
noremap <silent> <Space> <NOP>

" Better delete one character using 'x'.
" nnoremap x "_x
" vnoremap <bs> "_d

" Enter command mode
"nnoremap <nowait> ; :

inoremap jk <ESC>
nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>ch :nohlsearch<CR>

" Better movement
"nnoremap <silent> <Space>h <C-w>h
"nnoremap <silent> <Space>j <C-w>j
"nnoremap <silent> <Space>k <C-w>k
"nnoremap <silent> <Space>l <C-w>l

" Switch tab
nnoremap <silent> <TAB> gt

" Indent selected area and stay in indent mode.
vnoremap < <gv
vnoremap > >gv

" Move line/block up and down.
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv

" Copy to system clippboard.
vnoremap <Space>y "+y

" Paste from system clippboard.
nnoremap <Space><C-v> "+p

" Go to beginning and end of the current line
inoremap <C-b> <ESC>^i
inoremap <C-e> <End>
" -------------------------------------------------------------------------------------------------


" ------------------------------------ AUTOCOMMANDS -----------------------------------------------
autocmd Filetype python setlocal shiftwidth=4 tabstop=4
autocmd Filetype txt setlocal shiftwidth=4 tabstop=4

" Remove trailing space
" autocmd BufWritePre * :%s/\s\+$//e

" Display cursorline ONLY in active window.
augroup cursor_off
  autocmd!
  autocmd WinLeave * set nocursorline nocursorcolumn
  autocmd WinEnter * set cursorline nocursorcolumn
augroup END
" -------------------------------------------------------------------------------------------------


" --------------------------------------- PLUGINS -------------------------------------------------
call plug#begin('~/.local/share/vim/plugged')
  Plug 'tomasiser/vim-code-dark'
  "Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  "Plug 'sainnhe/gruvbox-material'
  "Plug 'sainnhe/sonokai'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "Plug 'editorconfig/editorconfig-vim'
  "Plug 'tpope/vim-fugitive'
  "Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'rking/ag.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'prettier/vim-prettier'
  Plug 'pangloss/vim-javascript'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'leafgarland/typescript-vim'
  Plug 'alvan/vim-closetag'
  Plug 'jiangmiao/auto-pairs'
  Plug 'Yggdroot/indentLine'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

"------------------------------
"        VIM-CODE-DARK        "
"------------------------------
set t_Co=256
set t_ut=
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let g:codedark_conservative=0
let g:codedark_modern=1
let g:codedark_italics=0
let g:codedark_transparent=1
let g:codedark_term256=1
colorscheme codedark
"------------------------------

"------------------------------
"           MATERIAL          "
"------------------------------
"let g:material_theme_style = 'darker-community'
"colorscheme material

"" Fix italics in Vim
"let &t_ZH="\e[3m"
"let &t_ZR="\e[23m"
"------------------------------

"------------------------------
"       GRUVBOX-MATERIAL      "
"------------------------------
" FIXED: The comment color looks weird.
" https://github.com/sainnhe/gruvbox-material/issues/5#issuecomment-729586348
"let &t_ZH='\e[3m'
"let &t_ZR='\e[23m'

"let g:gruvbox_material_better_performance = 1
"let g:gruvbox_material_background = 'hard'
"let g:gruvbox_material_foreground = 'original'
"let g:gruvbox_material_enable_bold = 1
"let g:gruvbox_material_disable_italic_comment = 1
"let g:gruvbox_material_transparent_background = 0
"let g:gruvbox_material_ui_contrast = 'high'
"colorscheme gruvbox-material
"------------------------------

"------------------------------
"           SONOKAI           "
"------------------------------
"let g:sonokai_style = 'atlantis'
"let g:sonokai_better_performance = 1
"let g:sonokai_disable_italic_comment = 1
"let g:sonokai_enable_italic = 0
"let g:sonokai_transparent_background = 1
"colorscheme sonokai
"------------------------------

"------------------------------
"           NERDTREE          "
"------------------------------
let g:NERDTreeWinSize = 32
let g:NERDTreeMinimalMenu = 1  " FIXED: blank space after closing menu
nnoremap <Space>e :NERDTreeMirror<CR>:NERDTreeToggle<CR>
"------------------------------

"------------------------------
"         NERDCOMMENTER       "
"------------------------------
let g:NERDCreateDefaultMappings = 0
nmap <silent> gcc <Plug>NERDCommenterToggle
xmap <silent> gcc <Plug>NERDCommenterToggle
"------------------------------

"------------------------------
"         VIM-DEVICONS        "
"------------------------------
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
"------------------------------

"------------------------------
"         VIM-AIRLINE         "
"------------------------------
let g:airline_theme = 'codedark'
"let g:airline_theme = 'material'
"let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
"------------------------------

"------------------------------
"         EDITORCONFIG        "
"------------------------------
"let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"autocmd FileType gitcommit let b:EditorConfig_disable = 1

"let g:charset = 'utf-8'
"let g:indent_style = 'space'
"let g:tab_width = 2
"let g:indent_size = 2
"let g:insert_final_newline = 1
"let g:trim_trailing_whitespace = 1
"let g:max_line_length = 120
"let g:quote_type = 'single'
"let g:EditorConfig_max_line_indicator = 'none'

"autocmd FileType markdown let g:max_line_length = 'off'
"autocmd FileType markdown let g:trim_trailing_whitespace = 0
"autocmd FileType python let g:tab_width = 4
"autocmd FileType python let g:indent_size = 4
"------------------------------

"------------------------------
"        VIM-GITGUTTER        "
"------------------------------
"let g:gitgutter_map_keys = 0
"let g:gitgutter_sign_added = '✚'
"let g:gitgutter_sign_modified = '✹'
"let g:gitgutter_sign_removed = '-'
"let g:gitgutter_sign_removed_first_line = '-'
"let g:gitgutter_sign_modified_removed = '-'
"------------------------------

"------------------------------
"             FZF             "
"------------------------------
let g:ag_prg="ag --column --nogroup --noheading --skip-vcs-ignore --path-to-ignore ~/.ignore"
nnoremap <Space>ff :Files<CR>
nnoremap <Space>fb :BLines<CR>
"nnoremap <Space>fa :Ag<CR>
"------------------------------

"------------------------------
"             COC             "
"------------------------------
let g:coc_global_extensions = ['coc-tsserver', 'coc-pyright', 'coc-json', 'coc-java']

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute('silent! normal \<C-]>')
  if ret =~ 'Error' || ret =~ '错误'
    call searchdecl(expand('<cword>'))
  endif
endfunction

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : (CheckBackspace() ? "\<TAB>" : coc#refresh())
inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : (CheckBackspace() ? "\<C-j>" : coc#refresh())
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-return>"
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <silent> gd :call GoToDefinition()<CR>
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nnoremap <silent> <Space>D :CocDiagnostics<CR>
nmap <silent> <Space>rf <Plug>(coc-references)
nmap <silent> <Space>ca <Plug>(coc-codeaction-cursor)
nmap <silent> <Space>rt <Plug>(coc-refactor)
nmap <silent> <Space>rn <Plug>(coc-rename)
nnoremap <Space>co :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
nmap <Space>n <Plug>(coc-format)
xmap <Space>n <Plug>(coc-format-selected)
nnoremap <silent> <Space>cl :CocCommand java.clean.workspace<CR>

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
"------------------------------

"------------------------------
"           PRETTIER          "
"------------------------------
let g:prettier#autoformat = 0
" let g:prettier#exec_cmd_async = 1
nmap <Space>m <Plug>(Prettier)
" nmap <leader>p <Plug>(PrettierAsync)
"------------------------------

"------------------------------
"       VIM_JAVASCRIPT        "
"------------------------------
let g:javascript_plugin_jsdoc = 1
"------------------------------

"------------------------------
"       TYPESCRIPT-VIM        "
"------------------------------
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
"------------------------------

"------------------------------
"     VIM-JSX-TYPESCRIPT      "
"------------------------------
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
"------------------------------

"------------------------------
"        VIM-CLOSETAG         "
"------------------------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.xml'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,tsx,xml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx,xml'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_enable_react_fragment = 0
"------------------------------

"------------------------------
"         indentLine          "
"------------------------------
let g:indentLine_char = '│'
"------------------------------

"------------------------------
"      VIM-VISUAL-MULTI       "
"------------------------------
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'
"------------------------------

let java_highlight_functions = 1
" -------------------------------------------------------------------------------------------------
