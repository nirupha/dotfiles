# ========================================
# Fish Configuration - QoL Edition
# ========================================

# Remove welcome message
set fish_greeting

# ========================================
# ALIASES - Quality of Life
# ========================================

# Better ls with eza
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias la='eza -a --icons'
alias lt='eza --tree --icons --level=2'

# Better cat with bat
alias cat='bat --style=plain --paging=never'
alias catt='bat --style=full'

# Quick navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
# Removed the ~ alias - it's already built-in!

# System shortcuts
alias update='yay -Syu'
alias cleanup='yay -Sc && yay -Yc'
alias orphans='yay -Qtdq'
alias remove-orphans='yay -Rns (yay -Qtdq)'

# Git shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph'

# Quick edit configs
alias fishconfig='nano ~/.config/fish/config.fish'
alias hyprconfig='nano ~/.config/hypr/hyprland.conf'
alias kittyconfig='nano ~/.config/kitty/kitty.conf'

# Utility
alias grep='rg'
alias find='fd'
alias df='duf'
alias top='btop'
alias h='history'
alias c='clear'

# ========================================
# FUNCTIONS - Advanced QoL
# ========================================

# Extract any archive
function extract
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar x $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xf $argv[1]
            case '*.tbz2'
                tar xjf $argv[1]
            case '*.tgz'
                tar xzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z x $argv[1]
            case '*'
                echo "Don't know how to extract '$argv[1]'"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end

# Create directory and cd into it
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

# Quick backup of a file
function backup
    cp $argv[1] $argv[1].backup-(date +%Y%m%d-%H%M%S)
end

# Show disk usage for current directory
function usage
    du -sh * | sort -h
end

# Quick find process
function pgrep-full
    ps aux | grep -i $argv[1]
end

# ========================================
# ENVIRONMENT VARIABLES
# ========================================

# Set default editor
set -gx EDITOR micro

# Add custom bin to PATH (if you have scripts)
set -gx PATH $HOME/.local/bin $PATH

# FZF colors (grey theme)
set -gx FZF_DEFAULT_OPTS '--color=fg:#808080,bg:#1a1a1a,hl:#b0b0b0,fg+:#b0b0b0,bg+:#2a2a2a,hl+:#ffffff,info:#606060,prompt:#707070,pointer:#909090,marker:#909090,spinner:#606060,header:#505050'

# ========================================
# COLORS - Grey Minimal Theme
# ========================================

set -g fish_color_normal b0b0b0
set -g fish_color_command 808080
set -g fish_color_param 909090
set -g fish_color_keyword 707070
set -g fish_color_quote 888888
set -g fish_color_redirection a0a0a0
set -g fish_color_end 707070
set -g fish_color_error ff6666
set -g fish_color_comment 505050
set -g fish_color_selection --background=2a2a2a
set -g fish_color_search_match --background=3a3a3a
set -g fish_color_operator 808080
set -g fish_color_escape 909090
set -g fish_color_autosuggestion 505050
set -g fish_color_cancel 606060

# Prompt colors
set -g fish_color_cwd 808080
set -g fish_color_user 707070
set -g fish_color_host 606060

# ========================================
# STARSHIP PROMPT (Optional - uncomment if installed)
# ========================================
# starship init fish | source
