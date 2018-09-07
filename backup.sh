#!/bin/sh
#
# Created by: Westley K
# email: westley@sylabs.io
# Date: Sep 7, 2018
# https://github.com/WestleyK/repo-backup
# Version-1.0.0
#
#
# MIT License
#
# Copyright (c) 2018 WestleyK
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

SCRIPT_VERSION="version-1.0.0"
SCRIPT_DATE="Sep 7, 2018"

URL_FILE="${HOME}/.config/repo-backup-url/repo-backup-urls.txt"
BUG_FILE="/tmp/debug_backup_repo_$SCRIPT_VERSION.txt"

print_version() {
    echo $SCRIPT_VERSION
    echo $SCRIPT_DATE
    echo "Source code: https://github.com/WestleyK/repo-backup"
    exit 0
}

help_menu() {
    echo "Usage: backup-repo [OPTION] [FILE_NAME]|[USRNAME/REPO_NAME]]"
    echo "      -h | -help | --help (print help menu)"
    echo "            this will print the help menu, then exit."
    echo "            usage:"
    echo "            >> $ backup-repo -help"
    echo 
    echo "      -u | -url [REPO_URL] (clone/update repo from given username and repo)"
    echo "            this will only clone or update the given repo."
    echo "            make sure you are in the proper directory, eg. usb drive (or) a backup directory."
    echo "            examples:"
    echo "            >> $ cd /media/usb-drives/backup-of-repos/"
    echo "            >> $ backup-repo -url WestleyK/easy-clone"
    echo
    echo "      -c | -check (check for update)"
    echo "            this argument will check for update, then exit."
    echo "            usage:"
    echo "            >> $ backup-repo -check"
    echo
    echo "      -nu | -no_update (don't check for updates)"
    echo "            uasge:"
    echo "            >> $ backup-repo -no_update [OPTION] [FILE_NAME]|[USRNAME/REPO_NAME]]"
    echo
    echo "      -clearbug | -clear_bug (clear debug file: $BUG_FILE)"
    echo "            this will clear the debug file, then exit."
    echo "            debug file is located at:"
    echo "            $BUG_FILE"
    echo "            usage:"
    echo "            >> $ backup-repo -clearbug"
    echo
    echo "      -v | -version | --version (print script version)"
    echo "source code: https://github.con/WestleyK/repo-backup"
    exit 0
}

info() {
    echo "This feature is comming soon!"
    exit 1
}

clear_bug() {
    if [ ! -d $BUG_FILE ]; then
        echo "Nothing to clear"
        echo "'$BUG_FILE' dosen't exist!"
        exit 1
    fi

	cat /dev/null > $BUG_FILE
	echo "File cleared: $BUG_FILE"
	exit 0
}

debug_output() {
    DATE_RUN=` date `
    echo "" >> $BUG_FILE
    echo "" >> $BUG_FILE
    echo "" >> $BUG_FILE
    echo "" >> $BUG_FILE
    echo $DATE_RUN >> $BUG_FILE
    echo "expecting: $ERROR_EX" >> $BUG_FILE
    echo "actral: $ERROR_BUG" >> $BUG_FILE
}

check_update() {
    echo "this feature is comming soon!"
    exit 1
}

if [ -z $1 ]; then
    help_menu
fi

if [ ! -z $2 ]; then
    OPTION=$1
    REPO=$2
else
    REPO=$1
    OPTION=$1
fi


if [ "$OPTION" == "-h" ] || [ "$OPTION" == "-help" ] || [ "$OPTION" == "--help" ]; then
    help_menu
elif [ "$OPTION" == "-u" ] || [ "$OPTION" == "-url" ]; then
    ONLY_ONE="true"
elif [ "$OPTION" == "-c" ] || [ "$OPTION" == "-check" ]; then
    check_update
elif [ "$OPTION" == "-nu" ] || [ "$OPTION" == "-no_update" ]; then
    NO_UP="true"
elif [ "$OPTION" == "-clearbug" ] || [ "$OPTION" == "-clear_bug" ]; then
    clear_bug
elif [ "$OPTION" == "-v" ] || [ "$OPTION" == "-version" ] || [ "$OPTION" == "--version" ]; then
    print_version
elif [ "$OPTION" == "-*" ]; then
    echo "Option not found! :P  $OPTION"
    echo "Try:"
    echo ">> $ backup-repo -help (for help)"
    exit 1
fi

if [ "$ONLY_ONE" == "true" ]; then
    if [ -z $2 ]; then
        echo "Need at least 2 arguments for this function! :P"
        exit 1
    fi

    echo "this feature is comming soon!"

    exit 0
fi



COUNT=` cat $URL_FILE | wc -l `
H=1

while [ $H -lt $COUNT ]; do

    REPO_URL=` cat $URL_FILE | head -$H | tail -1 `

    if [ "$REPO_URL" == "" ]; then
        echo "new line"
        break
    fi

    if [ -d $REPO_URL ]; then
        echo "FATAL ERROR:"
        echo "'$REPO_URL'  already exist!"
        exit 1
    fi
    
    echo $REPO_URL

    echo "Cloning repo..."
    echo "$REPO_URL"
    URL=` echo "https://github.com/"$REPO_URL `
    echo $URL

    wget -O /tmp/repo_backup_url_test.txt $URL
    rm -f /tmp/repo_backup_url_test.txt

    #git clone $REPO_URL

    ((H+=1))

done


echo "Done."


exit 0



#
# End backup.sh
#
