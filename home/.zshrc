# Set up "history"
export HISTSIZE=100000;
export HISTFILESIZE=100000;
export HISTFILE=$HOME/.zsh_history;

# Ensure that the HISTFILE exist(s)
if [ ! -e $HISTFILE ]; then
  touch $HISTFILE;
fi

# Ensure that the `SHELL` variable is properly set
export SHELL=zsh;

# Ensure that "ZSH_TMUX_TERM" is set to the same value as "TERM"
export ZSH_TMUX_TERM=$TERM;

# If it exists, load "oh-my-zsh"
OH_MY_ZSH_DIR=$HOME/.oh-my-zsh;
if [ -d $OH_MY_ZSH_DIR ]; then
  ZSH=$OH_MY_ZSH_DIR;
  ZSH_THEME=jzaleski;
  DISABLE_AUTO_UPDATE=true;
  source $ZSH/oh-my-zsh.sh;
fi

# "Homebrew" specific inclusions
HOMEBREW_PREFIX=`brew --prefix 2> /dev/null`;
if [ -n "$HOMEBREW_PREFIX" ]; then
  # If it exists, process [Homebrew] "zsh-autosuggestions"
  ZSH_AUTOSUGGESTIONS_FILE=$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh;
  if [ -e $ZSH_AUTOSUGGESTIONS_FILE ]; then
    source $ZSH_AUTOSUGGESTIONS_FILE;
  fi
  # If it exists, process [Homebrew] "zsh-syntax-highlighting"
  ZSH_SYNTAX_HIGHLIGHTING_FILE=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh;
  if [ -e $ZSH_SYNTAX_HIGHLIGHTING_FILE ]; then
    source $ZSH_SYNTAX_HIGHLIGHTING_FILE;
  fi
fi

# If it exists, process ".zsh_aliases"
ZSH_ALIASES_FILE=$HOME/.zsh_aliases;
if [ -e $ZSH_ALIASES_FILE ]; then
  source $ZSH_ALIASES_FILE;
fi

# If it exists, process ".bash_functions"
ZSH_FUNCTIONS_FILE=$HOME/.zsh_functions;
if [ -e $ZSH_FUNCTIONS_FILE ]; then
  source $ZSH_FUNCTIONS_FILE;
fi

# If it exists, process ".zsh_prompt"
ZSH_PROMPT_FILE=$HOME/.zsh_prompt;
if [ -e $ZSH_PROMPT_FILE ]; then
  source $ZSH_PROMPT_FILE;
fi

# If it exists, process ".zsh_keys"
ZSH_KEYS_FILE=$HOME/.zsh_keys;
if [ -e $ZSH_KEYS_FILE ]; then
  source $ZSH_KEYS_FILE;
fi

# If it exists, process ".commonrc"
COMMONRC_FILE=$HOME/.commonrc;
if [ -e $COMMONRC_FILE ]; then
  source $COMMONRC_FILE;
fi

# Load any custom init-scripts (the filename *must* end-with ".zsh")
CUSTOM_INIT_SCRIPTS_DIRECTORY=$HOME/.home_dir/init;
if [ -d $CUSTOM_INIT_SCRIPTS_DIRECTORY ]; then
  for f in `find "$CUSTOM_INIT_SCRIPTS_DIRECTORY" -type f -o -type l | \grep "\.zsh\$" | sort`; do
    source $f;
  done
fi
