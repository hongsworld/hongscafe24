 
alias rm='rm -i' 
alias cp='cp -i' 
alias mv='mv -i' 
alias go_snuev='ssh hongs@snuev.com' 
alias go_aws='ssh -i ~/aws_key/hongs_dev.pem ec2-user@ec2-54-194-210-226.eu-west-1.compute.amazonaws.com' 
alias go_cafe_admin='ssh root@jung2poom.cafe24.com' # proteen2014 
alias go_cafe='ssh hongs@jung2poom.cafe24.com' # black 
alias ls='ls -G' 
alias openc='open -a "Google Chrome"' # this alias is made by bj 
alias cdd="cd Downloads/" 
alias ll='ls -alh' 
# Below code is bj's finding on Internet, bash status line 
# http://maketecheasier.com/8-useful-and-interesting-bash-prompts/2009/09/04 
 
RST="\[\e[0m\]"           # Reset Styles 
BOLD="\[\e[1m\]"          # Bold 
UL="\[\e[4m\]"            # Underline 
HL="\[\e[7m\]"            # Highlight (inverse) 
FG_BLACK="\[\e[90m\]"     # Foreground black 
FG_RED="\[\e[91m\]"       # Foreground red 
FG_GREEN="\[\e[92m\]"     # Foreground green 
FG_YELLOW="\[\e[93m\]"    # Foreground yellow 
FG_BLUE="\[\e[94m\]"      # Foreground blue 
FG_MAGENTA="\[\e[95m\]"   # Foreground magenta 
FG_CYAN="\[\e[96m\]"      # Foreground cyan 
FG_WHITE="\[\e[97m\]"     # Foreground white 
BG_BLACK="\[\e[100m\]"    # Background black 
BG_RED="\[\e[101m\]"      # Background red 
BG_GREEN="\[\e[102m\]"    # Background green 
BG_YELLOW="\[\e[103m\]"   # Background yellow 
BG_BLUE="\[\e[104m\]"     # Background blue 
BG_MAGENTA="\[\e[105m\]"  # Background magenta 
BG_CYAN="\[\e[106m\]"     # Background cyan 
BG_WHITE="\[\e[107m\]"    # Background white 
PS1="\[\033[35m\]\t\[\033[m\]@\[\033[32m\]hongs:\[\033[33;1m\]\w\[\033[m\]\$ " 


# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
