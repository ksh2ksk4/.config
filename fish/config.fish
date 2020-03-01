set -x TERM xterm-256color

set -x LANG ja_JP.UTF-8
set -x PAGER less
set -x LESS -Fgij10MnRWX
# これを設定していると圧縮したファイルのlessでエラーになる
#set -x LESSCOLORIZER /usr/local/bin/pygmentize
set -x LESSOPEN '|/usr/local/bin/lesspipe.sh "%s"'
set -x LESS_ADVANCED_PREPROCESSOR 1

set -x ANDROID_HOME /usr/local/opt/android-sdk
set -x COMPOSER_HOME ~/.composer
set -x JAVA_HOME (/usr/libexec/java_home)

set -x PLANTUML_LIMIT_SIZE 8192

#source ~/.config/fish/functions/docker/ps.fish
