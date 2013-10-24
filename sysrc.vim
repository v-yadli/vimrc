" Vimwiki settings
if has("unix")
    let g:vimwiki_list = [
        \{
            \'path'			: '~/Dropbox/vimwiki/',
            \'path_html'	: '~/git/v-yadli.github.com/',
            \'nested_syntaxes'  : { 'python' : 'python' , 'c++' : 'cpp', 'c#' : 'cs', 'vim': 'vim' },
            \'template_path': '~/Dropbox/template/',
            \'template_default': 'disqus',
            \'template_ext' : '.html'
        \}
        \]
elseif has("win32")
    let g:vimwiki_list = [
        \{
            \'path'			: 'Z:/Dropbox/vimwiki',
            \'path_html'	: '~/git/v-yadli.github.com/',
            \'template_path': 'Z:/Dropbox/template/',
            \'template_default': 'disqus',
            \'template_ext' : '.html',
            \'nested_syntaxes'  : { 'python' : 'python' , 'c++' : 'cpp', 'c#' : 'cs', 'vim': 'vim' }
        \}
        \]
endif
