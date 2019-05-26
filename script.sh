#!/bin/bash
cat >&1 <<-'EOF'
#########################################################
# Tool for a local git repository using bash shell      #
#                                                       #
#   Features:                                           #
#            - Commit messages                          #
#            - Check repo's status                      #
#            - Add new file to repository               #
#                                                       #
#########################################################

EOF

function do_commit {
  commitText=""
  read -p "Enter the text of the commit message: " commitText
  git commit -m "$commitText"
}

function add_file {
  pathToFile=""
  read -p "Enter the path to file: " pathToFile
  git add "$pathToFile"
}

function request_help {
  cat >&1 <<-'HELP'

 Help:

          c - Commit message
          s - Check repo's status
          a - Add new file to repository
          q - Exit

HELP
}

cond=""
mainVar=""

while true; do
  read -p "Command (h for help): " mainVar
  case $mainVar in
  h)
  request_help
  continue
   ;;
  s) git status ;;
  c) do_commit ;;
  a) add_file ;;
  q)
  echo "Operation is over"
  exit
    ;;
  *) echo -e "Error: Invalid character\n" >&2 ;;
  esac
  read -p "Press N to cancel or any other key to continue: " cond
  if [[ $cond == "n" ]] || [[ $cond == "N" ]]; then
     echo "Operation is over"
     exit
  else
     continue
  fi
done
