if [ -d ~/.rbenv/ ]
then
  export PATH="$HOME/.rbenv/bin:${HOME}/.rbenv/shims:$PATH"
  eval "$(rbenv init -)"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi

[[ -s "/home/yasser/.gvm/scripts/gvm" ]] && source "/home/yasser/.gvm/scripts/gvm"

PATH=$PATH:"${HOME}/bin"

function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

MOOD () {
  if [ $? = 0 ]
  then
    echo '☺ '
  else
    echo '☹ '
  fi
}

function_exists __git_ps1 || source ~/.git-prompt.sh
PS1="\$(MOOD) ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\$(__git_ps1) \n➟ \[\033[00m\] \[$(tput sgr0)\]"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

for f in $(find -L ~/.bash.d/ -type f -name '*.sh')
do
  source $f
done
