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

add-to-path ~/bin ~/dotfiles/bin
add-to-path /sbin /usr/sbin
add-to-path ~/.local/bin

# Rust
add-to-path ~/.cargo/bin

# Haskell
add-to-path "$HOME/.cabal/bin" "$HOME/.stack/programs/x86_64-osx/ghc-8.2.2/bin"

# Node
set -x NODE_PATH "/usr/local/lib/node_modules"

# Perl
set -x PATH /Users/tim/perl5/bin $PATH ^/dev/null;
set -q PERL5LIB; and set -x PERL5LIB /Users/tim/perl5/lib/perl5:$PERL5LIB;
set -q PERL5LIB; or set -x PERL5LIB /Users/tim/perl5/lib/perl5;
set -q PERL_LOCAL_LIB_ROOT; and set -x PERL_LOCAL_LIB_ROOT /Users/tim/perl5:$PERL_LOCAL_LIB_ROOT;
set -q PERL_LOCAL_LIB_ROOT; or set -x PERL_LOCAL_LIB_ROOT /Users/tim/perl5;
set -x PERL_MB_OPT --install_base\ \"/Users/tim/perl5\";
set -x PERL_MM_OPT INSTALL_BASE=/Users/tim/perl5;

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

# Nix configuration (if not already available)
if test ! -n "$NIX_PATH"
  source ~/.config/fish/nix.fish
end

eval (direnv hook fish)