fm='\033[39;41m'
fm2='\033[39;43;1m'
def='\033[39;49m'
echo 
echo -e "${fm}The branch name <$local_ref_ex> is not valid as per our supported validation pattern.${def}"
echo
echo -e "# The branch name must follow the given pattern: \n \033[39;43;1m^(feature|bugfix|improvement|library|prerelease|release|hotfix)\/[a-z0-9._-]+$ ${def}"
echo
echo "*** Please rename your branch name and checkout to the same branch to use <push> commands. ***"
echo
