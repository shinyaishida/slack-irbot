# slack-irbot

## Setup

Prepare a Raspberry Pi with Raspbian (tested with Stretch). Upgrade Raspbian packages.

```bash
% sudo apt update
% sudo apt -y dist-upgrade
```

Install node.js and packages required by hubot.

```bash
% sudo apt install -y nodejs npm
% sudo npm cache clean
% sudo npm -g install npm n
% sudo n stable
% sudo npm -g install yo generator-hubot coffeescript
```

Clone the repository and run the hubot installer. Bot adapter must be `slack`. Do not overwrite `.gitignore`, i.e., press `n` and `Enter`. The installer moves `README.md` given by the hubot installer to `README-hubot.md` and the original `README.md` given by this repository is preserved.

```bash
% cd /somewhere/to/clone/repo
% git clone https://github.com/shinyaishida/slack-irbot.git
% cd slack-irbot
% ./install-hubot.sh
...
? Bot adapter slack
...
 conflict .gitignore
? Overwrite .gitignore? do not overwrite
     skip .gitignore
...
found 0 vulnerabilities

% ls README*
README-hubot.md  README.md
```

