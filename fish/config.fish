if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x TERM xterm-256color

set -x LANG ja_JP.UTF-8
set -x PAGER less
set -x LESS -Fgij10MnRWX
#set -x LESSCOLORIZER /usr/local/bin/pygmentize
set -x LESSOPEN '|/usr/local/bin/lesspipe.sh "%s"'
set -x LESS_ADVANCED_PREPROCESSOR 1
