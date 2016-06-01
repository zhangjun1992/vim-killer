" by zhangjun
" .vimrc
" configure file for vim
" about plugin :
"	Tlist :
"	netrw :
"	bufExplorer :
"	lookupfile :
"	ctags :
"	cscope :
"	A :
"	grep:
"	ydt 有道翻译插件 
" Copyright (C) 2011 chen

"set language code
let &termencoding=&encoding
"if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
"set fileencodings=utf-8,latin1,gbk,iso-8859-1
set fileencodings=utf-8,gbk,iso-8859-1
"set fileencodings=gb2312,gb18030,utf-8,gbk
"endif

"set tab 4 stop
set tabstop=8		" Set default tab width to 4, default is 8
set softtabstop=8
set shiftwidth=8

set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif
set gfn=Monospace\ 12

"==================================

"set mapleader
let mapleader = ","

"fast reloading and editing of the .vimrc
map <leader>ss :source ~/.vimrc<cr>
map <silent> <leader>ee :e ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc


"set mksession
"map <leader>mk :mksession!<cr>
"map <leader>sm :source Session.vim<cr>

"set viminfo
"map <leader>wi :wviminfo vim.viminfo<cr>
"map <leader>si :rviminfo vim.viminfo<cr>

"save and load cache
map <leader>mk :mksession!<cr> :wviminfo vim.viminfo<cr>
map <leader>sm :source Session.vim<cr> :rviminfo vim.viminfo<cr>
"==================================
"Tag list
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
map <silent> <F9> :TlistToggle<cr>
"==================================
"netrw setting
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr>
"==================================
"Bufexplorer
let g:bufExplorerDefaultHelp=0	"Do not show default help
let g:bufExplorerShowRelativePath=1	"Show relative paths
let g:bufExplorerSortBy='mru'	"Sort by most recently used
let g:bufExplorerSplitRight=0	"Split left
let g:bufExplorerSplitVertical=1	"Split vertically
let g:bufExplorerSplitVertSize=30	"Split width
let g:bufExplorerUseCurrentWindow=1	"Open in new window
autocmd bufWinEnter \[Buf\ List\] setl nonumber
"==================================
"winManager setting
let g:winManagerWindowLayout = "BufExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :bottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>
"==================================
"lookupfile setting
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_preservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable("./filenametags")
let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent> <leader>lk :LUTags<cr>
nmap <silent> <leader>ll :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>
"==================================
"if has("cscope")
"	set csprg=/usr/bin/cscope
"	set csto=0
"	set cst
"	set nocsverb
	"add any database in current directory
"	if filereadable("cscope.out")
"		cs add cscope.out
"	endif
"	set csverb
"endif

"set tags and cscope
"map <leader>ts :set tags=tags<cr>
"map <leader>ca :cs add cscope.out<cr>
map <leader>ts :set tags=tags<cr> :cs add cscope.out<cr>

"find 的选项
"
"0或则S：查找本符号
"
"1或则G：查找本定义
"
"2或则D：查找本函数调用的函数
"
"3或则C：查找调用本函数的函数
"
"4或则T：查找本字符串
"
"6或则E：查找本EGREP模式
"
"7或则F：查找本文件
"
"8或则I：查找包含本文件的文件
"
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"==================================
" mark setting
nmap <silent><leader>hl <Plug>MarkSet
vmap <silent><leader>hl <Plug>MarkSet
nmap <silent><leader>hh <Plug>MarkClear
vmap <silent><leader>hh <Plug>MarkClear
nmap <silent><leader>hr <Plug>MarkRegex
vmap <silent><leader>hr <Plug>MarkRegex
"==================================
set number	"turn on line number
set cindent	"do c-style indenting
"set autoindent
"set word color
"colorscheme darkblue_2
colorscheme darkblue
"stop circle scan
set nowrapscan
"==================================
"auto completion
filetype plugin indent on
set completeopt=longest,menu
"==================================
"add folded
" zo – 打开光标下的折叠
" zO – 循环打开光标下的折叠
" zc – 关闭光标下的折叠
" zC – 循环关闭光标下的折叠 
" [z – 到当前打开折叠的开始
" ]z – 到当前打开折叠的结束
" zj – 向下移动到下一个折叠的开始处
" zk – 向上移动到上一个折叠的结束处 
"set foldenable
"autocmd FileType c,cpp setl fdm=syntax | setl fen

" enable sdcv dict
" set keywordprg=sdcv
" function! Mydict()
" 	let expl=system('sdcv -n ' .
" 				\ expand("<cword>"))
" 	windo if
" 				\ expand("%")=="diCt-tmp" |
" 				\ q!|endif
" 	25vsp diCt-tmp
" 	setlocal buftype=nofile bufhidden=hide noswapfile
" 	1s/^/\=expl/
" 	1  
" endfunction
" nmap F :call Mydict()<cr>
"set 启动鼠标支持
"set mouse=a
map <silent> <leader>gr :NERDTreeMirror<cr>
map <silent> <leader>gr :NERDTreeToggle<cr>

"有道翻译
vnoremap <silent> <C-T> <Esc>:Ydv<CR>
nnoremap <silent> <C-T> <Esc>:Ydc<CR> 
noremap <leader>yd :Yde<CR>
