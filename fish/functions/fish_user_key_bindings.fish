function fish_user_key_bindings -d 'Define own key bindings'
  bind \cd delete-char
  bind \cr 'peco_select_history (commandline -b)'
end
