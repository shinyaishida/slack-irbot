# Description:
#   Send remote signal via irsend/lirc by command on slack
#

{WebClient} = require "@slack/client"
childProcess = require 'child_process'

sendIrSignal = (target, command, msg) ->
  childProcess.exec "irsend SEND_ONCE #{target} #{command}", (error, stdout, stderr) ->
    if error
      msg.reply "#{error}"

listening = 'What can I do for you?'
greeting = "Hi there. #{listening}"

module.exports = (robot) ->
  web = new WebClient robot.adapter.options.token
  ignoredChannels = [ 'general', 'random' ]
  channelMap = {}

  robot.hear /(.*)/i, (msg) ->
    message = msg.message
    if message.thread_ts?
      target = channelMap[message.room]
      sendSignal(target, msg, (m) -> m.message.text)
    else
      target = channelMap[message.room]
      sendSignal(target, msg, (m) -> m.match[1])
    return

  robot.hearReaction (msg) ->
    message = msg.message
    if message.type == 'added' and message.item.type == 'message'
      target = channelMap[message.room]
      sendSignal(target, msg, (m) -> m.message.reaction)
    return

  sendSignal = (target, msg, commander) ->
    if target?
      sendSignalToTarget(target, msg, commander)
    else
      msg.reply "Sorry but I'm not available on this channel"

  sendSignalToTarget = (target, msg, commander) ->
    command = commander(msg)
    if command?
      sendIrSignal(target, command, msg)
    else
      msg.reply "I couldn't catch your order"
    askNextOrder(msg)

  askNextOrder = (msg) ->
    msg.send 'What can I do for you?'

  web.channels.list()
    .then (response) ->
      for channel in response.channels when channel.name not in ignoredChannels
        robot.messageRoom channel.id, greeting
        channelMap[channel.id] = channel.name
    .catch (error) -> robot.logger.error error.message
