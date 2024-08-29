import os
import re

blue_dec = "(129,161,193)"
blue_hex = "#81a1c1"

dirs = ["/home/gagan/Downloads/candy-modified/apps/scalable","/home/gagan/Downloads/candy-modified/devices/scalable","/home/gagan/Downloads/candy-modified/mimetypes/scalable","/home/gagan/Downloads/candy-modified/places/16","/home/gagan/Downloads/candy-modified/places/48","/home/gagan/Downloads/candy-modified/preferences/scalable"]

for _dir in dirs:
    for filename in os.listdir(_dir):
        if filename.endswith(".svg"):
            with open(os.path.join(_dir,filename),"r") as file:
                filedata = file.read()
            regex1 = re.compile(r"stop-color:rgb\([0-9]+,[ ]*[0-9]+,[]*[0-9]+\)")
            replacement1 = "stop-color:rgb" + blue_dec
            regex2 = re.compile(r"stop-color:#[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]")
            replacement2 = "stop-color:" + blue_hex
            replacement3 = 'stop-color="{}"'.format(blue_hex)
            regex3 = re.compile(r'stop-color="#[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]"')
            filedata = re.sub(regex1,replacement1,filedata)
            filedata = re.sub(regex2,replacement2,filedata)
            filedata = re.sub(regex3,replacement3,filedata)
            with open(os.path.join(_dir,filename),"w") as file:
                file.write(filedata)

