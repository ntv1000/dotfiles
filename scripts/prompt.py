import os
import subprocess
from socket import gethostname

def gen_git_status():
    status_cmd = "git status"

    process = subprocess.Popen(status_cmd.split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, _ = process.communicate()

    if process.returncode != 0:
        # Not in a git repository
        return ""

    output = output.decode('unicode_escape')

    branch = ""
    dirty = False
    untracked = False
    ahead = False
    newfile = False
    renamed = False
    deleted = False

    for line in output.split("\n"):
        if "On branch" in line: branch = " ".join(line.split(" ")[2:])
        if "modified:" in line: dirty = True
        if "Untracked files:" in line: untracked = True
        if "Your branch is ahead of" in line: ahead = True
        if "newfile:" in line: newfile = True
        if "renamed:" in line: renamed = True
        if "deleted:" in line: deleted = True

    bits = ""
    if renamed: bits += ">"
    if ahead: bits += "*"
    if newfile: bits += "+"
    if untracked: bits += "?"
    if deleted: bits += "x"
    if dirty: bits += "!"

    if bits != "": bits = " " + bits

    return " [{branch}{bits}]".format(branch=branch, bits=bits)


def color(s, color):
    return "{color}{s}{nc}".format(s=s, color=color, nc=nc);

hostname = gethostname().split(".")[0]
username = os.environ["USER"]
pwd = os.getcwd()
homedir = os.path.expanduser("~")
pwd = pwd.replace(homedir, "~", 1)
git = gen_git_status()

nc = "\033[0m"
green = "\033[92m"
blue = "\033[36m"
red = "\033[31m"

# Two separate field versions are necessary as the coloring changes the length of the string
fields = {
        "username" : username,
        "at" : "@",
        "hostname" : hostname,
        "pwd" : pwd,
        "git" : git
        }

colored_fields = {
        "username" : color(username, green),
        "at" : color("@", green),
        "hostname" : color(hostname, green),
        "pwd" : color(pwd, blue),
        "git" : color(git, red)
        }


def gen(prompt):
    return prompt.format(**fields)

def gen_colored(prompt):
    return prompt.format(**colored_fields)

prompt = "{username}{at}{hostname}:{pwd}{git}$ "

_, width = os.popen('stty size', 'r').read().split()

width = int(width)
max_prompt_width = width / 2

if len(gen(prompt)) > max_prompt_width:
    prompt = "{hostname}:{pwd}{git}$ "

if len(gen(prompt)) > max_prompt_width:
    prompt = "{pwd}{git}$ "

if len(gen(prompt)) > max_prompt_width:
    separator = "..."
    head_length = int((max_prompt_width-len(separator)) // 3)
    tail_length = int((max_prompt_width-len(separator)) * 2 // 3)

    # First few chars and last few chars separated by `separator`
    pwd = pwd[:head_length]+"..."+pwd[-tail_length:]

    # Update dictionaries as the reference to pwd changed
    fields["pwd"] = color(pwd, blue)
    colored_fields["pwd"] = color(pwd, blue)

    # Prompt string can be left unchanged


print(gen_colored(prompt))
