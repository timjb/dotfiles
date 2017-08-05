#
# ~/.config/fish/config.fish
#

function fish_greeting -d "A cow greets you with eternal wisdom"
  set_color red
  fortune | cowsay
  set_color normal
  echo "" # empty line
end

function fish_prompt -d "Write out the prompt"
  printf '%s %sλ%s ' (prompt_pwd) (set_color --bold red) (set_color normal)
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

add-to-path ~/bin ~/dotfiles/bin
add-to-path /usr/local/share/npm/bin # npm installed by homebrew
add-to-path /usr/local/heroku/bin
add-to-path ~/Library/Haskell/bin /usr/local/Cellar/ruby/1.9.3-p194/bin
add-to-path ~/.gem/ruby/*/bin
add-to-path /usr/local/mysql/bin
add-to-path /usr/texbin
add-to-path /sbin /usr/sbin
add-to-path ~/Software/emsdk_portable/{,clang/e1.35.0_64bit,node/4.1.1_64bit/bin,emscripten/1.35.0}
add-to-path ~/.cargo/bin

# Haskell
add-to-path ~/.local/bin # stack
add-to-path "$HOME/.cabal/bin" "$HOME/.stack/programs/x86_64-osx/ghc-8.0.2/bin"
add-to-path "$HOME/.cabal/bin" "$HOME/.stack/programs/x86_64-osx/ghc-8.2.1/bin"

set -x DYLD_LIBRARY_PATH $DYLD_LIBRARY_PATH /usr/local/mysql/lib
set -x DOCKER_HOST tcp://127.0.0.1:4243


function reload-config -d "Reload fish config file (this file)"
  . (status --current-filename)
end

# Git aliases
alias gst "git status"
alias ga  "git add"
alias gaa "git add --all"
alias gc  "git commit"

# One letter aliases
alias q exit
alias g git
alias v vim
alias l less
alias x startx

# I can't memorize this line
alias untargz "tar xvf"

# Open vim and NERDTree
function vimt; vim -c "NERDTree"; end

# Environment
set -x LC_ALL "en_US.UTF-8"

# Nix configuration
source ~/.config/fish/nix.fish
