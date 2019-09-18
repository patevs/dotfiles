#!/bin/bash

# music.sh

printf "\nRunning music.sh\n"
printf "\nChecking Requirements...\n\n"

# Python
command -v python >/dev/null 2>&1 || { 
  echo >&2 "I require python but it's not installed.  Aborting."; exit 1; 
}
printf " * Python: "
python -V

# pip
command -v pip >/dev/null 2>&1 || { 
  echo >&2 "I require pip but it's not installed.  Aborting."; exit 1; 
}
printf " * pip: "
pip -V

# install beets

# install mpsyt & configure

printf "\nDone"