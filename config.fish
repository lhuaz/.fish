if not status --is-login; exit 0; end

stty -echo

# global env
set -gx LC_TIME 'ja_JP.UTF-8'
set -gx PATH $HOME/bin /usr/local/sbin /usr/local/bin $PATH
set -U EDITOR vim
set -U SSL_CERT_FILE "/usr/local/etc/ssl/certs/cacert.pem"

# rbenv
if which rbenv > /dev/null
  set -gx PATH $HOME/.rbenv/shims $PATH
  rbenv rehash >/dev/null ^&1
end

# tools from homebrew
alias find=gfind
alias sed=gsed

# colors ls
alias ls='gls --color=auto'
alias dir='gdir --color=auto'
alias vdir='gvdir --color=auto'

# colors other
alias grep='grep --color=auto'
alias gfrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# more ls
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# mysql UTF-8
alias mysql='mysql --default-character-set=utf8'

# others
alias rscp='rsync -vazP -e ssh'
alias axel='axel -a'
alias tree='tree -N'

# LS_COLORS
eval (gdircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')

# fish git prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch yellow
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green bold

set -g __fish_git_prompt_color_suffix black
set -g __fish_git_prompt_color_prefix black

stty echo