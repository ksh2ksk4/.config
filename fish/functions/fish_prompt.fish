function fish_prompt -d 'Write out the prompt'
  set -l last_status $status

  set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
  set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
  set -l prompt_symbol ''

  switch $USER
    case root toor
      set prompt_symbol '#'
    case '*'
      set prompt_symbol '$'
  end

  # 色確認
  #printf "%s%s %s%s %s%s %s%s %s%s %s%s %s%s %s%s%s\n" (set_color black) "black" (set_color red) "red" (set_color green) "green" (set_color yellow) "yellow" (set_color blue) "blue" (set_color magenta) "magenta" (set_color cyan) "cyan" (set_color white) "white" (set_color normal)
  #printf "%s%s %s%s %s%s %s%s %s%s %s%s %s%s %s%s%s\n" (set_color brblack) "brblack" (set_color brred) "brred" (set_color brgreen) "brgreen" (set_color bryellow) "bryellow" (set_color brblue) "brblue" (set_color brmagenta) "brmagenta" (set_color brcyan) "brcyan" (set_color brwhite) "brwhite" (set_color normal)

  set -l prompt_date (printf "%s[%s]%s" (set_color yellow) (date +'%F %T') (set_color normal))
  set -l prompt_user_pwd (printf "%s[%s@%s %s]%s" (set_color green) $USER (prompt_hostname) $pwd (set_color normal))

  set -l prompt_git ''
  set -l is_git_repository (git rev-parse --is-inside-work-tree 2>/dev/null)

  if test -n "$is_git_repository"
    set -l current_branch (git branch |grep '^* ' |string replace '* ' '')

    if test -n "$current_branch"
      # リポジトリにブランチが存在する場合
      set -l files (git status -s)
      set -l git_branch_status ''

      if test -z "$files"
        # コミットしていないものがない場合
        # 「OK マーク」
        set git_branch_status '\xf0\x9f\x86\x97'
      else
        # コミットしていないものがある場合
        # 「考えている顔」
        set git_branch_status '\xf0\x9f\xa4\x94'
      end

      set current_branch (printf "%s:%b" $current_branch $git_branch_status)
      set prompt_git (printf "%s[%s]%s" (set_color cyan) $current_branch (set_color normal))
    end
  end

  printf "%s%s%s\n[%d]%s " $prompt_date $prompt_user_pwd $prompt_git $last_status $prompt_symbol
end
