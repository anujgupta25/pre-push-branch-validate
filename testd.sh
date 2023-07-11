#!/bin/bash

# npm i husky > npx husky install (to produce the .husky dir) > npx husky add .husky/pre-push (to add pre-push hook inside .husky) > edit the hook file.

def='\033[39;49m'
fm1='\033[39;41m'
fm2='\033[39;43;1m'

while read local_ref local_oid remote_ref remote_oid; do

  validation_regex="^(feature|bugfix|hotfix)\/[a-z0-9._-]+$"

  local_ref_ex=${local_ref#*refs/heads/}

  remote_ref_ex=${remote_ref#*refs/heads/}

  # echo "here: $local_ref_ex"

  if ! [[ $local_ref_ex =~ $validation_regex || $remote_ref_ex =~ $validation_regex ]]; then

    if ! [[ $local_ref_ex == $remote_ref_ex ]]; then
      echo "Please checkout to the local branch first !"
      exit 1
    fi

    echo -e "${fm}The branch name <$local_ref_ex> is not valid as per our supported validation pattern.${def}"
    echo
    echo -e "# The branch name must follow the given pattern: \n ${fm2}^(feature|bugfix|improvement|library|prerelease|release|hotfix)\/[a-z0-9._-]+$ ${def}"
    echo
    echo "*** Please rename your branch name and checkout to the same branch to use <push> commands.***"
    echo 
    exit 1

  fi

  echo "**** Exiting ... ****"
  echo
  echo source: $local_ref
  echo result: ${local_ref#*refs/heads/}

  echo "local_ref: $local_ref"
  echo "local_oid: $local_oid"
  echo "remote_ref: $remote_ref"
  echo "remote_oid: $remote_oid"
done
