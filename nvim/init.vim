" | |                   | |
" | | ____ _ _ __   __ _| | ___ _ __
" | |/ / _` | '_ \ / _` | |/ __| '_ \
" |   < (_| | | | | (_| | | (__| | | |
" |_|\_\__,_|_| |_|\__, |_|\___|_| |_|
"                   __/ |
"                  |___/

" ===
" === Auto load Vim Plug for first time uses
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === System
" ===

" No compatible with vi
set nocompatible
set hidden "what is the meaning?
" Check file type
" Set proper indentation for different file type
" Enable plugin check file type
" Enable plugin set indentation
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set termguicolors

set colorcolumn=80

" Enable using mouse
set mouse=a

set cursorline
" UTF-8 encoding
set encoding=utf-8

" Better tab
" Expand tab to <SPACE>
set expandtab
" tab width
set tabstop=2
" Set indentation width
set shiftwidth=2
set softtabstop=2
" Enable <SPACE>,<TAB> visible
set list
set listchars=tab:▸\ ,trail:▫

" Set unnamed register as clipboard
" In order to co-work with system CLIPBOARD
set clipboard=unnamed

set updatetime=100

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Set <LEADER> as <SPACE>
let mapleader=" "

" ===
nnoremap J 20j
nnoremap K 20k
nnoremap H 0
nnoremap L $

" ===
" === Main code display
" ===

" Show some message
set number
set relativenumber
set ruler
set wildmenu
set showcmd

" Prevent auto line split
set wrap
set tw=0

" Limit scroll behavior ensuring at least 5 lines below and beyond cursor
set scrolloff=5

" Search options, highlight...
nnoremap <LEADER><CR> :nohlsearch<CR>
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" Enable syntax highlighting
syntax enable
syntax on

" Restore Cursor Position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Change directory to current directory
"set autochdir

" Code fold
set foldmethod=indent
set foldlevel=99

" ===
" === Split and windows management
" === Default s is disabled here!
" ===
set splitright
set splitbelow
nnoremap s <nop>

" Split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nnoremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nnoremap sj :split<CR>
nnoremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nnoremap sl :vsplit<CR>

" Moving the cursor between windows
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER>l <C-w>l

" Resize the windows size
nnoremap <LEADER><up> :res +5<CR>
nnoremap <LEADER><down> :res -5<CR>
nnoremap <LEADER><left> :vertical resize-5<CR>
nnoremap <LEADER><right> :vertical resize+5<CR>

" New tab, same key binding with ranger
nnoremap gn :tabe<CR>

" ===
" === Other useful stuff
" ===

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>

" Compile function
noremap <F2> :call CompileRun()<CR>
func! CompileRun()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -15
    :term ./%<
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
    " elseif &filetype == 'vim'
    "   :source %
  endif
endfunc

" Source vim
nnoremap S :w<CR>:source $MYVIMRC<CR>

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
"Plug 'ajmwagar/vim-deus'
"Plug 'arzg/vim-colors-xcode'
"Plug 'tomasr/molokai'
"Plug 'chriskempson/vim-tomorrow-theme'
"Plug 'morhetz/gruvbox'
"  let g:gruvbox_contrast_dark = 'soft'
"Plug 'yuttie/hydrangea-vim'
"Plug 'tyrannicaltoucan/vim-deep-space'
"Plug 'AlessandroYorba/Despacio'
"Plug 'cocopon/iceberg.vim'
"Plug 'w0ng/vim-hybrid'
"Plug 'nightsense/snow'
"Plug 'nightsense/stellarized'
"Plug 'nightsense/cosmic_latte'
"Plug 'lifepillar/vim-solarized8'

" Status line
Plug 'liuchengxu/eleline.vim'

" Visual enhancement
Plug 'luochen1990/rainbow'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'mg979/vim-xtabline'
Plug 'RRethy/vim-illuminate'

" debugger
Plug 'puremourning/vimspector'
" File navigation
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
"Plug 'pechorin/any-jump.vim'

" Undotree
Plug 'mbbill/undotree'

" LaTeX
Plug 'lervag/vimtex'

" English gramma checking
Plug 'rhysd/vim-grammarous'

" markdown
"Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
"Plug 'dkarter/bullets.vim'

" Editor enhancement
Plug 'tpope/vim-surround'
"Plug 'gcmt/wildfire.vim'
Plug 'terryma/vim-expand-region'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jiangmiao/auto-pairs' "auto pair for '' () etc
Plug 'tomtom/tcomment_vim' " <space>c to comment
Plug 'theniceboy/antovim' " gs to switch
Plug 'junegunn/vim-after-object' " da= : delete what's after =
Plug 'junegunn/vim-easy-align'
Plug 'rhysd/clever-f.vim' " f to find the next one
Plug 'chrisbra/NrrwRgn'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'theniceboy/argtextobj.vim'
Plug 'svermeulen/vim-subversive'

Plug 'rlue/vim-barbaric'

" marks
Plug 'Yilin-Yang/vim-markbar'

" registers
Plug 'junegunn/vim-peekaboo'

"Taglist
Plug 'liuchengxu/vista.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'

" Code format
"Plug 'Chiel92/vim-autoformat'

" Python
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'tweekmonster/braceless.vim'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
"" Error checking
"Plug 'w0rp/ale'
"
"" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

" Dress
"color deus
colorscheme dracula

" Debuggr
" <TODO> <KangLiang> config vimspector
" nmap <F2> <Plug>VimspectorContinue
let g:vimspector_enable_mappings = 'HUMAN'

" coc.nvim
let g:coc_global_extensions = [
      \ 'coc-clangd',
      \ 'coc-cmake',
      \ 'coc-diagnostic',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-pyright',
      \ 'coc-snippets',
      \ 'coc-vimtex',
      \ 'coc-sh',
      \ 'coc-todolist',
      \ 'coc-vimlsp']

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-c> coc#refresh()

" Show coc commands.
nnoremap coc :CocCommand<CR>

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc snippets
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Use gh to show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:snips_author = 'Kang Liang'

"vimtex
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
autocmd BufRead,BufNewFile *.tex set conceallevel=1
let g:tex_conceal='abdmg'

" rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" FZF
set rtp+=/usr/bin/fzf
" set rtp+=/home/david/.linuxbrew/opt/fzf
"nnoremap <c-p> :Leaderf file<CR>
nnoremap <silent> <LEADER>ff :Files<CR>
"noremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <LEADER>fhh :History<CR>
nnoremap <LEADER>fh: :History:<CR>
nnoremap <LEADER>fh/ :History/<CR>
nnoremap <LEADER>fc :Colors<CR>
nnoremap <LEADER>fb :Buffers<CR>
""noremap <C-t> :BTags<CR>
nnoremap <LEADER>fl :Lines<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

"function! s:list_buffers()
"  redir => list
"  silent ls
"  redir END
"  return split(list, "\n")
"endfunction
"
"function! s:delete_buffers(lines)
"  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
"endfunction
"
command! BD call fzf#run(fzf#wrap({
"  \ 'source': s:list_buffers(),
"  \ 'sink*': { lines -> s:delete_buffers(lines) },
"  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
      "\ }))
"
"noremap <c-d> :BD<CR>
"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" markdown-preview.nvim
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0

let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1,
      \ 'sequence_diagrams': {},
      \ 'flowchart_diagrams': {},
      \ 'content_editable': v:false,
      \ 'disable_filename': 0
      \ }

let g:mkdp_filetypes = ['markdown']

" vim-table-mode
noremap <LEADER>tm :TableModeToggle<CR>
autocmd BufRead,BufNewFile *.md TableModeToggle

" bullets.vim
let g:bullets_enabled_file_types = [
      \ 'markdown',
      \ 'text',
      \ 'gitcommit',
      \ 'scratch'
      \]

" rnvimr
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_picker = 1
let g:rnvimr_draw_border = 1
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> <LEADER>r :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
      \ '<C-t>': 'NvimEdit tabedit',
      \ '<C-j>': 'NvimEdit split',
      \ '<C-l>': 'NvimEdit vsplit',
      \ 'gw': 'JumpNvimCwd',
      \ 'yw': 'EmitRangerCwd'
      \ }
let g:rnvimr_layout = { 'relative': 'editor',
      \ 'width': &columns,
      \ 'height': &lines,
      \ 'col': 0,
      \ 'row': 0,
      \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]

" vim-visual-multi
let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = '<C-j>'
let g:VM_maps["Select Cursor Up"]   = '<C-k>'

" vim-rooter
let g:rooter_patterns = ['Makefile', '.git/']
let g:rooter_silent_chdir = 1

" vista.vim
function! TocAndVista()
  if &filetype != 'tex'
    nnoremap <LEADER>v :Vista!!<CR>
  elseif &filetype == 'tex'
    nmap <LEADER>v <plug>(vimtex-toc-toggle) <C-w>h
  endif
endfunction

autocmd FileType * call TocAndVista()

nnoremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
      \   "function": "\uf794",
      \   "variable": "\uf71b",
      \  }

" vim-expand-region
vmap v <Plug>(expand_region_expand)
call expand_region#custom_text_objects({
      \ 'ia' :0,
      \ 'aa' :0,
      \ }) " argument tex object provided by argtextobj.vim

call expand_region#custom_text_objects('tex', {
      \ 'ic' :0,
      \ 'id' :0,
      \ 'ie' :0,
      \ 'i$' :0,
      \ 'ac' :0,
      \ 'ad' :0,
      \ 'ae' :0,
      \ 'a$' :0,
      \ })
call expand_region#custom_text_objects('markdown', { 'i|' :0, 'a|' :0} )

" undotree
noremap <LEADER>u :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24

" vim-gitgutter
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gh :GitGutterPreviewHunk<CR>
nnoremap <LEADER>gk :GitGutterPrevHunk<CR>
nnoremap <LEADER>gj :GitGutterNextHunk<CR>

"agit.vim
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1

" vim-autoformat
let g:autoformat_verbosemode=1
nnoremap <F3> :Autoformat<CR>

" braceless.vim
autocmd FileType python BracelessEnable +indent +fold +fold-slow +highlight

" tcomment_vim
nmap <LEADER>c gc
vmap <LEADER>c gc

" vim-easy-align
xmap <LEADER>a <Plug>(EasyAlign)
nmap <LEADER>a <Plug>(EasyAlign)

" splitjoin.vim
let g:splitjoin_split_mapping = ';s'
let g:splitjoin_join_mapping = ';j'

" vim-markbar
nmap <Leader>m <Plug>ToggleMarkbar

" vim-hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']

" vim-pydocstring
let g:pydocstring_formatter = 'numpy'
