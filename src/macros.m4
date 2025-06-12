m4_define(`CURRENT_YEAR', `2025')m4_dnl
m4_define(`CC_BY_DISCLAIMER',`
        <a href="https://creativecommons.org">$1</a>
        © 'CURRENT_YEAR` by 
        <a href="https://creativecommons.org">Athena Boose</a>
        is licensed under 
        <a href="https://creativecommons.org/licenses/by/4.0/">CC BY 4.0</a>
        <img src="https://mirrors.creativecommons.org/presskit/icons/cc.svg" style="max-width: 1em;max-height:1em;margin-left: .2em;">
        <img src="https://mirrors.creativecommons.org/presskit/icons/by.svg" style="max-width: 1em;max-height:1em;margin-left: .2em;">
    ')m4_dnl
m4_define(`PAGE_TEMPLATE',
`<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="styles.css">
	    <link rel="icon" type="image/svg+xml" href="trans_flag.svg">
        <title>
            $1
        </title>
    </head>
    <body>
        <header>
            'm4_include(`navbar.m4')`
        </header>
        <hr>
        <div class="center">
            $2
        </div>
        <hr>
        <footer>
	        'CC_BY_DISCLAIMER(`athweb')`
            <br style="display: block; margin-top: 0.3em;">
            🏳️‍⚧️ trans rights! 🏳️‍🌈
        </footer>
    </body>
</html>'
)m4_dnl
m4_define(`PAGE_TEMPLATE_MD', PAGE_TEMPLATE($1, esyscmd(`pandoc --from=markdown --to=html mkstemp($2)')))
