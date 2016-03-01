[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
[![Deploy to Docker Cloud](https://files.cloud.docker.com/images/deploy-to-dockercloud.svg)](https://cloud.docker.com/stack/deploy/)

# slack-narikiri
slackに登録したカスタム絵文字に自由に喋らせることができる`slash-command`。

![slash-command-setting](https://github.com/sho2010/slack-narikiri/wiki/images/narikiri-sample.png)

slash-commandで受け取ったparameterをslash-commandのresponceで実現しないで
messageAPI側に勝手に横流しすることによって実装。

# Deploy

Register slash-command and SlackAPI token
https://api.slack.com/docs/oauth-test-tokens
https://slack.com/apps/A0F82E8CA-slash-commands

こんな感じに設定`URL`はdeployするURL
![slash-command-setting](https://github.com/sho2010/slack-narikiri/wiki/images/deploy01.png)
 


# Settings 

環境変数に設定。

## Require settings

### SLACK_TOKEN

messageAPI使うためのslack token.

### VERIFICATION_TOKEN

verify token
slash-commandのIntegration SettingsのTokenの値

## Optional settings

### NARIKIRI_LOG_CHANNEL

匿名で誰が使ったのかわからなくて困る場合、誰が使ったのか通知するChannel名 いらない場合は空。

e.g. `#narikiri-log`

## 注意事項
[postMessage](https://api.slack.com/methods/chat.postMessage)を使ってる関係上
tokenのpermissionのないChannelでは利用できません。



