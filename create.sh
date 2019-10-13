#!/bin/sh


##############################################
#  Setting up variables
##############################################

# git remote repositery path
REPO_PATH='./repos'

# actual project path
PROJ_PATH='./public_html/apps'


##############################################
#  Start creation process
##############################################

# collect project name as an input
echo -n "Enter Project Name: "
read proj

# Make a bare repository
mkdir `${REPO_PATH}/${proj}`
cd `${REPO_PATH}/${proj}`
git init --bare

# Add post recieve hook to git repositery
CURR = ${PWD}
WORKTREE=${cd `${CURR}/${PROJ_PATH}/${proj}`; pwd}
GITDIR=${cd `${CURR}/${REPO_PATH}/${proj}`; pwd}
cd ${CURR}
cat << EOT >> ${REPO_PATH}/${proj}/hooks/post-receive
#!/bin/sh
git --work-tree={WORKTREE} --git-dir=${GIRDIR} checkout -f


# Make project folder
mkdir `${PROJ_PATH}/${proj}`



