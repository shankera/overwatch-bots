# -*- coding: utf-8 -*-
import os
import time
import string

from slackclient import SlackClient
# starterbot's ID as an environment variable
BOT_ID = os.environ.get("HERO_ID")

# constants
AT_BOT = "<@" + BOT_ID + ">:"
COUNT = 0
# instantiate Slack & Twilio clients
slack_client = SlackClient(os.environ.get('HERO_BOT_TOKEN'))

def handle_command(command, channel):
    COUNT += 1
    if COUNT >= 150 :
        response = "It's High Noon. . ."
        slack_client.api_call("chat.postMessage", channel=channel,
                          text=response, as_user=True)

def parse_slack_output(slack_rtm_output):
    output_list = slack_rtm_output
    if output_list and len(output_list) > 0:
        for output in output_list:
            if output and 'text' in output:
                if output['user'] == BOT_ID:
                    return None, None
                return output['text'].lower(), \
                       output['channel']
    return None, None

if __name__ == "__main__":
    READ_WEBSOCKET_DELAY = 1 # 1 second delay between reading from firehose
    if slack_client.rtm_connect():
        print("mccree is here!")
        while True:
            command, channel = parse_slack_output(slack_client.rtm_read())
            if command and channel:
                handle_command(command, channel)
            time.sleep(READ_WEBSOCKET_DELAY)
    else:
        print("Connection failed. Invalid Slack token or bot ID?")
