import subprocess
import os

cmd = "echo \"$(playerctl --player=spotify metadata artist) - $(playerctl --player=spotify metadata title)\" | sed -r 's/&/&amp;/g'"

process = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
output, error = process.communicate()
output = output.decode("utf-8")

i = 0
while (True):
    print(output[i:i+40 % len(output)])
    i = (i + 1) % len(output)
