# MacPorts Installer addition: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
if [ -f /opt/local/etc/bash_completion ]; then
	source /opt/local/etc/bash_completion
fi
# Apache2 (MacPorts)
export PATH=/opt/local/apache2/bin:$PATH
# MySQL (DMG package)
export PATH=/usr/local/mysql/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_FALLBACK_LIBRARY_PATH

# JAVA_HOME (Mac)
export JAVA_HOME=/Library/Java/Home

# JAVA_HOME (CentOS)
export JAVA_HOME='/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0/jre'

# RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm # This loads RVM into a shell session.
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
