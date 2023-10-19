#!/usr/bin/python

import subprocess
import sys
import json


def get_workspace():
    handle = subprocess.Popen(
        ["i3-msg", "-t", "get_workspaces"], stdout=subprocess.PIPE)
    output = handle.communicate()[0]
    data = json.loads(output.decode())
    data = sorted(data, key=lambda k: k['name'])
    for i in data:
        if (i['focused']):
            return i['num']


def moveto(num):
    subprocess.Popen(
        ["i3-msg", "move container to workspace "+str(num)], stdout=subprocess.PIPE)
    exit(0)


def goto(num):
    subprocess.Popen(["i3-msg", "workspace "+str(num)], stdout=subprocess.PIPE)
    exit(0)


if len(sys.argv) != 3:
    exit(-1)

command = sys.argv[1]
direction = sys.argv[2]

# get the workspace number
ws = get_workspace()

# handle the commands
if command == 'goto':
    if direction == 'next':
        ws += 1
        goto(ws)
    elif direction == 'prev':
        ws -= 1
        if ws < 0:
            exit(-1)
        goto(ws)

elif command == 'moveto':
    if direction == 'next':
        ws += 1
        moveto(ws)
    elif direction == 'prev':
        ws -= 1
        if ws < 0:
            exit(-1)
        moveto(ws)
