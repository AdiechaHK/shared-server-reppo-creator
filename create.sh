#!/bin/sh


##############################################
#  Setting up variables
##############################################

# git remote repositery path
REPO_PATH='./repos'

# actual project path
PROJ_PATH='./public_html/apps'

# keep store current path
CURR=${PWD}

# set domain
DOMAIN='codegeeks.in'


##############################################
#  Start creation process
##############################################

# collect project name as an input
echo -n "Enter Project Name: "
read proj

# Make a bare repository
mkdir ${REPO_PATH}/${proj}
cd ${REPO_PATH}/${proj}
git init --bare
echo "Git bare repo created successfully"

# Add post recieve hook to git repositery
WORKTREE=`readlink -f ${CURR}/${PROJ_PATH}/${proj}`
GITDIR=`readlink -f ${CURR}/${REPO_PATH}/${proj}`
cd ${CURR}
cat << EOT >> ${REPO_PATH}/${proj}/hooks/post-receive
#!/bin/sh
git --work-tree=${WORKTREE} --git-dir=${GITDIR} checkout -f
EOT
echo "post reveive hook has been initiallized"

# Make your hook executable
chmod +x ${REPO_PATH}/${proj}/hooks/post-receive

# Make project folder
mkdir ${PROJ_PATH}/${proj}
echo "Project directory has been created successfully."

echo "=============================================================================="
echo "Now you can push to remote: ${USER}@${DOMAIN}:${GITDIR}"
