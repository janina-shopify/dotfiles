autoload -Uz vcs_info
precmd_functions+=( vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '%F{200}[%b%u%c]%f'
zstyle ':vcs_info:*' enable git

PROMPT='%F{green}%m%F %B%~%b $vcs_info_msg_0_ $ '
if [ $SPIN ]; then
    export PROMPT=$(echo $PROMPT | sed 's/➜/⥁/g')
fi
