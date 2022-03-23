autoload -Uz vcs_info
precmd_functions+=( vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '%F{blue}[%b%u%c]%f'
zstyle ':vcs_info:*' enable git

if [ $SPIN ]; then
    SPIN_FQDN=$(cat /etc/spin/machine/fqdn)
    FQDN_PREFIX=$SPIN_FQDN[(ws:.:)0]
    PROMPT=$'%F{green}\U1F4AB  $FQDN_PREFIX%f %B%~%b $vcs_info_msg_0_ $ '
else
    PROMPT=$'%F{green}%m%f %B%~%b $vcs_info_msg_0_ $ '
fi