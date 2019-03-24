# slack-irbot

## Setup irbot

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
% npm install --save @slack/client
```

Go to [Slack App Directory](https://slack.com/apps) and install Hubot. Do not forget to obtain the API token of Hubot.

## Run irbot

The API token must be passed to hubot via environmental variable `HUBOT_SLACK_TOKEN`. You may export it before running the Hubot launcher script, `bin/hubot`, or inject the export into the script.

```bash
% bin/hubot -a slack
```

## References

- [Hubot](https://hubot.github.com/docs/)
- [hubot-slack](https://github.com/slackapi/hubot-slack/blob/master/docs/_pages/basic_usage.md)
