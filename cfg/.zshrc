# Config Powerlevel9k theme.
function sp {
  git branch > /dev/null 2>&1 || return 1
  git config user.initials
}

POWERLEVEL9K_INSTALLATION_PATH="$HOME/.antigen/bundles/bhilburn/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_DIR_BACKGROUND="237"
POWERLEVEL9K_DIR_FOREGROUND="010"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="012"
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="012"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="012"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_ETC_BACKGROUND="clear"
POWERLEVEL9K_STATUS_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="001"
POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{008}/%F{cyan}"
POWERLEVEL9K_SHORTEN_STRATEGY="none"
POWERLEVEL9K_SHORTEN_DELIMITER="%F{008} …%F{008}"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_HOME_ICON="\ue617"
POWERLEVEL9K_HOME_SUB_ICON="\uf74a"
POWERLEVEL9K_FOLDER_ICON="\uf755"
POWERLEVEL9K_ETC_ICON="%F{blue}\uf423"
POWERLEVEL9K_PROMPT_ADD_NEWLINE="true"
POWERLEVEL9K_PROMPT_ON_NEWLINE="true"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{008}╭%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{008}╰\uf101 %f"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir dir_writable_joined custom_git_pair vcs_joined)
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%F{008}\uf460%F{008}"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status go_version nvm os_icon)
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%F{008}\uf104%F{008}"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m}"
POWERLEVEL9K_CARRIAGE_RETURN_ICON="\uf071"
POWERLEVEL9K_OS_ICON_BACKGROUND="clear"
POWERLEVEL9K_OS_ICON_FOREGROUND="cyan"
POWERLEVEL9K_LINUX_MANJARO_ICON="\uf312 "
POWERLEVEL9K_LINUX_UBUNTU_ICON="\uf31b "
POWERLEVEL9K_CUSTOM_GIT_PAIR="echo \$(sp)"
POWERLEVEL9K_CUSTOM_GIT_PAIR_BACKGROUND="clear"
POWERLEVEL9K_CUSTOM_GIT_PAIR_FOREGROUND="blue"
POWERLEVEL9K_CUSTOM_GIT_PAIR_ICON="\uf7af"
POWERLEVEL9K_VCS_GIT_GITHUB_ICON="\uf408 "
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="clear"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="green"
POWERLEVEL9K_GO_ICON="\uf7b7"
POWERLEVEL9K_GO_VERSION_BACKGROUND="clear"
POWERLEVEL9K_GO_VERSION_FOREGROUND="081"
POWERLEVEL9K_NVM_BACKGROUND="clear"
POWERLEVEL9K_NVM_FOREGROUND="green"

# Apply Antigen.
source /usr/local/share/antigen/antigen.zsh
antigen init $HOME/.antigenrc
