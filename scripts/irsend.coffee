# Description:
#   Send remote signal via irsend/lirc by command on slack
#

{WebClient} = require "@slack/client"
childProcess = require 'child_process'

sendIrSignal = (target, command, msg, react) ->
    childProcess.exec "irsend SEND_ONCE #{target} #{command}", (error, stdout, stderr) ->
        if error
            msg.reply "#{error}"
        else
            react(msg)

sendSignal = (target, command, msg, react) ->
    if msg.message.thread_ts?
        sendIrSignal(target, command, msg, react)

module.exports = (robot) ->
    web = new WebClient robot.adapter.options.token
    react = (msg, reaction) ->
        web.reactions.add
            name: reaction,
            channel: msg.message.rawMessage.channel,
            timestamp: msg.message.rawMessage.ts
    thumbsup = (msg) ->
        react(msg, 'thumbsup')
    robot.hear /power/i, (msg) ->
        sendSignal('aquos', 'power', msg, thumbsup)
    robot.hear /volup/i, (msg) ->
        sendSignal('aquos', 'volup', msg, thumbsup)
    robot.hear /voldown/i, (msg) ->
        sendSignal('aquos', 'voldown', msg, thumbsup)
    robot.hear /1/i, (msg) ->
        sendSignal('aquos', '1', msg, thumbsup)
    robot.hear /2/i, (msg) ->
        sendSignal('aquos', '2', msg, thumbsup)
    robot.hear /3/i, (msg) ->
        sendSignal('aquos', '3', msg, thumbsup)
    robot.hear /4/i, (msg) ->
        sendSignal('aquos', '4', msg, thumbsup)
    robot.hear /5/i, (msg) ->
        sendSignal('aquos', '5', msg, thumbsup)
    robot.hear /6/i, (msg) ->
        sendSignal('aquos', '6', msg, thumbsup)
    robot.hear /7/i, (msg) ->
        sendSignal('aquos', '7', msg, thumbsup)
    robot.hear /8/i, (msg) ->
        sendSignal('aquos', '8', msg, thumbsup)
    robot.hear /9/i, (msg) ->
        sendSignal('aquos', '9', msg, thumbsup)
    robot.hear /10/i, (msg) ->
        sendSignal('aquos', '10', msg, thumbsup)
    robot.hear /11/i, (msg) ->
        sendSignal('aquos', '11', msg, thumbsup)
    robot.hear /12/i, (msg) ->
        sendSignal('aquos', '12', msg, thumbsup)
