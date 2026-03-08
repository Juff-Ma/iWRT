echo "Cleaning up PATH and adding TTY"
export GPG_TTY=$(tty)
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
echo "Done! If this didn't work, remember this script needs to be sourced"
