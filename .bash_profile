
echo 'bash_profile'

# Normally a .bash_profile is only run when you __log in__ to terminal by typing
# your username and password. Either locally, or remotely via ssh. In the OSX terminal, it opens
# a login shell everytime, instead of an interactive shell. So, we need to source our ~/.bashrc from here so
# they both run.

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

export PATH=/usr/local/sbin:$PATH

##
# Your previous /Users/calvinwiebe/.bash_profile file was backed up as /Users/calvinwiebe/.bash_profile.macports-saved_2014-07-29_at_22:01:27
##

# MacPorts Installer addition on 2014-07-29_at_22:01:27: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/calvinwiebe/.gvm/bin/gvm-init.sh" ]] && source "/Users/calvinwiebe/.gvm/bin/gvm-init.sh"
