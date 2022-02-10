"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"
" file name: vimrc - the Vim configuration file.
"
" Coperight(c), 2012 zhangwei. All Rights Reserved.
"
" author: zhangwei <d5c5ceb0@gmail.com>
"
"
" version: 1.0.0  2012.03.10
" modify: 2016.03.27
" modify: 2020.08.15
" last version: 2.0.0  2020.02.10 switch to neovim
"

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd!
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
"File Search:
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
"File Browser:
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'xuyuanp/nerdtree-git-plugin'
"Color:
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
"Golang:
Plug 'fatih/vim-go'
"Autocomplete:
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-go'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"Snippets:
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
"Git:
Plug 'tpope/vim-fugitive'
"Ack
Plug 'mileszs/ack.vim'
"Tagbar
Plug 'majutsushi/tagbar'
"karkat
Plug 'vim-scripts/Mark--Karkat'
"git
Plug 'tpope/vim-fugitive'
" gitgutter
Plug 'airblade/vim-gitgutter'
" projectroot
Plug 'dbakker/vim-projectroot'
"indentline
Plug 'yggdroot/indentLine'
"tabular
Plug 'godlygeek/tabular'
"delimitmate
Plug 'Raimondi/delimitMate'
"dict
Plug 'iamcco/dict.vim'
Plug 'itchyny/lightline.vim'
Plug 'entombedvirus/ncm2-vim-go'

Plug 'honza/vim-snippets'
call plug#end()

let g:iswindows = 0
let g:islinux = 0
let g:ismacos = 0

if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
elseif(has("mac"))
	let g:ismacos = 1
else
	let g:islinux = 1
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif


"COPY/PASTE:
"-----------
"Increases the memory limit from 50 lines to 1000 lines
:set viminfo='100,<1000,s10,h

set shortmess=atI                                   "去掉欢迎界面

"NUMBERING:
"----------
:set number

"INDENTATION:
"------------
"Highlights code for multiple indents without reselecting
vnoremap < <gv
vnoremap > >gv

"COLOR:
"------
"colorscheme gruvbox
colorscheme solarized
set background=light

"FONT
"font Liberation\ Mono\ Bold

""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
""  keymap
""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" set mapleader
let mapleader=","
let maplocalleader="."

" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
noremap <c-l> <C-w>l

" 常规模式下清除行尾空格
nmap <Leader>cS :%s/\s\+$//g<CR>
nmap <Leader>ec :w<CR>:!tclsh %<CR>

"
"cscope & ctags
"
function Do_CsTag()
	let g:project_path = projectroot#get()
	if ! strlen(g:project_path)
		echo "cscope not find path"
		retu []
	endif

    if(executable('cscope') && has("cscope") )
        if has("win32")
            silent! execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        else
	    silent! ProjectRootExe !find `pwd` -name "*.[chSs]" -o -name "*.java"  -o -name "*.go"  -o -name "*.cs"  -o -name "*.hpp" -o -name "*.cpp" -o -name "*.tcc"> cscope.files
        endif
	silent! ProjectRootExe !cscope -Rbq -i cscope.files
    endif
	let g:tmp_path = g:project_path 
	let g:tmp_path .= "/cscope.out"
    if filereadable(g:tmp_path)
        execute "cs kill -1"
        silent! ProjectRootExe cs add cscope.out
    endif

	"ctags
    "ProjectRootExe !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
	"let g:tags_path = join([projectroot#get(), "tags"], "/")
	"let &tags = g:tags_path
	
	redraw!

endf

function Do_AddTags()
	let g:project_path = projectroot#get()
	if ! strlen(g:project_path)
		echo "cscope.out not find path"
		retu []
	endif

	if has("cscope")
	  "set cscopequickfix=s-,c-,d-,i-,t-,e-
	  set csto=0
	  set cst
	  set nocsverb
	  " add any databasset autochdire in current directory
	  let g:tmp_path = g:project_path 
	  let g:tmp_path .= "/cscope.out"
	  if filereadable(g:tmp_path)
		  cs add cscope.out
        execute "cs kill -1"
        ProjectRootExe cs add cscope.out
	  else
		call Do_CsTag()
	  endif
	  set csverb
	endif
	"ctags
	"let g:tags_path = join([projectroot#get(), "tags"], "/")
	"let &tags = g:tags_path
endf


function Do_AddTagsAuto()
	let g:project_path = projectroot#get()
	if ! strlen(g:project_path)
		retu []
	endif

	if has("cscope")
	  let g:tmp_path = g:project_path 
	  let g:tmp_path .= "/cscope.out"
	  if filereadable(g:tmp_path)
		set csto=0
		set cst
		set nocsverb
        execute "cs kill -1"
        ProjectRootExe cs add cscope.out
		set csverb
	  endif
	endif
endf
autocmd FileType c,h,asm,cpp,hpp,java,tcc,cs,go nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,h,asm,cpp,hpp,java,tcc,cs,go nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,h,asm,cpp,hpp,java,tcc,cs,go nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,h,asm,cpp,hpp,java,tcc,cs,go nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,h,asm,cpp,hpp,java,tcc,cs,go nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,h,asm,cpp,hpp,java,tcc,cs,go nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
autocmd FileType c,h,asm,cpp,hpp,java,tcc,cs,go nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
autocmd FileType c,h,asm,cpp,hpp,java,tcc,cs,go nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,h,asm,cpp,hpp,java,tcc,cs,go call Do_AddTagsAuto()

nmap <Leader>ep :call Do_CsTag()<CR>
nmap <Leader>ea :call Do_AddTags()<CR>

"
" tagbar (for mac )
"
if (g:iswindows)
    let g:tagbar_ctags_bin='ctags.exe'
elseif (g:ismacos)
	let g:tagbar_ctags_bin='/usr/local/bin/ctags'
else
    let g:tagbar_ctags_bin='/usr/bin/ctags'
endif
let g:tagbar_width=30

nmap <Leader>tl :TagbarToggle<CR>

"
" NERDTree.vim
"
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=30
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=0
"let g:NERDTreeShowIgnoredStatus = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"nmap <leader>nt :ProjectRootExe NERDTreeToggle<cr>
nmap <leader>nt :NERDTreeToggle<cr>

"
" Mark--Karkat
"
"modify for terminal solarized color
highlight def MarkWord1  ctermbg=LightCyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
highlight def MarkWord2  ctermbg=LightGreen    ctermfg=Black  guibg=#A4E57E    guifg=Black
highlight def MarkWord3  ctermbg=LightYellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
highlight def MarkWord4  ctermbg=Red           ctermfg=Black  guibg=#FF7272    guifg=Black
highlight def MarkWord5  ctermbg=Magenta       ctermfg=Black  guibg=#FFB3FF    guifg=Black
highlight def MarkWord6  ctermbg=LightBlue     ctermfg=Black  guibg=#9999FF    guifg=Black


"
" gitgutter
"
let g:gitgutter_max_signs = 10000
let g:gitgutter_signs = 0
nmap <Leader>gg :GitGutterSignsToggle<CR> :GitGutterLineHighlightsToggle<CR>

"
" ctrlp
"
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.git','.svn'] 

" indentline
"let g:indentLine_setColors = 0
"let g:indentLine_char = '┆'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 0

" dict
let g:api_key = "1932136763"
let g:keyfrom = "aioiyuuko"
nmap <silent> <Leader>w <Plug>DictWSearch
nmap <silent> <Leader>w <Plug>DictWVSearch
nmap <silent> <Leader><Leader>r <Plug>DictRSearch
vmap <silent> <Leader><Leader>r <Plug>DictRVSearch

" need ag support
let g:ackprg = 'ag --nogroup --nocolor --column'

:command! -nargs=1 Ag :ProjectRootExe Ack <args>
nnoremap <Leader>a :ProjectRootExe Ack!<CR>


"AUTO IMPORT:
"------------
"let g:go_disable_autoinstall = 0
"let g:go_highlight_functions = 1  
"let g:go_highlight_methods = 1  
"let g:go_highlight_structs = 1  
"let g:go_highlight_operators = 1  
"let g:go_highlight_build_constraints = 1
"
""let g:go_auto_sameids = 1
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_extra_types = 1
"let g:go_def_mode = 'godef'
"let g:go_decls_includes = "func,type"
"let g:go_addtags_transform = "camelcase"
let g:go_fmt_command = "goimports"

"AUTOCOMPLETE:
"-------------
augroup ncm2
  au!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
  au User Ncm2PopupClose set completeopt=menuone
augroup END
autocmd BufEnter * call ncm2#enable_for_buffer()
"Press Enter to select item in autocomplete popup
inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")
"Cycle through completion entries with tab/shift+tab
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"
"Allow getting out of pop with Down/Up arrow keys
inoremap <expr> <down> pumvisible() ? "\<C-E>" : "\<down>"
inoremap <expr> <up> pumvisible() ? "\<C-E>" : "\<up>"

"SNIPPETS:
"---------
"Change default expand since TAB is used to cycle options
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"FILE SEARCH:
"------------
"allows FZF to open by pressing CTRL-F
map <C-p> :FZF<CR>
"allow FZF to search hidden 'dot' files
let $FZF_DEFAULT_COMMAND = "find -L"

"FILE BROWSER:
"-------------
""allows NERDTree to open/close by typing 'n' then 't'
"map nt :NERDTreeTabsToggle<CR>
""Start NERDtree when dir is selected (e.g. "vim .") and start NERDTreeTabs
"let g:nerdtree_tabs_open_on_console_startup=2
""Add a close button in the upper right for tabs
"let g:tablineclosebutton=1
""Automatically find and select currently opened file in NERDTree
"let g:nerdtree_tabs_autofind=1
""Add folder icon to directories
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:DevIconsEnableFoldersOpenClose = 1
""Hide expand/collapse arrows
"let g:NERDTreeDirArrowExpandable = "\u00a0"
"let g:NERDTreeDirArrowCollapsible = "\u00a0"
"let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
"highlight! link NERDTreeFlags NERDTreeDir

"SHORTCUTS:
"----------
"Open file at same line last closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

"SOURCING:
"---------
"Automatically reloads neovim configuration file on write (w)
autocmd! bufwritepost init.vim source %

"TEXT SEARCH:
"------------
"Makes Search Case Insensitive
set ignorecase

"SWAP:
"-----
set dir=~/.local/share/nvim/swap/

"SYNTAX HIGHLIGHTING:
"--------------------
syntax on

"HIGHLIGHTING:
"-------------
" <Ctrl-l> redraws the screen and removes any search highlighting.
"nnoremap <silent> <C-l> :nohl<CR><C-l>
" Highlight the current line the cursor is on
set cursorline


set autoindent                                      "自动对齐
set autoread                                        "当文件被外部程序改变时自动载入
set autowrite                                       "当文件一有改动就自动保存
set backspace=indent,eol,start                      "使用backspace正常处理indent，eol，start
set cindent                                         "编辑c文件时使用c的缩进方式
set cinoptions=:0                                   "设置c的具体缩进方式
"set lines=31 columns=73                             "vim屏幕的行列数
set completeopt=longest,menuone                     "用于插入模式的补全
set cursorline                                      "突出显示当前行
set encoding=utf-8                                  "vim内部使用的编码方式
"set fileencoding=chinese                            "设置文件保存编码
set fileencoding=utf-8                            "设置文件保存编码
set fileencodings=gb2312,utf-8,gbk,gb18030,chinese  "探测文件的编码方式，并打开
set termencoding=utf-8                              "设置终端编码方式
if (g:iswindows)                                    "解决菜单乱码
    set fileformat=dos                              "设置新文件的<EOL>格式
elseif(g:islinux)
    set fileformat=unix                             "设置新文件的<EOL>格式
else
    set fileformat=unix                             "设置新文件的<EOL>格式
endif                                               "
set fileformats=unix,dos,mac                        "给出文件的<EOL>格式类型
"set foldenable                                      "开启折叠
"set foldmethod=syntax                               "折叠方法
"set foldlevel=3                                     "设置折叠级别
"set foldcolumn=0                                    "指定宽度的列
set helpheight=10                                   "帮助窗口的初始化高度
set helplang=cn                                     "帮助文档的语音
set hidden                                          "允许未保存修改时切换缓冲区
set history=100                                     "历史命令存储条数
set hlsearch                                        "打开高亮搜索
set ignorecase                                      "搜索忽略大小写
set incsearch                                       "搜索实时匹配
set smartcase                                       "如果搜索模式中包含大写字母，不忽略大小写
"set mouse=a                                         "所有模式允许使用鼠标
set number                                          "显示行号
"set relativenumber                                  "relative number
set pumheight=10                                    "插入模式补全弹出项目最大条数
set ruler                                           "显示光标位置的行号和列号
set scrolloff=5                                     "设置光标上下行保留行数
"set expandtab                                       "将Tab键转换为空格
set tabstop=4                                       "设置Tab键的宽度
set shiftwidth=4                                    "换行时自动缩进4个空格
set smarttab                                        "指定按一次backspace就删除shiftwidth宽度的空格
set showcmd                                         "在屏幕最后一行显示命令
set smartindent                                     "智能缩进
set textwidth=78                                    "插入文本最大宽度
set whichwrap=h,l                                   "左右移动键可以移动到上下行
set wildignore=*.bak,*.o,*.e,*~                     "文件模式的列表
set wildmenu                                        "命令行补全使用增强模式
set wildmode=list:longest,full                      "使用widechar指定的字符所用的补全模式
set wrap                                            "自动换行
set writebackup                                     "保存文件前建立备份，保存成功后删除该备份
set nobackup                                        "设置无备份文件
set noswapfile                                      "设置无临时文件
"set vb t_vb=                                       "关闭提示音
"set go=menu                                        "菜单栏
set go=                                             "无菜单栏工具栏
set updatetime=250                                  "vim更新时间250ms
set shortmess=atI                                   "去掉欢迎界面
"set showtabline=2                                  "何时显示标签页
set laststatus=2                                    "永久显示状态行
"set statusline=[%f]\ [FORMAT=%{&ff}]                "状态栏设置
"set statusline+=\ [TYPE=%Y]\ [POS=%l,%v]\ [%p%%]
"set statusline+=%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
if (g:iswindows && g:isGUI)                         "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim                  "解决菜单乱码
    source $VIMRUNTIME/menu.vim                     "解决菜单乱码
    language messages zh_CN.utf-8                   "解决consle输出乱码
endif                                               "
if g:isGUI                                          "设置 gVim 窗口初始位置及大小
    "au GUIEnter * simalt ~x                        "窗口启动时自动最大化
    winpos 0 0                                      "指定窗口出现的位置，坐标原点在屏幕左上角
	set lines=666 columns=666                       "指定窗口大小，lines为高度，columns为宽度
endif
if (g:islinux)
"Copy contents of System Clipboard to + buffer when entering vim
"autocmd VimEnter * call setreg('+', system('xsel -ob'))
"Copy contents of + buffer to System Clipboard while leaving vim
"autocmd VimLeave * call system("xsel -ib", getreg('+'))
endif
