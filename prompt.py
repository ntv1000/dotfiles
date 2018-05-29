import os
from socket import gethostname

hostname = gethostname().split(".")[0]

username = os.environ["USER"]

pwd = os.getcwd()

homedir = os.path.expanduser("~")

pwd = pwd.replace(homedir, "~", 1)

if len(pwd) > 33:
    pwd = pwd[:10]+"..."+pwd[-20:] # first 10 chars+last 20 chars

nc = "\033[0m"
green = "\033[92m"
blue = "\033[36m"
red = "\033[31m"

def color(s, color):
    return "{color}{s}{nc}".format(s=s, color=color, nc=nc);

fields = {
        "username" : color(username, green),
        "hostname" : color(hostname, green),
        "pwd" : color(pwd, blue)
        }

print("{username}@{hostname}:{pwd}$".format(**fields))
