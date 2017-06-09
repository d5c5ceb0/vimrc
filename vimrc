"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"
" file name: vimrc - the Vim configuration file.
"
" Coperight(c), 2012 zhangwei. All Rights Reserved.
"
" author: zhangwei <d5c5ceb0@gmail.com>
"
"
" last version: 1.0.0  2012.03.10
" modify: 2016.03.27
"
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"  Windows, Linux or macos
"  terminal or gui
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" plugins
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" vundle setting
set nocompatible              " be iMproved, vundle required
filetype off                  "vundle required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" tagbar
Plugin 'majutsushi/tagbar'
" nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
" mark-karkat
Plugin 'Mark--Karkat'
" orgmode
Plugin 'jceb/vim-orgmode'
" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'
" git
Plugin 'tpope/vim-fugitive'
" white space
Plugin 'ShowTrailingWhitespace'
" ultisnips
Plugin 'UltiSnips'
Plugin 'honza/vim-snippets'
" gitgutter
Plugin 'airblade/vim-gitgutter'
" syntastic
"Plugin 'scrooloose/syntastic'
" solarized
Plugin 'altercation/vim-colors-solarized' 
"vim-projectroot
Plugin 'dbakker/vim-projectroot'
"Yggdroot/indentLine
"Plugin 'Yggdroot/indentLine'
"fatih/vim-go
Plugin 'fatih/vim-go'
"plasticboy/vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/mathjax-support-for-mkdp'
"Plugin 'iamcco/markdown-preview.vim'
Plugin 'sat1993/markdown-preview.vim'
"rizzatti/dash
Plugin 'rizzatti/dash.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" basic setting
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif

"filetype plugin indent on                           "开启文件类型检测
syntax on                                           "打开语法高亮
set t_Co=256                                        "设置颜色数据
if (g:isGUI)
    set background=dark                             "选择dark
    set background=light                           "选择light
    let g:solarized_termcolors=16
	colorscheme solarized
else                                                "
    set background=dark                             "选择dark
	let g:solarized_termcolors=16
	colorscheme solarized
endif                                               "
"set clipboard=unnamedplus                           "使用系统剪切板
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
"set whichwrap=h,l                                   "左右移动键可以移动到上下行
set wildignore=*.bak,*.o,*.e,*~                     "文件模式的列表
set wildmenu                                        "命令行补全使用增强模式
set wildmode=list:longest,full                      "使用widechar指定的字符所用的补全模式
if (g:isGUI)
if (g:iswindows)
	set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
else
	set guifont=Monaco\ 10, Fira\ Mono\ Medium\ for\ Powerline\ 12
endif
else
	"使用terminal字体
endif
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
set statusline=[%f]\ [FORMAT=%{&ff}]                "状态栏设置
set statusline+=\ [TYPE=%Y]\ [POS=%l,%v]\ [%p%%]
set statusline+=%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
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

""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
""  keymap
""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" set mapleader
let mapleader=","
let maplocalleader="."

" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" 常规模式下清除行尾空格
nmap <Leader>cS :%s/\s\+$//g<CR>
nmap <Leader>ec :w<CR>:!tclsh %<CR>
" 常规模式下清除行尾^M符号
":%s/<C-V><C-M>//g
"常规模式下全文行逆序
":g/^/m0


""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"" plugins setting
""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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
			silent! ProjectRootExe !find `pwd` -name "*.[chSs]" -o -name "*.java"  -o -name "*.go" > cscope.files
        endif
        silent! ProjectRootExe !cscope -Rbq -i cscope.files
    endif
	let g:tmp_path = g:project_path 
	let g:tmp_path .= "/cscope.out"
    if filereadable(g:tmp_path)
        execute "cs kill -1"
        silent! ProjectRootExe cs add cscope.out
    endif

    "ProjectRootExe !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
	!pwd
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
	  endif
	  set csverb
	endif
endf

autocmd FileType c,cpp,h,S,java,go nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

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

nmap <leader>nt :ProjectRootExe NERDTreeToggle<cr>

"
" OmniCppComplete.vim
"
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"
" UltiSnips
"
let g:snips_author="d5c5ceb0"
let g:snips_email="d5c5ceb0@gmail.com"
let g:snips_copyright="d5c5ceb0"
"

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
" airline
"
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_section_x = '%Y'
let g:airline_section_z = '%p%% - (%l,%v)'
let g:airline_section_error={}
let g:airline_section_warning={}
let g:airline#extensions#wordcount#enabled = 0
"let w:airline_disabled = 1
"
" orgmode
"
let g:org_heading_shade_leading_stars = 1
let g:org_indent = 1
let g:org_todo_keywords=['TODO', 'DOIN', '|', 'DONE']
let g:org_agenda_files=['~/GTD/mywork.org']

function! GTD(...)
    :e ~/GTD/mywork.org
endf
command! -nargs=? -complete=file Gtd :call GTD("<args>")

"
" ctrlp
"
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'ra'

"
" fugitive
"
set statusline+=\ [%{fugitive#statusline()}]

"
" gitgutter
"
let g:gitgutter_max_signs = 10000
let g:gitgutter_signs = 0
nmap <Leader>gg :GitGutterSignsToggle<CR>:GitGutterLineHighlightsToggle<CR>

"
" syntastic
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_c_remove_include_errors = 1
"let g:syntastic_c_no_include_search = 1

"
"  ShowTrailingWhitespace
"
let g:ShowTrailingWhitespace = 0
" color column
function ToggleColumn()
    if ! &colorcolumn
        set colorcolumn=81
        call ShowTrailingWhitespace#Set(1,1)
    else
        set colorcolumn=
        call ShowTrailingWhitespace#Set(0,1)
    endif
endfunction

autocmd FileType c,cpp,h nmap <leader>cc :call ToggleColumn()<CR>

"
" vim-go
"
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1

"
" markdown
"
let g:vim_markdown_folding_disabled = 1
if (g:iswindows)
elseif (g:ismacos)
	let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
else
	let g:mkdp_path_to_chrome = "google-chrome"
end
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0

