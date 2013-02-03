# Update the "PATH"
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin;

# If it exists, process ".bash_aliases"
BASH_ALIASES_FILE="$HOME/.bash_aliases";
if [ -f $BASH_ALIASES_FILE ];
then
	source $BASH_ALIASES_FILE;
fi

# If it exists, process ".bash_key_bindings"
BASH_KEY_BINDINGS_FILE="$HOME/.bash_key_bindings";
if [ -f $BASH_KEY_BINDINGS_FILE ];
then
	bind -f $BASH_KEY_BINDINGS_FILE;
fi

# "Homebrew" specific inclusions
HOMEBREW_PREFIX=`brew --prefix 2> /dev/null`;
if [ -n "$HOMEBREW_PREFIX" ];
then
	# If it exists, process [Homebrew] "bash_completion"
	BASH_COMPLETION_FILE="$HOMEBREW_PREFIX/etc/bash_completion";
	if [ -f $BASH_COMPLETION_FILE ];
	then
		source $BASH_COMPLETION_FILE;
	fi
fi

# If it exists, load "RVM"
RVM_BASE_DIR="$HOME/.rvm";
if [ -d $RVM_BASE_DIR ];
then
	export PATH=$PATH:$RVM_BASE_DIR/bin;
	source $RVM_BASE_DIR/scripts/rvm;
fi

# Some distros don't ship with "ssh-askpass" (this section must be processed before processing ".sshagentrc")
if [ ! -f "/usr/libexec/ssh-askpass" ] && [ -z "$SSH_ASKPASS" ];
then
	export SSH_ASKPASS="$HOME/libexec/ssh-askpass";
fi

# If it exists, process ".sshagentrc"
SSH_AGENT_RC_FILE="$HOME/.sshagentrc";
if [ -f $SSH_AGENT_RC_FILE ];
then
	source $SSH_AGENT_RC_FILE;
fi

# If it exists, process ".term_colors"
TERM_COLORS_FILE="$HOME/.term_colors";
if [ -f $TERM_COLORS_FILE ];
then
	source $TERM_COLORS_FILE;
fi

# Set up the "History"
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - ';
export HISTSIZE=100000;
export HISTFILESIZE=100000;

# Append to the history file, don't overwrite it
shopt -s histappend;

# Set the default "Editor" (git, amongst other things use this)
export EDITOR=vim;

# Set the "Prompt"
export PS1="$LIGHT_BLUE_FG\u$RED_FG@$LIGHT_GREEN_FG\h$BLUE_FG:$LIGHT_PURPLE_FG($WHITE_FG\w$LIGHT_PURPLE_FG)$YELLOW_FG\$ $NO_COLOR";
