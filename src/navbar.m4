m4_define(NAVBAR_ELEM,
    `<a class="navbar-elem" href="$2">$1</a>'
) m4_dnl # $1: link name, $2: link reference
m4_dnl
NAVBAR_ELEM(`Home', `index.html')
NAVBAR_ELEM(`Blog', `blog.html')
NAVBAR_ELEM(`Contact', `contact.html')
