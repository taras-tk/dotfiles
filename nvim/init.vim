call plug#begin('~/.local/share/nvim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Autocompletion and debug
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" Go Bundle
Plug 'zchee/deoplete-go', { 'build': { 'unix': 'make' } }
Plug 'jodosha/vim-godebug'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'godoctor/godoctor.vim'

" Python
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'davidhalter/jedi-vim'

" UI/UX
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'thaerkh/vim-workspace'
Plug 'majutsushi/tagbar'
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'

" Git Bundle
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

call plug#end()

""""""""""
" Theme
colorscheme onedark
"colorscheme wombat256
"colorscheme molokai
"colorscheme jellybeans
