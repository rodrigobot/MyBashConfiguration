export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Colors and Prompt Setup
color1=$(tput setaf 34)
color2=$(tput setaf 15)
color3=$(tput setaf 45)
color4=$(tput setaf 10)
reset=$(tput sgr0)

# Parse git branch
parse_git_branch() {
  local branch_name
  branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$branch_name" ]; then
    echo "($branch_name)"
  fi
}

# Prompt Configuration
setopt PROMPT_SUBST;
PROMPT="%{$color1%}";
PROMPT+="%{${color1}%}[%*@%m] %n ";
PROMPT+="%{${color2}%}in ";
PROMPT+="%{${color3}%}%1~";
PROMPT+="%{${color4}%} \$(parse_git_branch)";
PROMPT+="%{${color2}%} > ";
PROMPT+="%{$reset%}";
export PROMPT;
