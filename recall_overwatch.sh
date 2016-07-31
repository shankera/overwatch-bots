#!/bin/bash
# all of the junk to run mccree bot

virtualenv recall
source recall/bin/activate
pip install slackclient


for key in `cat mccree/.botkeys`; do
    export HERO_NAME="mccree"
    export HERO_BOT_TOKEN=$key
    export HERO_ID=$(python print_bot_id.py 2>&1)
    nohup python mccree/mccree.py &
done
