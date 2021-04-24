#
# ~/.config/fish/config.fish
#

function fish_greeting -d "A cow greets you with eternal wisdom"
  set_color 7FDBFF
  fortune | cowsay
  set_color normal
  echo "" # empty line
end

function fish_prompt -d "Write out the prompt"
  set -l last_status $status
  if test $last_status = 0
    set status_color "3D9970"
  else
    set status_color "FF4136"
  end
  printf '%s %sλ%s ' (prompt_pwd) (set_color --bold $status_color) (set_color normal)
end

function add-to-path -d "Add directories to \$PATH"
  for dir in $argv
    if begin
        test -d $dir
        and not contains $dir $PATH
      end
      set -x PATH $PATH $dir
    end
  end
end

add-to-path ~/bin
add-to-path ~/.npm-packages/bin

function reload-config -d "Reload fish config file (this file)"
  . (status --current-filename)
end

# Git aliases
alias gst "git status"
#alias ga  "git add"
#alias gaa "git add --all"
#alias gc  "git commit"

# One letter aliases
alias q exit
alias g git
alias v vim
alias l less
alias e "exa --all --long"

# I can't memorize this line
alias untargz "tar xvf"

# Environment
set -x LC_ALL "en_US.UTF-8"

eval (direnv hook fish)

starship init fish | source