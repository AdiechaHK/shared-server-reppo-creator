# Git Repository on Shared Server

This is a basic script which will help you setup git repository on shared server.

## Requrements

* You must have `ssh` access to your server.

## Assumptions

* You have created a directory to keep your git repositories on server. [default in this script is `~/repos/`]
* You have created a directory to keep your projects [default in this script is `~/public_html/apps/`]

## Use the script (Step by step)

* login to your server using ssh [`ssh <username>@<domain>` if Mac or Linux] [use putty for windows]
* Copy this project creation script `curl https://raw.githubusercontent.com/AdiechaHK/shared-server-reppo-creator/master/create.sh -o create.sh`
* check and change git repositories path (`REPO_PATH`) and project path (`PROJ_PATH`) in the script - you can use `vi create.sh` to do so.
* change your domain or IP which so ever you use for ssh login and set it to variable `DOMAIN` in the script
* make this script executable using `chmod +x create.sh`
* now run the script `./create.sh` - this will only ask your for project name [don't use space in project name]

## Declaration

This is very basic level script We have created for our personal use, If you use it, that will be on your own risk. We will not be responsible for any damage, data lose or any other issues.
