# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mk/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fasd
  ripgrep
  #fzf
)

source $ZSH/oh-my-zsh.sh

# User configuration

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

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
alias gcpdir="cd $CHAI_ROOT/chai-terraform/gcp && export GOOGLE_APPLICATION_CREDENTIALS=~/.gcp/terraform-account-sa.json"
alias tfmdir="cd $CHAI_ROOT/chai-terraform-modules"
alias kdir="cd $CHAI_ROOT/chai-kubernetes"
alias metadir="cd $CHAI_ROOT/chai-deploy-metadata"
alias testdir="cd ~/dev/chai-devops/swarm-network-test"

PORT_ROOT="~/dev/iamport"
alias portdir="cd $PORT_ROOT"

#export LC_CTYPE=C

# aws/k8s
alias ckey="op item get wallet-keycloak-mk --field type=otp --format json | jq -r .totp | pbcopy"
alias chai-dev="cd $CHAI_ROOT/chai-terraform/aws/wallet-dev && saml2aws login -a chai-aws-dev --quiet --skip-prompt && aws-profile chai-aws-dev && kubectx chai-dev"
alias chai-stg="cd $CHAI_ROOT/chai-terraform/aws/wallet-stg && saml2aws login -a chai-aws-stg --quiet --skip-prompt && aws-profile chai-aws-stg && kubectx chai-stg"
alias chai-prod="cd $CHAI_ROOT/chai-terraform/aws/wallet-prod && saml2aws login -a chai-aws-prod --quiet --skip-prompt && aws-profile chai-aws-prod && kubectx chai-prod"
alias chai-infra="cd $CHAI_ROOT/chai-terraform/aws/wallet-infra && saml2aws login -a chai-aws-infra --quiet --skip-prompt && aws-profile chai-aws-infra && kubectx chai-infra"
alias _ssh="vault write -field=signed_key ssh-client-signer/sign/ec2-user public_key=@$HOME/.ssh/mk-gitea.pub > $HOME/.ssh/chai-signed.pub && ssh -i ~/.ssh/mk-gitea.pub -i ~/.ssh/chai-signed.pub $1"
alias _ssh_admin="vault write -field=signed_key ssh-client-signer/sign/admin public_key=@$HOME/.ssh/mk-gitea.pub > $HOME/.ssh/chai-signed.pub && ssh -i ~/.ssh/mk-gitea.pub -i ~/.ssh/chai-signed.pub $1"
alias _ssh_centos="vault write -field=signed_key ssh-client-signer/sign/centos public_key=@$HOME/.ssh/mk-gitea.pub > $HOME/.ssh/chai-signed.pub && ssh -i ~/.ssh/mk-gitea.pub -i ~/.ssh/chai-signed.pub $1"
#alias aws_infra_console="open -a '/Applications/Google Chrome.app' 'https://keycloak.chaicloud.io/auth/realms/chai-card/protocol/saml/clients/chai-aws-infra'"
alias pkey="op item get port/keycloak/mk --field type=otp --format json | jq -r .totp | pbcopy"
alias port-dev="saml2aws login -a port-aws-dev --quiet --skip-prompt && aws-profile port-aws-dev && kubectx port-dev"
alias port-stg="saml2aws login -a port-aws-stg --quiet --skip-prompt && aws-profile port-aws-stg && kubectx port-stg"
alias port-prod="saml2aws login -a port-aws-prod --quiet --skip-prompt && aws-profile port-aws-prod && kubectx port-prod"
alias port-infra="saml2aws login -a port-aws-infra --quiet --skip-prompt && aws-profile port-aws-infra"

# gcp
export GOOGLE_APPLICATION_CREDENTIALS=~/.gcp/terraform-account-sa.json

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

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
