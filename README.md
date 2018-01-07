# scripts

collection of scripts to do random things

### obfuscate.py

arbitrary command execution with python. allows you to workaround blacklisted characters on some machines.

```
$ touch flag.txt; echo "supersecret" > flag.txt

$ cat flag.txt
supersecret

$ python obfuscate.py cat flag.txt
[*] encoding payload: cat flag.txt
[+] encoded:
    echo 'print("".join(chr(c) for c in [105,109,112,111,114,116,32,111,115,59,32,111,115,46,115,121,115,116,101,109,40,34,99,97,116,32,102,108,97,103,46,116,120,116,34,41]))' | python | python
[+] translation:
    echo 'print("""import os; os.system("cat flag.txt")""")' | python | python

$ echo 'print("".join(chr(c) for c in [105,109,112,111,114,116,32,111,115,59,32,111,115,46,115,121,115,116,101,109,40,34,99,97,116,32,102,108,97,103,46,116,120,116,34,41]))' | python | python
supersecret

$
```

### kali.sh

install guest additions on a fresh kali install. this was always a pain in the ass with a million different instructions on how to do it. now just run this script through reboots until it's done.

![installed](https://imgur.com/XOh23lj.png "installed")

### linuxprivchecker.py

enumeration tool for linux priv esc. runs with `python2`

### LinEnum.sh

enumeration tool for linux priv esc. written in `bash`
