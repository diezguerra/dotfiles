# Globally recognised variables
set -g -x VISUAL vim
set -g -x EDITOR vim
set -g -x PAGER less
set -g -x PATH /usr/local/go/bin/ /opt/local/bin /opt/local/sbin $PATH

# Fish
set -g -x fish_greeting ''

# Some vars
set -g -x GREP_OPTIONS '--color=auto'
set -g -x PYTHONPATH '/Library/Python/2.6/site-packages/:/Users/saul/workspace/insight/source/'
set -g -x DJANGO_SETTINGS_MODULE 'insight.settings'

# Aliases
alias gopi "cd ~/workspace/insight/source/insight/"
alias "gopi" "cd ~/workspace/insight/source/insight/"
alias sshup 'ssh-agent ; ssh-add'
sshup > /dev/null ^&1

function ..; cd ..; end
function ...; cd ../..; end
function ....; cd ../../..; end
function cd..; cd ..; end
function g;git $argv; end
function gco;git checkout $argv; end
function gd;git diff $argv; end
function gc;git commit $argv; end
function gs;git status $argv; end
function gl;git la $argv; end
function issha;ssh ampush@$argv.ampushinsight.com;end

# Snippet setting git branch and git dirty helper

set fish_git_dirty_color red
set fish_git_clean_color brown
function parse_git_dirty
         if test (git status 2> /dev/null ^&1 | tail -n1) != "nothing to commit (working directory clean)"
            echo (set_color $fish_git_dirty_color)
         else
            echo (set_color $fish_git_clean_color)
         end
end
function fish_prompt --description 'Write out the prompt'
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end
    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end
    if not set -q __git_cb
        if test (git rev-parse --is-inside-work-tree 2> /dev/null | tail -n 1) = 'true' 2> /dev/null
            set __git_cb " ("(parse_git_dirty)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)") "
        else
            set __git_cb ""
        end
    end

    switch $USER
        case root
        if not set -q __fish_prompt_cwd
            if set -q fish_color_cwd_root
                set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
            else
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end
        end
        printf '%s@%s:%s%s%s%s# ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb

        case '*'
        if not set -q __fish_prompt_cwd
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end
        printf '%s@%s:%s%s%s%s$ ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb
    end
end

# Credit to: http://notsnippets.tumblr.com/post/894091013/fish-function-of-the-day-prompt-with-git-branch for showing the branch
# and http://stackoverflow.com/a/9334733/1165146 for coloring the branch name depending on dirty status.
# http://herdrick.tumblr.com/post/24563032599/display-git-branch-and-dirty-status-in-fish-shell can go and die for posting
# code where " is replaced with ” and - with –. Now half of my repos have a branch called –quiet...
