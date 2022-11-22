# If not running interactively, don't do anything
[[ -o interactive ]] || return

# There configs should be set before p10k instant prompt
stty stop undef
export GPG_TTY=$(tty)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##
# zinit: zsh plugin manager
##
source /opt/homebrew/opt/zinit/zinit.zsh
zinit light romkatv/powerlevel10k

ZSH_AUTOSUGGEST_USE_ASYNC=1
if is-at-least 5.3; then
  zinit ice silent wait'1' atload'_zsh_autosuggest_start'
fi

zinit light zsh-users/zsh-autosuggestions

# Easily access the directories you visit most often
# zinit light agkozak/zsh-z
# zinit light andrewferrier/fzf-z
# export FZFZ_SUBDIR_LIMIT=0

# Automatically expand all aliases
ZSH_EXPAND_ALL_DISABLE=word
zinit light simnalamburt/zsh-expand-all

# Others
zinit light simnalamburt/cgitc
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-completions
# TODO: fasd, ripgrep

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

autoload -Uz compinit bashcompinit
compinit
bashcompinit
zinit cdreplay

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Show me exit codes
typeset -g POWERLEVEL9K_STATUS_ERROR=true

# Load local configs
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

# zsh-sensible
#if (( $+commands[lsd] )); then
  alias l='lsd -Al --date=relative --group-dirs=first --blocks=permission,user,size,date,name'
  alias ll='lsd -l --date=relative --group-dirs=first --blocks=permission,user,size,date,name'
  alias lt='lsd --tree --depth=2 --date=relative --group-dirs=first'
#else
#  alias l='ls -alh'
#  alias ll='ls -lh'
#fi

HISTSIZE=90000
SAVEHIST=90000
HISTFILE=~/.zsh_history

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Neovim
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
alias cat="bat"
export EDITOR=/opt/homebrew/bin/nvim

# terraform
alias tf='terraform'
alias tfv='terraform validate'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfpp='terraform plan -parallelism=30'
alias tff='terraform fmt -recursive'
alias tfa='terraform apply'
alias tfap='terraform apply -parallelism=30'

# cd
CHAI_ROOT="~/dev/github.chaicloud.io"
alias chaidir="cd $CHAI_ROOT"
alias tfdir="cd $CHAI_ROOT/chai-terraform"
alias tfmdir="cd $CHAI_ROOT/chai-terraform-modules"
alias gcpdir="cd $CHAI_ROOT/chai-terraform/gcp && export GOOGLE_APPLICATION_CREDENTIALS=~/.gcp/terraform-account-sa.json"
alias kdir="cd $CHAI_ROOT/chai-kubernetes"
alias metadir="cd $CHAI_ROOT/chai-deploy-metadata"
alias intldir="cd ~/dev/iamport-intl"
alias datadir="cd ~/dev/gitlab"

PORT_ROOT="~/dev/iamport"
alias portdir="cd $PORT_ROOT"

#export LC_CTYPE=C

# aws/k8s
alias ckey="op item get wallet-keycloak-mk --field type=otp --format json | jq -r .totp | pbcopy"
alias chai-dev="cd $CHAI_ROOT/chai-terraform/aws/wallet-dev && aws-profile chai-aws-dev && kubectx chai-dev"
alias chai-stg="cd $CHAI_ROOT/chai-terraform/aws/wallet-stg && aws-profile chai-aws-stg && kubectx chai-stg"
alias chai-prod="cd $CHAI_ROOT/chai-terraform/aws/wallet-prod && aws-profile chai-aws-prod && kubectx chai-prod"
alias chai-infra="cd $CHAI_ROOT/chai-terraform/aws/wallet-infra && aws-profile chai-aws-infra && kubectx chai-infra"
#alias aws_infra_console="open -a '/Applications/Google Chrome.app' 'https://keycloak.chaicloud.io/auth/realms/chai-card/protocol/saml/clients/chai-aws-infra'"
alias pkey="op item get port/keycloak/mk --field type=otp --format json | jq -r .totp | pbcopy"
alias port-dev="cd $CHAI_ROOT/chai-terraform/aws/port-dev && aws-profile port-aws-dev && kubectx port-dev"
alias port-stg="cd $CHAI_ROOT/chai-terraform/aws/port-stg && aws-profile port-aws-stg && kubectx port-stg"
alias port-prod="cd $CHAI_ROOT/chai-terraform/aws/port-prod && aws-profile port-aws-prod && kubectx port-prod"
alias port-infra="cd $CHAI_ROOT/chai-terraform/aws/port-infra && aws-profile port-aws-infra"

# ssh
alias _ssh="vault write -field=signed_key ssh-client-signer/sign/ec2-user public_key=@$HOME/.ssh/mk-gitea.pub > $HOME/.ssh/chai-signed.pub && ssh -i ~/.ssh/mk-gitea.pub -i ~/.ssh/chai-signed.pub $1"
alias _ssh_admin="vault write -field=signed_key ssh-client-signer/sign/admin public_key=@$HOME/.ssh/mk-gitea.pub > $HOME/.ssh/chai-signed.pub && ssh -i ~/.ssh/mk-gitea.pub -i ~/.ssh/chai-signed.pub $1"
alias _ssh_centos="vault write -field=signed_key ssh-client-signer/sign/centos public_key=@$HOME/.ssh/mk-gitea.pub > $HOME/.ssh/chai-signed.pub && ssh -i ~/.ssh/mk-gitea.pub -i ~/.ssh/chai-signed.pub $1"

# java
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
# export PATH="$JAVA_HOME/bin:$PATH"

# golang
export GOPATH="/Users/mk/go"
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOPATH:$GOBIN"
export PATH=$PATH:$HOME/.istioctl/bin

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#export NPM_AUTH_TOKEN=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

# vault
# export VAULT_ADDR=https://vault.chaicloud.io
export VAULT_ADDR=https://vault.iamport.co

# kubectl
alias k=kubectl
complete -F __start_kubectl k
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$HOME/istio-1.10.0/bin:$PATH"

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)


## aws profile
CMD_NAME=aws-profile
_comp-$CMD_NAME() {
    compadd $(aws configure list-profiles)
}
$CMD_NAME() {
    export AWS_PROFILE=$1
    cat <<< "${AWS_PROFILE}" > ~/.aws/current_profile &&\
    aws sts get-caller-identity --output table --no-cli-pager
}
compdef _comp-$CMD_NAME $CMD_NAME


## AWSCLIv2
complete -C aws_completer aws
if [[ -f ~/.aws/current_profile ]]; then
  read -r AWS_PROFILE < ~/.aws/current_profile
  export AWS_PROFILE
fi
awsctx() {
  # shellcheck disable=SC2016
  AWS_PROFILE=$(FZF_DEFAULT_COMMAND='aws configure list-profiles | perl -pe "s/^(${AWS_PROFILE})$/\x1b[33m\1\x1b[0m/g"' fzf --ansi) &&\
    mkdir -p ~/.aws &&\
    cat <<< "${AWS_PROFILE}" > ~/.aws/current_profile &&\
    export AWS_PROFILE
}
awsregion() {
  # shellcheck disable=SC2016
  FZF_DEFAULT_COMMAND='aws ec2 describe-regions --all-regions --query "Regions[].{Name:RegionName}" --output text | perl -pe "s/^(${REGION})$/\x1b[33m\1\x1b[0m/g"' \
  REGION=$(aws configure get region) \
  fzf --ansi | xargs aws configure set region
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
