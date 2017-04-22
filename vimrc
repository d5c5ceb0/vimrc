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
"
"  判断操作系统是否是 Windows 还是 Linux
"
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"
"  < 判断是终端还是 Gvim >
"
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"
" 插件安装
"
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" vundle setting
" 安装"$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
" 配置
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"airline
"Plugin 'bling/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
" tagbar
Plugin 'majutsushi/tagbar'
" nerdtree
Plugin 'scrooloose/nerdtree'
"Plugin 'xuyuanp/nerdtree-git-plugin'
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
"Plugin 'UltiSnips'
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
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"
" basic setting
"
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"set nocompatible                                   "设置为VIM，而不是vi
autocmd BufEnter * lcd %:p:h                        "自动更改到当前文件所在的目录
"filetype plugin indent on                           "开启文件类型检测
syntax on                                           "打开语法高亮
set t_Co=256                                        "设置颜色数据
if (g:isGUI)
    set background=dark                             "选择dark
    "set background=light                           "选择light
    "let g:solarized_termcolors=16
	colorscheme solarized
else                                                "
    set background=dark                             "选择dark
    "set background=light                           "选择light
	let g:solarized_termcolors=16
	colorscheme solarized
endif                                               "
set clipboard=unnamedplus                           "使用系统剪切板
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
set fileencoding=chinese                            "设置文件保存编码
set fileencodings=gb2312,utf-8,gbk,gb18030,chinese  "探测文件的编码方式，并打开
set termencoding=utf-8                              "设置终端编码方式
if (g:iswindows)                                    "解决菜单乱码
    set fileformat=dos                              "设置新文件的<EOL>格式
elseif(g:islinux)
    set fileformat=unix                             "设置新文件的<EOL>格式
endif                                               "
set fileformats=unix,dos,mac                        "给出文件的<EOL>格式类型
set foldenable                                      "开启折叠
set foldmethod=syntax                               "折叠方法
set foldlevel=3                                     "设置折叠级别
set foldcolumn=0                                    "指定宽度的列
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
	"set guifont=Courier\ New\ 12
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

" need xsel '$sudo apt-get install xsel'
"Copy contents of System Clipboard to + buffer when entering vim
"autocmd VimEnter * call setreg('+', system('xsel -ob'))
"Copy contents of + buffer to System Clipboard while leaving vim
"autocmd VimLeave * call system("xsel -ib", getreg('+'))


""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
""
"" 插件配置
""
""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"
""-----------------------------------------------------------------------------
"" 1. cscope & ctags
""-----------------------------------------------------------------------------
" 安装ctags: $sudo apt-get install exuberant-ctags
" 安装cscope: $sudo apt-get install cscope
"1 csgen.sh, 放到PATH下面
"#!/bin/bash
"
"# create ~/.tags/ dir.
"if [ ! -d $(readlink -f ~/.tags/) ] ; then
"	mkdir ~/.tags;
"	echo "no .tags dir, create it!"
"fi
"
"echo "Generate cscope&ctags index files..."
"cs_path=`pwd`
"#find "$cs_path" -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.java" -o -name "*.cs" -o -name "*.S" > cscope.files
"find "$cs_path" -name "*.[chSs]" > cscope.files
"#sed -i 's/^/"/;s/$/"/' cscope.files
"
"#use -bqk will not contain /user/include
"cscope -Rbq -i cscope.files
"ctags -R
"
"echo "move cscope.* to ~/.tags/"
"mv cscope.files ~/.tags/;
"mv cscope.out ~/.tags/;
"mv cscope.in.out ~/.tags/;
"mv cscope.po.out ~/.tags/;
"mv tags ~/.tags/;
"
"echo "cscope&ctags generates successfully!"
"
"
"
"1.5 version

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
			#silent! ProjectRootExe !find `pwd` -name "*.[chSs]" > cscope.files
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

"-----------------------------------------------------------------------------
" 2. tagbar (for mac let g:tagbar_ctags_bin='/usr/local/bin/ctags')
"-----------------------------------------------------------------------------
if (g:iswindows)
    let g:tagbar_ctags_bin='ctags.exe'
else
    let g:tagbar_ctags_bin='/usr/bin/ctags'
endif
let g:tagbar_width=30					"窗口宽度的设置
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() 	"c程序tagbar自动开启

"-----------------------------------------------------------------------------
" 3. NERDTree.vim
"-----------------------------------------------------------------------------
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=30
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""-----------------------------------------------------------------------------
"" 4. OmniCppComplete.vim
""-----------------------------------------------------------------------------
" vim 7.3, builtin
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

""-----------------------------------------------------------------------------
"" 5. UltiSnips
""-----------------------------------------------------------------------------
"let g:snips_author="zhangwei"
"let g:snips_email="weizhang_07@163.com"
"let g:snips_copyright="jhangverita"
"

""-----------------------------------------------------------------------------
"" 6. Mark--Karkat
""-----------------------------------------------------------------------------
"" 给不同的单词高亮，表明不同的变量时很有用，详细帮助见 :h mark.txt
" <leader>m 设置mark
"modify for terminal solarized color
highlight def MarkWord1  ctermbg=LightCyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
highlight def MarkWord2  ctermbg=LightGreen    ctermfg=Black  guibg=#A4E57E    guifg=Black
highlight def MarkWord3  ctermbg=LightYellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
highlight def MarkWord4  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=Black
highlight def MarkWord5  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
highlight def MarkWord6  ctermbg=LightBlue     ctermfg=Black  guibg=#9999FF    guifg=Black

""-----------------------------------------------------------------------------
"" 7. airline
""-----------------------------------------------------------------------------
"安装powline字体
"git clone https://github.com/powerline/fonts.git
"./install.sh
"terminator font->power-line
"terminator backgroud->solarized
"
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_section_error={}
let g:airline_section_warning={}
"let w:airline_disabled = 1

""-----------------------------------------------------------------------------
"" 8. orgmode
""-----------------------------------------------------------------------------
" 将GTD文件夹放在/home目录下
let g:org_heading_shade_leading_stars = 1
let g:org_indent = 1
let g:org_todo_keywords=['TODO', 'DOIN', '|', 'DONE']
let g:org_agenda_files=['~/GTD/mywork.org']
"
" gtd.sh 放在PATH目录下
"#!/bin/bash
"
"vim ~/GTD/mywork.org
"
function! GTD(...)
	:e ~/GTD/mywork.org
endf
command! -nargs=? -complete=file Gtd :call GTD("<args>")

""-----------------------------------------------------------------------------
"" 9. ctrlp
""-----------------------------------------------------------------------------
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'ra'

""-----------------------------------------------------------------------------
"" 10. fugitive
""-----------------------------------------------------------------------------
set statusline+=\ [%{fugitive#statusline()}]

""-----------------------------------------------------------------------------
"" 11. gitgutter
""-----------------------------------------------------------------------------
let g:gitgutter_max_signs = 10000
let g:gitgutter_signs = 0

""-----------------------------------------------------------------------------
"" 11. syntastic
""-----------------------------------------------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_c_remove_include_errors = 1
"let g:syntastic_c_no_include_search = 1

""-----------------------------------------------------------------------------
"" 11. ShowTrailingWhitespace
""-----------------------------------------------------------------------------
let g:ShowTrailingWhitespace = 0

let g:go_disable_autoinstall = 0

let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1
""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
""
""    键盘映射
""
""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" 将空格映射为命令输入符":"
nnoremap <space> :
vnoremap <space> :

" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" set mapleader
let mapleader=","
let maplocalleader="."

" cscope & ctags
function TagsAdd()
	cs kill -1
	cs add ~/.tags/cscope.out
	set tags+=~/.tags/tags
endfunction
nmap <leader>sc :call TagsAdd()<CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" color column
";```g:iscolorcolumn
"let g:iscolorcolumn = 0
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

" NerdTree
nmap <leader>nt :NERDTreeToggle<cr>

" tabbar 快捷键
nmap <Leader>tl :TagbarToggle<CR>

nmap <Leader>gg :GitGutterSignsToggle<CR>:GitGutterLineHighlightsToggle<CR>

nmap <Leader>cS :%s/\s\+$//g<CR>

nmap <Leader>ep :call Do_CsTag()<CR>
nmap <Leader>ea :call Do_AddTags()<CR>

nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>
""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
""
""    常用快捷键
""
""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"
" 常规模式下清除行尾空格
":%s/\s\+$//g
" 常规模式下清除行尾^M符号
":%s/\r$//g
":%s/<C-V><C-M>//g
"常规模式下全文行逆序
":g/^/m0

