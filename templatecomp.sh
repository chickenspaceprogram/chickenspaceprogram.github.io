#!/bin/sh
# args: <templatefile> <infile> <outfile>

hmacro <(echo "\\def{title}{$(grep '\\title' $2 | tail -n 1 | sed 's/\\title{//' | sed 's/}$//')}\\def{text}{$(hmacro <(echo "\\def{title}{}"; cat $2;) | pandoc --from=markdown --to=html)}"; cat $1) > $3 # i haven't added predefining macros to hmacro yet and this is easier than messing with that fucked codebase

