# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="agnoster"

ZSH_THEME="powerlevel10k/powerlevel10k"




# User configuration
MOZ_ENABLE_WAYLAND=1
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias scp="noglob scp"

#source aliases if present
[[ ! -f ~/.aliases ]] || source $HOME/.aliases
#
#source zshenv  if present
[[ ! -f ~/.zshenv ]] || source $HOME/.zshenv


# pyenv
export VIRTUAL_ENV_DISABLE_PROMPT=
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# add nvm
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# load plugins only AFTER all pyenv, nvm etc has been loaded
plugins=(git docker docker-compose vi-mode poetry fzf kubectl nvm ng)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/plugins/git/git.plugin.zsh

## flux
# enable flux complition if flux is there
command -v flux >/dev/null && . <(flux completion zsh)

## exports
export FZF_ALT_C_COMMAND='ag --hidden -l -g ""'
export FZF_CTRL_T_COMMAND='ag -l -g ""'
export FZF_DEFAULT_COMMAND='ag --hidden -l -g ""'

# kube sealing
kss () {
  kubeseal -o yaml --controller-namespace kube-system --controller-name sealed-secrets-controller < "$1" > "${1/-secret/-ssecret}"
}
# selector for kubecfg
alias kcfg='export KUBECONFIG=$(ls ~/.kube/*yaml | fzf)'

# add krew plugin to path (for kubectl)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# add gem installed binaries to path
GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"


# all things just
#compdef just
autoload -U is-at-least

_just() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    local common=(
'(--no-aliases)--alias-style=[Set list command alias display style]: :(left right separate)' \
'--chooser=[Override binary invoked by \`--choose\`]: :_default' \
'--color=[Print colorful output]: :(auto always never)' \
'--command-color=[Echo recipe lines in <COMMAND-COLOR>]: :(black blue cyan green purple red yellow)' \
'(-E --dotenv-path)--dotenv-filename=[Search for environment file named <DOTENV-FILENAME> instead of \`.env\`]: :_default' \
'-E+[Load <DOTENV-PATH> as environment file instead of searching for one]: :_files' \
'--dotenv-path=[Load <DOTENV-PATH> as environment file instead of searching for one]: :_files' \
'--dump-format=[Dump justfile as <FORMAT>]:FORMAT:(json just)' \
'-f+[Use <JUSTFILE> as justfile]: :_files' \
'--justfile=[Use <JUSTFILE> as justfile]: :_files' \
'--list-heading=[Print <TEXT> before list]:TEXT:_default' \
'--list-prefix=[Print <TEXT> before each list item]:TEXT:_default' \
'*--set=[Override <VARIABLE> with <VALUE>]: :(_just_variables)' \
'--shell=[Invoke <SHELL> to run recipes]: :_default' \
'*--shell-arg=[Invoke shell with <SHELL-ARG> as an argument]: :_default' \
'--timestamp-format=[Timestamp format string]: :_default' \
'-d+[Use <WORKING-DIRECTORY> as working directory. --justfile must also be set]: :_files' \
'--working-directory=[Use <WORKING-DIRECTORY> as working directory. --justfile must also be set]: :_files' \
'*-c+[Run an arbitrary command with the working directory, \`.env\`, overrides, and exports set]: :_default' \
'*--command=[Run an arbitrary command with the working directory, \`.env\`, overrides, and exports set]: :_default' \
'--completions=[Print shell completion script for <SHELL>]:SHELL:(bash elvish fish nushell powershell zsh)' \
'()-l+[List available recipes]' \
'()--list=[List available recipes]' \
'--request=[Execute <REQUEST>. For internal testing purposes only. May be changed or removed at any time.]: :_default' \
'-s+[Show recipe at <PATH>]: :(_just_commands)' \
'--show=[Show recipe at <PATH>]: :(_just_commands)' \
'--check[Run \`--fmt\` in '\''check'\'' mode. Exits with 0 if justfile is formatted correctly. Exits with 1 and prints a diff if formatting is required.]' \
'--clear-shell-args[Clear shell arguments]' \
'(-q --quiet)-n[Print what just would do without doing it]' \
'(-q --quiet)--dry-run[Print what just would do without doing it]' \
'--explain[Print recipe doc comment before running it]' \
'(-f --justfile -d --working-directory)-g[Use global justfile]' \
'(-f --justfile -d --working-directory)--global-justfile[Use global justfile]' \
'--highlight[Highlight echoed recipe lines in bold]' \
'--list-submodules[List recipes in submodules]' \
'--no-aliases[Don'\''t show aliases in list]' \
'--no-deps[Don'\''t run recipe dependencies]' \
'--no-dotenv[Don'\''t load \`.env\` file]' \
'--no-highlight[Don'\''t highlight echoed recipe lines in bold]' \
'--one[Forbid multiple recipes from being invoked on the command line]' \
'(-n --dry-run)-q[Suppress all output]' \
'(-n --dry-run)--quiet[Suppress all output]' \
'--allow-missing[Ignore missing recipe and module errors]' \
'--shell-command[Invoke <COMMAND> with the shell used to run recipe lines and backticks]' \
'--timestamp[Print recipe command timestamps]' \
'-u[Return list and summary entries in source order]' \
'--unsorted[Return list and summary entries in source order]' \
'--unstable[Enable unstable features]' \
'*-v[Use verbose output]' \
'*--verbose[Use verbose output]' \
'--yes[Automatically confirm all recipes.]' \
'--changelog[Print changelog]' \
'--choose[Select one or more recipes to run using a binary chooser. If \`--chooser\` is not passed the chooser defaults to the value of \$JUST_CHOOSER, falling back to \`fzf\`]' \
'--dump[Print justfile]' \
'-e[Edit justfile with editor given by \$VISUAL or \$EDITOR, falling back to \`vim\`]' \
'--edit[Edit justfile with editor given by \$VISUAL or \$EDITOR, falling back to \`vim\`]' \
'--evaluate[Evaluate and print all variables. If a variable name is given as an argument, only print that variable'\''s value.]' \
'--fmt[Format and overwrite justfile]' \
'--groups[List recipe groups]' \
'--init[Initialize new justfile in project root]' \
'--man[Print man page]' \
'--summary[List names of available recipes]' \
'--variables[List names of variables]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
)

    _arguments "${_arguments_options[@]}" $common \
        '1: :_just_commands' \
        '*: :->args' \
        && ret=0

    case $state in
        args)
            curcontext="${curcontext%:*}-${words[2]}:"

            local lastarg=${words[${#words}]}
            local recipe

            local cmds; cmds=(
                ${(s: :)$(_call_program commands just --summary)}
            )

            # Find first recipe name
            for ((i = 2; i < $#words; i++ )) do
                if [[ ${cmds[(I)${words[i]}]} -gt 0 ]]; then
                    recipe=${words[i]}
                    break
                fi
            done

            if [[ $lastarg = */* ]]; then
                # Arguments contain slash would be recognised as a file
                _arguments -s -S $common '*:: :_files'
            elif [[ $lastarg = *=* ]]; then
                # Arguments contain equal would be recognised as a variable
                _message "value"
            elif [[ $recipe ]]; then
                # Show usage message
                _message "`just --show $recipe`"
                # Or complete with other commands
                #_arguments -s -S $common '*:: :_just_commands'
            else
                _arguments -s -S $common '*:: :_just_commands'
            fi
        ;;
    esac

    return ret

}

(( $+functions[_just_commands] )) ||
_just_commands() {
    [[ $PREFIX = -* ]] && return 1
    integer ret=1
    local variables; variables=(
        ${(s: :)$(_call_program commands just --variables)}
    )
    local commands; commands=(
        ${${${(M)"${(f)$(_call_program commands just --list)}":#    *}/ ##/}/ ##/:Args: }
    )

    if compset -P '*='; then
        case "${${words[-1]%=*}#*=}" in
            *) _message 'value' && ret=0 ;;
        esac
    else
        _describe -t variables 'variables' variables -qS "=" && ret=0
        _describe -t commands 'just commands' commands "$@"
    fi

}

if [ "$funcstack[1]" = "_just" ]; then
    (( $+functions[_just_variables] )) ||
_just_variables() {
    [[ $PREFIX = -* ]] && return 1
    integer ret=1
    local variables; variables=(
        ${(s: :)$(_call_program commands just --variables)}
    )

    if compset -P '*='; then
        case "${${words[-1]%=*}#*=}" in
            *) _message 'value' && ret=0 ;;
        esac
    else
        _describe -t variables 'variables' variables && ret=0
    fi

    return ret
}

_just "$@"
else
    compdef _just just
fi
