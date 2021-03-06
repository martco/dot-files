" ======================================================================================
" File         : .vimrc
" Author       : Piotr Yordanov (tUrG0n)
" ======================================================================================

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","


filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()
filetype plugin indent on

" ------------------------------------------------------------------ 
" Desc: General
" ------------------------------------------------------------------ 
set nocompatible
set lazyredraw
set ttyfast
set hlsearch
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" ------------------------------------------------------------------ 
" Desc: Statusline
" ------------------------------------------------------------------ 
" Always hide the statusline
set laststatus=2

" Format the statusline
" set statusline=\ %f%m%r%h\ %w\ \ Col:\ %c\ \ \ Line:\ %l/%L\ %p%%\ [%P]

" ------------------------------------------------------------------ 
" Desc: Backup and Swap Folder
" ------------------------------------------------------------------ 
set backup " make backup file and leave it around 

" setup back and swap directory
let data_dir = $HOME.'/.data/'
let backup_dir = data_dir . 'backup' 
let swap_dir = data_dir . 'swap' 
if finddir(data_dir) == ''
	silent call mkdir(data_dir)
endif
if finddir(backup_dir) == ''
	silent call mkdir(backup_dir)
endif
if finddir(swap_dir) == ''
	silent call mkdir(swap_dir)
endif
set backupdir=$HOME/.data/backup " where to put backup file 
set directory=$HOME/.data/swap " where to put swap file 
unlet data_dir
unlet backup_dir
unlet swap_dir

" NOTE: viminfo
" for MS-DOS, Windows and OS/2: '20,<50,s10,h,rA:,rB:,
" for Amiga: '20,<50,s10,h,rdf0:,rdf1:,rdf2:
" for others: '20,<50,s10,h
set viminfo+=! " make sure it can save viminfo 
filetype on " enable file type detection 
filetype plugin on " enable loading the plugin for appropriate file type 
filetype plugin indent on

set history=50 " keep 50 lines of command line history
set updatetime=1000 " default = 4000
set autoread " auto read same-file change ( better for vc/vim change )

" enlarge maxmempattern from 1000 to ... (2000000 will give it without limit)
set maxmempattern=1000

" ------------------------------------------------------------------ 
" Desc: Visual
" ------------------------------------------------------------------ 

set showmatch " show matching paren 
set nu " Show LineNumber

" color scheme define
if has("gui_running")
	set guifont=monospace\ 9
	silent exec "colorscheme mine"
else " if we are in terminal mode
	silent exec "colorscheme mine"
endif

" ------------------------------------------------------------------ 
" Desc: Vim UI
" ------------------------------------------------------------------ 
set wildmenu " turn on wild menu, try typing :h and press <Tab> 
set showcmd	" display incomplete commands
set cmdheight=1 " 1 screen lines to use for the command-line 
set ruler " show the cursor position all the time
set hid " allow to change buffer without saving 
set shortmess=atI " shortens messages to avoid 'press a key' prompt 
"set display+=lastline " for easy browse last line with wrap text
set laststatus=2 " always have status-line


set showfulltag " show tag with function protype.

" disable menu & toolbar

" disable menu & toolbar
set guioptions-=m
set guioptions-=T
set guioptions-=R
set guioptions-=r
set guioptions-=b
set guioptions-=B
set guioptions-=L
set guioptions-=l

" ------------------------------------------------------------------ 
" Desc: Text edit
" ------------------------------------------------------------------ 
set ai " autoindent 
set si " smartindent 
set backspace=indent,eol,start " allow backspacing over everything in insert mode
" indent options
"  see help cinoptions-values for more details
set	cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,l0,b0,g0,hs,ps,ts,is,+s,c3,C0,0,(0,us,U0,w0,W0,m0,j0,
" default '0{,0},0),:,0#,!^F,o,O,e' disable 0# for not ident preprocess
" set cinkeys=0{,0},0),:,!^F,o,O,e

set cindent shiftwidth=2 " Set cindent on to autoinent when editing C/C++ file, with 4 shift width
set tabstop=2 " Set tabstop to 4 characters

" Set Number format to null(default is octal) , when press CTRL-A on number
" like 007, it would not become 010
set nf=
" In Visual Block Mode, cursor can be positioned where there is no actual character
set ve=block

" ------------------------------------------------------------------ 
" Desc: Fold text
" ------------------------------------------------------------------ 
set foldmethod=marker foldmarker={,} foldlevel=9999
set diffopt=filler,context:9999

" ------------------------------------------------------------------ 
" Desc: Search
" ------------------------------------------------------------------ 
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
set incsearch " do incremental searching
set ignorecase " Set search/replace pattern to ignore case 
set smartcase " Set smartcase mode on, If there is upper case character in the search patern, the 'ignorecase' option will be override.






" ------------------------------------------------------------------ 
" Desc: Key Mappings
" ------------------------------------------------------------------ 
" Fast saving and closing
nmap <leader>w :w!<cr>
nmap <leader>q :wq!<cr>
" if file is js, then saving it will call Jsbeautify
nmap <leader>ff :call g:Jsbeautify()<cr>

nmap <F4> :NERDTreeToggle<CR>

map <unique> <leader>y "*y
map <unique> <leader>p "*p
map <unique> <leader>P "*P

" m:  Set Search pattern highlight on/off
nnoremap <unique> <leader>m :let @/=""<CR>


map <leader>pp :setlocal paste!<cr>
map <leader>e :e! ~/.vim/.vimrc<cr>

" Show numbers to the left
map <F3> :set nonumber!<CR>:set foldcolumn=0<CR>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Undo ^^
imap <C-z> <C-O>u

" search in current files, preview first. remove the original c-p
" inoremap <unique> <c-p> <C-X><C-P>

" VimTip 329: A map for swapping words
" http://vim.sourceforge.net/tip_view.php?tip_id=
" Then when you put the cursor on or in a word, press "\sw", and
" the word will be swapped with the next word.  The words may
" even be separated by punctuation (such as "abc = def").
nnoremap <unique> <silent><leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>

map <CR> o<Esc>
" set Ctrl+j in insert mode, like VS.Net

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copy and Paste As found here: http://vim.wikia.com/wiki/In_line_copy_and_paste_to_system_clipboard?fb_ref=content_page&fb_source=profile_oneline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-v> <Esc>:call setreg("\"",system("xclip -o -selection clipboard"))<CR>pa
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>

noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR> 

" Remaps Vsplit to vsplit. I dunno why Vsplit is here in the first place! :P
cmap vsplit <Nop>


" Mappings for ctrlp
fu! s:call_ctrlp_extension(ext)
    if !exists('g:ctrlp_builtins')
        ru autoload/ctrlp.vim
    en
    cal ctrlp#init(ctrlp#{a:ext}#id())
endf

" Then create some mappings:
nn <silent> <leader><space>l :cal <SID>call_ctrlp_extension('line')<cr>
nn <silent> <leader><space>s :cal <SID>call_ctrlp_extension('rtscript')<cr>


" ------------------------------------------------------------------ 
" Desc: Only do this part when compiled with support for autocommands.
" ------------------------------------------------------------------ 
if has("autocmd")
	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		autocmd BufReadPost *
					\ if line("'\"") > 0 && line("'\"") <= line("$") |
					\   exe "normal g`\"" |
					\ endif

	augroup END
endif " has("autocmd")

" ------------------------------------------------------------------ 
" Desc: Buffer
" ------------------------------------------------------------------ 
au BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full) 

" ------------------------------------------------------------------ 
" Desc: PLUGINSS
" ------------------------------------------------------------------ 
" ------------------------------------------------------------------ 
" Desc: Ctrlp
" ------------------------------------------------------------------ 
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'line', 'undo', 'changes']


" ------------------------------------------------------------------ 
" Desc: OmniCppComplete
" ------------------------------------------------------------------ 
" use global scope search
let OmniCpp_GlobalScopeSearch = 1

" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 1

" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1

" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0

" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1

" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1

" This option can be use if you don't want to parse using namespace declarations in included files and want to add namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]

" Complete Behaviour
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1

" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0

set foldmethod=syntax
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


" ------------------------------------------------------------------ 
" Desc: file types commenting
" ------------------------------------------------------------------ 
" Disable auto-comment for c/cpp, lua, javascript, c# and vim-script
au FileType c,cpp,javascript set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f:// 
au FileType cs set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f:///,f:// 
au FileType vim set comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",f:\"
au FileType lua set comments=f:--

" ------------------------------------------------------------------ 
" Desc: EnhCommentify
" ------------------------------------------------------------------ 
let g:EnhCommentifyFirstLineMode='yes'
let g:EnhCommentifyRespectIndent='yes'
let g:EnhCommentifyUseBlockIndent='yes'
let g:EnhCommentifyAlignRight = 'yes'
let g:EnhCommentifyPretty = 'yes'
let g:EnhCommentifyBindInNormal = 'no'
let g:EnhCommentifyBindInVisual = 'no'
let g:EnhCommentifyBindInInsert = 'no'

" NOTE: VisualComment,Comment,DeComment are plugin mapping(start with <Plug>), so can't use remap here
vmap <unique> <leader>C <Plug>VisualComment
nmap <unique> <leader>C <Plug>Comment
vmap <unique> <C-F11> <Plug>VisualDeComment
nmap <unique> <C-F11> <Plug>DeComment

" ======================================================== 
"  add new languages for comment
" ======================================================== 

function EnhCommentifyCallback(ft)
	" for hlsl, swig, c
	if a:ft =~ '^\(hlsl\|swig\|c\)$' " NOTE: we have to rewrite the c comment behavior. 
		let b:ECcommentOpen = '//'
		let b:ECcommentClose = ''
	elseif a:ft == 'snippet' " for snippet
		let b:ECcommentOpen = '#'
		let b:ECcommentClose = ''
	elseif a:ft == 'maxscript' " for maxscript
		let b:ECcommentOpen = '--'
		let b:ECcommentClose = ''
	endif
endfunction
let g:EnhCommentifyCallbackExists = 'Yes'

" ------------------------------------------------------------------ 
" Desc: ShowMarks
" ------------------------------------------------------------------ 
let g:showmarks_enable = 1
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 0 

" ------------------------------------------------------------------ 
" Desc: Command-T
" ------------------------------------------------------------------ 
let g:CommandTMaxHeight = 15
let g:CommandTAcceptSelectionMap='<C-o>'
let g:CommandTAcceptSelectionVSplitMap='<CR>'
set wildignore+=*.o,*.obj,.git,*.pyc
noremap <leader>t :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>

" ------------------------------------------------------------------ 
" Desc: Fugitive
" ------------------------------------------------------------------ 
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
" Mnemonic, gu = Git Update
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>
" Exit a diff by closing the diff window
nmap <Leader>gx :wincmd h<CR>:q<CR>

" ------------------------------------------------------------------ 
" Desc: vimwiki
" ------------------------------------------------------------------ 
"  Since <Leader>w Is mapped to save, we need to change vimwiki's default mappings
map <Leader>W <Plug>VimwikiIndex
map <Leader>Wb <Plug>VimwikiGoBackLink
map <Leader>Wc <Plug>Vimwiki2HTML
map <Leader>Wcc <Plug>Vimwiki2HTMLBrowse
map <Leader>We <Plug>VimwikiSplitLink
map <Leader>Wf <Plug>VimwikiFollowLink
map <Leader>Wn <Plug>VimwikiNextLink
map <Leader>Wp <Plug>VimwikiPrevLink
map <Leader>Wq <Plug>VimwikiVSplitLink
map <Leader>Ws <Plug>VimwikiUISelect
map <Leader>Wt <Plug>VimwikiTabnewLink
map <Leader>Wtl <Plug>VimwikiTableMoveColumnLeft
map <Leader>Wtr <Plug>VimwikiTableMoveColumnRight
map <Leader>d <Plug>VimwikiMakeDiaryNote
map <Leader>dt <Plug>VimwikiTabMakeDiaryNote
map <Leader>i <Plug>VimwikiDiaryIndex
map <Leader>rr <Plug>VimwikiRenameLink
map <Leader>dd <Plug>VimwikiDeleteLink
map <Leader>T <Plug>VimwikiTabIndex




" ------------------------------------------------------------------ 
" Desc: Octave
" ------------------------------------------------------------------ 
augroup filetypedetect 
	au! BufRead,BufNewFile *.m,*.oct set filetype=matlab
augroup END 

autocmd BufRead *.m,*.oct nmap <F5> :!clear && octave %<CR>
autocmd BufRead *.m,*.oct nmap <F12> :!ctags *.m<CR>

" Use keywords from Octave syntax language file for autocomplete 
if has("autocmd") && exists("+omnifunc") 
	autocmd Filetype octave 
				\    if &omnifunc == "" | 
				\     setlocal omnifunc=syntaxcomplete#Complete | 
				\    endif 
endif 


" ------------------------------------------------------------------ 
" Desc: My Functions
" ------------------------------------------------------------------ 
"      mapping to automatically add an abbreviation
vmap <F8> <ESC>:call AddAbbr()<CR>

fun AddAbbr()
	normal byw
	let StringChar = visual#selection()
	let val = input("Enter the abbreviation you wish to use for '" . StringChar . "' :")
	exec "ia" StringChar val
	silent call SaveAbbr(StringChar, val)
endfun

fun SaveAbbr(abbr, val)
	redir >>~/.vim/plugin/autocorrectTurgon.vim 
	"foo.txt is the file in which you wish to add your abbreviations. For me, it
	"is ~/.vim/ftplugin/tex.vim
	echo "iab" a:abbr a:val
	redir END
endfun

" ------------------------------------------------------------------ 
" Desc: Stuff started based on file type
" ------------------------------------------------------------------ 
" ------------------------------------------------------------------ 
" Desc: python
" ------------------------------------------------------------------ 
au FileType python set completeopt=menuone
autocmd BufRead *.py nmap <F5> :!clear && python %<CR>

" ------------------------------------------------------------------ 
" Desc: TAGS
" ------------------------------------------------------------------ 
" programming related 


au BufNewFile,BufEnter * set cpoptions+=d " NOTE: ctags find the tags file from the current path instead of the path of currect file

" configure tags - add additional tags here or comment out not-used ones
set tags+=./tags,./../tags,./**/tags,tags " which tags files CTRL-] will find 
autocmd BufRead *.cpp set tags+=~/.vim/tags/cpp
autocmd BufRead *.cpp set tags+=~/.vim/tags/gl

" set completeopt as don't show menu and preview
au FileType c,cpp,hlsl set completeopt=menuone
autocmd BufRead *.cpp inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>i 
autocmd BufRead *.cpp noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr> 


autocmd BufRead *.tex :call MyAbrv()
au BufRead,BufNewFile *.ny setfiletype lisp


"Higlight current line 
set cursorline

"Highlight cursor
highlight CursorLine ctermbg=8 cterm=NONE

" ------------------------------------------------------------------ 
" Desc: Coffee
" ------------------------------------------------------------------ 
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent 
au BufNewFile,BufReadPost *.coffee setl expandtab
au BufNewFile,BufReadPost *.styl setl expandtab

" ------------------------------------------------------------------ 
" Desc: TagBar
" ------------------------------------------------------------------ 
let g:tagbar_type_javascript = {
			\ 'ctagsbin' : '/usr/local/bin/jsctags'
			\ }

nmap <F8> :TagbarToggle<CR>
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif



function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen


nnoremap <Leader>s :%s/\<<C-r><C-w>\>/


" ------------------------------------------------------------------ 
" Desc: NeoComplCache
" ------------------------------------------------------------------ 
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
