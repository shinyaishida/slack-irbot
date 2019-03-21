#!/bin/bash

readonly readme='README.md'
[ ! -f "${readme}" ] && exit 1

readonly readme_tmp=${readme/\.md/-slack-irbot.md}
readonly readme_hubot=${readme/\.md/-hubot.md}

mv ${readme} ${readme_tmp}
yo hubot
[ $? -eq 0 ] && {
  mv ${readme} ${readme_hubot}
}
mv ${readme_tmp} ${readme}
