" Vimwiki settings
if has("unix")
    let g:vimwiki_list = [
        \{
            \'path'			: '~/Dropbox/vimwiki',
            \'path_html'	: '~/git/v-yadli.github.com/',
            \'html_header'	: '~/Dropbox/template/header.tpl',
            \'html_footer'	: '~/Dropbox/template/footer.tpl',
            \'nested_syntaxes'  : { 'python' : 'python' , 'c++' : 'cpp', 'c#' : 'cs', 'vim': 'vim' }
        \}
        \]
elseif has("win32")
    let g:vimwiki_list = [
        \{
            \'path'			: '~/Dropbox/',
            \'path_html'	: '~/git/v-yadli.github.com/',
            \'html_header'	: '~/Dropbox/template/header.tpl',
            \'html_footer'	: '~/Dropbox/template/footer.tpl',
            \'nested_syntaxes'  : { 'python' : 'python' , 'c++' : 'cpp', 'c#' : 'cs', 'vim': 'vim' }
        \}
        \]
endif
