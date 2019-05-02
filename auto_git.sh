#!/bin/bash
git add *
git commit -m "commit" 
git remote set-url origin https://github.com/elrons/shellcode.git
git push -u origin master
