#!/bin/bash
# all of the junk to run mccree bot

virtualenv recall
source recall/bin/activate
pip install slackclient


for key in `cat mccree/.botkeys`; do
    export HERO_NAME="mccree"
    export HERO_BOT_TOKEN=$key
    export HERO_ID=$(python print_bot_id.py 2>&1)
    nohup python mccree/mccree.py > bot.log 2>&1&
    echo $! > process_ids.txt
done
for key in `cat d.va/.botkeys`; do
    export HERO_NAME="d.va"
    export HERO_BOT_TOKEN=$key
    export HERO_ID=$(python print_bot_id.py 2>&1)
    nohup python d.va/dva.py > bot.log 2>&1&
    echo $! > process_ids.txt
done
for key in `cat mercy/.botkeys`; do
    export HERO_NAME="mercy"
    export HERO_BOT_TOKEN=$key
    export HERO_ID=$(python print_bot_id.py 2>&1)
    nohup python mercy/mercy.py > bot.log 2>&1&
    echo $! > process_ids.txt
done
for key in `cat lucio/.botkeys`; do
    export HERO_NAME="lucio"
    export HERO_BOT_TOKEN=$key
    export HERO_ID=$(python print_bot_id.py 2>&1)
    nohup python lucio/lucio.py > bot.log 2>&1&
    echo $! > process_ids.txt
done
for key in `cat hanzo/.botkeys`; do
    export HERO_NAME="hanzo"
    export HERO_BOT_TOKEN=$key
    export HERO_ID=$(python print_bot_id.py 2>&1)
    nohup python hanzo/hanzo.py > bot.log 2>&1&
    echo $! > process_ids.txt
done
